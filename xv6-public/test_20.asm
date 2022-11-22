
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void worker(void *arg1, void *arg2);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 b4 06 00 00       	call   6ca <getpid>

   int arg1 = 11, arg2 = 22;

   size = (unsigned int)sbrk(0);
  16:	83 ec 0c             	sub    $0xc,%esp
   int arg1 = 11, arg2 = 22;
  19:	c7 45 f0 0b 00 00 00 	movl   $0xb,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
  20:	6a 00                	push   $0x0
   ppid = getpid();
  22:	a3 68 0f 00 00       	mov    %eax,0xf68
   int arg1 = 11, arg2 = 22;
  27:	c7 45 f4 16 00 00 00 	movl   $0x16,-0xc(%ebp)
   size = (unsigned int)sbrk(0);
  2e:	e8 9f 06 00 00       	call   6d2 <sbrk>

   int thread_pid = thread_create(worker, &arg1, &arg2);
  33:	83 c4 0c             	add    $0xc,%esp
   size = (unsigned int)sbrk(0);
  36:	a3 60 0f 00 00       	mov    %eax,0xf60
   int thread_pid = thread_create(worker, &arg1, &arg2);
  3b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  3e:	50                   	push   %eax
  3f:	8d 45 f0             	lea    -0x10(%ebp),%eax
  42:	50                   	push   %eax
  43:	68 b0 01 00 00       	push   $0x1b0
  48:	e8 a3 05 00 00       	call   5f0 <thread_create>
   assert(thread_pid > 0);
  4d:	83 c4 10             	add    $0x10,%esp
  50:	85 c0                	test   %eax,%eax
  52:	7e 62                	jle    b6 <main+0xb6>
   
   int join_pid = thread_join();
  54:	e8 c7 05 00 00       	call   620 <thread_join>
   assert(join_pid > 0);
  59:	85 c0                	test   %eax,%eax
  5b:	7e 13                	jle    70 <main+0x70>
   

   printf(1, "TEST PASSED\n");
  5d:	50                   	push   %eax
  5e:	50                   	push   %eax
  5f:	68 61 0b 00 00       	push   $0xb61
  64:	6a 01                	push   $0x1
  66:	e8 45 07 00 00       	call   7b0 <printf>
   exit();
  6b:	e8 da 05 00 00       	call   64a <exit>
   assert(join_pid > 0);
  70:	6a 27                	push   $0x27
  72:	68 d8 0a 00 00       	push   $0xad8
  77:	68 e2 0a 00 00       	push   $0xae2
  7c:	6a 01                	push   $0x1
  7e:	e8 2d 07 00 00       	call   7b0 <printf>
  83:	83 c4 0c             	add    $0xc,%esp
  86:	68 45 0b 00 00       	push   $0xb45
  8b:	68 08 0b 00 00       	push   $0xb08
  90:	6a 01                	push   $0x1
  92:	e8 19 07 00 00       	call   7b0 <printf>
  97:	5a                   	pop    %edx
  98:	59                   	pop    %ecx
  99:	68 1c 0b 00 00       	push   $0xb1c
  9e:	6a 01                	push   $0x1
  a0:	e8 0b 07 00 00       	call   7b0 <printf>
  a5:	58                   	pop    %eax
  a6:	ff 35 68 0f 00 00    	push   0xf68
  ac:	e8 c9 05 00 00       	call   67a <kill>
  b1:	e8 94 05 00 00       	call   64a <exit>
   assert(thread_pid > 0);
  b6:	6a 24                	push   $0x24
  b8:	68 d8 0a 00 00       	push   $0xad8
  bd:	68 e2 0a 00 00       	push   $0xae2
  c2:	6a 01                	push   $0x1
  c4:	e8 e7 06 00 00       	call   7b0 <printf>
  c9:	83 c4 0c             	add    $0xc,%esp
  cc:	68 52 0b 00 00       	push   $0xb52
  d1:	eb b8                	jmp    8b <main+0x8b>
  d3:	66 90                	xchg   %ax,%ax
  d5:	66 90                	xchg   %ax,%ax
  d7:	66 90                	xchg   %ax,%ax
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <worker2>:
}

