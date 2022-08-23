// General tool to encrypt/decrypt a stdin stream with
// a password-derived key and a symmetric cipher

// Usage: E|D key alg [mode]

import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.*;
import java.security.spec.*;
import java.util.*;

class SymCipherTest {

public static void main (String[] args)
{
    String mode = "ECB/PKCS5Padding";
    int reqKeyLen = 0;

    // Check mandatory arguments

    if (args.length < 3 ||
        (args[0].equals( "E" ) == false && args[0].equals( "D" ) == false)) {
        System.err.print( "Usage: E|D key alg[-keyBitLen] [mode]\n" );
	System.exit ( 1 );
    }

    // Any mode provided?

    if (args.length > 3) {
        mode = args[3];
    }

    String cipherMode = mode.split( "/" )[0];
    String algo;
    Boolean needsIV = true;

    if (args[2].contains( "-" )) {
        algo = args[2].split( "-" )[0];
        reqKeyLen = Integer.parseInt( args[2].split( "-" )[1] ); // In bits
    }
    else {
        algo = args[2];
    }

    if (cipherMode.equals( "ECB" )) { // Only ECB doesn't require IV
    	needsIV = false;
    }

    Cipher engine = null; 

    try {
        String transformation = algo + "/" + mode; 

	// Generate an array of 1024 bytes from a password
	// (16 hashing iterations, based on SHA256)

        SecretKeyFactory kFactory =
	    SecretKeyFactory.getInstance( "PBKDF2WithHmacSHA256" );
	KeySpec kSpec =
	    new PBEKeySpec( args[1].toCharArray(), args[1].getBytes(), 16, 1024 * 8 );
	SecretKey rawKey = kFactory.generateSecret( kSpec );

	// Generate a key for the algorith being used

	// When not specified (in the name of the algorithm, e.g. AES-192)
	// guess the cipher key length (in bits) using trial and error
	// starting from a small size (56 bits).
	//
	// (FFT: is there a better way to get the key size of an algorithm?)

	int kLen = reqKeyLen == 0 ? 56 : reqKeyLen; // In bits
	SecretKeySpec key = null;
	IvParameterSpec iv = null;

	while (true) {
	    try {
		key = new SecretKeySpec( rawKey.getEncoded(), 0, kLen / 8, algo );

		// We need to get a new Cipher object because it seems it gets "damaged"
		// after being set with a worong key length ... stupid library!

		engine = Cipher.getInstance( transformation );
		if (needsIV) {
		    // Use raw data derived from the password to set the IV
		    iv = new IvParameterSpec( rawKey.getEncoded(), 0, engine.getBlockSize() );
		    engine.init( args[0].equals( "E" ) ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, key, iv );
		}
		else {
		    iv = new IvParameterSpec( rawKey.getEncoded(), 0, engine.getBlockSize() );
		    engine.init( args[0].equals( "E" ) ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, key );
		}

		break; // Sorry, Dijkstra!
	    } catch(InvalidKeyException e) {
		if (reqKeyLen != 0) {
		    System.err.print( "Invalid key length = " + reqKeyLen + " bits\n" );
		    System.exit( 1 );
		}

		kLen += 8; // Wrong key length, add 8 bits more
	    }
	}
	System.err.print( "Key length = " + String.valueOf( kLen ) + " bytes\n" );
    }
    catch (NoSuchAlgorithmException e) {
	System.err.print( "Unknown algorithm: " + e + "\n"  );
	System.exit( 1 );
    }
    catch (NoSuchPaddingException e) {
	System.err.print( "Unknown padding: " + e + "\n" );
	System.exit( 1 );
    }
    catch (InvalidKeySpecException e) {
	System.err.print( "Bad key specification: " + e + "\n" );
	System.exit( 1 );
    }
    catch (InvalidAlgorithmParameterException e) {
	System.err.print( "Invalid algorithm parameter (IV): " + e + "\n" );
	System.exit( 1 );
    }

    // Encrypt/decrypt stdin, write result on stdout

    byte[] buffer = new byte[4096];

    try {
	System.err.print( "Starting..." );
	while (true) {
	    int len = System.in.read( buffer );
	    if (len > 0) {
		byte [] output = engine.update( buffer, 0, len );
		System.out.write( output, 0, output.length );
	    }
	    else {
		byte [] output = engine.doFinal();
		System.out.write( output, 0, output.length );
		System.err.print( "Done\n" );
		return;
	    }
	}
    } catch (Exception e) {
	System.err.println ( e );
	System.exit( 1 );
    }
}

}

