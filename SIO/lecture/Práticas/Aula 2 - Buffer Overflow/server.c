/*
 * =====================================================================================
 *
 *       Filename:  server.c
 *
 *    Description:  Simple UDP Server vulnerable to buffer overflow attacks
 *
 *        Version:  1.0
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Joao Paulo Barraca <jpbarraca@ua.pt>
 *   Organization:  University of Aveiro
 *
 * =====================================================================================
 */
#include <stdlib.h>

#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <time.h>
#include <unistd.h>
#include <string.h>

int sock;
int confSendTime = 0;
struct sockaddr_in client;
int clientAddressLen = sizeof(struct sockaddr_in);
int messageNumber = 0;

#define PORT 12345

void die(char* p){
	printf("QUIT: %s\n",p);
	exit(0);
}

/*
	Sends current time through socket.
*/
void sendCurrentTime()
{
	time_t now = time(NULL);
	char* nows = ctime(&now);
	printf("Sending Current Time: %s\n",nows);
	sendto(sock,nows,strlen(nows),0,(struct sockaddr*) &client,sizeof(client));
}

//Sends back the to the client the text he provided
//Method is vulnerable to buffer overflow attacks!
int sendEcho(char* inbuffer){
	char outbuffer[16] ;
	int currMessage = ++messageNumber;
	int sendTime = confSendTime;

	sprintf(outbuffer,"ECHO:%2u: %s",currMessage, inbuffer);

	printf("sendTime: %08x\n",sendTime);
	if(sendTime == 1)
	{
		sendCurrentTime();
	}

	sendto(sock,outbuffer,strlen(outbuffer), 0,(struct sockaddr*) &client,sizeof(client));
}

int main( int argc, char* argv[])
{
	struct sockaddr_in addr;
	//Create Socket
	if((sock = socket(AF_INET,SOCK_DGRAM, IPPROTO_UDP)) == -1)
		die("Unable to create socket");


	//Set port and address
	memset((char*) &addr,0,sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_port = htons(PORT);
	addr.sin_addr.s_addr = htonl(INADDR_ANY);
	//Bind socket
	if((bind(sock,(struct sockaddr*)&addr,sizeof(addr))) == -1)
	   die("Unable to bind socket");

	//Process packets
	while(1){
		char buffer[2048];
		memset(buffer,0,sizeof(buffer));
	    printf("Waiting for packet\n");
		int sz = recvfrom(sock, buffer, sizeof(buffer),0, (struct sockaddr *)&client, &clientAddressLen);
		if(sz <= 0)
			continue;

		printf("Received packet from %s:%d\n", inet_ntoa(client.sin_addr), ntohs(client.sin_port));
		printf("Data: %s\n" , buffer);

		sendEcho(buffer);
		printf("Done.\n");
	}

	close(sock);
	return 0;

}

