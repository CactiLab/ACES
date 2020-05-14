/**
*****************************************************************************
**
**  File        : syscalls.c
**
**  Abstract    : System Workbench Minimal System calls file
**
** 		          For more information about which c-functions
**                need which of these lowlevel functions
**                please consult the Newlib libc-manual
**
**  Environment : System Workbench for MCU
**
**  Distribution: The file is distributed �as is,� without any warranty
**                of any kind.
**
*****************************************************************************
**
** <h2><center>&copy; COPYRIGHT(c) 2014 Ac6</center></h2>
**
** Redistribution and use in source and binary forms, with or without modification,
** are permitted provided that the following conditions are met:
**   1. Redistributions of source code must retain the above copyright notice,
**      this list of conditions and the following disclaimer.
**   2. Redistributions in binary form must reproduce the above copyright notice,
**      this list of conditions and the following disclaimer in the documentation
**      and/or other materials provided with the distribution.
**   3. Neither the name of Ac6 nor the names of its contributors
**      may be used to endorse or promote products derived from this software
**      without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
** DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
** SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
** CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
** OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*****************************************************************************
*/

/* Includes */
#include <sys/stat.h>
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <time.h>
#include <sys/time.h>
#include <sys/times.h>

/*
"errno" is a specific global integer in the ANSI C standard (successive standards for the C programming language). The runtime library asserts when an error occurs. Once asserted, errno's value persists until the application clears it.
*/

/*
Newlib encloses errno and several related values into a structure of type struct _reent, and redefines the symbol errno as a macro that references a global _reent* pointer named __impure_ptr.
Since ACES only uses syscall.c from Newlib, it comments all lines of errno.
*/

/* Variables */
//#undef errno
/*
extern int errno;
extern int __io_putchar(int ch) __attribute__((weak));
extern int __io_getchar(void) __attribute__((weak));
*/
//register char * stack_ptr asm("sp");
/*
char *__env[1] = { 0 };
char **environ = __env;

*/
// Functions


/*
The implementation of fork() in uC/OS is probably a bad idea, because it raises task priority and synchronization issues that uC/OS already addresses quite well on its own. Then leaving this function unimplemented. 
Same with 
		_execve, _kill, _wait, and _getpid
*/

/*
It seems only a few functions are implemented. All those functions are declared as __attribute__((weak)) because it is not sure if the application provides those functions. And this is the initialization of Newlib for the ARM architecture.
*/

int __attribute__((weak,used)) _getpid(void)
{
	return 1;
}

int __attribute__((weak,used)) _kill(int pid, int sig)
{
	//errno = EINVAL;
	return -1;
}

/*
Call the kill function?? but the kill in unimplemented??
*/
void __attribute__((weak,used)) _exit (int status)
{
	_kill(status, -1);
	while (1) {}		// Make sure we hang here
}

int __attribute__((weak)) _read (int file, char *ptr, int len)
{
	return 0;
}

int __attribute__((weak)) _write(int file, char *ptr, int len)
{
	return 0;
}

/*
This function was called whenever malloc() runs out of heap and wants more. 
Each time malloc() calls _sbrk the heap end grows by incr bytes.
*/
caddr_t __attribute__((weak)) _sbrk(int incr)
{
	/* This is very dangerous as heap can overflow into stack
		 Should update linker script to have marker to prevent collision
	*/
	extern char end;  //defined in linker script;
	//extern char end_heap;   //Defined in linker script
	static char *heap_end=0;
	char *prev_heap_end;


	if (heap_end == 0)
		heap_end = &end;

	prev_heap_end = heap_end;
	//if (heap_end + incr > &end_heap)
	//{
	//	exit(-5);
	//	return (caddr_t) -1;
	//}

	heap_end += incr;

	return (caddr_t) prev_heap_end;
}


int __attribute__((weak)) _close(int file)
{
	return -1;
}


int __attribute__((weak)) _fstat(int file, struct stat *st)
{
	//st->st_mode = S_IFCHR;
	return -1;
}

int __attribute__((weak)) _isatty(int file)
{
	return 1;
}

int __attribute__((weak)) _lseek(int file, int ptr, int dir)
{
	return 0;
}

int __attribute__((weak)) _open(char *path, int flags, ...)
{
	// Pretend like we always fail
	return -1;
}

int __attribute__((weak)) _wait(int *status)
{
	//errno = ECHILD;
	return -1;
}

int __attribute__((weak)) _unlink(char *name)
{
	//errno = ENOENT;
	return -1;
}

int __attribute__((weak)) _times(struct tms *buf)
{
	return -1;
}

int __attribute__((weak)) _stat(char *file, struct stat *st)
{
	//st->st_mode = S_IFCHR;
	return -1;
}

int __attribute__((weak)) _link(char *old, char *new)
{
	//errno = EMLINK;
	return -1;
}

int __attribute__((weak)) _fork(void)
{
	//errno = EAGAIN;
	return -1;
}

int __attribute__((weak)) _execve(char *name, char **argv, char **env)
{
	//errno = ENOMEM;
	return -1;
}


int __attribute__((weak)) _fini(){
	while(1)
		;
	return -1;


}

void __attribute__((weak)) _init(){

}
