
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 ec 05 00 00       	push   $0x5ec
  2d:	6a 02                	push   $0x2
  2f:	e8 fe 02 00 00       	call   332 <printf>
    exit();
  34:	e8 af 01 00 00       	call   1e8 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	pushl  (%edi,%ebx,4)
  3f:	e8 46 01 00 00       	call   18a <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 cc 01 00 00       	call   218 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 8d 01 00 00       	call   1e8 <exit>

0000005b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	53                   	push   %ebx
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  62:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  65:	89 c2                	mov    %eax,%edx
  67:	0f b6 19             	movzbl (%ecx),%ebx
  6a:	88 1a                	mov    %bl,(%edx)
  6c:	8d 52 01             	lea    0x1(%edx),%edx
  6f:	8d 49 01             	lea    0x1(%ecx),%ecx
  72:	84 db                	test   %bl,%bl
  74:	75 f1                	jne    67 <strcpy+0xc>
    ;
  return os;
}
  76:	5b                   	pop    %ebx
  77:	5d                   	pop    %ebp
  78:	c3                   	ret    

00000079 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  82:	eb 06                	jmp    8a <strcmp+0x11>
    p++, q++;
  84:	83 c1 01             	add    $0x1,%ecx
  87:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  8a:	0f b6 01             	movzbl (%ecx),%eax
  8d:	84 c0                	test   %al,%al
  8f:	74 04                	je     95 <strcmp+0x1c>
  91:	3a 02                	cmp    (%edx),%al
  93:	74 ef                	je     84 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  95:	0f b6 c0             	movzbl %al,%eax
  98:	0f b6 12             	movzbl (%edx),%edx
  9b:	29 d0                	sub    %edx,%eax
}
  9d:	5d                   	pop    %ebp
  9e:	c3                   	ret    

0000009f <strlen>:

uint
strlen(const char *s)
{
  9f:	55                   	push   %ebp
  a0:	89 e5                	mov    %esp,%ebp
  a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  a5:	ba 00 00 00 00       	mov    $0x0,%edx
  aa:	eb 03                	jmp    af <strlen+0x10>
  ac:	83 c2 01             	add    $0x1,%edx
  af:	89 d0                	mov    %edx,%eax
  b1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  b5:	75 f5                	jne    ac <strlen+0xd>
    ;
  return n;
}
  b7:	5d                   	pop    %ebp
  b8:	c3                   	ret    

000000b9 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b9:	55                   	push   %ebp
  ba:	89 e5                	mov    %esp,%ebp
  bc:	57                   	push   %edi
  bd:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c0:	89 d7                	mov    %edx,%edi
  c2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  c8:	fc                   	cld    
  c9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  cb:	89 d0                	mov    %edx,%eax
  cd:	5f                   	pop    %edi
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret    

000000d0 <strchr>:

char*
strchr(const char *s, char c)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  da:	0f b6 10             	movzbl (%eax),%edx
  dd:	84 d2                	test   %dl,%dl
  df:	74 09                	je     ea <strchr+0x1a>
    if(*s == c)
  e1:	38 ca                	cmp    %cl,%dl
  e3:	74 0a                	je     ef <strchr+0x1f>
  for(; *s; s++)
  e5:	83 c0 01             	add    $0x1,%eax
  e8:	eb f0                	jmp    da <strchr+0xa>
      return (char*)s;
  return 0;
  ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <gets>:

char*
gets(char *buf, int max)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	57                   	push   %edi
  f5:	56                   	push   %esi
  f6:	53                   	push   %ebx
  f7:	83 ec 1c             	sub    $0x1c,%esp
  fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 102:	8d 73 01             	lea    0x1(%ebx),%esi
 105:	3b 75 0c             	cmp    0xc(%ebp),%esi
 108:	7d 2e                	jge    138 <gets+0x47>
    cc = read(0, &c, 1);
 10a:	83 ec 04             	sub    $0x4,%esp
 10d:	6a 01                	push   $0x1
 10f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 112:	50                   	push   %eax
 113:	6a 00                	push   $0x0
 115:	e8 e6 00 00 00       	call   200 <read>
    if(cc < 1)
 11a:	83 c4 10             	add    $0x10,%esp
 11d:	85 c0                	test   %eax,%eax
 11f:	7e 17                	jle    138 <gets+0x47>
      break;
    buf[i++] = c;
 121:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 125:	88 04 1f             	mov    %al,(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 128:	3c 0a                	cmp    $0xa,%al
 12a:	0f 94 c2             	sete   %dl
 12d:	3c 0d                	cmp    $0xd,%al
 12f:	0f 94 c0             	sete   %al
    buf[i++] = c;
 132:	89 f3                	mov    %esi,%ebx
    if(c == '\n' || c == '\r')
 134:	08 c2                	or     %al,%dl
 136:	74 ca                	je     102 <gets+0x11>
      break;
  }
  buf[i] = '\0';
 138:	c6 04 1f 00          	movb   $0x0,(%edi,%ebx,1)
  return buf;
}
 13c:	89 f8                	mov    %edi,%eax
 13e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 141:	5b                   	pop    %ebx
 142:	5e                   	pop    %esi
 143:	5f                   	pop    %edi
 144:	5d                   	pop    %ebp
 145:	c3                   	ret    

00000146 <stat>:

int
stat(const char *n, struct stat *st)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	56                   	push   %esi
 14a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 14b:	83 ec 08             	sub    $0x8,%esp
 14e:	6a 00                	push   $0x0
 150:	ff 75 08             	pushl  0x8(%ebp)
 153:	e8 d0 00 00 00       	call   228 <open>
  if(fd < 0)
 158:	83 c4 10             	add    $0x10,%esp
 15b:	85 c0                	test   %eax,%eax
 15d:	78 24                	js     183 <stat+0x3d>
 15f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 161:	83 ec 08             	sub    $0x8,%esp
 164:	ff 75 0c             	pushl  0xc(%ebp)
 167:	50                   	push   %eax
 168:	e8 d3 00 00 00       	call   240 <fstat>
 16d:	89 c6                	mov    %eax,%esi
  close(fd);
 16f:	89 1c 24             	mov    %ebx,(%esp)
 172:	e8 99 00 00 00       	call   210 <close>
  return r;
 177:	83 c4 10             	add    $0x10,%esp
}
 17a:	89 f0                	mov    %esi,%eax
 17c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 17f:	5b                   	pop    %ebx
 180:	5e                   	pop    %esi
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
    return -1;
 183:	be ff ff ff ff       	mov    $0xffffffff,%esi
 188:	eb f0                	jmp    17a <stat+0x34>

0000018a <atoi>:

int
atoi(const char *s)
{
 18a:	55                   	push   %ebp
 18b:	89 e5                	mov    %esp,%ebp
 18d:	53                   	push   %ebx
 18e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 191:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 196:	eb 10                	jmp    1a8 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 198:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
 19b:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
 19e:	83 c1 01             	add    $0x1,%ecx
 1a1:	0f be d2             	movsbl %dl,%edx
 1a4:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  while('0' <= *s && *s <= '9')
 1a8:	0f b6 11             	movzbl (%ecx),%edx
 1ab:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1ae:	80 fb 09             	cmp    $0x9,%bl
 1b1:	76 e5                	jbe    198 <atoi+0xe>
  return n;
}
 1b3:	5b                   	pop    %ebx
 1b4:	5d                   	pop    %ebp
 1b5:	c3                   	ret    

000001b6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1b6:	55                   	push   %ebp
 1b7:	89 e5                	mov    %esp,%ebp
 1b9:	56                   	push   %esi
 1ba:	53                   	push   %ebx
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1c1:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
 1c4:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
 1c6:	eb 0d                	jmp    1d5 <memmove+0x1f>
    *dst++ = *src++;
 1c8:	0f b6 13             	movzbl (%ebx),%edx
 1cb:	88 11                	mov    %dl,(%ecx)
 1cd:	8d 5b 01             	lea    0x1(%ebx),%ebx
 1d0:	8d 49 01             	lea    0x1(%ecx),%ecx
  while(n-- > 0)
 1d3:	89 f2                	mov    %esi,%edx
 1d5:	8d 72 ff             	lea    -0x1(%edx),%esi
 1d8:	85 d2                	test   %edx,%edx
 1da:	7f ec                	jg     1c8 <memmove+0x12>
  return vdst;
}
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    

