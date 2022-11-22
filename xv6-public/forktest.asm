
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 fa 03 00 00       	call   40a <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 90 01 00 00       	call   1b0 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	push   0x8(%ebp)
  28:	e8 fd 03 00 00       	call   42a <write>
}
  2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  49:	68 48 06 00 00       	push   $0x648
  4e:	e8 5d 01 00 00       	call   1b0 <strlen>
  53:	83 c4 0c             	add    $0xc,%esp
  56:	50                   	push   %eax
  57:	68 48 06 00 00       	push   $0x648
  5c:	6a 01                	push   $0x1
  5e:	e8 c7 03 00 00       	call   42a <write>
  63:	83 c4 10             	add    $0x10,%esp
  66:	eb 19                	jmp    81 <forktest+0x41>
  68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6f:	90                   	nop
    if(pid == 0)
  70:	74 58                	je     ca <forktest+0x8a>
  for(n=0; n<N; n++){
  72:	83 c3 01             	add    $0x1,%ebx
  75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7b:	0f 84 83 00 00 00    	je     104 <forktest+0xc4>
    pid = fork();
  81:	e8 7c 03 00 00       	call   402 <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x30>
  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 10                	je     9e <forktest+0x5e>
  8e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  90:	e8 7d 03 00 00       	call   412 <wait>
  95:	85 c0                	test   %eax,%eax
  97:	78 36                	js     cf <forktest+0x8f>
  for(; n > 0; n--){
  99:	83 eb 01             	sub    $0x1,%ebx
  9c:	75 f2                	jne    90 <forktest+0x50>
  if(wait() != -1){
  9e:	e8 6f 03 00 00       	call   412 <wait>
  a3:	83 f8 ff             	cmp    $0xffffffff,%eax
  a6:	75 49                	jne    f1 <forktest+0xb1>
  write(fd, s, strlen(s));
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 7a 06 00 00       	push   $0x67a
  b0:	e8 fb 00 00 00       	call   1b0 <strlen>
  b5:	83 c4 0c             	add    $0xc,%esp
  b8:	50                   	push   %eax
  b9:	68 7a 06 00 00       	push   $0x67a
  be:	6a 01                	push   $0x1
  c0:	e8 65 03 00 00       	call   42a <write>
}
  c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c8:	c9                   	leave  
  c9:	c3                   	ret    
      exit();
  ca:	e8 3b 03 00 00       	call   40a <exit>
  write(fd, s, strlen(s));
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	68 53 06 00 00       	push   $0x653
  d7:	e8 d4 00 00 00       	call   1b0 <strlen>
  dc:	83 c4 0c             	add    $0xc,%esp
  df:	50                   	push   %eax
  e0:	68 53 06 00 00       	push   $0x653
  e5:	6a 01                	push   $0x1
  e7:	e8 3e 03 00 00       	call   42a <write>
      exit();
  ec:	e8 19 03 00 00       	call   40a <exit>
    printf(1, "wait got too many\n");
  f1:	52                   	push   %edx
  f2:	52                   	push   %edx
  f3:	68 67 06 00 00       	push   $0x667
  f8:	6a 01                	push   $0x1
  fa:	e8 11 ff ff ff       	call   10 <printf>
    exit();
  ff:	e8 06 03 00 00       	call   40a <exit>
    printf(1, "fork claimed to work N times!\n", N);
 104:	50                   	push   %eax
 105:	68 e8 03 00 00       	push   $0x3e8
 10a:	68 88 06 00 00       	push   $0x688
 10f:	6a 01                	push   $0x1
 111:	e8 fa fe ff ff       	call   10 <printf>
    exit();
 116:	e8 ef 02 00 00       	call   40a <exit>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:
#include "x86.h"

uint original_stack = 0;
char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave  
 144:	c3                   	ret    
 145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 17                	jne    178 <strcmp+0x28>
 161:	eb 3a                	jmp    19d <strcmp+0x4d>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 16c:	83 c2 01             	add    $0x1,%edx
 16f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 172:	84 c0                	test   %al,%al
 174:	74 1a                	je     190 <strcmp+0x40>
    p++, q++;
 176:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 178:	0f b6 19             	movzbl (%ecx),%ebx
 17b:	38 c3                	cmp    %al,%bl
 17d:	74 e9                	je     168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 17f:	29 d8                	sub    %ebx,%eax
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave  
 185:	c3                   	ret    
 186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 194:	31 c0                	xor    %eax,%eax
 196:	29 d8                	sub    %ebx,%eax
}
 198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19b:	c9                   	leave  
 19c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 19             	movzbl (%ecx),%ebx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	eb db                	jmp    17f <strcmp+0x2f>
 1a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	89 c1                	mov    %eax,%ecx
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	89 c8                	mov    %ecx,%eax
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    
 1cf:	90                   	nop
  for(n = 0; s[n]; n++)
 1d0:	31 c9                	xor    %ecx,%ecx
}
 1d2:	5d                   	pop    %ebp
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	c3                   	ret    
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld    
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	75 12                	jne    223 <strchr+0x23>
 211:	eb 1d                	jmp    230 <strchr+0x30>
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 21c:	83 c0 01             	add    $0x1,%eax
 21f:	84 d2                	test   %dl,%dl
 221:	74 0d                	je     230 <strchr+0x30>
    if(*s == c)
 223:	38 d1                	cmp    %dl,%cl
 225:	75 f1                	jne    218 <strchr+0x18>
      return (char*)s;
  return 0;
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 230:	31 c0                	xor    %eax,%eax
}
 232:	5d                   	pop    %ebp
 233:	c3                   	ret    
 234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 245:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 249:	31 db                	xor    %ebx,%ebx
{
 24b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 24e:	eb 27                	jmp    277 <gets+0x37>
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	6a 01                	push   $0x1
 255:	57                   	push   %edi
 256:	6a 00                	push   $0x0
 258:	e8 c5 01 00 00       	call   422 <read>
    if(cc < 1)
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	7e 1d                	jle    281 <gets+0x41>
      break;
    buf[i++] = c;
 264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 268:	8b 55 08             	mov    0x8(%ebp),%edx
 26b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 26f:	3c 0a                	cmp    $0xa,%al
 271:	74 1d                	je     290 <gets+0x50>
 273:	3c 0d                	cmp    $0xd,%al
 275:	74 19                	je     290 <gets+0x50>
  for(i=0; i+1 < max; ){
 277:	89 de                	mov    %ebx,%esi
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27f:	7c cf                	jl     250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 288:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5f                   	pop    %edi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    
  buf[i] = '\0';
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 de                	mov    %ebx,%esi
 295:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 299:	8d 65 f4             	lea    -0xc(%ebp),%esp
 29c:	5b                   	pop    %ebx
 29d:	5e                   	pop    %esi
 29e:	5f                   	pop    %edi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	push   0x8(%ebp)
 2bd:	e8 88 01 00 00       	call   44a <open>
  if(fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	push   0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 8b 01 00 00       	call   462 <fstat>
  close(fd);
 2d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2da:	89 c6                	mov    %eax,%esi
  close(fd);
 2dc:	e8 51 01 00 00       	call   432 <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
}
 2e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f5:	eb ed                	jmp    2e4 <stat+0x34>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 02             	movsbl (%edx),%eax
 30a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 30d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 315:	77 1e                	ja     335 <atoi+0x35>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 338:	89 c8                	mov    %ecx,%eax
 33a:	c9                   	leave  
 33b:	c3                   	ret    
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 45 10             	mov    0x10(%ebp),%eax
 347:	8b 55 08             	mov    0x8(%ebp),%edx
 34a:	56                   	push   %esi
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34e:	85 c0                	test   %eax,%eax
 350:	7e 13                	jle    365 <memmove+0x25>
 352:	01 d0                	add    %edx,%eax
  dst = vdst;
 354:	89 d7                	mov    %edx,%edi
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <lock_init>:

void 
lock_init(lock_t *spinlock)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
  spinlock->acquired = 0;
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	66 90                	xchg   %ax,%ax

00000380 <lock_acquire>:

void 
lock_acquire(lock_t *spinlock)
{
 380:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 381:	b9 01 00 00 00       	mov    $0x1,%ecx
 386:	89 e5                	mov    %esp,%ebp
 388:	8b 55 08             	mov    0x8(%ebp),%edx
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop
 390:	89 c8                	mov    %ecx,%eax
 392:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg((volatile uint *)&spinlock->acquired, 1) == 1)
 395:	83 f8 01             	cmp    $0x1,%eax
 398:	74 f6                	je     390 <lock_acquire+0x10>
    ; // spin
}
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <lock_release>:

void 
lock_release(lock_t *spinlock)
{
 3a0:	55                   	push   %ebp
 3a1:	31 c0                	xor    %eax,%eax
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	8b 55 08             	mov    0x8(%ebp),%edx
 3a8:	f0 87 02             	lock xchg %eax,(%edx)
  xchg((volatile uint *)&spinlock->acquired, 0);
}
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi

000003b0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	83 ec 14             	sub    $0x14,%esp
  void* stack = malloc(2*4096);
 3b6:	68 00 20 00 00       	push   $0x2000
 3bb:	e8 90 01 00 00       	call   550 <malloc>
  original_stack = *(uint*)(stack);
 3c0:	8b 10                	mov    (%eax),%edx
  return clone(start_routine, arg1, arg2, stack);
 3c2:	50                   	push   %eax
 3c3:	ff 75 10             	push   0x10(%ebp)
 3c6:	ff 75 0c             	push   0xc(%ebp)
 3c9:	ff 75 08             	push   0x8(%ebp)
  original_stack = *(uint*)(stack);
 3cc:	89 15 c4 09 00 00    	mov    %edx,0x9c4
  return clone(start_routine, arg1, arg2, stack);
 3d2:	e8 db 00 00 00       	call   4b2 <clone>
}
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <thread_join>:

int thread_join(void){
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
  //free global var ?
  void* stack;
  int wait_pid = -1;
  wait_pid = join(&stack);
 3e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void){
 3e7:	83 ec 20             	sub    $0x20,%esp
  wait_pid = join(&stack);
 3ea:	50                   	push   %eax
 3eb:	e8 ba 00 00 00       	call   4aa <join>
 3f0:	89 c3                	mov    %eax,%ebx
  free(stack);
 3f2:	58                   	pop    %eax
 3f3:	ff 75 f4             	push   -0xc(%ebp)
 3f6:	e8 c5 00 00 00       	call   4c0 <free>
  return wait_pid;
 3fb:	89 d8                	mov    %ebx,%eax
 3fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 402:	b8 01 00 00 00       	mov    $0x1,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <exit>:
SYSCALL(exit)
 40a:	b8 02 00 00 00       	mov    $0x2,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <wait>:
SYSCALL(wait)
 412:	b8 03 00 00 00       	mov    $0x3,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <pipe>:
SYSCALL(pipe)
 41a:	b8 04 00 00 00       	mov    $0x4,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <read>:
SYSCALL(read)
 422:	b8 05 00 00 00       	mov    $0x5,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <write>:
SYSCALL(write)
 42a:	b8 10 00 00 00       	mov    $0x10,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <close>:
SYSCALL(close)
 432:	b8 15 00 00 00       	mov    $0x15,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <kill>:
SYSCALL(kill)
 43a:	b8 06 00 00 00       	mov    $0x6,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <exec>:
SYSCALL(exec)
 442:	b8 07 00 00 00       	mov    $0x7,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <open>:
SYSCALL(open)
 44a:	b8 0f 00 00 00       	mov    $0xf,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <mknod>:
SYSCALL(mknod)
 452:	b8 11 00 00 00       	mov    $0x11,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <unlink>:
SYSCALL(unlink)
 45a:	b8 12 00 00 00       	mov    $0x12,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <fstat>:
SYSCALL(fstat)
 462:	b8 08 00 00 00       	mov    $0x8,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <link>:
SYSCALL(link)
 46a:	b8 13 00 00 00       	mov    $0x13,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <mkdir>:
SYSCALL(mkdir)
 472:	b8 14 00 00 00       	mov    $0x14,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <chdir>:
SYSCALL(chdir)
 47a:	b8 09 00 00 00       	mov    $0x9,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <dup>:
SYSCALL(dup)
 482:	b8 0a 00 00 00       	mov    $0xa,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <getpid>:
SYSCALL(getpid)
 48a:	b8 0b 00 00 00       	mov    $0xb,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <sbrk>:
SYSCALL(sbrk)
 492:	b8 0c 00 00 00       	mov    $0xc,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <sleep>:
SYSCALL(sleep)
 49a:	b8 0d 00 00 00       	mov    $0xd,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <uptime>:
SYSCALL(uptime)
 4a2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <join>:
SYSCALL(join)
 4aa:	b8 17 00 00 00       	mov    $0x17,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <clone>:
SYSCALL(clone)
 4b2:	b8 16 00 00 00       	mov    $0x16,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	66 90                	xchg   %ax,%ax
 4be:	66 90                	xchg   %ax,%ax

000004c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4c1:	a1 c8 09 00 00       	mov    0x9c8,%eax
{
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	57                   	push   %edi
 4c9:	56                   	push   %esi
 4ca:	53                   	push   %ebx
 4cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 4ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d8:	89 c2                	mov    %eax,%edx
 4da:	8b 00                	mov    (%eax),%eax
 4dc:	39 ca                	cmp    %ecx,%edx
 4de:	73 30                	jae    510 <free+0x50>
 4e0:	39 c1                	cmp    %eax,%ecx
 4e2:	72 04                	jb     4e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4e4:	39 c2                	cmp    %eax,%edx
 4e6:	72 f0                	jb     4d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 4e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4ee:	39 f8                	cmp    %edi,%eax
 4f0:	74 30                	je     522 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 4f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 4f5:	8b 42 04             	mov    0x4(%edx),%eax
 4f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 4fb:	39 f1                	cmp    %esi,%ecx
 4fd:	74 3a                	je     539 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 4ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 501:	5b                   	pop    %ebx
  freep = p;
 502:	89 15 c8 09 00 00    	mov    %edx,0x9c8
}
 508:	5e                   	pop    %esi
 509:	5f                   	pop    %edi
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 510:	39 c2                	cmp    %eax,%edx
 512:	72 c4                	jb     4d8 <free+0x18>
 514:	39 c1                	cmp    %eax,%ecx
 516:	73 c0                	jae    4d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 518:	8b 73 fc             	mov    -0x4(%ebx),%esi
 51b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 51e:	39 f8                	cmp    %edi,%eax
 520:	75 d0                	jne    4f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 522:	03 70 04             	add    0x4(%eax),%esi
 525:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 528:	8b 02                	mov    (%edx),%eax
 52a:	8b 00                	mov    (%eax),%eax
 52c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 52f:	8b 42 04             	mov    0x4(%edx),%eax
 532:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 535:	39 f1                	cmp    %esi,%ecx
 537:	75 c6                	jne    4ff <free+0x3f>
    p->s.size += bp->s.size;
 539:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 53c:	89 15 c8 09 00 00    	mov    %edx,0x9c8
    p->s.size += bp->s.size;
 542:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 545:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 548:	89 0a                	mov    %ecx,(%edx)
}
 54a:	5b                   	pop    %ebx
 54b:	5e                   	pop    %esi
 54c:	5f                   	pop    %edi
 54d:	5d                   	pop    %ebp
 54e:	c3                   	ret    
 54f:	90                   	nop