void worker2(void *arg1, void *arg2)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
  e6:	68 5c 0f 00 00       	push   $0xf5c
  eb:	e8 d0 04 00 00       	call   5c0 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  f7:	e8 d6 05 00 00       	call   6d2 <sbrk>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	3b 05 60 0f 00 00    	cmp    0xf60,%eax
 105:	74 46                	je     14d <worker2+0x6d>
 107:	6a 31                	push   $0x31
   global++;
   lock_release(&lock);

   
   lock_acquire(&lock2);
   assert((unsigned int)sbrk(0) == size);
 109:	68 d8 0a 00 00       	push   $0xad8
 10e:	68 e2 0a 00 00       	push   $0xae2
 113:	6a 01                	push   $0x1
 115:	e8 96 06 00 00       	call   7b0 <printf>
 11a:	83 c4 0c             	add    $0xc,%esp
 11d:	68 ea 0a 00 00       	push   $0xaea
 122:	68 08 0b 00 00       	push   $0xb08
 127:	6a 01                	push   $0x1
 129:	e8 82 06 00 00       	call   7b0 <printf>
 12e:	58                   	pop    %eax
 12f:	5a                   	pop    %edx
 130:	68 1c 0b 00 00       	push   $0xb1c
 135:	6a 01                	push   $0x1
 137:	e8 74 06 00 00       	call   7b0 <printf>
 13c:	59                   	pop    %ecx
 13d:	ff 35 68 0f 00 00    	push   0xf68
 143:	e8 32 05 00 00       	call   67a <kill>
 148:	e8 fd 04 00 00       	call   64a <exit>
   lock_release(&lock);
 14d:	83 ec 0c             	sub    $0xc,%esp
   global++;
 150:	83 05 64 0f 00 00 01 	addl   $0x1,0xf64
   lock_release(&lock);
 157:	68 5c 0f 00 00       	push   $0xf5c
 15c:	e8 7f 04 00 00       	call   5e0 <lock_release>
   lock_acquire(&lock2);
 161:	c7 04 24 58 0f 00 00 	movl   $0xf58,(%esp)
 168:	e8 53 04 00 00       	call   5c0 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 16d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 174:	e8 59 05 00 00       	call   6d2 <sbrk>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3b 05 60 0f 00 00    	cmp    0xf60,%eax
 182:	74 04                	je     188 <worker2+0xa8>
 184:	6a 37                	push   $0x37
 186:	eb 81                	jmp    109 <worker2+0x29>
   global++;
   lock_release(&lock2);
 188:	83 ec 0c             	sub    $0xc,%esp
   global++;
 18b:	83 05 64 0f 00 00 01 	addl   $0x1,0xf64
   lock_release(&lock2);
 192:	68 58 0f 00 00       	push   $0xf58
 197:	e8 44 04 00 00       	call   5e0 <lock_release>

   
   exit();
 19c:	e8 a9 04 00 00       	call   64a <exit>
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <worker>:
}