000001e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 1e0:	b8 01 00 00 00       	mov    $0x1,%eax
 1e5:	cd 40                	int    $0x40
 1e7:	c3                   	ret    

000001e8 <exit>:
SYSCALL(exit)
 1e8:	b8 02 00 00 00       	mov    $0x2,%eax
 1ed:	cd 40                	int    $0x40
 1ef:	c3                   	ret    

000001f0 <wait>:
SYSCALL(wait)
 1f0:	b8 03 00 00 00       	mov    $0x3,%eax
 1f5:	cd 40                	int    $0x40
 1f7:	c3                   	ret    

000001f8 <pipe>:
SYSCALL(pipe)
 1f8:	b8 04 00 00 00       	mov    $0x4,%eax
 1fd:	cd 40                	int    $0x40
 1ff:	c3                   	ret    

00000200 <read>:
SYSCALL(read)
 200:	b8 05 00 00 00       	mov    $0x5,%eax
 205:	cd 40                	int    $0x40
 207:	c3                   	ret    

00000208 <write>:
SYSCALL(write)
 208:	b8 10 00 00 00       	mov    $0x10,%eax
 20d:	cd 40                	int    $0x40
 20f:	c3                   	ret    

00000210 <close>:
SYSCALL(close)
 210:	b8 15 00 00 00       	mov    $0x15,%eax
 215:	cd 40                	int    $0x40
 217:	c3                   	ret    

00000218 <kill>:
SYSCALL(kill)
 218:	b8 06 00 00 00       	mov    $0x6,%eax
 21d:	cd 40                	int    $0x40
 21f:	c3                   	ret    

00000220 <exec>:
SYSCALL(exec)
 220:	b8 07 00 00 00       	mov    $0x7,%eax
 225:	cd 40                	int    $0x40
 227:	c3                   	ret    

00000228 <open>:
SYSCALL(open)
 228:	b8 0f 00 00 00       	mov    $0xf,%eax
 22d:	cd 40                	int    $0x40
 22f:	c3                   	ret    

00000230 <mknod>:
SYSCALL(mknod)
 230:	b8 11 00 00 00       	mov    $0x11,%eax
 235:	cd 40                	int    $0x40
 237:	c3                   	ret    

00000238 <unlink>:
SYSCALL(unlink)
 238:	b8 12 00 00 00       	mov    $0x12,%eax
 23d:	cd 40                	int    $0x40
 23f:	c3                   	ret    

00000240 <fstat>:
SYSCALL(fstat)
 240:	b8 08 00 00 00       	mov    $0x8,%eax
 245:	cd 40                	int    $0x40
 247:	c3                   	ret    

00000248 <link>:
SYSCALL(link)
 248:	b8 13 00 00 00       	mov    $0x13,%eax
 24d:	cd 40                	int    $0x40
 24f:	c3                   	ret    

00000250 <mkdir>:
SYSCALL(mkdir)
 250:	b8 14 00 00 00       	mov    $0x14,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <chdir>:
SYSCALL(chdir)
 258:	b8 09 00 00 00       	mov    $0x9,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <dup>:
SYSCALL(dup)
 260:	b8 0a 00 00 00       	mov    $0xa,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <getpid>:
SYSCALL(getpid)
 268:	b8 0b 00 00 00       	mov    $0xb,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <sbrk>:
SYSCALL(sbrk)
 270:	b8 0c 00 00 00       	mov    $0xc,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <sleep>:
SYSCALL(sleep)
 278:	b8 0d 00 00 00       	mov    $0xd,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <uptime>:
