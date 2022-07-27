#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

extern char **environ;

void spawn_and_wait(char **args)
{
    // create process
    pid_t pid;
    int status;
    if ((status = posix_spawn(&pid, args[0], NULL, NULL, args, environ)) != 0) {
        perror("posix_spawn");
        exit(1);
    }

    if (waitpid(pid, &status, 0) == -1) {
        perror("waitpid");
        exit(1);
    }
}

int main(int argc, char *argv[])
{
    // date +%d-%m-%Y
    char *args_array[] = {"/bin/date", "+%d-%m-%Y", NULL};
    spawn_and_wait(args_array);
    spawn_and_wait((char *[]){"/usr/bin/whoami", NULL});
    spawn_and_wait((char *[]){"/bin/hostname", "-f", NULL});
}