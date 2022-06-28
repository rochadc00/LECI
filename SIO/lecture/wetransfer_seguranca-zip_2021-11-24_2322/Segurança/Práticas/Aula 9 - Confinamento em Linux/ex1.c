
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

void main(int argc, char *argv[]){

	
	printf("REAL UID: %d\n", getuid());
	printf("EFFECTIVE UID: %d\n", geteuid());
	printf("Group UID: %d\n", getgid());
	printf("EFFECTIVE group UID: %d\n", getegid());

}