
_test_10:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void worker(void *arg1, void *arg2);

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 23 05 00 00       	call   53a <getpid>

   int arg1 = 35;
   int arg2 = 42;
   int thread_pid = thread_create(worker, &arg1, &arg2);
  17:	83 ec 04             	sub    $0x4,%esp
   int arg1 = 35;
  1a:	c7 45 f0 23 00 00 00 	movl   $0x23,-0x10(%ebp)
   ppid = getpid();
  21:	a3 b4 0d 00 00       	mov    %eax,0xdb4
   int thread_pid = thread_create(worker, &arg1, &arg2);
  26:	8d 45 f4             	lea    -0xc(%ebp),%eax
  29:	50                   	push   %eax
  2a:	8d 45 f0             	lea    -0x10(%ebp),%eax
  2d:	50                   	push   %eax
  2e:	68 00 01 00 00       	push   $0x100
   int arg2 = 42;
  33:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
  3a:	e8 11 04 00 00       	call   450 <thread_create>
   assert(thread_pid > 0);
  3f:	83 c4 10             	add    $0x10,%esp
  42:	85 c0                	test   %eax,%eax
  44:	7e 7b                	jle    c1 <main+0xc1>
  46:	89 c3                	mov    %eax,%ebx

   int join_pid = thread_join();
  48:	e8 43 04 00 00       	call   490 <thread_join>
   assert(join_pid == thread_pid);
  4d:	39 c3                	cmp    %eax,%ebx
  4f:	75 2a                	jne    7b <main+0x7b>
   assert(global == 2);
  51:	83 3d b0 0d 00 00 02 	cmpl   $0x2,0xdb0
  58:	0f 84 80 00 00 00    	je     de <main+0xde>
  5e:	6a 23                	push   $0x23
  60:	68 48 09 00 00       	push   $0x948
  65:	68 52 09 00 00       	push   $0x952
  6a:	6a 01                	push   $0x1
  6c:	e8 af 05 00 00       	call   620 <printf>
  71:	83 c4 0c             	add    $0xc,%esp
  74:	68 cb 09 00 00       	push   $0x9cb
  79:	eb 1b                	jmp    96 <main+0x96>
   assert(join_pid == thread_pid);
  7b:	6a 22                	push   $0x22
  7d:	68 48 09 00 00       	push   $0x948
  82:	68 52 09 00 00       	push   $0x952
  87:	6a 01                	push   $0x1
  89:	e8 92 05 00 00       	call   620 <printf>
  8e:	83 c4 0c             	add    $0xc,%esp
  91:	68 b4 09 00 00       	push   $0x9b4
  96:	68 69 09 00 00       	push   $0x969
  9b:	6a 01                	push   $0x1
  9d:	e8 7e 05 00 00       	call   620 <printf>
  a2:	5a                   	pop    %edx
  a3:	59                   	pop    %ecx
  a4:	68 7d 09 00 00       	push   $0x97d
  a9:	6a 01                	push   $0x1
  ab:	e8 70 05 00 00       	call   620 <printf>
  b0:	5b                   	pop    %ebx
  b1:	ff 35 b4 0d 00 00    	push   0xdb4
  b7:	e8 2e 04 00 00       	call   4ea <kill>
  bc:	e8 f9 03 00 00       	call   4ba <exit>
   assert(thread_pid > 0);
  c1:	6a 1f                	push   $0x1f
  c3:	68 48 09 00 00       	push   $0x948
  c8:	68 52 09 00 00       	push   $0x952
  cd:	6a 01                	push   $0x1
  cf:	e8 4c 05 00 00       	call   620 <printf>
  d4:	83 c4 0c             	add    $0xc,%esp
  d7:	68 a5 09 00 00       	push   $0x9a5
  dc:	eb b8                	jmp    96 <main+0x96>

   printf(1, "TEST PASSED\n");
  de:	50                   	push   %eax
  df:	50                   	push   %eax
  e0:	68 d7 09 00 00       	push   $0x9d7
  e5:	6a 01                	push   $0x1
  e7:	e8 34 05 00 00       	call   620 <printf>
   exit();
  ec:	e8 c9 03 00 00       	call   4ba <exit>
  f1:	66 90                	xchg   %ax,%ax
  f3:	66 90                	xchg   %ax,%ax
  f5:	66 90                	xchg   %ax,%ax
  f7:	66 90                	xchg   %ax,%ax
  f9:	66 90                	xchg   %ax,%ax
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <worker>:
}

