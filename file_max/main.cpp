#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

int main(int argc, char* argv[])
{
	int ret = 0;

	int fd = -1;
	int index = 0;
	char file_name[1024];
	while(1)
	{		
		sprintf(file_name, "%d.txt", index);
		fprintf(stdout, "%s\n", file_name);
		
		fd = open(file_name, O_CREAT|O_WRONLY|O_TRUNC);
		if(fd == -1)
		{
			fprintf(stderr, "error %d, %s\n", errno, strerror(errno));
			break;
		}
		
		
		index++;
	}

	
	
	return ret;
}

