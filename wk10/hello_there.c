#include <stdio.h>
#include <stdbool.h>
#include <pthread.h>

void *thread_run(void *data) {
    while (true) {
        printf("%s", (char *)data);
    }
    return NULL;
}

int main(void) {
    
    pthread_t thread;
    char *string = "Hello\n";
    pthread_create(
        &thread,    // the pthread_t handle that will represent this thread
        NULL,       // thread-attributes -- we usually just leave this NULL
        thread_run, // the function that the thread should start executing
        string
    );

    while (true) {
        printf("there!\n");
    }

    pthread_join(thread, NULL);

    return 0;
}