void
worker(void *arg1, void *arg2) {
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
 106:	8b 45 0c             	mov    0xc(%ebp),%eax
 109:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	83 38 23             	cmpl   $0x23,(%eax)
 111:	75 75                	jne    188 <worker+0x88>
   assert(arg2_int == 42);
 113:	83 fa 2a             	cmp    $0x2a,%edx
 116:	75 2a                	jne    142 <worker+0x42>
   assert(global == 1);
 118:	83 3d b0 0d 00 00 01 	cmpl   $0x1,0xdb0
 11f:	0f 84 80 00 00 00    	je     1a5 <worker+0xa5>
 125:	6a 2f                	push   $0x2f
 127:	68 48 09 00 00       	push   $0x948
 12c:	68 52 09 00 00       	push   $0x952
 131:	6a 01                	push   $0x1
 133:	e8 e8 04 00 00       	call   620 <printf>
 138:	83 c4 0c             	add    $0xc,%esp
 13b:	68 99 09 00 00       	push   $0x999
 140:	eb 1b                	jmp    15d <worker+0x5d>
   assert(arg2_int == 42);
 142:	6a 2e                	push   $0x2e
 144:	68 48 09 00 00       	push   $0x948
 149:	68 52 09 00 00       	push   $0x952
 14e:	6a 01                	push   $0x1
 150:	e8 cb 04 00 00       	call   620 <printf>
 155:	83 c4 0c             	add    $0xc,%esp
 158:	68 8a 09 00 00       	push   $0x98a
 15d:	68 69 09 00 00       	push   $0x969
 162:	6a 01                	push   $0x1
 164:	e8 b7 04 00 00       	call   620 <printf>
 169:	58                   	pop    %eax
 16a:	5a                   	pop    %edx
 16b:	68 7d 09 00 00       	push   $0x97d
 170:	6a 01                	push   $0x1
 172:	e8 a9 04 00 00       	call   620 <printf>
 177:	59                   	pop    %ecx
 178:	ff 35 b4 0d 00 00    	push   0xdb4
 17e:	e8 67 03 00 00       	call   4ea <kill>
 183:	e8 32 03 00 00       	call   4ba <exit>
   assert(arg1_int == 35);
 188:	6a 2d                	push   $0x2d
 18a:	68 48 09 00 00       	push   $0x948
 18f:	68 52 09 00 00       	push   $0x952
 194:	6a 01                	push   $0x1
 196:	e8 85 04 00 00       	call   620 <printf>
 19b:	83 c4 0c             	add    $0xc,%esp
 19e:	68 5a 09 00 00       	push   $0x95a
 1a3:	eb b8                	jmp    15d <worker+0x5d>
   global++;
 1a5:	c7 05 b0 0d 00 00 02 	movl   $0x2,0xdb0
 1ac:	00 00 00 
   exit();
 1af:	e8 06 03 00 00       	call   4ba <exit>
 1b4:	66 90                	xchg   %ax,%ax
 1b6:	66 90                	xchg   %ax,%ax
 1b8:	66 90                	xchg   %ax,%ax
 1ba:	66 90                	xchg   %ax,%ax
 1bc:	66 90                	xchg   %ax,%ax
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strcpy>:
#include "x86.h"

uint original_stack = 0;
char*
strcpy(char *s, const char *t)
{
 1c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1c1:	31 c0                	xor    %eax,%eax
{
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strcpy+0x10>
    ;
  return os;
}
 1de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e1:	89 c8                	mov    %ecx,%eax
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    
 1e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
 1f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1fa:	0f b6 02             	movzbl (%edx),%eax
 1fd:	84 c0                	test   %al,%al
 1ff:	75 17                	jne    218 <strcmp+0x28>
 201:	eb 3a                	jmp    23d <strcmp+0x4d>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 20c:	83 c2 01             	add    $0x1,%edx
 20f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 212:	84 c0                	test   %al,%al
 214:	74 1a                	je     230 <strcmp+0x40>
    p++, q++;
 216:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 218:	0f b6 19             	movzbl (%ecx),%ebx
 21b:	38 c3                	cmp    %al,%bl
 21d:	74 e9                	je     208 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 21f:	29 d8                	sub    %ebx,%eax
}
 221:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 224:	c9                   	leave  
 225:	c3                   	ret    
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 230:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 234:	31 c0                	xor    %eax,%eax
 236:	29 d8                	sub    %ebx,%eax
}
 238:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23b:	c9                   	leave  
 23c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 23d:	0f b6 19             	movzbl (%ecx),%ebx
 240:	31 c0                	xor    %eax,%eax
 242:	eb db                	jmp    21f <strcmp+0x2f>
 244:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 3a 00             	cmpb   $0x0,(%edx)
 259:	74 15                	je     270 <strlen+0x20>
 25b:	31 c0                	xor    %eax,%eax
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c0 01             	add    $0x1,%eax
 263:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 267:	89 c1                	mov    %eax,%ecx
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	89 c8                	mov    %ecx,%eax
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
 26f:	90                   	nop
  for(n = 0; s[n]; n++)
 270:	31 c9                	xor    %ecx,%ecx
}
 272:	5d                   	pop    %ebp
 273:	89 c8                	mov    %ecx,%eax
 275:	c3                   	ret    
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	8b 7d fc             	mov    -0x4(%ebp),%edi
 295:	89 d0                	mov    %edx,%eax
 297:	c9                   	leave  
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	75 12                	jne    2c3 <strchr+0x23>
 2b1:	eb 1d                	jmp    2d0 <strchr+0x30>
 2b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b7:	90                   	nop
 2b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	84 d2                	test   %dl,%dl
 2c1:	74 0d                	je     2d0 <strchr+0x30>
    if(*s == c)
 2c3:	38 d1                	cmp    %dl,%cl
 2c5:	75 f1                	jne    2b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2c7:	5d                   	pop    %ebp
 2c8:	c3                   	ret    
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2d0:	31 c0                	xor    %eax,%eax
}
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    
 2d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2e9:	31 db                	xor    %ebx,%ebx
{
 2eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ee:	eb 27                	jmp    317 <gets+0x37>
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	6a 01                	push   $0x1
 2f5:	57                   	push   %edi
 2f6:	6a 00                	push   $0x0
 2f8:	e8 d5 01 00 00       	call   4d2 <read>
    if(cc < 1)
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	7e 1d                	jle    321 <gets+0x41>
      break;
    buf[i++] = c;
 304:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 30f:	3c 0a                	cmp    $0xa,%al
 311:	74 1d                	je     330 <gets+0x50>
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 19                	je     330 <gets+0x50>
  for(i=0; i+1 < max; ){
 317:	89 de                	mov    %ebx,%esi
 319:	83 c3 01             	add    $0x1,%ebx
 31c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31f:	7c cf                	jl     2f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 328:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32b:	5b                   	pop    %ebx
 32c:	5e                   	pop    %esi
 32d:	5f                   	pop    %edi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    
  buf[i] = '\0';
 330:	8b 45 08             	mov    0x8(%ebp),%eax
 333:	89 de                	mov    %ebx,%esi
 335:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 339:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33c:	5b                   	pop    %ebx
 33d:	5e                   	pop    %esi
 33e:	5f                   	pop    %edi
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	push   0x8(%ebp)
 35d:	e8 98 01 00 00       	call   4fa <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	push   0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 9b 01 00 00       	call   512 <fstat>
  close(fd);
 377:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	e8 61 01 00 00       	call   4e2 <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
}
 384:	8d 65 f8             	lea    -0x8(%ebp),%esp
 387:	89 f0                	mov    %esi,%eax
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb ed                	jmp    384 <stat+0x34>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax

000003a0 <atoi>:

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 02             	movsbl (%edx),%eax
 3aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3b5:	77 1e                	ja     3d5 <atoi+0x35>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ca:	0f be 02             	movsbl (%edx),%eax
 3cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
  return n;
}
 3d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d8:	89 c8                	mov    %ecx,%eax
 3da:	c9                   	leave  
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 45 10             	mov    0x10(%ebp),%eax
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ea:	56                   	push   %esi
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 c0                	test   %eax,%eax
 3f0:	7e 13                	jle    405 <memmove+0x25>
 3f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <lock_init>:

