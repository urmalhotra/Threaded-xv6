
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 d9 03 00 00       	call   415 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 a1 03 00 00       	call   3fd <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 6c 03 00 00       	call   3d5 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	push   (%ebx)
  6c:	68 8b 08 00 00       	push   $0x88b
  71:	6a 01                	push   $0x1
  73:	e8 c8 04 00 00       	call   540 <printf>
      exit();
  78:	e8 58 03 00 00       	call   3d5 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 49 03 00 00       	call   3d5 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	8b 75 08             	mov    0x8(%ebp),%esi
  97:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 80 0c 00 00       	push   $0xc80
  a9:	6a 01                	push   $0x1
  ab:	e8 45 03 00 00       	call   3f5 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 80 0c 00 00       	push   $0xc80
  c4:	56                   	push   %esi
  c5:	e8 23 03 00 00       	call   3ed <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 68 08 00 00       	push   $0x868
  e4:	6a 01                	push   $0x1
  e6:	e8 55 04 00 00       	call   540 <printf>
      exit();
  eb:	e8 e5 02 00 00       	call   3d5 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 7a 08 00 00       	push   $0x87a
  f7:	6a 01                	push   $0x1
  f9:	e8 42 04 00 00       	call   540 <printf>
    exit();
  fe:	e8 d2 02 00 00       	call   3d5 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 c0                	xor    %eax,%eax
{
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	89 c8                	mov    %ecx,%eax
 133:	c9                   	leave  
 134:	c3                   	ret    
 135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	75 17                	jne    168 <strcmp+0x28>
 151:	eb 3a                	jmp    18d <strcmp+0x4d>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 15c:	83 c2 01             	add    $0x1,%edx
 15f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 162:	84 c0                	test   %al,%al
 164:	74 1a                	je     180 <strcmp+0x40>
    p++, q++;
 166:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 168:	0f b6 19             	movzbl (%ecx),%ebx
 16b:	38 c3                	cmp    %al,%bl
 16d:	74 e9                	je     158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 16f:	29 d8                	sub    %ebx,%eax
}
 171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 174:	c9                   	leave  
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 184:	31 c0                	xor    %eax,%eax
 186:	29 d8                	sub    %ebx,%eax
}
 188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18b:	c9                   	leave  
 18c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	31 c0                	xor    %eax,%eax
 192:	eb db                	jmp    16f <strcmp+0x2f>
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if(*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 235:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 23e:	eb 27                	jmp    267 <gets+0x37>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	57                   	push   %edi
 246:	6a 00                	push   $0x0
 248:	e8 a0 01 00 00       	call   3ed <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 1d                	je     280 <gets+0x50>
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 19                	je     280 <gets+0x50>
  for(i=0; i+1 < max; ){
 267:	89 de                	mov    %ebx,%esi
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 278:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27b:	5b                   	pop    %ebx
 27c:	5e                   	pop    %esi
 27d:	5f                   	pop    %edi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    
  buf[i] = '\0';
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	89 de                	mov    %ebx,%esi
 285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 289:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5f                   	pop    %edi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	push   0x8(%ebp)
 2ad:	e8 63 01 00 00       	call   415 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	push   0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 66 01 00 00       	call   42d <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 2c 01 00 00       	call   3fd <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	89 c8                	mov    %ecx,%eax
 32a:	c9                   	leave  
 32b:	c3                   	ret    
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8b 55 08             	mov    0x8(%ebp),%edx
 33a:	56                   	push   %esi
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <thread_join>:

int thread_join(void){
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
  void* stack;
  int wait_pid = -1;
  wait_pid = join(&stack);
 364:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void){
 367:	83 ec 20             	sub    $0x20,%esp
  wait_pid = join(&stack);
 36a:	50                   	push   %eax
 36b:	e8 05 01 00 00       	call   475 <join>
 370:	89 c3                	mov    %eax,%ebx
  free(stack);
 372:	58                   	pop    %eax
 373:	ff 75 f4             	push   -0xc(%ebp)
 376:	e8 65 03 00 00       	call   6e0 <free>
  return wait_pid;
}
 37b:	89 d8                	mov    %ebx,%eax
 37d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 380:	c9                   	leave  
 381:	c3                   	ret    
 382:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <lock_init>:

void 
lock_init(lock_t *spinlock)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
  spinlock->acquired = 0;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 39c:	5d                   	pop    %ebp
 39d:	c3                   	ret    
 39e:	66 90                	xchg   %ax,%ax

000003a0 <lock_acquire>:

void 
lock_acquire(lock_t *spinlock)
{
 3a0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3a1:	b9 01 00 00 00       	mov    $0x1,%ecx
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	8b 55 08             	mov    0x8(%ebp),%edx
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg((volatile uint*)&spinlock->acquired, 1) == 1)
 3b5:	83 f8 01             	cmp    $0x1,%eax
 3b8:	74 f6                	je     3b0 <lock_acquire+0x10>
    ; // spin
}
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <lock_release>:

void 
lock_release(lock_t *spinlock)
{
 3c0:	55                   	push   %ebp
 3c1:	31 c0                	xor    %eax,%eax
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	8b 55 08             	mov    0x8(%ebp),%edx
 3c8:	f0 87 02             	lock xchg %eax,(%edx)
  xchg((volatile uint*)&spinlock->acquired, 0);
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    

000003cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3cd:	b8 01 00 00 00       	mov    $0x1,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <exit>:
SYSCALL(exit)
 3d5:	b8 02 00 00 00       	mov    $0x2,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <wait>:
SYSCALL(wait)
 3dd:	b8 03 00 00 00       	mov    $0x3,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <pipe>:
SYSCALL(pipe)
 3e5:	b8 04 00 00 00       	mov    $0x4,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <read>:
SYSCALL(read)
 3ed:	b8 05 00 00 00       	mov    $0x5,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <write>:
SYSCALL(write)
 3f5:	b8 10 00 00 00       	mov    $0x10,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <close>:
SYSCALL(close)
 3fd:	b8 15 00 00 00       	mov    $0x15,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <kill>:
SYSCALL(kill)
 405:	b8 06 00 00 00       	mov    $0x6,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <exec>:
SYSCALL(exec)
 40d:	b8 07 00 00 00       	mov    $0x7,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <open>:
SYSCALL(open)
 415:	b8 0f 00 00 00       	mov    $0xf,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <mknod>:
SYSCALL(mknod)
 41d:	b8 11 00 00 00       	mov    $0x11,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <unlink>:
SYSCALL(unlink)
 425:	b8 12 00 00 00       	mov    $0x12,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <fstat>:
SYSCALL(fstat)
 42d:	b8 08 00 00 00       	mov    $0x8,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <link>:
SYSCALL(link)
 435:	b8 13 00 00 00       	mov    $0x13,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <mkdir>:
SYSCALL(mkdir)
 43d:	b8 14 00 00 00       	mov    $0x14,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <chdir>:
SYSCALL(chdir)
 445:	b8 09 00 00 00       	mov    $0x9,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <dup>:
SYSCALL(dup)
 44d:	b8 0a 00 00 00       	mov    $0xa,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <getpid>:
SYSCALL(getpid)
 455:	b8 0b 00 00 00       	mov    $0xb,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <sbrk>:
SYSCALL(sbrk)
 45d:	b8 0c 00 00 00       	mov    $0xc,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <sleep>:
SYSCALL(sleep)
 465:	b8 0d 00 00 00       	mov    $0xd,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <uptime>:
SYSCALL(uptime)
 46d:	b8 0e 00 00 00       	mov    $0xe,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <join>:
SYSCALL(join)
 475:	b8 17 00 00 00       	mov    $0x17,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <clone>:
SYSCALL(clone)
 47d:	b8 16 00 00 00       	mov    $0x16,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    
 485:	66 90                	xchg   %ax,%ax
 487:	66 90                	xchg   %ax,%ax
 489:	66 90                	xchg   %ax,%ax
 48b:	66 90                	xchg   %ax,%ax
 48d:	66 90                	xchg   %ax,%ax
 48f:	90                   	nop

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 3c             	sub    $0x3c,%esp
 499:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 49c:	89 d1                	mov    %edx,%ecx
{
 49e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4a1:	85 d2                	test   %edx,%edx
 4a3:	0f 89 7f 00 00 00    	jns    528 <printint+0x98>
 4a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ad:	74 79                	je     528 <printint+0x98>
    neg = 1;
 4af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4b8:	31 db                	xor    %ebx,%ebx
 4ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4c0:	89 c8                	mov    %ecx,%eax
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	89 cf                	mov    %ecx,%edi
 4c6:	f7 75 c4             	divl   -0x3c(%ebp)
 4c9:	0f b6 92 00 09 00 00 	movzbl 0x900(%edx),%edx
 4d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4d3:	89 d8                	mov    %ebx,%eax
 4d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4e1:	76 dd                	jbe    4c0 <printint+0x30>
  if(neg)
 4e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4e6:	85 c9                	test   %ecx,%ecx
 4e8:	74 0c                	je     4f6 <printint+0x66>
    buf[i++] = '-';
 4ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4fd:	eb 07                	jmp    506 <printint+0x76>
 4ff:	90                   	nop
    putc(fd, buf[i]);
 500:	0f b6 13             	movzbl (%ebx),%edx
 503:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 506:	83 ec 04             	sub    $0x4,%esp
 509:	88 55 d7             	mov    %dl,-0x29(%ebp)
 50c:	6a 01                	push   $0x1
 50e:	56                   	push   %esi
 50f:	57                   	push   %edi
 510:	e8 e0 fe ff ff       	call   3f5 <write>
  while(--i >= 0)
 515:	83 c4 10             	add    $0x10,%esp
 518:	39 de                	cmp    %ebx,%esi
 51a:	75 e4                	jne    500 <printint+0x70>
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 528:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 52f:	eb 87                	jmp    4b8 <printint+0x28>
 531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 54c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 54f:	0f b6 13             	movzbl (%ebx),%edx
 552:	84 d2                	test   %dl,%dl
 554:	74 6a                	je     5c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 556:	8d 45 10             	lea    0x10(%ebp),%eax
 559:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 55c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 55f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 561:	89 45 d0             	mov    %eax,-0x30(%ebp)
 564:	eb 36                	jmp    59c <printf+0x5c>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
 570:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 573:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	74 15                	je     592 <printf+0x52>
  write(fd, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	88 55 e7             	mov    %dl,-0x19(%ebp)
 583:	6a 01                	push   $0x1
 585:	57                   	push   %edi
 586:	56                   	push   %esi
 587:	e8 69 fe ff ff       	call   3f5 <write>
 58c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 58f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 592:	0f b6 13             	movzbl (%ebx),%edx
 595:	83 c3 01             	add    $0x1,%ebx
 598:	84 d2                	test   %dl,%dl
 59a:	74 24                	je     5c0 <printf+0x80>
    c = fmt[i] & 0xff;
 59c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 59f:	85 c9                	test   %ecx,%ecx
 5a1:	74 cd                	je     570 <printf+0x30>
      }
    } else if(state == '%'){
 5a3:	83 f9 25             	cmp    $0x25,%ecx
 5a6:	75 ea                	jne    592 <printf+0x52>
      if(c == 'd'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	0f 84 07 01 00 00    	je     6b8 <printf+0x178>
 5b1:	83 e8 63             	sub    $0x63,%eax
 5b4:	83 f8 15             	cmp    $0x15,%eax
 5b7:	77 17                	ja     5d0 <printf+0x90>
 5b9:	ff 24 85 a8 08 00 00 	jmp    *0x8a8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5d6:	6a 01                	push   $0x1
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5de:	e8 12 fe ff ff       	call   3f5 <write>
        putc(fd, c);
 5e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5e7:	83 c4 0c             	add    $0xc,%esp
 5ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5ed:	6a 01                	push   $0x1
 5ef:	57                   	push   %edi
 5f0:	56                   	push   %esi
 5f1:	e8 ff fd ff ff       	call   3f5 <write>
        putc(fd, c);
 5f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f9:	31 c9                	xor    %ecx,%ecx
 5fb:	eb 95                	jmp    592 <printf+0x52>
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	b9 10 00 00 00       	mov    $0x10,%ecx
 608:	6a 00                	push   $0x0
 60a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 60d:	8b 10                	mov    (%eax),%edx
 60f:	89 f0                	mov    %esi,%eax
 611:	e8 7a fe ff ff       	call   490 <printint>
        ap++;
 616:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 61a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61d:	31 c9                	xor    %ecx,%ecx
 61f:	e9 6e ff ff ff       	jmp    592 <printf+0x52>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 628:	8b 45 d0             	mov    -0x30(%ebp),%eax
 62b:	8b 10                	mov    (%eax),%edx
        ap++;
 62d:	83 c0 04             	add    $0x4,%eax
 630:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 633:	85 d2                	test   %edx,%edx
 635:	0f 84 8d 00 00 00    	je     6c8 <printf+0x188>
        while(*s != 0){
 63b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 63e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 640:	84 c0                	test   %al,%al
 642:	0f 84 4a ff ff ff    	je     592 <printf+0x52>
 648:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 64b:	89 d3                	mov    %edx,%ebx
 64d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
          s++;
 653:	83 c3 01             	add    $0x1,%ebx
 656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	57                   	push   %edi
 65c:	56                   	push   %esi
 65d:	e8 93 fd ff ff       	call   3f5 <write>
        while(*s != 0){
 662:	0f b6 03             	movzbl (%ebx),%eax
 665:	83 c4 10             	add    $0x10,%esp
 668:	84 c0                	test   %al,%al
 66a:	75 e4                	jne    650 <printf+0x110>
      state = 0;
 66c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 66f:	31 c9                	xor    %ecx,%ecx
 671:	e9 1c ff ff ff       	jmp    592 <printf+0x52>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
 688:	6a 01                	push   $0x1
 68a:	e9 7b ff ff ff       	jmp    60a <printf+0xca>
 68f:	90                   	nop
        putc(fd, *ap);
 690:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 696:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
 69a:	57                   	push   %edi
 69b:	56                   	push   %esi
        putc(fd, *ap);
 69c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 69f:	e8 51 fd ff ff       	call   3f5 <write>
        ap++;
 6a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ab:	31 c9                	xor    %ecx,%ecx
 6ad:	e9 e0 fe ff ff       	jmp    592 <printf+0x52>
 6b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6bb:	83 ec 04             	sub    $0x4,%esp
 6be:	e9 2a ff ff ff       	jmp    5ed <printf+0xad>
 6c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c7:	90                   	nop
          s = "(null)";
 6c8:	ba a0 08 00 00       	mov    $0x8a0,%edx
        while(*s != 0){
 6cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6d0:	b8 28 00 00 00       	mov    $0x28,%eax
 6d5:	89 d3                	mov    %edx,%ebx
 6d7:	e9 74 ff ff ff       	jmp    650 <printf+0x110>
 6dc:	66 90                	xchg   %ax,%ax
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 80 0e 00 00       	mov    0xe80,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6f8:	89 c2                	mov    %eax,%edx
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	39 ca                	cmp    %ecx,%edx
 6fe:	73 30                	jae    730 <free+0x50>
 700:	39 c1                	cmp    %eax,%ecx
 702:	72 04                	jb     708 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 704:	39 c2                	cmp    %eax,%edx
 706:	72 f0                	jb     6f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 f8                	cmp    %edi,%eax
 710:	74 30                	je     742 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 712:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 715:	8b 42 04             	mov    0x4(%edx),%eax
 718:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 71b:	39 f1                	cmp    %esi,%ecx
 71d:	74 3a                	je     759 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 71f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 721:	5b                   	pop    %ebx
  freep = p;
 722:	89 15 80 0e 00 00    	mov    %edx,0xe80
}
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret    
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 c2                	cmp    %eax,%edx
 732:	72 c4                	jb     6f8 <free+0x18>
 734:	39 c1                	cmp    %eax,%ecx
 736:	73 c0                	jae    6f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 f8                	cmp    %edi,%eax
 740:	75 d0                	jne    712 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 742:	03 70 04             	add    0x4(%eax),%esi
 745:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 748:	8b 02                	mov    (%edx),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 74f:	8b 42 04             	mov    0x4(%edx),%eax
 752:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 755:	39 f1                	cmp    %esi,%ecx
 757:	75 c6                	jne    71f <free+0x3f>
    p->s.size += bp->s.size;
 759:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 75c:	89 15 80 0e 00 00    	mov    %edx,0xe80
    p->s.size += bp->s.size;
 762:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 765:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 768:	89 0a                	mov    %ecx,(%edx)
}
 76a:	5b                   	pop    %ebx
 76b:	5e                   	pop    %esi
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
 76e:	c3                   	ret    
 76f:	90                   	nop

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 3d 80 0e 00 00    	mov    0xe80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 70 07             	lea    0x7(%eax),%esi
 785:	c1 ee 03             	shr    $0x3,%esi
 788:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 78b:	85 ff                	test   %edi,%edi
 78d:	0f 84 9d 00 00 00    	je     830 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 795:	8b 4a 04             	mov    0x4(%edx),%ecx
 798:	39 f1                	cmp    %esi,%ecx
 79a:	73 6a                	jae    806 <malloc+0x96>
 79c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7a1:	39 de                	cmp    %ebx,%esi
 7a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7b0:	eb 17                	jmp    7c9 <malloc+0x59>
 7b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ba:	8b 48 04             	mov    0x4(%eax),%ecx
 7bd:	39 f1                	cmp    %esi,%ecx
 7bf:	73 4f                	jae    810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c1:	8b 3d 80 0e 00 00    	mov    0xe80,%edi
 7c7:	89 c2                	mov    %eax,%edx
 7c9:	39 d7                	cmp    %edx,%edi
 7cb:	75 eb                	jne    7b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7cd:	83 ec 0c             	sub    $0xc,%esp
 7d0:	ff 75 e4             	push   -0x1c(%ebp)
 7d3:	e8 85 fc ff ff       	call   45d <sbrk>
  if(p == (char*)-1)
 7d8:	83 c4 10             	add    $0x10,%esp
 7db:	83 f8 ff             	cmp    $0xffffffff,%eax
 7de:	74 1c                	je     7fc <malloc+0x8c>
  hp->s.size = nu;
 7e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	83 c0 08             	add    $0x8,%eax
 7e9:	50                   	push   %eax
 7ea:	e8 f1 fe ff ff       	call   6e0 <free>
  return freep;
 7ef:	8b 15 80 0e 00 00    	mov    0xe80,%edx
      if((p = morecore(nunits)) == 0)
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	85 d2                	test   %edx,%edx
 7fa:	75 bc                	jne    7b8 <malloc+0x48>
        return 0;
  }
}
 7fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7ff:	31 c0                	xor    %eax,%eax
}
 801:	5b                   	pop    %ebx
 802:	5e                   	pop    %esi
 803:	5f                   	pop    %edi
 804:	5d                   	pop    %ebp
 805:	c3                   	ret    
    if(p->s.size >= nunits){
 806:	89 d0                	mov    %edx,%eax
 808:	89 fa                	mov    %edi,%edx
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 ce                	cmp    %ecx,%esi
 812:	74 4c                	je     860 <malloc+0xf0>
        p->s.size -= nunits;
 814:	29 f1                	sub    %esi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 81f:	89 15 80 0e 00 00    	mov    %edx,0xe80
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 837:	0e 00 00 
    base.s.size = 0;
 83a:	bf 84 0e 00 00       	mov    $0xe84,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 846:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 84b:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	e9 42 ff ff ff       	jmp    79c <malloc+0x2c>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0xaf>