void worker(void *arg1, void *arg2) {
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 1b6:	68 5c 0f 00 00       	push   $0xf5c
 1bb:	e8 f0 03 00 00       	call   5b0 <lock_init>
   lock_init(&lock2);
 1c0:	c7 04 24 58 0f 00 00 	movl   $0xf58,(%esp)
 1c7:	e8 e4 03 00 00       	call   5b0 <lock_init>
   lock_acquire(&lock);
 1cc:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
 1d3:	e8 e8 03 00 00       	call   5c0 <lock_acquire>
   lock_acquire(&lock2);
 1d8:	c7 04 24 58 0f 00 00 	movl   $0xf58,(%esp)
 1df:	e8 dc 03 00 00       	call   5c0 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 1e4:	83 c4 0c             	add    $0xc,%esp
 1e7:	6a 00                	push   $0x0
 1e9:	6a 00                	push   $0x0
 1eb:	68 e0 00 00 00       	push   $0xe0
 1f0:	e8 fb 03 00 00       	call   5f0 <thread_create>
    assert(nested_thread_id > 0);
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	85 c0                	test   %eax,%eax
 1fa:	0f 8e 39 01 00 00    	jle    339 <worker+0x189>
   size = (unsigned int)sbrk(0);
 200:	83 ec 0c             	sub    $0xc,%esp
 203:	6a 00                	push   $0x0
 205:	e8 c8 04 00 00       	call   6d2 <sbrk>

   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
   size = (unsigned int)sbrk(0);
 20d:	a3 60 0f 00 00       	mov    %eax,0xf60
   while (global < num_threads) {
 212:	a1 54 0f 00 00       	mov    0xf54,%eax
 217:	39 05 64 0f 00 00    	cmp    %eax,0xf64
 21d:	7d 36                	jge    255 <worker+0xa5>
 21f:	90                   	nop
      lock_release(&lock);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 5c 0f 00 00       	push   $0xf5c
 228:	e8 b3 03 00 00       	call   5e0 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 a1 04 00 00       	call   6da <sleep>
      lock_acquire(&lock);
 239:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
 240:	e8 7b 03 00 00       	call   5c0 <lock_acquire>
   while (global < num_threads) {
 245:	a1 54 0f 00 00       	mov    0xf54,%eax
 24a:	83 c4 10             	add    $0x10,%esp
 24d:	39 05 64 0f 00 00    	cmp    %eax,0xf64
 253:	7c cb                	jl     220 <worker+0x70>
   }

   global = 0;
 255:	c7 05 64 0f 00 00 00 	movl   $0x0,0xf64
 25c:	00 00 00 
   sbrk(10000);
 25f:	83 ec 0c             	sub    $0xc,%esp
 262:	68 10 27 00 00       	push   $0x2710
 267:	e8 66 04 00 00       	call   6d2 <sbrk>
   size = (unsigned int)sbrk(0);
 26c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 273:	e8 5a 04 00 00       	call   6d2 <sbrk>
   lock_release(&lock);
 278:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
   size = (unsigned int)sbrk(0);
 27f:	a3 60 0f 00 00       	mov    %eax,0xf60
   lock_release(&lock);
 284:	e8 57 03 00 00       	call   5e0 <lock_release>

   while (global < num_threads) {
 289:	a1 54 0f 00 00       	mov    0xf54,%eax
 28e:	83 c4 10             	add    $0x10,%esp
 291:	39 05 64 0f 00 00    	cmp    %eax,0xf64
 297:	7d 3c                	jge    2d5 <worker+0x125>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      lock_release(&lock2);
 2a0:	83 ec 0c             	sub    $0xc,%esp
 2a3:	68 58 0f 00 00       	push   $0xf58
 2a8:	e8 33 03 00 00       	call   5e0 <lock_release>
      sleep(100);
 2ad:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 2b4:	e8 21 04 00 00       	call   6da <sleep>
      lock_acquire(&lock2);
 2b9:	c7 04 24 58 0f 00 00 	movl   $0xf58,(%esp)
 2c0:	e8 fb 02 00 00       	call   5c0 <lock_acquire>
   while (global < num_threads) {
 2c5:	a1 54 0f 00 00       	mov    0xf54,%eax
 2ca:	83 c4 10             	add    $0x10,%esp
 2cd:	39 05 64 0f 00 00    	cmp    %eax,0xf64
 2d3:	7c cb                	jl     2a0 <worker+0xf0>
   }
   lock_release(&lock2);
 2d5:	83 ec 0c             	sub    $0xc,%esp
 2d8:	68 58 0f 00 00       	push   $0xf58
 2dd:	e8 fe 02 00 00       	call   5e0 <lock_release>

   int nested_join_pid = thread_join();
 2e2:	e8 39 03 00 00       	call   620 <thread_join>
   assert(nested_join_pid > 0);
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	85 c0                	test   %eax,%eax
 2ec:	7e 05                	jle    2f3 <worker+0x143>




   exit();
 2ee:	e8 57 03 00 00       	call   64a <exit>
   assert(nested_join_pid > 0);
 2f3:	6a 5d                	push   $0x5d
 2f5:	68 d8 0a 00 00       	push   $0xad8
 2fa:	68 e2 0a 00 00       	push   $0xae2
 2ff:	6a 01                	push   $0x1
 301:	e8 aa 04 00 00       	call   7b0 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 3e 0b 00 00       	push   $0xb3e
 30e:	68 08 0b 00 00       	push   $0xb08
 313:	6a 01                	push   $0x1
 315:	e8 96 04 00 00       	call   7b0 <printf>
 31a:	58                   	pop    %eax
 31b:	5a                   	pop    %edx
 31c:	68 1c 0b 00 00       	push   $0xb1c
 321:	6a 01                	push   $0x1
 323:	e8 88 04 00 00       	call   7b0 <printf>
 328:	59                   	pop    %ecx
 329:	ff 35 68 0f 00 00    	push   0xf68
 32f:	e8 46 03 00 00       	call   67a <kill>
 334:	e8 11 03 00 00       	call   64a <exit>
    assert(nested_thread_id > 0);
 339:	6a 47                	push   $0x47
 33b:	68 d8 0a 00 00       	push   $0xad8
 340:	68 e2 0a 00 00       	push   $0xae2
 345:	6a 01                	push   $0x1
 347:	e8 64 04 00 00       	call   7b0 <printf>
 34c:	83 c4 0c             	add    $0xc,%esp
 34f:	68 29 0b 00 00       	push   $0xb29
 354:	eb b8                	jmp    30e <worker+0x15e>
 356:	66 90                	xchg   %ax,%ax
 358:	66 90                	xchg   %ax,%ax
 35a:	66 90                	xchg   %ax,%ax
 35c:	66 90                	xchg   %ax,%ax
 35e:	66 90                	xchg   %ax,%ax

00000360 <strcpy>:
#include "x86.h"

uint original_stack = 0;
char*
strcpy(char *s, const char *t)
{
 360:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 361:	31 c0                	xor    %eax,%eax
{
 363:	89 e5                	mov    %esp,%ebp
 365:	53                   	push   %ebx
 366:	8b 4d 08             	mov    0x8(%ebp),%ecx
 369:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 370:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 374:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 377:	83 c0 01             	add    $0x1,%eax
 37a:	84 d2                	test   %dl,%dl
 37c:	75 f2                	jne    370 <strcpy+0x10>
    ;
  return os;
}
 37e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 381:	89 c8                	mov    %ecx,%eax
 383:	c9                   	leave  
 384:	c3                   	ret    
 385:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 55 08             	mov    0x8(%ebp),%edx
 397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 39a:	0f b6 02             	movzbl (%edx),%eax
 39d:	84 c0                	test   %al,%al
 39f:	75 17                	jne    3b8 <strcmp+0x28>
 3a1:	eb 3a                	jmp    3dd <strcmp+0x4d>
 3a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3a7:	90                   	nop
 3a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3ac:	83 c2 01             	add    $0x1,%edx
 3af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3b2:	84 c0                	test   %al,%al
 3b4:	74 1a                	je     3d0 <strcmp+0x40>
    p++, q++;
 3b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3b8:	0f b6 19             	movzbl (%ecx),%ebx
 3bb:	38 c3                	cmp    %al,%bl
 3bd:	74 e9                	je     3a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3bf:	29 d8                	sub    %ebx,%eax
}
 3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c4:	c9                   	leave  
 3c5:	c3                   	ret    
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3d4:	31 c0                	xor    %eax,%eax
 3d6:	29 d8                	sub    %ebx,%eax
}
 3d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3db:	c9                   	leave  
 3dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3dd:	0f b6 19             	movzbl (%ecx),%ebx
 3e0:	31 c0                	xor    %eax,%eax
 3e2:	eb db                	jmp    3bf <strcmp+0x2f>
 3e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <strlen>:

uint
strlen(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3f6:	80 3a 00             	cmpb   $0x0,(%edx)
 3f9:	74 15                	je     410 <strlen+0x20>
 3fb:	31 c0                	xor    %eax,%eax
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	83 c0 01             	add    $0x1,%eax
 403:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 407:	89 c1                	mov    %eax,%ecx
 409:	75 f5                	jne    400 <strlen+0x10>
    ;
  return n;
}
 40b:	89 c8                	mov    %ecx,%eax
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret    
 40f:	90                   	nop
  for(n = 0; s[n]; n++)
 410:	31 c9                	xor    %ecx,%ecx
}
 412:	5d                   	pop    %ebp
 413:	89 c8                	mov    %ecx,%eax
 415:	c3                   	ret    
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <memset>:

void*
memset(void *dst, int c, uint n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	89 d7                	mov    %edx,%edi
 42f:	fc                   	cld    
 430:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 432:	8b 7d fc             	mov    -0x4(%ebp),%edi
 435:	89 d0                	mov    %edx,%eax
 437:	c9                   	leave  
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000440 <strchr>:

char*
strchr(const char *s, char c)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	8b 45 08             	mov    0x8(%ebp),%eax
 446:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 44a:	0f b6 10             	movzbl (%eax),%edx
 44d:	84 d2                	test   %dl,%dl
 44f:	75 12                	jne    463 <strchr+0x23>
 451:	eb 1d                	jmp    470 <strchr+0x30>
 453:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 457:	90                   	nop
 458:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 45c:	83 c0 01             	add    $0x1,%eax
 45f:	84 d2                	test   %dl,%dl
 461:	74 0d                	je     470 <strchr+0x30>
    if(*s == c)
 463:	38 d1                	cmp    %dl,%cl
 465:	75 f1                	jne    458 <strchr+0x18>
      return (char*)s;
  return 0;
}
 467:	5d                   	pop    %ebp
 468:	c3                   	ret    
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 470:	31 c0                	xor    %eax,%eax
}
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <gets>:

char*
gets(char *buf, int max)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 485:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 488:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 489:	31 db                	xor    %ebx,%ebx
{
 48b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 48e:	eb 27                	jmp    4b7 <gets+0x37>
    cc = read(0, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	6a 01                	push   $0x1
 495:	57                   	push   %edi
 496:	6a 00                	push   $0x0
 498:	e8 c5 01 00 00       	call   662 <read>
    if(cc < 1)
 49d:	83 c4 10             	add    $0x10,%esp
 4a0:	85 c0                	test   %eax,%eax
 4a2:	7e 1d                	jle    4c1 <gets+0x41>
      break;
    buf[i++] = c;
 4a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4a8:	8b 55 08             	mov    0x8(%ebp),%edx
 4ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4af:	3c 0a                	cmp    $0xa,%al
 4b1:	74 1d                	je     4d0 <gets+0x50>
 4b3:	3c 0d                	cmp    $0xd,%al
 4b5:	74 19                	je     4d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4b7:	89 de                	mov    %ebx,%esi
 4b9:	83 c3 01             	add    $0x1,%ebx
 4bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4bf:	7c cf                	jl     490 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4c1:	8b 45 08             	mov    0x8(%ebp),%eax
 4c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cb:	5b                   	pop    %ebx
 4cc:	5e                   	pop    %esi
 4cd:	5f                   	pop    %edi
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret    
  buf[i] = '\0';
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
 4d3:	89 de                	mov    %ebx,%esi
 4d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret    
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop

000004f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f5:	83 ec 08             	sub    $0x8,%esp
 4f8:	6a 00                	push   $0x0
 4fa:	ff 75 08             	push   0x8(%ebp)
 4fd:	e8 88 01 00 00       	call   68a <open>
  if(fd < 0)
 502:	83 c4 10             	add    $0x10,%esp
 505:	85 c0                	test   %eax,%eax
 507:	78 27                	js     530 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 509:	83 ec 08             	sub    $0x8,%esp
 50c:	ff 75 0c             	push   0xc(%ebp)
 50f:	89 c3                	mov    %eax,%ebx
 511:	50                   	push   %eax
 512:	e8 8b 01 00 00       	call   6a2 <fstat>
  close(fd);
 517:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 51a:	89 c6                	mov    %eax,%esi
  close(fd);
 51c:	e8 51 01 00 00       	call   672 <close>
  return r;
 521:	83 c4 10             	add    $0x10,%esp
}
 524:	8d 65 f8             	lea    -0x8(%ebp),%esp
 527:	89 f0                	mov    %esi,%eax
 529:	5b                   	pop    %ebx
 52a:	5e                   	pop    %esi
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    
 52d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 530:	be ff ff ff ff       	mov    $0xffffffff,%esi
 535:	eb ed                	jmp    524 <stat+0x34>
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax

00000540 <atoi>:

int
atoi(const char *s)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	53                   	push   %ebx
 544:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 547:	0f be 02             	movsbl (%edx),%eax
 54a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 54d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 550:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 555:	77 1e                	ja     575 <atoi+0x35>
 557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 560:	83 c2 01             	add    $0x1,%edx
 563:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 566:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 56a:	0f be 02             	movsbl (%edx),%eax
 56d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 570:	80 fb 09             	cmp    $0x9,%bl
 573:	76 eb                	jbe    560 <atoi+0x20>
  return n;
}
 575:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 578:	89 c8                	mov    %ecx,%eax
 57a:	c9                   	leave  
 57b:	c3                   	ret    
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	8b 45 10             	mov    0x10(%ebp),%eax
 587:	8b 55 08             	mov    0x8(%ebp),%edx
 58a:	56                   	push   %esi
 58b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 58e:	85 c0                	test   %eax,%eax
 590:	7e 13                	jle    5a5 <memmove+0x25>
 592:	01 d0                	add    %edx,%eax
  dst = vdst;
 594:	89 d7                	mov    %edx,%edi
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5a1:	39 f8                	cmp    %edi,%eax
 5a3:	75 fb                	jne    5a0 <memmove+0x20>
  return vdst;
}
 5a5:	5e                   	pop    %esi
 5a6:	89 d0                	mov    %edx,%eax
 5a8:	5f                   	pop    %edi
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <lock_init>:

