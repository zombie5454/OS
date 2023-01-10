#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0


static struct thread* current_thread = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
    t->arg = arg;
    t->ID  = id;
    t->buf_set = 0;
    t->stack = (void*) new_stack;
    t->stack_p = (void*) new_stack_p;
    id++;
    return t;
}
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        // TODO
        current_thread = t;
        current_thread->previous = t;
        current_thread->next = t;
    }
    else{
        // TODO
        t->next = current_thread;
        t->previous = current_thread->previous;
        current_thread->previous->next = t;
        current_thread->previous = t;
    }
    /*
    printf("%d %d %d %d\n", current_thread->ID, current_thread->next->ID, 
        current_thread->next->next->ID, current_thread->next->next->next->ID);
    printf("%d %d %d %d\n", current_thread->ID, current_thread->previous->ID, 
        current_thread->previous->previous->ID, current_thread->previous->previous->previous->ID);
    */
}
void thread_yield(void){
//    printf("%d\n", current_thread->ID);
    if(setjmp(current_thread->env) == 0){
        schedule();
        dispatch();
    }
}
void dispatch(void){
//    printf("dispatch\n");
//    printf("%d\n", current_thread->ID);
    // TODO
    if(current_thread->buf_set == 0){
        current_thread->buf_set = 1;
        if(setjmp(env_tmp) == 0){
            env_tmp->sp = (unsigned long)current_thread->stack_p;
            longjmp(env_tmp, 1);
        }
        current_thread->fp(current_thread->arg);
        thread_exit();
    }
    else{
        longjmp(current_thread->env, 1);
    }

}
void schedule(void){
    current_thread = current_thread->next;
}
void thread_exit(void){
    if(current_thread->next != current_thread){
        // TODO
        current_thread->next->previous = current_thread->previous;
        current_thread->previous->next = current_thread->next;
        
        struct thread *useless = current_thread;
        current_thread = current_thread->next;
        free(useless->stack);
        free(useless);
        dispatch();
    }
    else{
        // TODO
        free(current_thread->stack);
        free(current_thread);
        longjmp(env_st, 1);
        // Hint: No more thread to execute
    }
}
void thread_start_threading(void){
    // TODO
    if(setjmp(env_st) == 0)
        dispatch();
}