SYSCALL(uptime)
 280:	b8 0e 00 00 00       	mov    $0xe,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <getofilecnt>:
SYSCALL(getofilecnt)
 288:	b8 16 00 00 00       	mov    $0x16,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <getofilenext>:
SYSCALL(getofilenext)
 290:	b8 17 00 00 00       	mov    $0x17,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	83 ec 1c             	sub    $0x1c,%esp
 29e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 2a1:	6a 01                	push   $0x1
 2a3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 2a6:	52                   	push   %edx
 2a7:	50                   	push   %eax
 2a8:	e8 5b ff ff ff       	call   208 <write>
}
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	57                   	push   %edi
 2b6:	56                   	push   %esi
 2b7:	53                   	push   %ebx
 2b8:	83 ec 2c             	sub    $0x2c,%esp
 2bb:	89 c7                	mov    %eax,%edi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 2bd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2c1:	0f 95 c3             	setne  %bl
 2c4:	89 d0                	mov    %edx,%eax
 2c6:	c1 e8 1f             	shr    $0x1f,%eax
 2c9:	84 c3                	test   %al,%bl
 2cb:	74 10                	je     2dd <printint+0x2b>
    neg = 1;
    x = -xx;
 2cd:	f7 da                	neg    %edx
    neg = 1;
 2cf:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2d6:	be 00 00 00 00       	mov    $0x0,%esi
 2db:	eb 0b                	jmp    2e8 <printint+0x36>
  neg = 0;
 2dd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 2e4:	eb f0                	jmp    2d6 <printint+0x24>
  do{
    buf[i++] = digits[x % base];
 2e6:	89 c6                	mov    %eax,%esi
 2e8:	89 d0                	mov    %edx,%eax
 2ea:	ba 00 00 00 00       	mov    $0x0,%edx
 2ef:	f7 f1                	div    %ecx
 2f1:	89 c3                	mov    %eax,%ebx
 2f3:	8d 46 01             	lea    0x1(%esi),%eax
 2f6:	0f b6 92 08 06 00 00 	movzbl 0x608(%edx),%edx
 2fd:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
 301:	89 da                	mov    %ebx,%edx
 303:	85 db                	test   %ebx,%ebx
 305:	75 df                	jne    2e6 <printint+0x34>
 307:	89 c3                	mov    %eax,%ebx
  if(neg)
 309:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 30d:	74 16                	je     325 <printint+0x73>
    buf[i++] = '-';
 30f:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 314:	8d 5e 02             	lea    0x2(%esi),%ebx
 317:	eb 0c                	jmp    325 <printint+0x73>

  while(--i >= 0)
    putc(fd, buf[i]);
 319:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 31e:	89 f8                	mov    %edi,%eax
 320:	e8 73 ff ff ff       	call   298 <putc>
  while(--i >= 0)
 325:	83 eb 01             	sub    $0x1,%ebx
 328:	79 ef                	jns    319 <printint+0x67>
}
 32a:	83 c4 2c             	add    $0x2c,%esp
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5f                   	pop    %edi
 330:	5d                   	pop    %ebp
 331:	c3                   	ret    