void 
lock_init(lock_t *spinlock)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
  spinlock->acquired = 0;
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    
 5be:	66 90                	xchg   %ax,%ax

000005c0 <lock_acquire>:

void 
lock_acquire(lock_t *spinlock)
{
 5c0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5c1:	b9 01 00 00 00       	mov    $0x1,%ecx
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	8b 55 08             	mov    0x8(%ebp),%edx
 5cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg((volatile uint *)&spinlock->acquired, 1) == 1)
 5d5:	83 f8 01             	cmp    $0x1,%eax
 5d8:	74 f6                	je     5d0 <lock_acquire+0x10>
    ; // spin
}
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005e0 <lock_release>:

void 
lock_release(lock_t *spinlock)
{
 5e0:	55                   	push   %ebp
 5e1:	31 c0                	xor    %eax,%eax
 5e3:	89 e5                	mov    %esp,%ebp
 5e5:	8b 55 08             	mov    0x8(%ebp),%edx
 5e8:	f0 87 02             	lock xchg %eax,(%edx)
  xchg((volatile uint *)&spinlock->acquired, 0);
}
 5eb:	5d                   	pop    %ebp
 5ec:	c3                   	ret    
 5ed:	8d 76 00             	lea    0x0(%esi),%esi

000005f0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 14             	sub    $0x14,%esp
  void* stack = malloc(2*4096);
 5f6:	68 00 20 00 00       	push   $0x2000
 5fb:	e8 e0 03 00 00       	call   9e0 <malloc>
  original_stack = *(uint*)(stack);
 600:	8b 10                	mov    (%eax),%edx
  return clone(start_routine, arg1, arg2, stack);
 602:	50                   	push   %eax
 603:	ff 75 10             	push   0x10(%ebp)
 606:	ff 75 0c             	push   0xc(%ebp)
 609:	ff 75 08             	push   0x8(%ebp)
  original_stack = *(uint*)(stack);
 60c:	89 15 6c 0f 00 00    	mov    %edx,0xf6c
  return clone(start_routine, arg1, arg2, stack);
 612:	e8 db 00 00 00       	call   6f2 <clone>
}
 617:	c9                   	leave  
 618:	c3                   	ret    
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000620 <thread_join>:

int thread_join(void){
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	53                   	push   %ebx
  //free global var ?
  void* stack;
  int wait_pid = -1;
  wait_pid = join(&stack);
 624:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void){
 627:	83 ec 20             	sub    $0x20,%esp
  wait_pid = join(&stack);
 62a:	50                   	push   %eax
 62b:	e8 ba 00 00 00       	call   6ea <join>
 630:	89 c3                	mov    %eax,%ebx
  free(stack);
 632:	58                   	pop    %eax
 633:	ff 75 f4             	push   -0xc(%ebp)
 636:	e8 15 03 00 00       	call   950 <free>
  return wait_pid;
 63b:	89 d8                	mov    %ebx,%eax
 63d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 640:	c9                   	leave  
 641:	c3                   	ret    

00000642 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 642:	b8 01 00 00 00       	mov    $0x1,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <exit>:
SYSCALL(exit)
 64a:	b8 02 00 00 00       	mov    $0x2,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <wait>:
SYSCALL(wait)
 652:	b8 03 00 00 00       	mov    $0x3,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <pipe>:
SYSCALL(pipe)
 65a:	b8 04 00 00 00       	mov    $0x4,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <read>:
SYSCALL(read)
 662:	b8 05 00 00 00       	mov    $0x5,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <write>:
SYSCALL(write)
 66a:	b8 10 00 00 00       	mov    $0x10,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <close>:
SYSCALL(close)
 672:	b8 15 00 00 00       	mov    $0x15,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <kill>:
SYSCALL(kill)
 67a:	b8 06 00 00 00       	mov    $0x6,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <exec>:
SYSCALL(exec)
 682:	b8 07 00 00 00       	mov    $0x7,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <open>:
SYSCALL(open)
 68a:	b8 0f 00 00 00       	mov    $0xf,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <mknod>:
SYSCALL(mknod)
 692:	b8 11 00 00 00       	mov    $0x11,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <unlink>:
SYSCALL(unlink)
 69a:	b8 12 00 00 00       	mov    $0x12,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <fstat>:
SYSCALL(fstat)
 6a2:	b8 08 00 00 00       	mov    $0x8,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <link>:
SYSCALL(link)
 6aa:	b8 13 00 00 00       	mov    $0x13,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <mkdir>:
SYSCALL(mkdir)
 6b2:	b8 14 00 00 00       	mov    $0x14,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <chdir>:
SYSCALL(chdir)
 6ba:	b8 09 00 00 00       	mov    $0x9,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <dup>:
SYSCALL(dup)
 6c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <getpid>:
SYSCALL(getpid)
 6ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <sbrk>:
SYSCALL(sbrk)
 6d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <sleep>:
SYSCALL(sleep)
 6da:	b8 0d 00 00 00       	mov    $0xd,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <uptime>:
SYSCALL(uptime)
 6e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <join>:
SYSCALL(join)
 6ea:	b8 17 00 00 00       	mov    $0x17,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <clone>:
SYSCALL(clone)
 6f2:	b8 16 00 00 00       	mov    $0x16,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    
 6fa:	66 90                	xchg   %ax,%ax
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 3c             	sub    $0x3c,%esp
 709:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 70c:	89 d1                	mov    %edx,%ecx
{
 70e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 711:	85 d2                	test   %edx,%edx
 713:	0f 89 7f 00 00 00    	jns    798 <printint+0x98>
 719:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 71d:	74 79                	je     798 <printint+0x98>
    neg = 1;
 71f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 726:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 728:	31 db                	xor    %ebx,%ebx
 72a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	31 d2                	xor    %edx,%edx
 734:	89 cf                	mov    %ecx,%edi
 736:	f7 75 c4             	divl   -0x3c(%ebp)
 739:	0f b6 92 d0 0b 00 00 	movzbl 0xbd0(%edx),%edx
 740:	89 45 c0             	mov    %eax,-0x40(%ebp)
 743:	89 d8                	mov    %ebx,%eax
 745:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 748:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 74b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 74e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 751:	76 dd                	jbe    730 <printint+0x30>
  if(neg)
 753:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 756:	85 c9                	test   %ecx,%ecx
 758:	74 0c                	je     766 <printint+0x66>
    buf[i++] = '-';
 75a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 75f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 761:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 766:	8b 7d b8             	mov    -0x48(%ebp),%edi
 769:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 76d:	eb 07                	jmp    776 <printint+0x76>
 76f:	90                   	nop
    putc(fd, buf[i]);
 770:	0f b6 13             	movzbl (%ebx),%edx
 773:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 776:	83 ec 04             	sub    $0x4,%esp
 779:	88 55 d7             	mov    %dl,-0x29(%ebp)
 77c:	6a 01                	push   $0x1
 77e:	56                   	push   %esi
 77f:	57                   	push   %edi
 780:	e8 e5 fe ff ff       	call   66a <write>
  while(--i >= 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	39 de                	cmp    %ebx,%esi
 78a:	75 e4                	jne    770 <printint+0x70>
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 798:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 79f:	eb 87                	jmp    728 <printint+0x28>
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7bf:	0f b6 13             	movzbl (%ebx),%edx
 7c2:	84 d2                	test   %dl,%dl
 7c4:	74 6a                	je     830 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7c6:	8d 45 10             	lea    0x10(%ebp),%eax
 7c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d4:	eb 36                	jmp    80c <printf+0x5c>
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
 7e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 7e8:	83 f8 25             	cmp    $0x25,%eax
 7eb:	74 15                	je     802 <printf+0x52>
  write(fd, &c, 1);
 7ed:	83 ec 04             	sub    $0x4,%esp
 7f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7f3:	6a 01                	push   $0x1
 7f5:	57                   	push   %edi
 7f6:	56                   	push   %esi
 7f7:	e8 6e fe ff ff       	call   66a <write>
 7fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 7ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 802:	0f b6 13             	movzbl (%ebx),%edx
 805:	83 c3 01             	add    $0x1,%ebx
 808:	84 d2                	test   %dl,%dl
 80a:	74 24                	je     830 <printf+0x80>
    c = fmt[i] & 0xff;
 80c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 80f:	85 c9                	test   %ecx,%ecx
 811:	74 cd                	je     7e0 <printf+0x30>
      }
    } else if(state == '%'){
 813:	83 f9 25             	cmp    $0x25,%ecx
 816:	75 ea                	jne    802 <printf+0x52>
      if(c == 'd'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	0f 84 07 01 00 00    	je     928 <printf+0x178>
 821:	83 e8 63             	sub    $0x63,%eax
 824:	83 f8 15             	cmp    $0x15,%eax
 827:	77 17                	ja     840 <printf+0x90>
 829:	ff 24 85 78 0b 00 00 	jmp    *0xb78(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 830:	8d 65 f4             	lea    -0xc(%ebp),%esp
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
 843:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 846:	6a 01                	push   $0x1
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 84e:	e8 17 fe ff ff       	call   66a <write>
        putc(fd, c);
 853:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 857:	83 c4 0c             	add    $0xc,%esp
 85a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 85d:	6a 01                	push   $0x1
 85f:	57                   	push   %edi
 860:	56                   	push   %esi
 861:	e8 04 fe ff ff       	call   66a <write>
        putc(fd, c);
 866:	83 c4 10             	add    $0x10,%esp
      state = 0;
 869:	31 c9                	xor    %ecx,%ecx
 86b:	eb 95                	jmp    802 <printf+0x52>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 10 00 00 00       	mov    $0x10,%ecx
 878:	6a 00                	push   $0x0
 87a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 87d:	8b 10                	mov    (%eax),%edx
 87f:	89 f0                	mov    %esi,%eax
 881:	e8 7a fe ff ff       	call   700 <printint>
        ap++;
 886:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 88a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88d:	31 c9                	xor    %ecx,%ecx
 88f:	e9 6e ff ff ff       	jmp    802 <printf+0x52>
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 898:	8b 45 d0             	mov    -0x30(%ebp),%eax
 89b:	8b 10                	mov    (%eax),%edx
        ap++;
 89d:	83 c0 04             	add    $0x4,%eax
 8a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8a3:	85 d2                	test   %edx,%edx
 8a5:	0f 84 8d 00 00 00    	je     938 <printf+0x188>
        while(*s != 0){
 8ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8b0:	84 c0                	test   %al,%al
 8b2:	0f 84 4a ff ff ff    	je     802 <printf+0x52>
 8b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8bb:	89 d3                	mov    %edx,%ebx
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8c3:	83 c3 01             	add    $0x1,%ebx
 8c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8c9:	6a 01                	push   $0x1
 8cb:	57                   	push   %edi
 8cc:	56                   	push   %esi
 8cd:	e8 98 fd ff ff       	call   66a <write>
        while(*s != 0){
 8d2:	0f b6 03             	movzbl (%ebx),%eax
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	84 c0                	test   %al,%al
 8da:	75 e4                	jne    8c0 <printf+0x110>
      state = 0;
 8dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8df:	31 c9                	xor    %ecx,%ecx
 8e1:	e9 1c ff ff ff       	jmp    802 <printf+0x52>
 8e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f8:	6a 01                	push   $0x1
 8fa:	e9 7b ff ff ff       	jmp    87a <printf+0xca>
 8ff:	90                   	nop
        putc(fd, *ap);
 900:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 906:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 908:	6a 01                	push   $0x1
 90a:	57                   	push   %edi
 90b:	56                   	push   %esi
        putc(fd, *ap);
 90c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 90f:	e8 56 fd ff ff       	call   66a <write>
        ap++;
 914:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 918:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91b:	31 c9                	xor    %ecx,%ecx
 91d:	e9 e0 fe ff ff       	jmp    802 <printf+0x52>
 922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 928:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 92b:	83 ec 04             	sub    $0x4,%esp
 92e:	e9 2a ff ff ff       	jmp    85d <printf+0xad>
 933:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 937:	90                   	nop
          s = "(null)";
 938:	ba 6e 0b 00 00       	mov    $0xb6e,%edx
        while(*s != 0){
 93d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 940:	b8 28 00 00 00       	mov    $0x28,%eax
 945:	89 d3                	mov    %edx,%ebx
 947:	e9 74 ff ff ff       	jmp    8c0 <printf+0x110>
 94c:	66 90                	xchg   %ax,%ax
 94e:	66 90                	xchg   %ax,%ax

00000950 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 950:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	a1 70 0f 00 00       	mov    0xf70,%eax
{
 956:	89 e5                	mov    %esp,%ebp
 958:	57                   	push   %edi
 959:	56                   	push   %esi
 95a:	53                   	push   %ebx
 95b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 95e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 968:	89 c2                	mov    %eax,%edx
 96a:	8b 00                	mov    (%eax),%eax
 96c:	39 ca                	cmp    %ecx,%edx
 96e:	73 30                	jae    9a0 <free+0x50>
 970:	39 c1                	cmp    %eax,%ecx
 972:	72 04                	jb     978 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 974:	39 c2                	cmp    %eax,%edx
 976:	72 f0                	jb     968 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 978:	8b 73 fc             	mov    -0x4(%ebx),%esi
 97b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97e:	39 f8                	cmp    %edi,%eax
 980:	74 30                	je     9b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 982:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 985:	8b 42 04             	mov    0x4(%edx),%eax
 988:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 98b:	39 f1                	cmp    %esi,%ecx
 98d:	74 3a                	je     9c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 98f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 991:	5b                   	pop    %ebx
  freep = p;
 992:	89 15 70 0f 00 00    	mov    %edx,0xf70
}
 998:	5e                   	pop    %esi
 999:	5f                   	pop    %edi
 99a:	5d                   	pop    %ebp
 99b:	c3                   	ret    
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a0:	39 c2                	cmp    %eax,%edx
 9a2:	72 c4                	jb     968 <free+0x18>
 9a4:	39 c1                	cmp    %eax,%ecx
 9a6:	73 c0                	jae    968 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ae:	39 f8                	cmp    %edi,%eax
 9b0:	75 d0                	jne    982 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9b2:	03 70 04             	add    0x4(%eax),%esi
 9b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b8:	8b 02                	mov    (%edx),%eax
 9ba:	8b 00                	mov    (%eax),%eax
 9bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bf:	8b 42 04             	mov    0x4(%edx),%eax
 9c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9c5:	39 f1                	cmp    %esi,%ecx
 9c7:	75 c6                	jne    98f <free+0x3f>
    p->s.size += bp->s.size;
 9c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9cc:	89 15 70 0f 00 00    	mov    %edx,0xf70
    p->s.size += bp->s.size;
 9d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9d8:	89 0a                	mov    %ecx,(%edx)
}
 9da:	5b                   	pop    %ebx
 9db:	5e                   	pop    %esi
 9dc:	5f                   	pop    %edi
 9dd:	5d                   	pop    %ebp
 9de:	c3                   	ret    
 9df:	90                   	nop

000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	57                   	push   %edi
 9e4:	56                   	push   %esi
 9e5:	53                   	push   %ebx
 9e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ec:	8b 3d 70 0f 00 00    	mov    0xf70,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f2:	8d 70 07             	lea    0x7(%eax),%esi
 9f5:	c1 ee 03             	shr    $0x3,%esi
 9f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9fb:	85 ff                	test   %edi,%edi
 9fd:	0f 84 9d 00 00 00    	je     aa0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a03:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a05:	8b 4a 04             	mov    0x4(%edx),%ecx
 a08:	39 f1                	cmp    %esi,%ecx
 a0a:	73 6a                	jae    a76 <malloc+0x96>
 a0c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a11:	39 de                	cmp    %ebx,%esi
 a13:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a16:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a20:	eb 17                	jmp    a39 <malloc+0x59>
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a2a:	8b 48 04             	mov    0x4(%eax),%ecx
 a2d:	39 f1                	cmp    %esi,%ecx
 a2f:	73 4f                	jae    a80 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	8b 3d 70 0f 00 00    	mov    0xf70,%edi
 a37:	89 c2                	mov    %eax,%edx
 a39:	39 d7                	cmp    %edx,%edi
 a3b:	75 eb                	jne    a28 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a3d:	83 ec 0c             	sub    $0xc,%esp
 a40:	ff 75 e4             	push   -0x1c(%ebp)
 a43:	e8 8a fc ff ff       	call   6d2 <sbrk>
  if(p == (char*)-1)
 a48:	83 c4 10             	add    $0x10,%esp
 a4b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4e:	74 1c                	je     a6c <malloc+0x8c>
  hp->s.size = nu;
 a50:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a53:	83 ec 0c             	sub    $0xc,%esp
 a56:	83 c0 08             	add    $0x8,%eax
 a59:	50                   	push   %eax
 a5a:	e8 f1 fe ff ff       	call   950 <free>
  return freep;
 a5f:	8b 15 70 0f 00 00    	mov    0xf70,%edx
      if((p = morecore(nunits)) == 0)
 a65:	83 c4 10             	add    $0x10,%esp
 a68:	85 d2                	test   %edx,%edx
 a6a:	75 bc                	jne    a28 <malloc+0x48>
        return 0;
  }
}
 a6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a6f:	31 c0                	xor    %eax,%eax
}
 a71:	5b                   	pop    %ebx
 a72:	5e                   	pop    %esi
 a73:	5f                   	pop    %edi
 a74:	5d                   	pop    %ebp
 a75:	c3                   	ret    
    if(p->s.size >= nunits){
 a76:	89 d0                	mov    %edx,%eax
 a78:	89 fa                	mov    %edi,%edx
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a80:	39 ce                	cmp    %ecx,%esi
 a82:	74 4c                	je     ad0 <malloc+0xf0>
        p->s.size -= nunits;
 a84:	29 f1                	sub    %esi,%ecx
 a86:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a89:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a8c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a8f:	89 15 70 0f 00 00    	mov    %edx,0xf70
}
 a95:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a98:	83 c0 08             	add    $0x8,%eax
}
 a9b:	5b                   	pop    %ebx
 a9c:	5e                   	pop    %esi
 a9d:	5f                   	pop    %edi
 a9e:	5d                   	pop    %ebp
 a9f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 aa0:	c7 05 70 0f 00 00 74 	movl   $0xf74,0xf70
 aa7:	0f 00 00 
    base.s.size = 0;
 aaa:	bf 74 0f 00 00       	mov    $0xf74,%edi
    base.s.ptr = freep = prevp = &base;
 aaf:	c7 05 74 0f 00 00 74 	movl   $0xf74,0xf74
 ab6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 abb:	c7 05 78 0f 00 00 00 	movl   $0x0,0xf78
 ac2:	00 00 00 
    if(p->s.size >= nunits){
 ac5:	e9 42 ff ff ff       	jmp    a0c <malloc+0x2c>
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ad0:	8b 08                	mov    (%eax),%ecx
 ad2:	89 0a                	mov    %ecx,(%edx)
 ad4:	eb b9                	jmp    a8f <malloc+0xaf>