void 
lock_init(lock_t *spinlock)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
  spinlock->acquired = 0;
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    
 41e:	66 90                	xchg   %ax,%ax

00000420 <lock_acquire>:

void 
lock_acquire(lock_t *spinlock)
{
 420:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 421:	b9 01 00 00 00       	mov    $0x1,%ecx
 426:	89 e5                	mov    %esp,%ebp
 428:	8b 55 08             	mov    0x8(%ebp),%edx
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
 430:	89 c8                	mov    %ecx,%eax
 432:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg((volatile uint *)&spinlock->acquired, 1) == 1)
 435:	83 f8 01             	cmp    $0x1,%eax
 438:	74 f6                	je     430 <lock_acquire+0x10>
    ; // spin
}
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <lock_release>:

void 
lock_release(lock_t *spinlock)
{
 440:	55                   	push   %ebp
 441:	31 c0                	xor    %eax,%eax
 443:	89 e5                	mov    %esp,%ebp
 445:	8b 55 08             	mov    0x8(%ebp),%edx
 448:	f0 87 02             	lock xchg %eax,(%edx)
  xchg((volatile uint *)&spinlock->acquired, 0);
}
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    
 44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	83 ec 14             	sub    $0x14,%esp
  void* stack = malloc(2*4096);
 456:	68 00 20 00 00       	push   $0x2000
 45b:	e8 f0 03 00 00       	call   850 <malloc>
  original_stack = *(uint*)(stack);
  if((uint)stack % 4096 != 0)
 460:	83 c4 10             	add    $0x10,%esp
  original_stack = *(uint*)(stack);
 463:	8b 10                	mov    (%eax),%edx
 465:	89 15 b8 0d 00 00    	mov    %edx,0xdb8
  if((uint)stack % 4096 != 0)
 46b:	89 c2                	mov    %eax,%edx
 46d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 473:	74 07                	je     47c <thread_create+0x2c>
    stack = stack + (4096 - (uint)stack % 4096);
 475:	29 d0                	sub    %edx,%eax
 477:	05 00 10 00 00       	add    $0x1000,%eax
  return clone(start_routine, arg1, arg2, stack);
 47c:	50                   	push   %eax
 47d:	ff 75 10             	push   0x10(%ebp)
 480:	ff 75 0c             	push   0xc(%ebp)
 483:	ff 75 08             	push   0x8(%ebp)
 486:	e8 d7 00 00 00       	call   562 <clone>
}
 48b:	c9                   	leave  
 48c:	c3                   	ret    
 48d:	8d 76 00             	lea    0x0(%esi),%esi