00000332 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	57                   	push   %edi
 336:	56                   	push   %esi
 337:	53                   	push   %ebx
 338:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 33b:	8d 45 10             	lea    0x10(%ebp),%eax
 33e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 341:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 346:	bb 00 00 00 00       	mov    $0x0,%ebx
 34b:	eb 14                	jmp    361 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 34d:	89 fa                	mov    %edi,%edx
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	e8 41 ff ff ff       	call   298 <putc>
 357:	eb 05                	jmp    35e <printf+0x2c>
      }
    } else if(state == '%'){
 359:	83 fe 25             	cmp    $0x25,%esi
 35c:	74 25                	je     383 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 35e:	83 c3 01             	add    $0x1,%ebx
 361:	8b 45 0c             	mov    0xc(%ebp),%eax
 364:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 368:	84 c0                	test   %al,%al
 36a:	0f 84 23 01 00 00    	je     493 <printf+0x161>
    c = fmt[i] & 0xff;
 370:	0f be f8             	movsbl %al,%edi
 373:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 376:	85 f6                	test   %esi,%esi
 378:	75 df                	jne    359 <printf+0x27>
      if(c == '%'){
 37a:	83 f8 25             	cmp    $0x25,%eax
 37d:	75 ce                	jne    34d <printf+0x1b>
        state = '%';
 37f:	89 c6                	mov    %eax,%esi
 381:	eb db                	jmp    35e <printf+0x2c>
      if(c == 'd'){
 383:	83 f8 64             	cmp    $0x64,%eax
 386:	74 49                	je     3d1 <printf+0x9f>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 388:	83 f8 78             	cmp    $0x78,%eax
 38b:	0f 94 c1             	sete   %cl
 38e:	83 f8 70             	cmp    $0x70,%eax
 391:	0f 94 c2             	sete   %dl
 394:	08 d1                	or     %dl,%cl
 396:	75 63                	jne    3fb <printf+0xc9>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 398:	83 f8 73             	cmp    $0x73,%eax
 39b:	0f 84 84 00 00 00    	je     425 <printf+0xf3>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3a1:	83 f8 63             	cmp    $0x63,%eax
 3a4:	0f 84 b7 00 00 00    	je     461 <printf+0x12f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3aa:	83 f8 25             	cmp    $0x25,%eax
 3ad:	0f 84 cc 00 00 00    	je     47f <printf+0x14d>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 3b3:	ba 25 00 00 00       	mov    $0x25,%edx
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	e8 d8 fe ff ff       	call   298 <putc>
        putc(fd, c);
 3c0:	89 fa                	mov    %edi,%edx
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	e8 ce fe ff ff       	call   298 <putc>
      }
      state = 0;
 3ca:	be 00 00 00 00       	mov    $0x0,%esi
 3cf:	eb 8d                	jmp    35e <printf+0x2c>
        printint(fd, *ap, 10, 1);
 3d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3d4:	8b 17                	mov    (%edi),%edx
 3d6:	83 ec 0c             	sub    $0xc,%esp
 3d9:	6a 01                	push   $0x1
 3db:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3e0:	8b 45 08             	mov    0x8(%ebp),%eax
 3e3:	e8 ca fe ff ff       	call   2b2 <printint>
        ap++;
 3e8:	83 c7 04             	add    $0x4,%edi
 3eb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3ee:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3f1:	be 00 00 00 00       	mov    $0x0,%esi
 3f6:	e9 63 ff ff ff       	jmp    35e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 3fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3fe:	8b 17                	mov    (%edi),%edx
 400:	83 ec 0c             	sub    $0xc,%esp
 403:	6a 00                	push   $0x0
 405:	b9 10 00 00 00       	mov    $0x10,%ecx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	e8 a0 fe ff ff       	call   2b2 <printint>
        ap++;
 412:	83 c7 04             	add    $0x4,%edi
 415:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 418:	83 c4 10             	add    $0x10,%esp
      state = 0;
 41b:	be 00 00 00 00       	mov    $0x0,%esi
 420:	e9 39 ff ff ff       	jmp    35e <printf+0x2c>
        s = (char*)*ap;
 425:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 428:	8b 30                	mov    (%eax),%esi
        ap++;
 42a:	83 c0 04             	add    $0x4,%eax
 42d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 430:	85 f6                	test   %esi,%esi
 432:	75 28                	jne    45c <printf+0x12a>
          s = "(null)";
 434:	be 00 06 00 00       	mov    $0x600,%esi
 439:	8b 7d 08             	mov    0x8(%ebp),%edi
 43c:	eb 0d                	jmp    44b <printf+0x119>
          putc(fd, *s);
 43e:	0f be d2             	movsbl %dl,%edx
 441:	89 f8                	mov    %edi,%eax
 443:	e8 50 fe ff ff       	call   298 <putc>
          s++;
 448:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 44b:	0f b6 16             	movzbl (%esi),%edx
 44e:	84 d2                	test   %dl,%dl
 450:	75 ec                	jne    43e <printf+0x10c>
      state = 0;
 452:	be 00 00 00 00       	mov    $0x0,%esi
 457:	e9 02 ff ff ff       	jmp    35e <printf+0x2c>
 45c:	8b 7d 08             	mov    0x8(%ebp),%edi
 45f:	eb ea                	jmp    44b <printf+0x119>
        putc(fd, *ap);
 461:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 464:	0f be 17             	movsbl (%edi),%edx
 467:	8b 45 08             	mov    0x8(%ebp),%eax
 46a:	e8 29 fe ff ff       	call   298 <putc>
        ap++;
 46f:	83 c7 04             	add    $0x4,%edi
 472:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 475:	be 00 00 00 00       	mov    $0x0,%esi
 47a:	e9 df fe ff ff       	jmp    35e <printf+0x2c>
        putc(fd, c);
 47f:	89 fa                	mov    %edi,%edx
 481:	8b 45 08             	mov    0x8(%ebp),%eax
 484:	e8 0f fe ff ff       	call   298 <putc>
      state = 0;
 489:	be 00 00 00 00       	mov    $0x0,%esi
 48e:	e9 cb fe ff ff       	jmp    35e <printf+0x2c>
    }
  }
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    

