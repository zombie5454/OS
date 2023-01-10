#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
//  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;
  return p;
  /*// Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;*/
}

int flag = 0;  //if found, flag == 1

void
ls(char *path, char *comm)
{
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
    fprintf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    fprintf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }
  //printf("entering %s\n", path);
  switch(st.type){
/*  case T_FILE:
  	if(strcmp(fmtname(buf), ".") != 0 && strcmp(fmtname(buf), "..") != 0){
	//  printf("%s %d %d %l\n", fmtname(path), st.type, st.ino, st.size);
      printf("%s %d %d %l\n", path, st.type, st.ino, st.size);
    }
    break;
    */
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf("ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf("ls: cannot stat %s\n", buf);
        continue;
      }
      if(strcmp(fmtname(buf), ".") == 0 || strcmp(fmtname(buf), "..") == 0){
      	continue;
      }
    //  printf("%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    //  printf("%s %d %d %d\n", buf, st.type, st.ino, st.size);
      if(strcmp(fmtname(buf), comm) == 0){
      	flag = 1;
      	printf("%d as Watson: %s\n", getpid(), buf);
      }
      ls(buf, comm);
    }
    break;
  }
  close(fd);
}



int main(int argc, char *argv[]){
//	printf("%s\n", "i'm detective");
//	printf("%s\n", fmtname("."));
	int fd[2];
	pipe(fd);
	char buf[100];
	int useless;

	if(fork() == 0){  //child
		close(fd[0]);
		ls(".", argv[1]);
		if(flag == 1){
			write(fd[1], "y", strlen("y"));
		}
		else{
			write(fd[1], "n", strlen("n"));
		}
//		printf("child dead\n");
	}

	
	else{
		wait(&useless);
		close(fd[1]);
		read(fd[0], buf, 100);
	//	printf("%s\n", buf);
		if(strcmp(buf, "y") == 0){
			printf("%d as Holmes: This is the evidence\n", getpid());
		}
		else{
			printf("%d as Holmes: This is the alibi\n", getpid());
		}

//		printf("parent dead\n");
	}
	



	exit(0);
}