00000490 <thread_join>:

int thread_join(void){
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
  //free global var ?
  void* stack;
  int wait_pid = -1;
  wait_pid = join(&stack);
 494:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void){
 497:	83 ec 20             	sub    $0x20,%esp
  wait_pid = join(&stack);
 49a:	50                   	push   %eax
 49b:	e8 ba 00 00 00       	call   55a <join>
 4a0:	89 c3                	mov    %eax,%ebx
  free(stack);
 4a2:	58                   	pop    %eax
 4a3:	ff 75 f4             	push   -0xc(%ebp)
 4a6:	e8 15 03 00 00       	call   7c0 <free>
  return wait_pid;
 4ab:	89 d8                	mov    %ebx,%eax
 4ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b0:	c9                   	leave  
 4b1:	c3                   	ret    

000004b2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4b2:	b8 01 00 00 00       	mov    $0x1,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <exit>:
SYSCALL(exit)
 4ba:	b8 02 00 00 00       	mov    $0x2,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <wait>:
SYSCALL(wait)
 4c2:	b8 03 00 00 00       	mov    $0x3,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <pipe>:
SYSCALL(pipe)
 4ca:	b8 04 00 00 00       	mov    $0x4,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <read>:
SYSCALL(read)
 4d2:	b8 05 00 00 00       	mov    $0x5,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <write>:
SYSCALL(write)
 4da:	b8 10 00 00 00       	mov    $0x10,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <close>:
SYSCALL(close)
 4e2:	b8 15 00 00 00       	mov    $0x15,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <kill>:
SYSCALL(kill)
 4ea:	b8 06 00 00 00       	mov    $0x6,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <exec>:
SYSCALL(exec)
 4f2:	b8 07 00 00 00       	mov    $0x7,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <open>:
SYSCALL(open)
 4fa:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <mknod>:
SYSCALL(mknod)
 502:	b8 11 00 00 00       	mov    $0x11,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <unlink>:
SYSCALL(unlink)
 50a:	b8 12 00 00 00       	mov    $0x12,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <fstat>:
SYSCALL(fstat)
 512:	b8 08 00 00 00       	mov    $0x8,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <link>:
SYSCALL(link)
 51a:	b8 13 00 00 00       	mov    $0x13,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <mkdir>:
SYSCALL(mkdir)
 522:	b8 14 00 00 00       	mov    $0x14,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <chdir>:
SYSCALL(chdir)
 52a:	b8 09 00 00 00       	mov    $0x9,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <dup>:
SYSCALL(dup)
 532:	b8 0a 00 00 00       	mov    $0xa,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <getpid>:
SYSCALL(getpid)
 53a:	b8 0b 00 00 00       	mov    $0xb,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <sbrk>:
SYSCALL(sbrk)
 542:	b8 0c 00 00 00       	mov    $0xc,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <sleep>:
SYSCALL(sleep)
 54a:	b8 0d 00 00 00       	mov    $0xd,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <uptime>:
SYSCALL(uptime)
 552:	b8 0e 00 00 00       	mov    $0xe,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <join>:
SYSCALL(join)
 55a:	b8 17 00 00 00       	mov    $0x17,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <clone>:
SYSCALL(clone)
 562:	b8 16 00 00 00       	mov    $0x16,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    
 56a:	66 90                	xchg   %ax,%ax
 56c:	66 90                	xchg   %ax,%ax
 56e:	66 90                	xchg   %ax,%ax

00000570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 3c             	sub    $0x3c,%esp
 579:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 57c:	89 d1                	mov    %edx,%ecx
{
 57e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 581:	85 d2                	test   %edx,%edx
 583:	0f 89 7f 00 00 00    	jns    608 <printint+0x98>
 589:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 58d:	74 79                	je     608 <printint+0x98>
    neg = 1;
 58f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 596:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 598:	31 db                	xor    %ebx,%ebx
 59a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	89 cf                	mov    %ecx,%edi
 5a6:	f7 75 c4             	divl   -0x3c(%ebp)
 5a9:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
 5b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5b3:	89 d8                	mov    %ebx,%eax
 5b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5c1:	76 dd                	jbe    5a0 <printint+0x30>
  if(neg)
 5c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5c6:	85 c9                	test   %ecx,%ecx
 5c8:	74 0c                	je     5d6 <printint+0x66>
    buf[i++] = '-';
 5ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5dd:	eb 07                	jmp    5e6 <printint+0x76>
 5df:	90                   	nop
    putc(fd, buf[i]);
 5e0:	0f b6 13             	movzbl (%ebx),%edx
 5e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ec:	6a 01                	push   $0x1
 5ee:	56                   	push   %esi
 5ef:	57                   	push   %edi
 5f0:	e8 e5 fe ff ff       	call   4da <write>
  while(--i >= 0)
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	39 de                	cmp    %ebx,%esi
 5fa:	75 e4                	jne    5e0 <printint+0x70>
}
 5fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 608:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 60f:	eb 87                	jmp    598 <printint+0x28>
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 629:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 62c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 13             	movzbl (%ebx),%edx
 632:	84 d2                	test   %dl,%dl
 634:	74 6a                	je     6a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 636:	8d 45 10             	lea    0x10(%ebp),%eax
 639:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 63c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 63f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 641:	89 45 d0             	mov    %eax,-0x30(%ebp)
 644:	eb 36                	jmp    67c <printf+0x5c>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
 650:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 653:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 658:	83 f8 25             	cmp    $0x25,%eax
 65b:	74 15                	je     672 <printf+0x52>
  write(fd, &c, 1);
 65d:	83 ec 04             	sub    $0x4,%esp
 660:	88 55 e7             	mov    %dl,-0x19(%ebp)
 663:	6a 01                	push   $0x1
 665:	57                   	push   %edi
 666:	56                   	push   %esi
 667:	e8 6e fe ff ff       	call   4da <write>
 66c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 66f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 672:	0f b6 13             	movzbl (%ebx),%edx
 675:	83 c3 01             	add    $0x1,%ebx
 678:	84 d2                	test   %dl,%dl
 67a:	74 24                	je     6a0 <printf+0x80>
    c = fmt[i] & 0xff;
 67c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 67f:	85 c9                	test   %ecx,%ecx
 681:	74 cd                	je     650 <printf+0x30>
      }
    } else if(state == '%'){
 683:	83 f9 25             	cmp    $0x25,%ecx
 686:	75 ea                	jne    672 <printf+0x52>
      if(c == 'd'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	0f 84 07 01 00 00    	je     798 <printf+0x178>
 691:	83 e8 63             	sub    $0x63,%eax
 694:	83 f8 15             	cmp    $0x15,%eax
 697:	77 17                	ja     6b0 <printf+0x90>
 699:	ff 24 85 ec 09 00 00 	jmp    *0x9ec(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a3:	5b                   	pop    %ebx
 6a4:	5e                   	pop    %esi
 6a5:	5f                   	pop    %edi
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 6b6:	6a 01                	push   $0x1
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6be:	e8 17 fe ff ff       	call   4da <write>
        putc(fd, c);
 6c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6c7:	83 c4 0c             	add    $0xc,%esp
 6ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6cd:	6a 01                	push   $0x1
 6cf:	57                   	push   %edi
 6d0:	56                   	push   %esi
 6d1:	e8 04 fe ff ff       	call   4da <write>
        putc(fd, c);
 6d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d9:	31 c9                	xor    %ecx,%ecx
 6db:	eb 95                	jmp    672 <printf+0x52>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e8:	6a 00                	push   $0x0
 6ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ed:	8b 10                	mov    (%eax),%edx
 6ef:	89 f0                	mov    %esi,%eax
 6f1:	e8 7a fe ff ff       	call   570 <printint>
        ap++;
 6f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fd:	31 c9                	xor    %ecx,%ecx
 6ff:	e9 6e ff ff ff       	jmp    672 <printf+0x52>
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 708:	8b 45 d0             	mov    -0x30(%ebp),%eax
 70b:	8b 10                	mov    (%eax),%edx
        ap++;
 70d:	83 c0 04             	add    $0x4,%eax
 710:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 713:	85 d2                	test   %edx,%edx
 715:	0f 84 8d 00 00 00    	je     7a8 <printf+0x188>
        while(*s != 0){
 71b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 71e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 720:	84 c0                	test   %al,%al
 722:	0f 84 4a ff ff ff    	je     672 <printf+0x52>
 728:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 72b:	89 d3                	mov    %edx,%ebx
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
          s++;
 733:	83 c3 01             	add    $0x1,%ebx
 736:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 739:	6a 01                	push   $0x1
 73b:	57                   	push   %edi
 73c:	56                   	push   %esi
 73d:	e8 98 fd ff ff       	call   4da <write>
        while(*s != 0){
 742:	0f b6 03             	movzbl (%ebx),%eax
 745:	83 c4 10             	add    $0x10,%esp
 748:	84 c0                	test   %al,%al
 74a:	75 e4                	jne    730 <printf+0x110>
      state = 0;
 74c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 74f:	31 c9                	xor    %ecx,%ecx
 751:	e9 1c ff ff ff       	jmp    672 <printf+0x52>
 756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 0a 00 00 00       	mov    $0xa,%ecx
 768:	6a 01                	push   $0x1
 76a:	e9 7b ff ff ff       	jmp    6ea <printf+0xca>
 76f:	90                   	nop
        putc(fd, *ap);
 770:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 776:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 778:	6a 01                	push   $0x1
 77a:	57                   	push   %edi
 77b:	56                   	push   %esi
        putc(fd, *ap);
 77c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 77f:	e8 56 fd ff ff       	call   4da <write>
        ap++;
 784:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 788:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78b:	31 c9                	xor    %ecx,%ecx
 78d:	e9 e0 fe ff ff       	jmp    672 <printf+0x52>
 792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 798:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 79b:	83 ec 04             	sub    $0x4,%esp
 79e:	e9 2a ff ff ff       	jmp    6cd <printf+0xad>
 7a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7a7:	90                   	nop
          s = "(null)";
 7a8:	ba e4 09 00 00       	mov    $0x9e4,%edx
        while(*s != 0){
 7ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7b0:	b8 28 00 00 00       	mov    $0x28,%eax
 7b5:	89 d3                	mov    %edx,%ebx
 7b7:	e9 74 ff ff ff       	jmp    730 <printf+0x110>
 7bc:	66 90                	xchg   %ax,%ax
 7be:	66 90                	xchg   %ax,%ax

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c1:	a1 bc 0d 00 00       	mov    0xdbc,%eax
{
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	89 c2                	mov    %eax,%edx
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	39 ca                	cmp    %ecx,%edx
 7de:	73 30                	jae    810 <free+0x50>
 7e0:	39 c1                	cmp    %eax,%ecx
 7e2:	72 04                	jb     7e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e4:	39 c2                	cmp    %eax,%edx
 7e6:	72 f0                	jb     7d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 f8                	cmp    %edi,%eax
 7f0:	74 30                	je     822 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7f5:	8b 42 04             	mov    0x4(%edx),%eax
 7f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7fb:	39 f1                	cmp    %esi,%ecx
 7fd:	74 3a                	je     839 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 801:	5b                   	pop    %ebx
  freep = p;
 802:	89 15 bc 0d 00 00    	mov    %edx,0xdbc
}
 808:	5e                   	pop    %esi
 809:	5f                   	pop    %edi
 80a:	5d                   	pop    %ebp
 80b:	c3                   	ret    
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 810:	39 c2                	cmp    %eax,%edx
 812:	72 c4                	jb     7d8 <free+0x18>
 814:	39 c1                	cmp    %eax,%ecx
 816:	73 c0                	jae    7d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 f8                	cmp    %edi,%eax
 820:	75 d0                	jne    7f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 822:	03 70 04             	add    0x4(%eax),%esi
 825:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 828:	8b 02                	mov    (%edx),%eax
 82a:	8b 00                	mov    (%eax),%eax
 82c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 82f:	8b 42 04             	mov    0x4(%edx),%eax
 832:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 835:	39 f1                	cmp    %esi,%ecx
 837:	75 c6                	jne    7ff <free+0x3f>
    p->s.size += bp->s.size;
 839:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 83c:	89 15 bc 0d 00 00    	mov    %edx,0xdbc
    p->s.size += bp->s.size;
 842:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 845:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 848:	89 0a                	mov    %ecx,(%edx)
}
 84a:	5b                   	pop    %ebx
 84b:	5e                   	pop    %esi
 84c:	5f                   	pop    %edi
 84d:	5d                   	pop    %ebp
 84e:	c3                   	ret    
 84f:	90                   	nop

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 85c:	8b 3d bc 0d 00 00    	mov    0xdbc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 862:	8d 70 07             	lea    0x7(%eax),%esi
 865:	c1 ee 03             	shr    $0x3,%esi
 868:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 86b:	85 ff                	test   %edi,%edi
 86d:	0f 84 9d 00 00 00    	je     910 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 873:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 875:	8b 4a 04             	mov    0x4(%edx),%ecx
 878:	39 f1                	cmp    %esi,%ecx
 87a:	73 6a                	jae    8e6 <malloc+0x96>
 87c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 881:	39 de                	cmp    %ebx,%esi
 883:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 886:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 88d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 890:	eb 17                	jmp    8a9 <malloc+0x59>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 898:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 89a:	8b 48 04             	mov    0x4(%eax),%ecx
 89d:	39 f1                	cmp    %esi,%ecx
 89f:	73 4f                	jae    8f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a1:	8b 3d bc 0d 00 00    	mov    0xdbc,%edi
 8a7:	89 c2                	mov    %eax,%edx
 8a9:	39 d7                	cmp    %edx,%edi
 8ab:	75 eb                	jne    898 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8ad:	83 ec 0c             	sub    $0xc,%esp
 8b0:	ff 75 e4             	push   -0x1c(%ebp)
 8b3:	e8 8a fc ff ff       	call   542 <sbrk>
  if(p == (char*)-1)
 8b8:	83 c4 10             	add    $0x10,%esp
 8bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8be:	74 1c                	je     8dc <malloc+0x8c>
  hp->s.size = nu;
 8c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c3:	83 ec 0c             	sub    $0xc,%esp
 8c6:	83 c0 08             	add    $0x8,%eax
 8c9:	50                   	push   %eax
 8ca:	e8 f1 fe ff ff       	call   7c0 <free>
  return freep;
 8cf:	8b 15 bc 0d 00 00    	mov    0xdbc,%edx
      if((p = morecore(nunits)) == 0)
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	85 d2                	test   %edx,%edx
 8da:	75 bc                	jne    898 <malloc+0x48>
        return 0;
  }
}
 8dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8df:	31 c0                	xor    %eax,%eax
}
 8e1:	5b                   	pop    %ebx
 8e2:	5e                   	pop    %esi
 8e3:	5f                   	pop    %edi
 8e4:	5d                   	pop    %ebp
 8e5:	c3                   	ret    
    if(p->s.size >= nunits){
 8e6:	89 d0                	mov    %edx,%eax
 8e8:	89 fa                	mov    %edi,%edx
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8f0:	39 ce                	cmp    %ecx,%esi
 8f2:	74 4c                	je     940 <malloc+0xf0>
        p->s.size -= nunits;
 8f4:	29 f1                	sub    %esi,%ecx
 8f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8ff:	89 15 bc 0d 00 00    	mov    %edx,0xdbc
}
 905:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 908:	83 c0 08             	add    $0x8,%eax
}
 90b:	5b                   	pop    %ebx
 90c:	5e                   	pop    %esi
 90d:	5f                   	pop    %edi
 90e:	5d                   	pop    %ebp
 90f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 910:	c7 05 bc 0d 00 00 c0 	movl   $0xdc0,0xdbc
 917:	0d 00 00 
    base.s.size = 0;
 91a:	bf c0 0d 00 00       	mov    $0xdc0,%edi
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 c0 0d 00 00 c0 	movl   $0xdc0,0xdc0
 926:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 929:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 92b:	c7 05 c4 0d 00 00 00 	movl   $0x0,0xdc4
 932:	00 00 00 
    if(p->s.size >= nunits){
 935:	e9 42 ff ff ff       	jmp    87c <malloc+0x2c>
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 940:	8b 08                	mov    (%eax),%ecx
 942:	89 0a                	mov    %ecx,(%edx)
 944:	eb b9                	jmp    8ff <malloc+0xaf>
