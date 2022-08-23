#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

//CONST
const char cntvar[]="constant";

//BSS
static char bssvar[4];

void foo(int argc, unsigned int mask, unsigned int c, unsigned int m)
{
  char a[4096*0x100];
	unsigned int stack = (unsigned int) &argc;
	printf("foo [%03u]: &argc  = %08x -> stack = %08x\n",c,stack, stack & mask);
	if(c < m)
		foo(argc,mask,c+1, m);
}

int main(int argc, void** argv) {
	FILE* fd;
	char line[1024];
	unsigned int mask;

	unsigned int stack = (unsigned int) &argc;
	unsigned int heap = (unsigned int) malloc(sizeof(unsigned int));
	unsigned int bss = (unsigned int) bssvar;
	unsigned int cnst = (unsigned int) cntvar;
	unsigned int text = (unsigned int) &main;

	memset(&mask,0xff,sizeof(mask));
	mask ^= getpagesize() -1;

	printf("Internal Variables (Page = %u)\n", getpagesize());
	printf("&argc  = %08x -> stack = %08x\n", stack, stack & mask);
	printf("malloc = %08x -> heap  = %08x\n", heap, heap & mask);
	printf("bssvar = %08x -> bss   = %08x\n", bss, bss & mask);
	printf("cntvar = %08x -> const = %08x\n", cnst,cnst & mask);
	printf("&main  = %08x -> text  = %08x\n", text,text & mask);

	fd=fopen("/proc/self/maps","r");
	if(fd != NULL)
	{
		printf("\n\nContent of /proc/self/maps\n");
		while(fgets(line,sizeof(line), fd))
		{
			printf("%s",line);
		}

		fclose(fd);
	}

	printf("\nStack evolution:\n");
	foo(0,mask,0,100);

	return 0;
}
