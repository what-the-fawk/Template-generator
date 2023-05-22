#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>


int main(int argc, char* argv[]) {
    printf("USAGE: executable1, arg1, arg2, ..., empty argv string, executable2, arg1, arg2, ...\n\n");

    
    int argc_ind = 0;

    for(; argc_ind < argc; ++argc_ind) {
        if(*(argv[argc_ind]) == '\0') {
            argv[argc_ind] = NULL;
            ++argc_ind;
            break;
        }
    }

    int channel[2];

    if(pipe(channel) < 0) {
        perror("pipe");
        exit(1);
    }

    pid_t id_front = fork();

    if(!id_front) {
        dup2(channel[1], STDOUT_FILENO);

        execvp(argv[1], argv + 1);
        exit(0);
    }

    pid_t id_back = fork();

    if(!id_front) {
        dup2(channel[0], STDIN_FILENO);

        execvp(argv[argc_ind], argv + argc_ind);
        exit(0);
    }

    waitpid(id_front, NULL, 0);
    waitpid(id_back, NULL, 0);

    perror("exited");
    exit(0);
}