
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 6e 04 00 00       	call   4aa <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 34 04 00 00       	call   492 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 ff 03 00 00       	call   46a <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	push   (%ebx)
  6e:	68 1b 09 00 00       	push   $0x91b
  73:	6a 01                	push   $0x1
  75:	e8 56 05 00 00       	call   5d0 <printf>
      exit();
  7a:	e8 eb 03 00 00       	call   46a <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 0d 09 00 00       	push   $0x90d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 d8 03 00 00       	call   46a <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 20 0d 00 00       	push   $0xd20
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 ad 03 00 00       	call   482 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 20 0d 00 00 	movsbl 0xd20(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
        l++;
 108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10a:	68 f8 08 00 00       	push   $0x8f8
 10f:	e8 4c 01 00 00       	call   260 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	push   0xc(%ebp)
 148:	ff 75 dc             	push   -0x24(%ebp)
 14b:	ff 75 e0             	push   -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 0e 09 00 00       	push   $0x90e
 154:	6a 01                	push   $0x1
 156:	e8 75 04 00 00       	call   5d0 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 fe 08 00 00       	push   $0x8fe
 16d:	6a 01                	push   $0x1
 16f:	e8 5c 04 00 00       	call   5d0 <printf>
    exit();
 174:	e8 f1 02 00 00       	call   46a <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "x86.h"

uint original_stack = 0;
char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
 1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c7:	90                   	nop
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
    p++, q++;
 1d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave  
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 c5 01 00 00       	call   482 <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 1d                	je     2f0 <gets+0x50>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 19                	je     2f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2eb:	5b                   	pop    %ebx
 2ec:	5e                   	pop    %esi
 2ed:	5f                   	pop    %edi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    
  buf[i] = '\0';
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	89 de                	mov    %ebx,%esi
 2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5f                   	pop    %edi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	push   0x8(%ebp)
 31d:	e8 88 01 00 00       	call   4aa <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 8b 01 00 00       	call   4c2 <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 51 01 00 00       	call   492 <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave  
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <lock_init>:

void 
lock_init(lock_t *spinlock)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
  spinlock->acquired = 0;
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3dc:	5d                   	pop    %ebp
 3dd:	c3                   	ret    
 3de:	66 90                	xchg   %ax,%ax

000003e0 <lock_acquire>:

void 
lock_acquire(lock_t *spinlock)
{
 3e0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3e1:	b9 01 00 00 00       	mov    $0x1,%ecx
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 55 08             	mov    0x8(%ebp),%edx
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg((volatile uint *)&spinlock->acquired, 1) == 1)
 3f5:	83 f8 01             	cmp    $0x1,%eax
 3f8:	74 f6                	je     3f0 <lock_acquire+0x10>
    ; // spin
}
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <lock_release>:

void 
lock_release(lock_t *spinlock)
{
 400:	55                   	push   %ebp
 401:	31 c0                	xor    %eax,%eax
 403:	89 e5                	mov    %esp,%ebp
 405:	8b 55 08             	mov    0x8(%ebp),%edx
 408:	f0 87 02             	lock xchg %eax,(%edx)
  xchg((volatile uint *)&spinlock->acquired, 0);
}
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	83 ec 14             	sub    $0x14,%esp
  void* stack = malloc(2*4096);
 416:	68 00 20 00 00       	push   $0x2000
 41b:	e8 e0 03 00 00       	call   800 <malloc>
  original_stack = *(uint*)(stack);
 420:	8b 10                	mov    (%eax),%edx
  return clone(start_routine, arg1, arg2, stack);
 422:	50                   	push   %eax
 423:	ff 75 10             	push   0x10(%ebp)
 426:	ff 75 0c             	push   0xc(%ebp)
 429:	ff 75 08             	push   0x8(%ebp)
  original_stack = *(uint*)(stack);
 42c:	89 15 20 0f 00 00    	mov    %edx,0xf20
  return clone(start_routine, arg1, arg2, stack);
 432:	e8 db 00 00 00       	call   512 <clone>
}
 437:	c9                   	leave  
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000440 <thread_join>:

int thread_join(void){
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	53                   	push   %ebx
  //free global var ?
  void* stack;
  int wait_pid = -1;
  wait_pid = join(&stack);
 444:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void){
 447:	83 ec 20             	sub    $0x20,%esp
  wait_pid = join(&stack);
 44a:	50                   	push   %eax
 44b:	e8 ba 00 00 00       	call   50a <join>
 450:	89 c3                	mov    %eax,%ebx
  free(stack);
 452:	58                   	pop    %eax
 453:	ff 75 f4             	push   -0xc(%ebp)
 456:	e8 15 03 00 00       	call   770 <free>
  return wait_pid;
 45b:	89 d8                	mov    %ebx,%eax
 45d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 460:	c9                   	leave  
 461:	c3                   	ret    

00000462 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 462:	b8 01 00 00 00       	mov    $0x1,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <exit>:
SYSCALL(exit)
 46a:	b8 02 00 00 00       	mov    $0x2,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <wait>:
SYSCALL(wait)
 472:	b8 03 00 00 00       	mov    $0x3,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <pipe>:
SYSCALL(pipe)
 47a:	b8 04 00 00 00       	mov    $0x4,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <read>:
SYSCALL(read)
 482:	b8 05 00 00 00       	mov    $0x5,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <write>:
SYSCALL(write)
 48a:	b8 10 00 00 00       	mov    $0x10,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <close>:
SYSCALL(close)
 492:	b8 15 00 00 00       	mov    $0x15,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <kill>:
SYSCALL(kill)
 49a:	b8 06 00 00 00       	mov    $0x6,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <exec>:
SYSCALL(exec)
 4a2:	b8 07 00 00 00       	mov    $0x7,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <open>:
SYSCALL(open)
 4aa:	b8 0f 00 00 00       	mov    $0xf,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <mknod>:
SYSCALL(mknod)
 4b2:	b8 11 00 00 00       	mov    $0x11,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <unlink>:
SYSCALL(unlink)
 4ba:	b8 12 00 00 00       	mov    $0x12,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <fstat>:
SYSCALL(fstat)
 4c2:	b8 08 00 00 00       	mov    $0x8,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <link>:
SYSCALL(link)
 4ca:	b8 13 00 00 00       	mov    $0x13,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <mkdir>:
SYSCALL(mkdir)
 4d2:	b8 14 00 00 00       	mov    $0x14,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <chdir>:
SYSCALL(chdir)
 4da:	b8 09 00 00 00       	mov    $0x9,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <dup>:
SYSCALL(dup)
 4e2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <getpid>:
SYSCALL(getpid)
 4ea:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <sbrk>:
SYSCALL(sbrk)
 4f2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <sleep>:
SYSCALL(sleep)
 4fa:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <uptime>:
SYSCALL(uptime)
 502:	b8 0e 00 00 00       	mov    $0xe,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <join>:
SYSCALL(join)
 50a:	b8 17 00 00 00       	mov    $0x17,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <clone>:
SYSCALL(clone)
 512:	b8 16 00 00 00       	mov    $0x16,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 3c             	sub    $0x3c,%esp
 529:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 52c:	89 d1                	mov    %edx,%ecx
{
 52e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 531:	85 d2                	test   %edx,%edx
 533:	0f 89 7f 00 00 00    	jns    5b8 <printint+0x98>
 539:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 53d:	74 79                	je     5b8 <printint+0x98>
    neg = 1;
 53f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 546:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 548:	31 db                	xor    %ebx,%ebx
 54a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 c8                	mov    %ecx,%eax
 552:	31 d2                	xor    %edx,%edx
 554:	89 cf                	mov    %ecx,%edi
 556:	f7 75 c4             	divl   -0x3c(%ebp)
 559:	0f b6 92 90 09 00 00 	movzbl 0x990(%edx),%edx
 560:	89 45 c0             	mov    %eax,-0x40(%ebp)
 563:	89 d8                	mov    %ebx,%eax
 565:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 568:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 56b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 56e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 571:	76 dd                	jbe    550 <printint+0x30>
  if(neg)
 573:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 576:	85 c9                	test   %ecx,%ecx
 578:	74 0c                	je     586 <printint+0x66>
    buf[i++] = '-';
 57a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 57f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 581:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 586:	8b 7d b8             	mov    -0x48(%ebp),%edi
 589:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 58d:	eb 07                	jmp    596 <printint+0x76>
 58f:	90                   	nop
    putc(fd, buf[i]);
 590:	0f b6 13             	movzbl (%ebx),%edx
 593:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 596:	83 ec 04             	sub    $0x4,%esp
 599:	88 55 d7             	mov    %dl,-0x29(%ebp)
 59c:	6a 01                	push   $0x1
 59e:	56                   	push   %esi
 59f:	57                   	push   %edi
 5a0:	e8 e5 fe ff ff       	call   48a <write>
  while(--i >= 0)
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	39 de                	cmp    %ebx,%esi
 5aa:	75 e4                	jne    590 <printint+0x70>
}
 5ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5bf:	eb 87                	jmp    548 <printint+0x28>
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop

000005d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5df:	0f b6 13             	movzbl (%ebx),%edx
 5e2:	84 d2                	test   %dl,%dl
 5e4:	74 6a                	je     650 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5e6:	8d 45 10             	lea    0x10(%ebp),%eax
 5e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f4:	eb 36                	jmp    62c <printf+0x5c>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
 600:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 603:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	74 15                	je     622 <printf+0x52>
  write(fd, &c, 1);
 60d:	83 ec 04             	sub    $0x4,%esp
 610:	88 55 e7             	mov    %dl,-0x19(%ebp)
 613:	6a 01                	push   $0x1
 615:	57                   	push   %edi
 616:	56                   	push   %esi
 617:	e8 6e fe ff ff       	call   48a <write>
 61c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 61f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 622:	0f b6 13             	movzbl (%ebx),%edx
 625:	83 c3 01             	add    $0x1,%ebx
 628:	84 d2                	test   %dl,%dl
 62a:	74 24                	je     650 <printf+0x80>
    c = fmt[i] & 0xff;
 62c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 62f:	85 c9                	test   %ecx,%ecx
 631:	74 cd                	je     600 <printf+0x30>
      }
    } else if(state == '%'){
 633:	83 f9 25             	cmp    $0x25,%ecx
 636:	75 ea                	jne    622 <printf+0x52>
      if(c == 'd'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	0f 84 07 01 00 00    	je     748 <printf+0x178>
 641:	83 e8 63             	sub    $0x63,%eax
 644:	83 f8 15             	cmp    $0x15,%eax
 647:	77 17                	ja     660 <printf+0x90>
 649:	ff 24 85 38 09 00 00 	jmp    *0x938(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 650:	8d 65 f4             	lea    -0xc(%ebp),%esp
 653:	5b                   	pop    %ebx
 654:	5e                   	pop    %esi
 655:	5f                   	pop    %edi
 656:	5d                   	pop    %ebp
 657:	c3                   	ret    
 658:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 666:	6a 01                	push   $0x1
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 66e:	e8 17 fe ff ff       	call   48a <write>
        putc(fd, c);
 673:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 677:	83 c4 0c             	add    $0xc,%esp
 67a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 67d:	6a 01                	push   $0x1
 67f:	57                   	push   %edi
 680:	56                   	push   %esi
 681:	e8 04 fe ff ff       	call   48a <write>
        putc(fd, c);
 686:	83 c4 10             	add    $0x10,%esp
      state = 0;
 689:	31 c9                	xor    %ecx,%ecx
 68b:	eb 95                	jmp    622 <printf+0x52>
 68d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 10 00 00 00       	mov    $0x10,%ecx
 698:	6a 00                	push   $0x0
 69a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 69d:	8b 10                	mov    (%eax),%edx
 69f:	89 f0                	mov    %esi,%eax
 6a1:	e8 7a fe ff ff       	call   520 <printint>
        ap++;
 6a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ad:	31 c9                	xor    %ecx,%ecx
 6af:	e9 6e ff ff ff       	jmp    622 <printf+0x52>
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6bb:	8b 10                	mov    (%eax),%edx
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6c3:	85 d2                	test   %edx,%edx
 6c5:	0f 84 8d 00 00 00    	je     758 <printf+0x188>
        while(*s != 0){
 6cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6d0:	84 c0                	test   %al,%al
 6d2:	0f 84 4a ff ff ff    	je     622 <printf+0x52>
 6d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6db:	89 d3                	mov    %edx,%ebx
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6e3:	83 c3 01             	add    $0x1,%ebx
 6e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6e9:	6a 01                	push   $0x1
 6eb:	57                   	push   %edi
 6ec:	56                   	push   %esi
 6ed:	e8 98 fd ff ff       	call   48a <write>
        while(*s != 0){
 6f2:	0f b6 03             	movzbl (%ebx),%eax
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	84 c0                	test   %al,%al
 6fa:	75 e4                	jne    6e0 <printf+0x110>
      state = 0;
 6fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6ff:	31 c9                	xor    %ecx,%ecx
 701:	e9 1c ff ff ff       	jmp    622 <printf+0x52>
 706:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 0a 00 00 00       	mov    $0xa,%ecx
 718:	6a 01                	push   $0x1
 71a:	e9 7b ff ff ff       	jmp    69a <printf+0xca>
 71f:	90                   	nop
        putc(fd, *ap);
 720:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 726:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
 72a:	57                   	push   %edi
 72b:	56                   	push   %esi
        putc(fd, *ap);
 72c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 72f:	e8 56 fd ff ff       	call   48a <write>
        ap++;
 734:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 738:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73b:	31 c9                	xor    %ecx,%ecx
 73d:	e9 e0 fe ff ff       	jmp    622 <printf+0x52>
 742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 748:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 74b:	83 ec 04             	sub    $0x4,%esp
 74e:	e9 2a ff ff ff       	jmp    67d <printf+0xad>
 753:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 757:	90                   	nop
          s = "(null)";
 758:	ba 2f 09 00 00       	mov    $0x92f,%edx
        while(*s != 0){
 75d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 760:	b8 28 00 00 00       	mov    $0x28,%eax
 765:	89 d3                	mov    %edx,%ebx
 767:	e9 74 ff ff ff       	jmp    6e0 <printf+0x110>
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 24 0f 00 00       	mov    0xf24,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 77e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 788:	89 c2                	mov    %eax,%edx
 78a:	8b 00                	mov    (%eax),%eax
 78c:	39 ca                	cmp    %ecx,%edx
 78e:	73 30                	jae    7c0 <free+0x50>
 790:	39 c1                	cmp    %eax,%ecx
 792:	72 04                	jb     798 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	39 c2                	cmp    %eax,%edx
 796:	72 f0                	jb     788 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 f8                	cmp    %edi,%eax
 7a0:	74 30                	je     7d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7a5:	8b 42 04             	mov    0x4(%edx),%eax
 7a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7ab:	39 f1                	cmp    %esi,%ecx
 7ad:	74 3a                	je     7e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7b1:	5b                   	pop    %ebx
  freep = p;
 7b2:	89 15 24 0f 00 00    	mov    %edx,0xf24
}
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret    
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	39 c2                	cmp    %eax,%edx
 7c2:	72 c4                	jb     788 <free+0x18>
 7c4:	39 c1                	cmp    %eax,%ecx
 7c6:	73 c0                	jae    788 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ce:	39 f8                	cmp    %edi,%eax
 7d0:	75 d0                	jne    7a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7d2:	03 70 04             	add    0x4(%eax),%esi
 7d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d8:	8b 02                	mov    (%edx),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7df:	8b 42 04             	mov    0x4(%edx),%eax
 7e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7e5:	39 f1                	cmp    %esi,%ecx
 7e7:	75 c6                	jne    7af <free+0x3f>
    p->s.size += bp->s.size;
 7e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7ec:	89 15 24 0f 00 00    	mov    %edx,0xf24
    p->s.size += bp->s.size;
 7f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7f8:	89 0a                	mov    %ecx,(%edx)
}
 7fa:	5b                   	pop    %ebx
 7fb:	5e                   	pop    %esi
 7fc:	5f                   	pop    %edi
 7fd:	5d                   	pop    %ebp
 7fe:	c3                   	ret    
 7ff:	90                   	nop

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 3d 24 0f 00 00    	mov    0xf24,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 70 07             	lea    0x7(%eax),%esi
 815:	c1 ee 03             	shr    $0x3,%esi
 818:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 81b:	85 ff                	test   %edi,%edi
 81d:	0f 84 9d 00 00 00    	je     8c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 823:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 825:	8b 4a 04             	mov    0x4(%edx),%ecx
 828:	39 f1                	cmp    %esi,%ecx
 82a:	73 6a                	jae    896 <malloc+0x96>
 82c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 831:	39 de                	cmp    %ebx,%esi
 833:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 836:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 840:	eb 17                	jmp    859 <malloc+0x59>
 842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 84a:	8b 48 04             	mov    0x4(%eax),%ecx
 84d:	39 f1                	cmp    %esi,%ecx
 84f:	73 4f                	jae    8a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	8b 3d 24 0f 00 00    	mov    0xf24,%edi
 857:	89 c2                	mov    %eax,%edx
 859:	39 d7                	cmp    %edx,%edi
 85b:	75 eb                	jne    848 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 85d:	83 ec 0c             	sub    $0xc,%esp
 860:	ff 75 e4             	push   -0x1c(%ebp)
 863:	e8 8a fc ff ff       	call   4f2 <sbrk>
  if(p == (char*)-1)
 868:	83 c4 10             	add    $0x10,%esp
 86b:	83 f8 ff             	cmp    $0xffffffff,%eax
 86e:	74 1c                	je     88c <malloc+0x8c>
  hp->s.size = nu;
 870:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	83 c0 08             	add    $0x8,%eax
 879:	50                   	push   %eax
 87a:	e8 f1 fe ff ff       	call   770 <free>
  return freep;
 87f:	8b 15 24 0f 00 00    	mov    0xf24,%edx
      if((p = morecore(nunits)) == 0)
 885:	83 c4 10             	add    $0x10,%esp
 888:	85 d2                	test   %edx,%edx
 88a:	75 bc                	jne    848 <malloc+0x48>
        return 0;
  }
}
 88c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 88f:	31 c0                	xor    %eax,%eax
}
 891:	5b                   	pop    %ebx
 892:	5e                   	pop    %esi
 893:	5f                   	pop    %edi
 894:	5d                   	pop    %ebp
 895:	c3                   	ret    
    if(p->s.size >= nunits){
 896:	89 d0                	mov    %edx,%eax
 898:	89 fa                	mov    %edi,%edx
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8a0:	39 ce                	cmp    %ecx,%esi
 8a2:	74 4c                	je     8f0 <malloc+0xf0>
        p->s.size -= nunits;
 8a4:	29 f1                	sub    %esi,%ecx
 8a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8af:	89 15 24 0f 00 00    	mov    %edx,0xf24
}
 8b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8b8:	83 c0 08             	add    $0x8,%eax
}
 8bb:	5b                   	pop    %ebx
 8bc:	5e                   	pop    %esi
 8bd:	5f                   	pop    %edi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8c0:	c7 05 24 0f 00 00 28 	movl   $0xf28,0xf24
 8c7:	0f 00 00 
    base.s.size = 0;
 8ca:	bf 28 0f 00 00       	mov    $0xf28,%edi
    base.s.ptr = freep = prevp = &base;
 8cf:	c7 05 28 0f 00 00 28 	movl   $0xf28,0xf28
 8d6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8db:	c7 05 2c 0f 00 00 00 	movl   $0x0,0xf2c
 8e2:	00 00 00 
    if(p->s.size >= nunits){
 8e5:	e9 42 ff ff ff       	jmp    82c <malloc+0x2c>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8f0:	8b 08                	mov    (%eax),%ecx
 8f2:	89 0a                	mov    %ecx,(%edx)
 8f4:	eb b9                	jmp    8af <malloc+0xaf>