00000550 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 559:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 55c:	8b 3d c8 09 00 00    	mov    0x9c8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 562:	8d 70 07             	lea    0x7(%eax),%esi
 565:	c1 ee 03             	shr    $0x3,%esi
 568:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 56b:	85 ff                	test   %edi,%edi
 56d:	0f 84 9d 00 00 00    	je     610 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 573:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 575:	8b 4a 04             	mov    0x4(%edx),%ecx
 578:	39 f1                	cmp    %esi,%ecx
 57a:	73 6a                	jae    5e6 <malloc+0x96>
 57c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 581:	39 de                	cmp    %ebx,%esi
 583:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 586:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 58d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 590:	eb 17                	jmp    5a9 <malloc+0x59>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 598:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 59a:	8b 48 04             	mov    0x4(%eax),%ecx
 59d:	39 f1                	cmp    %esi,%ecx
 59f:	73 4f                	jae    5f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5a1:	8b 3d c8 09 00 00    	mov    0x9c8,%edi
 5a7:	89 c2                	mov    %eax,%edx
 5a9:	39 d7                	cmp    %edx,%edi
 5ab:	75 eb                	jne    598 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 5ad:	83 ec 0c             	sub    $0xc,%esp
 5b0:	ff 75 e4             	push   -0x1c(%ebp)
 5b3:	e8 da fe ff ff       	call   492 <sbrk>
  if(p == (char*)-1)
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5be:	74 1c                	je     5dc <malloc+0x8c>
  hp->s.size = nu;
 5c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5c3:	83 ec 0c             	sub    $0xc,%esp
 5c6:	83 c0 08             	add    $0x8,%eax
 5c9:	50                   	push   %eax
 5ca:	e8 f1 fe ff ff       	call   4c0 <free>
  return freep;
 5cf:	8b 15 c8 09 00 00    	mov    0x9c8,%edx
      if((p = morecore(nunits)) == 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	85 d2                	test   %edx,%edx
 5da:	75 bc                	jne    598 <malloc+0x48>
        return 0;
  }
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 5df:	31 c0                	xor    %eax,%eax
}
 5e1:	5b                   	pop    %ebx
 5e2:	5e                   	pop    %esi
 5e3:	5f                   	pop    %edi
 5e4:	5d                   	pop    %ebp
 5e5:	c3                   	ret    
    if(p->s.size >= nunits){
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	89 fa                	mov    %edi,%edx
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 5f0:	39 ce                	cmp    %ecx,%esi
 5f2:	74 4c                	je     640 <malloc+0xf0>
        p->s.size -= nunits;
 5f4:	29 f1                	sub    %esi,%ecx
 5f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 5f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 5fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 5ff:	89 15 c8 09 00 00    	mov    %edx,0x9c8
}
 605:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 608:	83 c0 08             	add    $0x8,%eax
}
 60b:	5b                   	pop    %ebx
 60c:	5e                   	pop    %esi
 60d:	5f                   	pop    %edi
 60e:	5d                   	pop    %ebp
 60f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 610:	c7 05 c8 09 00 00 cc 	movl   $0x9cc,0x9c8
 617:	09 00 00 
    base.s.size = 0;
 61a:	bf cc 09 00 00       	mov    $0x9cc,%edi
    base.s.ptr = freep = prevp = &base;
 61f:	c7 05 cc 09 00 00 cc 	movl   $0x9cc,0x9cc
 626:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 629:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 62b:	c7 05 d0 09 00 00 00 	movl   $0x0,0x9d0
 632:	00 00 00 
    if(p->s.size >= nunits){
 635:	e9 42 ff ff ff       	jmp    57c <malloc+0x2c>
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 640:	8b 08                	mov    (%eax),%ecx
 642:	89 0a                	mov    %ecx,(%edx)
 644:	eb b9                	jmp    5ff <malloc+0xaf>