0000049b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 49b:	55                   	push   %ebp
 49c:	89 e5                	mov    %esp,%ebp
 49e:	57                   	push   %edi
 49f:	56                   	push   %esi
 4a0:	53                   	push   %ebx
 4a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4a7:	a1 ac 08 00 00       	mov    0x8ac,%eax
 4ac:	eb 02                	jmp    4b0 <free+0x15>
 4ae:	89 d0                	mov    %edx,%eax
 4b0:	39 c8                	cmp    %ecx,%eax
 4b2:	73 04                	jae    4b8 <free+0x1d>
 4b4:	39 08                	cmp    %ecx,(%eax)
 4b6:	77 12                	ja     4ca <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4b8:	8b 10                	mov    (%eax),%edx
 4ba:	39 c2                	cmp    %eax,%edx
 4bc:	77 f0                	ja     4ae <free+0x13>
 4be:	39 c8                	cmp    %ecx,%eax
 4c0:	72 08                	jb     4ca <free+0x2f>
 4c2:	39 ca                	cmp    %ecx,%edx
 4c4:	77 04                	ja     4ca <free+0x2f>
 4c6:	89 d0                	mov    %edx,%eax
 4c8:	eb e6                	jmp    4b0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 4ca:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4cd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4d0:	8b 10                	mov    (%eax),%edx
 4d2:	39 d7                	cmp    %edx,%edi
 4d4:	74 19                	je     4ef <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 4d6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 4d9:	8b 50 04             	mov    0x4(%eax),%edx
 4dc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 4df:	39 ce                	cmp    %ecx,%esi
 4e1:	74 1b                	je     4fe <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 4e3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 4e5:	a3 ac 08 00 00       	mov    %eax,0x8ac
}
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5f                   	pop    %edi
 4ed:	5d                   	pop    %ebp
 4ee:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 4ef:	03 72 04             	add    0x4(%edx),%esi
 4f2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 4f5:	8b 10                	mov    (%eax),%edx
 4f7:	8b 12                	mov    (%edx),%edx
 4f9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 4fc:	eb db                	jmp    4d9 <free+0x3e>
    p->s.size += bp->s.size;
 4fe:	03 53 fc             	add    -0x4(%ebx),%edx
 501:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 504:	8b 53 f8             	mov    -0x8(%ebx),%edx
 507:	89 10                	mov    %edx,(%eax)
 509:	eb da                	jmp    4e5 <free+0x4a>

0000050b <morecore>:

static Header*
morecore(uint nu)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	53                   	push   %ebx
 50f:	83 ec 04             	sub    $0x4,%esp
 512:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 514:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 519:	77 05                	ja     520 <morecore+0x15>
    nu = 4096;
 51b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 520:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 527:	83 ec 0c             	sub    $0xc,%esp
 52a:	50                   	push   %eax
 52b:	e8 40 fd ff ff       	call   270 <sbrk>
  if(p == (char*)-1)
 530:	83 c4 10             	add    $0x10,%esp
 533:	83 f8 ff             	cmp    $0xffffffff,%eax
 536:	74 1c                	je     554 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 538:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 53b:	83 c0 08             	add    $0x8,%eax
 53e:	83 ec 0c             	sub    $0xc,%esp
 541:	50                   	push   %eax
 542:	e8 54 ff ff ff       	call   49b <free>
  return freep;
 547:	a1 ac 08 00 00       	mov    0x8ac,%eax
 54c:	83 c4 10             	add    $0x10,%esp
}
 54f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 552:	c9                   	leave  
 553:	c3                   	ret    
    return 0;
 554:	b8 00 00 00 00       	mov    $0x0,%eax
 559:	eb f4                	jmp    54f <morecore+0x44>

0000055b <malloc>:

void*
malloc(uint nbytes)
{
 55b:	55                   	push   %ebp
 55c:	89 e5                	mov    %esp,%ebp
 55e:	53                   	push   %ebx
 55f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 562:	8b 45 08             	mov    0x8(%ebp),%eax
 565:	8d 58 07             	lea    0x7(%eax),%ebx
 568:	c1 eb 03             	shr    $0x3,%ebx
 56b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 56e:	8b 0d ac 08 00 00    	mov    0x8ac,%ecx
 574:	85 c9                	test   %ecx,%ecx
 576:	74 04                	je     57c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 578:	8b 01                	mov    (%ecx),%eax
 57a:	eb 4d                	jmp    5c9 <malloc+0x6e>
    base.s.ptr = freep = prevp = &base;
 57c:	c7 05 ac 08 00 00 b0 	movl   $0x8b0,0x8ac
 583:	08 00 00 
 586:	c7 05 b0 08 00 00 b0 	movl   $0x8b0,0x8b0
 58d:	08 00 00 
    base.s.size = 0;
 590:	c7 05 b4 08 00 00 00 	movl   $0x0,0x8b4
 597:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 59a:	b9 b0 08 00 00       	mov    $0x8b0,%ecx
 59f:	eb d7                	jmp    578 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5a1:	39 da                	cmp    %ebx,%edx
 5a3:	74 1a                	je     5bf <malloc+0x64>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5a5:	29 da                	sub    %ebx,%edx
 5a7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5aa:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5ad:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5b0:	89 0d ac 08 00 00    	mov    %ecx,0x8ac
      return (void*)(p + 1);
 5b6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 5b9:	83 c4 04             	add    $0x4,%esp
 5bc:	5b                   	pop    %ebx
 5bd:	5d                   	pop    %ebp
 5be:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 5bf:	8b 10                	mov    (%eax),%edx
 5c1:	89 11                	mov    %edx,(%ecx)
 5c3:	eb eb                	jmp    5b0 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5c5:	89 c1                	mov    %eax,%ecx
 5c7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 5c9:	8b 50 04             	mov    0x4(%eax),%edx
 5cc:	39 da                	cmp    %ebx,%edx
 5ce:	73 d1                	jae    5a1 <malloc+0x46>
    if(p == freep)
 5d0:	39 05 ac 08 00 00    	cmp    %eax,0x8ac
 5d6:	75 ed                	jne    5c5 <malloc+0x6a>
      if((p = morecore(nunits)) == 0)
 5d8:	89 d8                	mov    %ebx,%eax
 5da:	e8 2c ff ff ff       	call   50b <morecore>
 5df:	85 c0                	test   %eax,%eax
 5e1:	75 e2                	jne    5c5 <malloc+0x6a>
        return 0;
 5e3:	b8 00 00 00 00       	mov    $0x0,%eax
 5e8:	eb cf                	jmp    5b9 <malloc+0x5e>
