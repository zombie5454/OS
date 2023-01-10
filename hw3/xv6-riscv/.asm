
user/_test1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <thrdstop_test1>:
int main_id = 0;
int flag = 0;
int thrdstop_test_time = 0;
int tmpTime;
void thrdstop_test1()
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
    thrdstop_test_time = uptime();
   8:	00000097          	auipc	ra,0x0
   c:	666080e7          	jalr	1638(ra) # 66e <uptime>
  10:	00001797          	auipc	a5,0x1
  14:	10a7aa23          	sw	a0,276(a5) # 1124 <thrdstop_test_time>
    printf("thrdstop test1 at %d\n", thrdstop_test_time-startTime);
  18:	00001597          	auipc	a1,0x1
  1c:	1185a583          	lw	a1,280(a1) # 1130 <startTime>
  20:	40b505bb          	subw	a1,a0,a1
  24:	00001517          	auipc	a0,0x1
  28:	fdc50513          	addi	a0,a0,-36 # 1000 <thread_start_threading+0x74>
  2c:	00001097          	auipc	ra,0x1
  30:	93a080e7          	jalr	-1734(ra) # 966 <printf>
    flag += 1;
  34:	00001717          	auipc	a4,0x1
  38:	0f470713          	addi	a4,a4,244 # 1128 <flag>
  3c:	431c                	lw	a5,0(a4)
  3e:	2785                	addiw	a5,a5,1
  40:	c31c                	sw	a5,0(a4)
    thrdresume(main_id, 0);
  42:	4581                	li	a1,0
  44:	00001517          	auipc	a0,0x1
  48:	0e852503          	lw	a0,232(a0) # 112c <main_id>
  4c:	00000097          	auipc	ra,0x0
  50:	632080e7          	jalr	1586(ra) # 67e <thrdresume>
}
  54:	60a2                	ld	ra,8(sp)
  56:	6402                	ld	s0,0(sp)
  58:	0141                	addi	sp,sp,16
  5a:	8082                	ret

000000000000005c <f1>:
    }
}


void f1( void *k )
{
  5c:	1141                	addi	sp,sp,-16
  5e:	e406                	sd	ra,8(sp)
  60:	e022                	sd	s0,0(sp)
  62:	0800                	addi	s0,sp,16
    int *kk = (int *)k;
    *kk = *(int *)k + 1;
  64:	411c                	lw	a5,0(a0)
  66:	2785                	addiw	a5,a5,1
  68:	0007871b          	sext.w	a4,a5
  6c:	c11c                	sw	a5,0(a0)
    if( *kk <= 100 )
  6e:	06400793          	li	a5,100
  72:	00e7da63          	bge	a5,a4,86 <f1+0x2a>
    {
        struct thread *t1 = thread_create(f1, k, 3);
        thread_add_runqueue(t1);
    }    
    thread_exit();
  76:	00001097          	auipc	ra,0x1
  7a:	cea080e7          	jalr	-790(ra) # d60 <thread_exit>
}
  7e:	60a2                	ld	ra,8(sp)
  80:	6402                	ld	s0,0(sp)
  82:	0141                	addi	sp,sp,16
  84:	8082                	ret
        struct thread *t1 = thread_create(f1, k, 3);
  86:	460d                	li	a2,3
  88:	85aa                	mv	a1,a0
  8a:	00000517          	auipc	a0,0x0
  8e:	fd250513          	addi	a0,a0,-46 # 5c <f1>
  92:	00001097          	auipc	ra,0x1
  96:	aec080e7          	jalr	-1300(ra) # b7e <thread_create>
        thread_add_runqueue(t1);
  9a:	00001097          	auipc	ra,0x1
  9e:	b64080e7          	jalr	-1180(ra) # bfe <thread_add_runqueue>
  a2:	bfd1                	j	76 <f1+0x1a>

00000000000000a4 <gg>:
{
  a4:	1141                	addi	sp,sp,-16
  a6:	e422                	sd	s0,8(sp)
  a8:	0800                	addi	s0,sp,16
    *k = *k + 1;
  aa:	411c                	lw	a5,0(a0)
  ac:	2785                	addiw	a5,a5,1
  ae:	c11c                	sw	a5,0(a0)
}
  b0:	6422                	ld	s0,8(sp)
  b2:	0141                	addi	sp,sp,16
  b4:	8082                	ret

00000000000000b6 <test1>:
{
  b6:	711d                	addi	sp,sp,-96
  b8:	ec86                	sd	ra,88(sp)
  ba:	e8a2                	sd	s0,80(sp)
  bc:	e4a6                	sd	s1,72(sp)
  be:	e0ca                	sd	s2,64(sp)
  c0:	fc4e                	sd	s3,56(sp)
  c2:	f852                	sd	s4,48(sp)
  c4:	f456                	sd	s5,40(sp)
  c6:	f05a                	sd	s6,32(sp)
  c8:	ec5e                	sd	s7,24(sp)
  ca:	e862                	sd	s8,16(sp)
  cc:	e466                	sd	s9,8(sp)
  ce:	1080                	addi	s0,sp,96
    startTime = uptime();
  d0:	00000097          	auipc	ra,0x0
  d4:	59e080e7          	jalr	1438(ra) # 66e <uptime>
  d8:	00001797          	auipc	a5,0x1
  dc:	04a7ac23          	sw	a0,88(a5) # 1130 <startTime>
    main_id = thrdstop( 5, -1, thrdstop_test1);
  e0:	00000617          	auipc	a2,0x0
  e4:	f2060613          	addi	a2,a2,-224 # 0 <thrdstop_test1>
  e8:	55fd                	li	a1,-1
  ea:	4515                	li	a0,5
  ec:	00000097          	auipc	ra,0x0
  f0:	58a080e7          	jalr	1418(ra) # 676 <thrdstop>
  f4:	00001797          	auipc	a5,0x1
  f8:	02a7ac23          	sw	a0,56(a5) # 112c <main_id>
    int tmp_time = 0;
  fc:	4c81                	li	s9,0
        if(flag == 1)
  fe:	00001497          	auipc	s1,0x1
 102:	02a48493          	addi	s1,s1,42 # 1128 <flag>
 106:	4985                	li	s3,1
        else if( flag == 2 && uptime() - tmp_time >= 2 )
 108:	4909                	li	s2,2
            tmpTime = uptime();
 10a:	00001c17          	auipc	s8,0x1
 10e:	016c0c13          	addi	s8,s8,22 # 1120 <tmpTime>
            if( tmpTime != nowTime && flag == 5 )
 112:	00001b97          	auipc	s7,0x1
 116:	ffeb8b93          	addi	s7,s7,-2 # 1110 <nowTime>
                printf("ttt %d\n", tmpTime-startTime);
 11a:	00001a97          	auipc	s5,0x1
 11e:	016a8a93          	addi	s5,s5,22 # 1130 <startTime>
            if( thrdstop_test_time-startTime > 9 || thrdstop_test_time-startTime < 7 )
 122:	00001b17          	auipc	s6,0x1
 126:	002b0b13          	addi	s6,s6,2 # 1124 <thrdstop_test_time>
            thrdstop( 10, main_id, thrdstop_test1);
 12a:	00001a17          	auipc	s4,0x1
 12e:	002a0a13          	addi	s4,s4,2 # 112c <main_id>
 132:	a0a9                	j	17c <test1+0xc6>
            if( thrdstop_test_time-startTime > 6 || thrdstop_test_time-startTime < 4 )
 134:	000b2783          	lw	a5,0(s6)
 138:	000aa703          	lw	a4,0(s5)
 13c:	9f99                	subw	a5,a5,a4
 13e:	37f1                	addiw	a5,a5,-4
 140:	08f96f63          	bltu	s2,a5,1de <test1+0x128>
            thrdstop( 10, main_id, thrdstop_test1);
 144:	00000617          	auipc	a2,0x0
 148:	ebc60613          	addi	a2,a2,-324 # 0 <thrdstop_test1>
 14c:	000a2583          	lw	a1,0(s4)
 150:	4529                	li	a0,10
 152:	00000097          	auipc	ra,0x0
 156:	524080e7          	jalr	1316(ra) # 676 <thrdstop>
            tmp_time = uptime();
 15a:	00000097          	auipc	ra,0x0
 15e:	514080e7          	jalr	1300(ra) # 66e <uptime>
 162:	8caa                	mv	s9,a0
            printf("tmp_time=%d\n", tmp_time);
 164:	85aa                	mv	a1,a0
 166:	00001517          	auipc	a0,0x1
 16a:	ee250513          	addi	a0,a0,-286 # 1048 <thread_start_threading+0xbc>
 16e:	00000097          	auipc	ra,0x0
 172:	7f8080e7          	jalr	2040(ra) # 966 <printf>
            flag += 1;
 176:	409c                	lw	a5,0(s1)
 178:	2785                	addiw	a5,a5,1
 17a:	c09c                	sw	a5,0(s1)
        if(flag == 1)
 17c:	409c                	lw	a5,0(s1)
 17e:	fb378be3          	beq	a5,s3,134 <test1+0x7e>
        else if( flag == 2 && uptime() - tmp_time >= 2 )
 182:	07278b63          	beq	a5,s2,1f8 <test1+0x142>
        else if( flag == 4 )
 186:	409c                	lw	a5,0(s1)
 188:	4711                	li	a4,4
 18a:	0ae78c63          	beq	a5,a4,242 <test1+0x18c>
        else if( flag == 5 )
 18e:	4715                	li	a4,5
 190:	0ee78d63          	beq	a5,a4,28a <test1+0x1d4>
        else if( flag == 6 )
 194:	4719                	li	a4,6
 196:	fee793e3          	bne	a5,a4,17c <test1+0xc6>
            if( thrdstop_test_time-startTime > 19 || thrdstop_test_time-startTime < 17 )
 19a:	00001797          	auipc	a5,0x1
 19e:	f8a7a783          	lw	a5,-118(a5) # 1124 <thrdstop_test_time>
 1a2:	00001717          	auipc	a4,0x1
 1a6:	f8e72703          	lw	a4,-114(a4) # 1130 <startTime>
 1aa:	9f99                	subw	a5,a5,a4
 1ac:	37bd                	addiw	a5,a5,-17
 1ae:	4709                	li	a4,2
 1b0:	10f76c63          	bltu	a4,a5,2c8 <test1+0x212>
            else printf("PASS 1\n");
 1b4:	00001517          	auipc	a0,0x1
 1b8:	ed450513          	addi	a0,a0,-300 # 1088 <thread_start_threading+0xfc>
 1bc:	00000097          	auipc	ra,0x0
 1c0:	7aa080e7          	jalr	1962(ra) # 966 <printf>
}
 1c4:	60e6                	ld	ra,88(sp)
 1c6:	6446                	ld	s0,80(sp)
 1c8:	64a6                	ld	s1,72(sp)
 1ca:	6906                	ld	s2,64(sp)
 1cc:	79e2                	ld	s3,56(sp)
 1ce:	7a42                	ld	s4,48(sp)
 1d0:	7aa2                	ld	s5,40(sp)
 1d2:	7b02                	ld	s6,32(sp)
 1d4:	6be2                	ld	s7,24(sp)
 1d6:	6c42                	ld	s8,16(sp)
 1d8:	6ca2                	ld	s9,8(sp)
 1da:	6125                	addi	sp,sp,96
 1dc:	8082                	ret
                printf("FAILED, thrdstop counts down incorrectly\n");
 1de:	00001517          	auipc	a0,0x1
 1e2:	e3a50513          	addi	a0,a0,-454 # 1018 <thread_start_threading+0x8c>
 1e6:	00000097          	auipc	ra,0x0
 1ea:	780080e7          	jalr	1920(ra) # 966 <printf>
                exit(0);
 1ee:	4501                	li	a0,0
 1f0:	00000097          	auipc	ra,0x0
 1f4:	3e6080e7          	jalr	998(ra) # 5d6 <exit>
        else if( flag == 2 && uptime() - tmp_time >= 2 )
 1f8:	00000097          	auipc	ra,0x0
 1fc:	476080e7          	jalr	1142(ra) # 66e <uptime>
 200:	4195053b          	subw	a0,a0,s9
 204:	f8a9d1e3          	bge	s3,a0,186 <test1+0xd0>
            int time_consumed = cancelthrdstop( -1 );
 208:	557d                	li	a0,-1
 20a:	00000097          	auipc	ra,0x0
 20e:	47c080e7          	jalr	1148(ra) # 686 <cancelthrdstop>
 212:	85aa                	mv	a1,a0
            printf("time_consumed = %d, it should be 2\n", time_consumed);
 214:	00001517          	auipc	a0,0x1
 218:	e4450513          	addi	a0,a0,-444 # 1058 <thread_start_threading+0xcc>
 21c:	00000097          	auipc	ra,0x0
 220:	74a080e7          	jalr	1866(ra) # 966 <printf>
            thrdstop( 1, main_id, thrdstop_test1);
 224:	00000617          	auipc	a2,0x0
 228:	ddc60613          	addi	a2,a2,-548 # 0 <thrdstop_test1>
 22c:	000a2583          	lw	a1,0(s4)
 230:	854e                	mv	a0,s3
 232:	00000097          	auipc	ra,0x0
 236:	444080e7          	jalr	1092(ra) # 676 <thrdstop>
            flag += 1;
 23a:	409c                	lw	a5,0(s1)
 23c:	2785                	addiw	a5,a5,1
 23e:	c09c                	sw	a5,0(s1)
        {
 240:	bf35                	j	17c <test1+0xc6>
            if( thrdstop_test_time-startTime > 9 || thrdstop_test_time-startTime < 7 )
 242:	000b2783          	lw	a5,0(s6)
 246:	000aa703          	lw	a4,0(s5)
 24a:	9f99                	subw	a5,a5,a4
 24c:	37e5                	addiw	a5,a5,-7
 24e:	02f96163          	bltu	s2,a5,270 <test1+0x1ba>
            thrdstop( 10, main_id, thrdstop_test1);
 252:	00000617          	auipc	a2,0x0
 256:	dae60613          	addi	a2,a2,-594 # 0 <thrdstop_test1>
 25a:	000a2583          	lw	a1,0(s4)
 25e:	4529                	li	a0,10
 260:	00000097          	auipc	ra,0x0
 264:	416080e7          	jalr	1046(ra) # 676 <thrdstop>
            flag += 1;
 268:	409c                	lw	a5,0(s1)
 26a:	2785                	addiw	a5,a5,1
 26c:	c09c                	sw	a5,0(s1)
 26e:	b739                	j	17c <test1+0xc6>
                printf("FAILED, thrdstop counts down incorrectly\n");
 270:	00001517          	auipc	a0,0x1
 274:	da850513          	addi	a0,a0,-600 # 1018 <thread_start_threading+0x8c>
 278:	00000097          	auipc	ra,0x0
 27c:	6ee080e7          	jalr	1774(ra) # 966 <printf>
                exit(0);
 280:	4501                	li	a0,0
 282:	00000097          	auipc	ra,0x0
 286:	354080e7          	jalr	852(ra) # 5d6 <exit>
            tmpTime = uptime();
 28a:	00000097          	auipc	ra,0x0
 28e:	3e4080e7          	jalr	996(ra) # 66e <uptime>
 292:	00ac2023          	sw	a0,0(s8)
            if( tmpTime != nowTime && flag == 5 )
 296:	000ba783          	lw	a5,0(s7)
 29a:	eea781e3          	beq	a5,a0,17c <test1+0xc6>
 29e:	4098                	lw	a4,0(s1)
 2a0:	4795                	li	a5,5
 2a2:	ecf71de3          	bne	a4,a5,17c <test1+0xc6>
                printf("ttt %d\n", tmpTime-startTime);
 2a6:	000aa583          	lw	a1,0(s5)
 2aa:	40b505bb          	subw	a1,a0,a1
 2ae:	00001517          	auipc	a0,0x1
 2b2:	dd250513          	addi	a0,a0,-558 # 1080 <thread_start_threading+0xf4>
 2b6:	00000097          	auipc	ra,0x0
 2ba:	6b0080e7          	jalr	1712(ra) # 966 <printf>
                nowTime = tmpTime;
 2be:	000c2783          	lw	a5,0(s8)
 2c2:	00fba023          	sw	a5,0(s7)
 2c6:	bd5d                	j	17c <test1+0xc6>
                printf("FAILED, thrdstop counts down incorrectly\n");
 2c8:	00001517          	auipc	a0,0x1
 2cc:	d5050513          	addi	a0,a0,-688 # 1018 <thread_start_threading+0x8c>
 2d0:	00000097          	auipc	ra,0x0
 2d4:	696080e7          	jalr	1686(ra) # 966 <printf>
                exit(0);
 2d8:	4501                	li	a0,0
 2da:	00000097          	auipc	ra,0x0
 2de:	2fc080e7          	jalr	764(ra) # 5d6 <exit>

00000000000002e2 <test2>:

void test2()
{
 2e2:	1101                	addi	sp,sp,-32
 2e4:	ec06                	sd	ra,24(sp)
 2e6:	e822                	sd	s0,16(sp)
 2e8:	1000                	addi	s0,sp,32
    int test2k = 0;
 2ea:	fe042623          	sw	zero,-20(s0)
    struct thread *t1 = thread_create(f1, &test2k, 3);
 2ee:	460d                	li	a2,3
 2f0:	fec40593          	addi	a1,s0,-20
 2f4:	00000517          	auipc	a0,0x0
 2f8:	d6850513          	addi	a0,a0,-664 # 5c <f1>
 2fc:	00001097          	auipc	ra,0x1
 300:	882080e7          	jalr	-1918(ra) # b7e <thread_create>
    thread_add_runqueue(t1);
 304:	00001097          	auipc	ra,0x1
 308:	8fa080e7          	jalr	-1798(ra) # bfe <thread_add_runqueue>
    thread_start_threading(5);
 30c:	4515                	li	a0,5
 30e:	00001097          	auipc	ra,0x1
 312:	c7e080e7          	jalr	-898(ra) # f8c <thread_start_threading>
    printf("test2k=%d\n", test2k);
 316:	fec42583          	lw	a1,-20(s0)
 31a:	00001517          	auipc	a0,0x1
 31e:	d7650513          	addi	a0,a0,-650 # 1090 <thread_start_threading+0x104>
 322:	00000097          	auipc	ra,0x0
 326:	644080e7          	jalr	1604(ra) # 966 <printf>
    printf("PASS 2\n", test2k);
 32a:	fec42583          	lw	a1,-20(s0)
 32e:	00001517          	auipc	a0,0x1
 332:	d7250513          	addi	a0,a0,-654 # 10a0 <thread_start_threading+0x114>
 336:	00000097          	auipc	ra,0x0
 33a:	630080e7          	jalr	1584(ra) # 966 <printf>
}
 33e:	60e2                	ld	ra,24(sp)
 340:	6442                	ld	s0,16(sp)
 342:	6105                	addi	sp,sp,32
 344:	8082                	ret

0000000000000346 <main>:

int main(int argc, char **argv)
{
 346:	1141                	addi	sp,sp,-16
 348:	e406                	sd	ra,8(sp)
 34a:	e022                	sd	s0,0(sp)
 34c:	0800                	addi	s0,sp,16
   
    test1();
 34e:	00000097          	auipc	ra,0x0
 352:	d68080e7          	jalr	-664(ra) # b6 <test1>
    test2();
 356:	00000097          	auipc	ra,0x0
 35a:	f8c080e7          	jalr	-116(ra) # 2e2 <test2>
    exit(0);
 35e:	4501                	li	a0,0
 360:	00000097          	auipc	ra,0x0
 364:	276080e7          	jalr	630(ra) # 5d6 <exit>

0000000000000368 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 368:	1141                	addi	sp,sp,-16
 36a:	e422                	sd	s0,8(sp)
 36c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 36e:	87aa                	mv	a5,a0
 370:	0585                	addi	a1,a1,1
 372:	0785                	addi	a5,a5,1
 374:	fff5c703          	lbu	a4,-1(a1)
 378:	fee78fa3          	sb	a4,-1(a5)
 37c:	fb75                	bnez	a4,370 <strcpy+0x8>
    ;
  return os;
}
 37e:	6422                	ld	s0,8(sp)
 380:	0141                	addi	sp,sp,16
 382:	8082                	ret

0000000000000384 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 384:	1141                	addi	sp,sp,-16
 386:	e422                	sd	s0,8(sp)
 388:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 38a:	00054783          	lbu	a5,0(a0)
 38e:	cb91                	beqz	a5,3a2 <strcmp+0x1e>
 390:	0005c703          	lbu	a4,0(a1)
 394:	00f71763          	bne	a4,a5,3a2 <strcmp+0x1e>
    p++, q++;
 398:	0505                	addi	a0,a0,1
 39a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 39c:	00054783          	lbu	a5,0(a0)
 3a0:	fbe5                	bnez	a5,390 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 3a2:	0005c503          	lbu	a0,0(a1)
}
 3a6:	40a7853b          	subw	a0,a5,a0
 3aa:	6422                	ld	s0,8(sp)
 3ac:	0141                	addi	sp,sp,16
 3ae:	8082                	ret

00000000000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	1141                	addi	sp,sp,-16
 3b2:	e422                	sd	s0,8(sp)
 3b4:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 3b6:	00054783          	lbu	a5,0(a0)
 3ba:	cf91                	beqz	a5,3d6 <strlen+0x26>
 3bc:	0505                	addi	a0,a0,1
 3be:	87aa                	mv	a5,a0
 3c0:	4685                	li	a3,1
 3c2:	9e89                	subw	a3,a3,a0
 3c4:	00f6853b          	addw	a0,a3,a5
 3c8:	0785                	addi	a5,a5,1
 3ca:	fff7c703          	lbu	a4,-1(a5)
 3ce:	fb7d                	bnez	a4,3c4 <strlen+0x14>
    ;
  return n;
}
 3d0:	6422                	ld	s0,8(sp)
 3d2:	0141                	addi	sp,sp,16
 3d4:	8082                	ret
  for(n = 0; s[n]; n++)
 3d6:	4501                	li	a0,0
 3d8:	bfe5                	j	3d0 <strlen+0x20>

00000000000003da <memset>:

void*
memset(void *dst, int c, uint n)
{
 3da:	1141                	addi	sp,sp,-16
 3dc:	e422                	sd	s0,8(sp)
 3de:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 3e0:	ca19                	beqz	a2,3f6 <memset+0x1c>
 3e2:	87aa                	mv	a5,a0
 3e4:	1602                	slli	a2,a2,0x20
 3e6:	9201                	srli	a2,a2,0x20
 3e8:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 3ec:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 3f0:	0785                	addi	a5,a5,1
 3f2:	fee79de3          	bne	a5,a4,3ec <memset+0x12>
  }
  return dst;
}
 3f6:	6422                	ld	s0,8(sp)
 3f8:	0141                	addi	sp,sp,16
 3fa:	8082                	ret

00000000000003fc <strchr>:

char*
strchr(const char *s, char c)
{
 3fc:	1141                	addi	sp,sp,-16
 3fe:	e422                	sd	s0,8(sp)
 400:	0800                	addi	s0,sp,16
  for(; *s; s++)
 402:	00054783          	lbu	a5,0(a0)
 406:	cb99                	beqz	a5,41c <strchr+0x20>
    if(*s == c)
 408:	00f58763          	beq	a1,a5,416 <strchr+0x1a>
  for(; *s; s++)
 40c:	0505                	addi	a0,a0,1
 40e:	00054783          	lbu	a5,0(a0)
 412:	fbfd                	bnez	a5,408 <strchr+0xc>
      return (char*)s;
  return 0;
 414:	4501                	li	a0,0
}
 416:	6422                	ld	s0,8(sp)
 418:	0141                	addi	sp,sp,16
 41a:	8082                	ret
  return 0;
 41c:	4501                	li	a0,0
 41e:	bfe5                	j	416 <strchr+0x1a>

0000000000000420 <gets>:

char*
gets(char *buf, int max)
{
 420:	711d                	addi	sp,sp,-96
 422:	ec86                	sd	ra,88(sp)
 424:	e8a2                	sd	s0,80(sp)
 426:	e4a6                	sd	s1,72(sp)
 428:	e0ca                	sd	s2,64(sp)
 42a:	fc4e                	sd	s3,56(sp)
 42c:	f852                	sd	s4,48(sp)
 42e:	f456                	sd	s5,40(sp)
 430:	f05a                	sd	s6,32(sp)
 432:	ec5e                	sd	s7,24(sp)
 434:	1080                	addi	s0,sp,96
 436:	8baa                	mv	s7,a0
 438:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 43a:	892a                	mv	s2,a0
 43c:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 43e:	4aa9                	li	s5,10
 440:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 442:	89a6                	mv	s3,s1
 444:	2485                	addiw	s1,s1,1
 446:	0344d863          	bge	s1,s4,476 <gets+0x56>
    cc = read(0, &c, 1);
 44a:	4605                	li	a2,1
 44c:	faf40593          	addi	a1,s0,-81
 450:	4501                	li	a0,0
 452:	00000097          	auipc	ra,0x0
 456:	19c080e7          	jalr	412(ra) # 5ee <read>
    if(cc < 1)
 45a:	00a05e63          	blez	a0,476 <gets+0x56>
    buf[i++] = c;
 45e:	faf44783          	lbu	a5,-81(s0)
 462:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 466:	01578763          	beq	a5,s5,474 <gets+0x54>
 46a:	0905                	addi	s2,s2,1
 46c:	fd679be3          	bne	a5,s6,442 <gets+0x22>
  for(i=0; i+1 < max; ){
 470:	89a6                	mv	s3,s1
 472:	a011                	j	476 <gets+0x56>
 474:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 476:	99de                	add	s3,s3,s7
 478:	00098023          	sb	zero,0(s3)
  return buf;
}
 47c:	855e                	mv	a0,s7
 47e:	60e6                	ld	ra,88(sp)
 480:	6446                	ld	s0,80(sp)
 482:	64a6                	ld	s1,72(sp)
 484:	6906                	ld	s2,64(sp)
 486:	79e2                	ld	s3,56(sp)
 488:	7a42                	ld	s4,48(sp)
 48a:	7aa2                	ld	s5,40(sp)
 48c:	7b02                	ld	s6,32(sp)
 48e:	6be2                	ld	s7,24(sp)
 490:	6125                	addi	sp,sp,96
 492:	8082                	ret

0000000000000494 <stat>:

int
stat(const char *n, struct stat *st)
{
 494:	1101                	addi	sp,sp,-32
 496:	ec06                	sd	ra,24(sp)
 498:	e822                	sd	s0,16(sp)
 49a:	e426                	sd	s1,8(sp)
 49c:	e04a                	sd	s2,0(sp)
 49e:	1000                	addi	s0,sp,32
 4a0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a2:	4581                	li	a1,0
 4a4:	00000097          	auipc	ra,0x0
 4a8:	172080e7          	jalr	370(ra) # 616 <open>
  if(fd < 0)
 4ac:	02054563          	bltz	a0,4d6 <stat+0x42>
 4b0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 4b2:	85ca                	mv	a1,s2
 4b4:	00000097          	auipc	ra,0x0
 4b8:	17a080e7          	jalr	378(ra) # 62e <fstat>
 4bc:	892a                	mv	s2,a0
  close(fd);
 4be:	8526                	mv	a0,s1
 4c0:	00000097          	auipc	ra,0x0
 4c4:	13e080e7          	jalr	318(ra) # 5fe <close>
  return r;
}
 4c8:	854a                	mv	a0,s2
 4ca:	60e2                	ld	ra,24(sp)
 4cc:	6442                	ld	s0,16(sp)
 4ce:	64a2                	ld	s1,8(sp)
 4d0:	6902                	ld	s2,0(sp)
 4d2:	6105                	addi	sp,sp,32
 4d4:	8082                	ret
    return -1;
 4d6:	597d                	li	s2,-1
 4d8:	bfc5                	j	4c8 <stat+0x34>

00000000000004da <atoi>:

int
atoi(const char *s)
{
 4da:	1141                	addi	sp,sp,-16
 4dc:	e422                	sd	s0,8(sp)
 4de:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4e0:	00054603          	lbu	a2,0(a0)
 4e4:	fd06079b          	addiw	a5,a2,-48
 4e8:	0ff7f793          	andi	a5,a5,255
 4ec:	4725                	li	a4,9
 4ee:	02f76963          	bltu	a4,a5,520 <atoi+0x46>
 4f2:	86aa                	mv	a3,a0
  n = 0;
 4f4:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 4f6:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 4f8:	0685                	addi	a3,a3,1
 4fa:	0025179b          	slliw	a5,a0,0x2
 4fe:	9fa9                	addw	a5,a5,a0
 500:	0017979b          	slliw	a5,a5,0x1
 504:	9fb1                	addw	a5,a5,a2
 506:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 50a:	0006c603          	lbu	a2,0(a3)
 50e:	fd06071b          	addiw	a4,a2,-48
 512:	0ff77713          	andi	a4,a4,255
 516:	fee5f1e3          	bgeu	a1,a4,4f8 <atoi+0x1e>
  return n;
}
 51a:	6422                	ld	s0,8(sp)
 51c:	0141                	addi	sp,sp,16
 51e:	8082                	ret
  n = 0;
 520:	4501                	li	a0,0
 522:	bfe5                	j	51a <atoi+0x40>

0000000000000524 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 524:	1141                	addi	sp,sp,-16
 526:	e422                	sd	s0,8(sp)
 528:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 52a:	02b57463          	bgeu	a0,a1,552 <memmove+0x2e>
    while(n-- > 0)
 52e:	00c05f63          	blez	a2,54c <memmove+0x28>
 532:	1602                	slli	a2,a2,0x20
 534:	9201                	srli	a2,a2,0x20
 536:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 53a:	872a                	mv	a4,a0
      *dst++ = *src++;
 53c:	0585                	addi	a1,a1,1
 53e:	0705                	addi	a4,a4,1
 540:	fff5c683          	lbu	a3,-1(a1)
 544:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 548:	fee79ae3          	bne	a5,a4,53c <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 54c:	6422                	ld	s0,8(sp)
 54e:	0141                	addi	sp,sp,16
 550:	8082                	ret
    dst += n;
 552:	00c50733          	add	a4,a0,a2
    src += n;
 556:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 558:	fec05ae3          	blez	a2,54c <memmove+0x28>
 55c:	fff6079b          	addiw	a5,a2,-1
 560:	1782                	slli	a5,a5,0x20
 562:	9381                	srli	a5,a5,0x20
 564:	fff7c793          	not	a5,a5
 568:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 56a:	15fd                	addi	a1,a1,-1
 56c:	177d                	addi	a4,a4,-1
 56e:	0005c683          	lbu	a3,0(a1)
 572:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 576:	fee79ae3          	bne	a5,a4,56a <memmove+0x46>
 57a:	bfc9                	j	54c <memmove+0x28>

000000000000057c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 57c:	1141                	addi	sp,sp,-16
 57e:	e422                	sd	s0,8(sp)
 580:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 582:	ca05                	beqz	a2,5b2 <memcmp+0x36>
 584:	fff6069b          	addiw	a3,a2,-1
 588:	1682                	slli	a3,a3,0x20
 58a:	9281                	srli	a3,a3,0x20
 58c:	0685                	addi	a3,a3,1
 58e:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 590:	00054783          	lbu	a5,0(a0)
 594:	0005c703          	lbu	a4,0(a1)
 598:	00e79863          	bne	a5,a4,5a8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 59c:	0505                	addi	a0,a0,1
    p2++;
 59e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 5a0:	fed518e3          	bne	a0,a3,590 <memcmp+0x14>
  }
  return 0;
 5a4:	4501                	li	a0,0
 5a6:	a019                	j	5ac <memcmp+0x30>
      return *p1 - *p2;
 5a8:	40e7853b          	subw	a0,a5,a4
}
 5ac:	6422                	ld	s0,8(sp)
 5ae:	0141                	addi	sp,sp,16
 5b0:	8082                	ret
  return 0;
 5b2:	4501                	li	a0,0
 5b4:	bfe5                	j	5ac <memcmp+0x30>

00000000000005b6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 5b6:	1141                	addi	sp,sp,-16
 5b8:	e406                	sd	ra,8(sp)
 5ba:	e022                	sd	s0,0(sp)
 5bc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 5be:	00000097          	auipc	ra,0x0
 5c2:	f66080e7          	jalr	-154(ra) # 524 <memmove>
}
 5c6:	60a2                	ld	ra,8(sp)
 5c8:	6402                	ld	s0,0(sp)
 5ca:	0141                	addi	sp,sp,16
 5cc:	8082                	ret

00000000000005ce <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 5ce:	4885                	li	a7,1
 ecall
 5d0:	00000073          	ecall
 ret
 5d4:	8082                	ret

00000000000005d6 <exit>:
.global exit
exit:
 li a7, SYS_exit
 5d6:	4889                	li	a7,2
 ecall
 5d8:	00000073          	ecall
 ret
 5dc:	8082                	ret

00000000000005de <wait>:
.global wait
wait:
 li a7, SYS_wait
 5de:	488d                	li	a7,3
 ecall
 5e0:	00000073          	ecall
 ret
 5e4:	8082                	ret

00000000000005e6 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 5e6:	4891                	li	a7,4
 ecall
 5e8:	00000073          	ecall
 ret
 5ec:	8082                	ret

00000000000005ee <read>:
.global read
read:
 li a7, SYS_read
 5ee:	4895                	li	a7,5
 ecall
 5f0:	00000073          	ecall
 ret
 5f4:	8082                	ret

00000000000005f6 <write>:
.global write
write:
 li a7, SYS_write
 5f6:	48c1                	li	a7,16
 ecall
 5f8:	00000073          	ecall
 ret
 5fc:	8082                	ret

00000000000005fe <close>:
.global close
close:
 li a7, SYS_close
 5fe:	48d5                	li	a7,21
 ecall
 600:	00000073          	ecall
 ret
 604:	8082                	ret

0000000000000606 <kill>:
.global kill
kill:
 li a7, SYS_kill
 606:	4899                	li	a7,6
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <exec>:
.global exec
exec:
 li a7, SYS_exec
 60e:	489d                	li	a7,7
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <open>:
.global open
open:
 li a7, SYS_open
 616:	48bd                	li	a7,15
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 61e:	48c5                	li	a7,17
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 626:	48c9                	li	a7,18
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 62e:	48a1                	li	a7,8
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <link>:
.global link
link:
 li a7, SYS_link
 636:	48cd                	li	a7,19
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 63e:	48d1                	li	a7,20
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 646:	48a5                	li	a7,9
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <dup>:
.global dup
dup:
 li a7, SYS_dup
 64e:	48a9                	li	a7,10
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 656:	48ad                	li	a7,11
 ecall
 658:	00000073          	ecall
 ret
 65c:	8082                	ret

000000000000065e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 65e:	48b1                	li	a7,12
 ecall
 660:	00000073          	ecall
 ret
 664:	8082                	ret

0000000000000666 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 666:	48b5                	li	a7,13
 ecall
 668:	00000073          	ecall
 ret
 66c:	8082                	ret

000000000000066e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 66e:	48b9                	li	a7,14
 ecall
 670:	00000073          	ecall
 ret
 674:	8082                	ret

0000000000000676 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
 676:	48d9                	li	a7,22
 ecall
 678:	00000073          	ecall
 ret
 67c:	8082                	ret

000000000000067e <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
 67e:	48dd                	li	a7,23
 ecall
 680:	00000073          	ecall
 ret
 684:	8082                	ret

0000000000000686 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
 686:	48e1                	li	a7,24
 ecall
 688:	00000073          	ecall
 ret
 68c:	8082                	ret

000000000000068e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 68e:	1101                	addi	sp,sp,-32
 690:	ec06                	sd	ra,24(sp)
 692:	e822                	sd	s0,16(sp)
 694:	1000                	addi	s0,sp,32
 696:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 69a:	4605                	li	a2,1
 69c:	fef40593          	addi	a1,s0,-17
 6a0:	00000097          	auipc	ra,0x0
 6a4:	f56080e7          	jalr	-170(ra) # 5f6 <write>
}
 6a8:	60e2                	ld	ra,24(sp)
 6aa:	6442                	ld	s0,16(sp)
 6ac:	6105                	addi	sp,sp,32
 6ae:	8082                	ret

00000000000006b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b0:	7139                	addi	sp,sp,-64
 6b2:	fc06                	sd	ra,56(sp)
 6b4:	f822                	sd	s0,48(sp)
 6b6:	f426                	sd	s1,40(sp)
 6b8:	f04a                	sd	s2,32(sp)
 6ba:	ec4e                	sd	s3,24(sp)
 6bc:	0080                	addi	s0,sp,64
 6be:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c0:	c299                	beqz	a3,6c6 <printint+0x16>
 6c2:	0805c863          	bltz	a1,752 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6c6:	2581                	sext.w	a1,a1
  neg = 0;
 6c8:	4881                	li	a7,0
 6ca:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 6ce:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 6d0:	2601                	sext.w	a2,a2
 6d2:	00001517          	auipc	a0,0x1
 6d6:	9de50513          	addi	a0,a0,-1570 # 10b0 <digits>
 6da:	883a                	mv	a6,a4
 6dc:	2705                	addiw	a4,a4,1
 6de:	02c5f7bb          	remuw	a5,a1,a2
 6e2:	1782                	slli	a5,a5,0x20
 6e4:	9381                	srli	a5,a5,0x20
 6e6:	97aa                	add	a5,a5,a0
 6e8:	0007c783          	lbu	a5,0(a5)
 6ec:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 6f0:	0005879b          	sext.w	a5,a1
 6f4:	02c5d5bb          	divuw	a1,a1,a2
 6f8:	0685                	addi	a3,a3,1
 6fa:	fec7f0e3          	bgeu	a5,a2,6da <printint+0x2a>
  if(neg)
 6fe:	00088b63          	beqz	a7,714 <printint+0x64>
    buf[i++] = '-';
 702:	fd040793          	addi	a5,s0,-48
 706:	973e                	add	a4,a4,a5
 708:	02d00793          	li	a5,45
 70c:	fef70823          	sb	a5,-16(a4)
 710:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 714:	02e05863          	blez	a4,744 <printint+0x94>
 718:	fc040793          	addi	a5,s0,-64
 71c:	00e78933          	add	s2,a5,a4
 720:	fff78993          	addi	s3,a5,-1
 724:	99ba                	add	s3,s3,a4
 726:	377d                	addiw	a4,a4,-1
 728:	1702                	slli	a4,a4,0x20
 72a:	9301                	srli	a4,a4,0x20
 72c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 730:	fff94583          	lbu	a1,-1(s2)
 734:	8526                	mv	a0,s1
 736:	00000097          	auipc	ra,0x0
 73a:	f58080e7          	jalr	-168(ra) # 68e <putc>
  while(--i >= 0)
 73e:	197d                	addi	s2,s2,-1
 740:	ff3918e3          	bne	s2,s3,730 <printint+0x80>
}
 744:	70e2                	ld	ra,56(sp)
 746:	7442                	ld	s0,48(sp)
 748:	74a2                	ld	s1,40(sp)
 74a:	7902                	ld	s2,32(sp)
 74c:	69e2                	ld	s3,24(sp)
 74e:	6121                	addi	sp,sp,64
 750:	8082                	ret
    x = -xx;
 752:	40b005bb          	negw	a1,a1
    neg = 1;
 756:	4885                	li	a7,1
    x = -xx;
 758:	bf8d                	j	6ca <printint+0x1a>

000000000000075a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 75a:	7119                	addi	sp,sp,-128
 75c:	fc86                	sd	ra,120(sp)
 75e:	f8a2                	sd	s0,112(sp)
 760:	f4a6                	sd	s1,104(sp)
 762:	f0ca                	sd	s2,96(sp)
 764:	ecce                	sd	s3,88(sp)
 766:	e8d2                	sd	s4,80(sp)
 768:	e4d6                	sd	s5,72(sp)
 76a:	e0da                	sd	s6,64(sp)
 76c:	fc5e                	sd	s7,56(sp)
 76e:	f862                	sd	s8,48(sp)
 770:	f466                	sd	s9,40(sp)
 772:	f06a                	sd	s10,32(sp)
 774:	ec6e                	sd	s11,24(sp)
 776:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 778:	0005c903          	lbu	s2,0(a1)
 77c:	18090f63          	beqz	s2,91a <vprintf+0x1c0>
 780:	8aaa                	mv	s5,a0
 782:	8b32                	mv	s6,a2
 784:	00158493          	addi	s1,a1,1
  state = 0;
 788:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 78a:	02500a13          	li	s4,37
      if(c == 'd'){
 78e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 792:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 796:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 79a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 79e:	00001b97          	auipc	s7,0x1
 7a2:	912b8b93          	addi	s7,s7,-1774 # 10b0 <digits>
 7a6:	a839                	j	7c4 <vprintf+0x6a>
        putc(fd, c);
 7a8:	85ca                	mv	a1,s2
 7aa:	8556                	mv	a0,s5
 7ac:	00000097          	auipc	ra,0x0
 7b0:	ee2080e7          	jalr	-286(ra) # 68e <putc>
 7b4:	a019                	j	7ba <vprintf+0x60>
    } else if(state == '%'){
 7b6:	01498f63          	beq	s3,s4,7d4 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 7ba:	0485                	addi	s1,s1,1
 7bc:	fff4c903          	lbu	s2,-1(s1)
 7c0:	14090d63          	beqz	s2,91a <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 7c4:	0009079b          	sext.w	a5,s2
    if(state == 0){
 7c8:	fe0997e3          	bnez	s3,7b6 <vprintf+0x5c>
      if(c == '%'){
 7cc:	fd479ee3          	bne	a5,s4,7a8 <vprintf+0x4e>
        state = '%';
 7d0:	89be                	mv	s3,a5
 7d2:	b7e5                	j	7ba <vprintf+0x60>
      if(c == 'd'){
 7d4:	05878063          	beq	a5,s8,814 <vprintf+0xba>
      } else if(c == 'l') {
 7d8:	05978c63          	beq	a5,s9,830 <vprintf+0xd6>
      } else if(c == 'x') {
 7dc:	07a78863          	beq	a5,s10,84c <vprintf+0xf2>
      } else if(c == 'p') {
 7e0:	09b78463          	beq	a5,s11,868 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 7e4:	07300713          	li	a4,115
 7e8:	0ce78663          	beq	a5,a4,8b4 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ec:	06300713          	li	a4,99
 7f0:	0ee78e63          	beq	a5,a4,8ec <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 7f4:	11478863          	beq	a5,s4,904 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7f8:	85d2                	mv	a1,s4
 7fa:	8556                	mv	a0,s5
 7fc:	00000097          	auipc	ra,0x0
 800:	e92080e7          	jalr	-366(ra) # 68e <putc>
        putc(fd, c);
 804:	85ca                	mv	a1,s2
 806:	8556                	mv	a0,s5
 808:	00000097          	auipc	ra,0x0
 80c:	e86080e7          	jalr	-378(ra) # 68e <putc>
      }
      state = 0;
 810:	4981                	li	s3,0
 812:	b765                	j	7ba <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 814:	008b0913          	addi	s2,s6,8
 818:	4685                	li	a3,1
 81a:	4629                	li	a2,10
 81c:	000b2583          	lw	a1,0(s6)
 820:	8556                	mv	a0,s5
 822:	00000097          	auipc	ra,0x0
 826:	e8e080e7          	jalr	-370(ra) # 6b0 <printint>
 82a:	8b4a                	mv	s6,s2
      state = 0;
 82c:	4981                	li	s3,0
 82e:	b771                	j	7ba <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 830:	008b0913          	addi	s2,s6,8
 834:	4681                	li	a3,0
 836:	4629                	li	a2,10
 838:	000b2583          	lw	a1,0(s6)
 83c:	8556                	mv	a0,s5
 83e:	00000097          	auipc	ra,0x0
 842:	e72080e7          	jalr	-398(ra) # 6b0 <printint>
 846:	8b4a                	mv	s6,s2
      state = 0;
 848:	4981                	li	s3,0
 84a:	bf85                	j	7ba <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 84c:	008b0913          	addi	s2,s6,8
 850:	4681                	li	a3,0
 852:	4641                	li	a2,16
 854:	000b2583          	lw	a1,0(s6)
 858:	8556                	mv	a0,s5
 85a:	00000097          	auipc	ra,0x0
 85e:	e56080e7          	jalr	-426(ra) # 6b0 <printint>
 862:	8b4a                	mv	s6,s2
      state = 0;
 864:	4981                	li	s3,0
 866:	bf91                	j	7ba <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 868:	008b0793          	addi	a5,s6,8
 86c:	f8f43423          	sd	a5,-120(s0)
 870:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 874:	03000593          	li	a1,48
 878:	8556                	mv	a0,s5
 87a:	00000097          	auipc	ra,0x0
 87e:	e14080e7          	jalr	-492(ra) # 68e <putc>
  putc(fd, 'x');
 882:	85ea                	mv	a1,s10
 884:	8556                	mv	a0,s5
 886:	00000097          	auipc	ra,0x0
 88a:	e08080e7          	jalr	-504(ra) # 68e <putc>
 88e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 890:	03c9d793          	srli	a5,s3,0x3c
 894:	97de                	add	a5,a5,s7
 896:	0007c583          	lbu	a1,0(a5)
 89a:	8556                	mv	a0,s5
 89c:	00000097          	auipc	ra,0x0
 8a0:	df2080e7          	jalr	-526(ra) # 68e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 8a4:	0992                	slli	s3,s3,0x4
 8a6:	397d                	addiw	s2,s2,-1
 8a8:	fe0914e3          	bnez	s2,890 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 8ac:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 8b0:	4981                	li	s3,0
 8b2:	b721                	j	7ba <vprintf+0x60>
        s = va_arg(ap, char*);
 8b4:	008b0993          	addi	s3,s6,8
 8b8:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 8bc:	02090163          	beqz	s2,8de <vprintf+0x184>
        while(*s != 0){
 8c0:	00094583          	lbu	a1,0(s2)
 8c4:	c9a1                	beqz	a1,914 <vprintf+0x1ba>
          putc(fd, *s);
 8c6:	8556                	mv	a0,s5
 8c8:	00000097          	auipc	ra,0x0
 8cc:	dc6080e7          	jalr	-570(ra) # 68e <putc>
          s++;
 8d0:	0905                	addi	s2,s2,1
        while(*s != 0){
 8d2:	00094583          	lbu	a1,0(s2)
 8d6:	f9e5                	bnez	a1,8c6 <vprintf+0x16c>
        s = va_arg(ap, char*);
 8d8:	8b4e                	mv	s6,s3
      state = 0;
 8da:	4981                	li	s3,0
 8dc:	bdf9                	j	7ba <vprintf+0x60>
          s = "(null)";
 8de:	00000917          	auipc	s2,0x0
 8e2:	7ca90913          	addi	s2,s2,1994 # 10a8 <thread_start_threading+0x11c>
        while(*s != 0){
 8e6:	02800593          	li	a1,40
 8ea:	bff1                	j	8c6 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 8ec:	008b0913          	addi	s2,s6,8
 8f0:	000b4583          	lbu	a1,0(s6)
 8f4:	8556                	mv	a0,s5
 8f6:	00000097          	auipc	ra,0x0
 8fa:	d98080e7          	jalr	-616(ra) # 68e <putc>
 8fe:	8b4a                	mv	s6,s2
      state = 0;
 900:	4981                	li	s3,0
 902:	bd65                	j	7ba <vprintf+0x60>
        putc(fd, c);
 904:	85d2                	mv	a1,s4
 906:	8556                	mv	a0,s5
 908:	00000097          	auipc	ra,0x0
 90c:	d86080e7          	jalr	-634(ra) # 68e <putc>
      state = 0;
 910:	4981                	li	s3,0
 912:	b565                	j	7ba <vprintf+0x60>
        s = va_arg(ap, char*);
 914:	8b4e                	mv	s6,s3
      state = 0;
 916:	4981                	li	s3,0
 918:	b54d                	j	7ba <vprintf+0x60>
    }
  }
}
 91a:	70e6                	ld	ra,120(sp)
 91c:	7446                	ld	s0,112(sp)
 91e:	74a6                	ld	s1,104(sp)
 920:	7906                	ld	s2,96(sp)
 922:	69e6                	ld	s3,88(sp)
 924:	6a46                	ld	s4,80(sp)
 926:	6aa6                	ld	s5,72(sp)
 928:	6b06                	ld	s6,64(sp)
 92a:	7be2                	ld	s7,56(sp)
 92c:	7c42                	ld	s8,48(sp)
 92e:	7ca2                	ld	s9,40(sp)
 930:	7d02                	ld	s10,32(sp)
 932:	6de2                	ld	s11,24(sp)
 934:	6109                	addi	sp,sp,128
 936:	8082                	ret

0000000000000938 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 938:	715d                	addi	sp,sp,-80
 93a:	ec06                	sd	ra,24(sp)
 93c:	e822                	sd	s0,16(sp)
 93e:	1000                	addi	s0,sp,32
 940:	e010                	sd	a2,0(s0)
 942:	e414                	sd	a3,8(s0)
 944:	e818                	sd	a4,16(s0)
 946:	ec1c                	sd	a5,24(s0)
 948:	03043023          	sd	a6,32(s0)
 94c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 950:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 954:	8622                	mv	a2,s0
 956:	00000097          	auipc	ra,0x0
 95a:	e04080e7          	jalr	-508(ra) # 75a <vprintf>
}
 95e:	60e2                	ld	ra,24(sp)
 960:	6442                	ld	s0,16(sp)
 962:	6161                	addi	sp,sp,80
 964:	8082                	ret

0000000000000966 <printf>:

void
printf(const char *fmt, ...)
{
 966:	711d                	addi	sp,sp,-96
 968:	ec06                	sd	ra,24(sp)
 96a:	e822                	sd	s0,16(sp)
 96c:	1000                	addi	s0,sp,32
 96e:	e40c                	sd	a1,8(s0)
 970:	e810                	sd	a2,16(s0)
 972:	ec14                	sd	a3,24(s0)
 974:	f018                	sd	a4,32(s0)
 976:	f41c                	sd	a5,40(s0)
 978:	03043823          	sd	a6,48(s0)
 97c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 980:	00840613          	addi	a2,s0,8
 984:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 988:	85aa                	mv	a1,a0
 98a:	4505                	li	a0,1
 98c:	00000097          	auipc	ra,0x0
 990:	dce080e7          	jalr	-562(ra) # 75a <vprintf>
}
 994:	60e2                	ld	ra,24(sp)
 996:	6442                	ld	s0,16(sp)
 998:	6125                	addi	sp,sp,96
 99a:	8082                	ret

000000000000099c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 99c:	1141                	addi	sp,sp,-16
 99e:	e422                	sd	s0,8(sp)
 9a0:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9a2:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a6:	00000797          	auipc	a5,0x0
 9aa:	7927b783          	ld	a5,1938(a5) # 1138 <freep>
 9ae:	a805                	j	9de <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9b0:	4618                	lw	a4,8(a2)
 9b2:	9db9                	addw	a1,a1,a4
 9b4:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b8:	6398                	ld	a4,0(a5)
 9ba:	6318                	ld	a4,0(a4)
 9bc:	fee53823          	sd	a4,-16(a0)
 9c0:	a091                	j	a04 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9c2:	ff852703          	lw	a4,-8(a0)
 9c6:	9e39                	addw	a2,a2,a4
 9c8:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 9ca:	ff053703          	ld	a4,-16(a0)
 9ce:	e398                	sd	a4,0(a5)
 9d0:	a099                	j	a16 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d2:	6398                	ld	a4,0(a5)
 9d4:	00e7e463          	bltu	a5,a4,9dc <free+0x40>
 9d8:	00e6ea63          	bltu	a3,a4,9ec <free+0x50>
{
 9dc:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9de:	fed7fae3          	bgeu	a5,a3,9d2 <free+0x36>
 9e2:	6398                	ld	a4,0(a5)
 9e4:	00e6e463          	bltu	a3,a4,9ec <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e8:	fee7eae3          	bltu	a5,a4,9dc <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 9ec:	ff852583          	lw	a1,-8(a0)
 9f0:	6390                	ld	a2,0(a5)
 9f2:	02059713          	slli	a4,a1,0x20
 9f6:	9301                	srli	a4,a4,0x20
 9f8:	0712                	slli	a4,a4,0x4
 9fa:	9736                	add	a4,a4,a3
 9fc:	fae60ae3          	beq	a2,a4,9b0 <free+0x14>
    bp->s.ptr = p->s.ptr;
 a00:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 a04:	4790                	lw	a2,8(a5)
 a06:	02061713          	slli	a4,a2,0x20
 a0a:	9301                	srli	a4,a4,0x20
 a0c:	0712                	slli	a4,a4,0x4
 a0e:	973e                	add	a4,a4,a5
 a10:	fae689e3          	beq	a3,a4,9c2 <free+0x26>
  } else
    p->s.ptr = bp;
 a14:	e394                	sd	a3,0(a5)
  freep = p;
 a16:	00000717          	auipc	a4,0x0
 a1a:	72f73123          	sd	a5,1826(a4) # 1138 <freep>
}
 a1e:	6422                	ld	s0,8(sp)
 a20:	0141                	addi	sp,sp,16
 a22:	8082                	ret

0000000000000a24 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a24:	7139                	addi	sp,sp,-64
 a26:	fc06                	sd	ra,56(sp)
 a28:	f822                	sd	s0,48(sp)
 a2a:	f426                	sd	s1,40(sp)
 a2c:	f04a                	sd	s2,32(sp)
 a2e:	ec4e                	sd	s3,24(sp)
 a30:	e852                	sd	s4,16(sp)
 a32:	e456                	sd	s5,8(sp)
 a34:	e05a                	sd	s6,0(sp)
 a36:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a38:	02051493          	slli	s1,a0,0x20
 a3c:	9081                	srli	s1,s1,0x20
 a3e:	04bd                	addi	s1,s1,15
 a40:	8091                	srli	s1,s1,0x4
 a42:	0014899b          	addiw	s3,s1,1
 a46:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a48:	00000517          	auipc	a0,0x0
 a4c:	6f053503          	ld	a0,1776(a0) # 1138 <freep>
 a50:	c515                	beqz	a0,a7c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a52:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a54:	4798                	lw	a4,8(a5)
 a56:	02977f63          	bgeu	a4,s1,a94 <malloc+0x70>
 a5a:	8a4e                	mv	s4,s3
 a5c:	0009871b          	sext.w	a4,s3
 a60:	6685                	lui	a3,0x1
 a62:	00d77363          	bgeu	a4,a3,a68 <malloc+0x44>
 a66:	6a05                	lui	s4,0x1
 a68:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a6c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a70:	00000917          	auipc	s2,0x0
 a74:	6c890913          	addi	s2,s2,1736 # 1138 <freep>
  if(p == (char*)-1)
 a78:	5afd                	li	s5,-1
 a7a:	a88d                	j	aec <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a7c:	00000797          	auipc	a5,0x0
 a80:	6d478793          	addi	a5,a5,1748 # 1150 <base>
 a84:	00000717          	auipc	a4,0x0
 a88:	6af73a23          	sd	a5,1716(a4) # 1138 <freep>
 a8c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a8e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a92:	b7e1                	j	a5a <malloc+0x36>
      if(p->s.size == nunits)
 a94:	02e48b63          	beq	s1,a4,aca <malloc+0xa6>
        p->s.size -= nunits;
 a98:	4137073b          	subw	a4,a4,s3
 a9c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a9e:	1702                	slli	a4,a4,0x20
 aa0:	9301                	srli	a4,a4,0x20
 aa2:	0712                	slli	a4,a4,0x4
 aa4:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 aa6:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 aaa:	00000717          	auipc	a4,0x0
 aae:	68a73723          	sd	a0,1678(a4) # 1138 <freep>
      return (void*)(p + 1);
 ab2:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ab6:	70e2                	ld	ra,56(sp)
 ab8:	7442                	ld	s0,48(sp)
 aba:	74a2                	ld	s1,40(sp)
 abc:	7902                	ld	s2,32(sp)
 abe:	69e2                	ld	s3,24(sp)
 ac0:	6a42                	ld	s4,16(sp)
 ac2:	6aa2                	ld	s5,8(sp)
 ac4:	6b02                	ld	s6,0(sp)
 ac6:	6121                	addi	sp,sp,64
 ac8:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 aca:	6398                	ld	a4,0(a5)
 acc:	e118                	sd	a4,0(a0)
 ace:	bff1                	j	aaa <malloc+0x86>
  hp->s.size = nu;
 ad0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 ad4:	0541                	addi	a0,a0,16
 ad6:	00000097          	auipc	ra,0x0
 ada:	ec6080e7          	jalr	-314(ra) # 99c <free>
  return freep;
 ade:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 ae2:	d971                	beqz	a0,ab6 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 ae6:	4798                	lw	a4,8(a5)
 ae8:	fa9776e3          	bgeu	a4,s1,a94 <malloc+0x70>
    if(p == freep)
 aec:	00093703          	ld	a4,0(s2)
 af0:	853e                	mv	a0,a5
 af2:	fef719e3          	bne	a4,a5,ae4 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 af6:	8552                	mv	a0,s4
 af8:	00000097          	auipc	ra,0x0
 afc:	b66080e7          	jalr	-1178(ra) # 65e <sbrk>
  if(p == (char*)-1)
 b00:	fd5518e3          	bne	a0,s5,ad0 <malloc+0xac>
        return 0;
 b04:	4501                	li	a0,0
 b06:	bf45                	j	ab6 <malloc+0x92>

0000000000000b08 <setjmp>:
 b08:	e100                	sd	s0,0(a0)
 b0a:	e504                	sd	s1,8(a0)
 b0c:	01253823          	sd	s2,16(a0)
 b10:	01353c23          	sd	s3,24(a0)
 b14:	03453023          	sd	s4,32(a0)
 b18:	03553423          	sd	s5,40(a0)
 b1c:	03653823          	sd	s6,48(a0)
 b20:	03753c23          	sd	s7,56(a0)
 b24:	05853023          	sd	s8,64(a0)
 b28:	05953423          	sd	s9,72(a0)
 b2c:	05a53823          	sd	s10,80(a0)
 b30:	05b53c23          	sd	s11,88(a0)
 b34:	06153023          	sd	ra,96(a0)
 b38:	06253423          	sd	sp,104(a0)
 b3c:	4501                	li	a0,0
 b3e:	8082                	ret

0000000000000b40 <longjmp>:
 b40:	6100                	ld	s0,0(a0)
 b42:	6504                	ld	s1,8(a0)
 b44:	01053903          	ld	s2,16(a0)
 b48:	01853983          	ld	s3,24(a0)
 b4c:	02053a03          	ld	s4,32(a0)
 b50:	02853a83          	ld	s5,40(a0)
 b54:	03053b03          	ld	s6,48(a0)
 b58:	03853b83          	ld	s7,56(a0)
 b5c:	04053c03          	ld	s8,64(a0)
 b60:	04853c83          	ld	s9,72(a0)
 b64:	05053d03          	ld	s10,80(a0)
 b68:	05853d83          	ld	s11,88(a0)
 b6c:	06053083          	ld	ra,96(a0)
 b70:	06853103          	ld	sp,104(a0)
 b74:	c199                	beqz	a1,b7a <longjmp_1>
 b76:	852e                	mv	a0,a1
 b78:	8082                	ret

0000000000000b7a <longjmp_1>:
 b7a:	4505                	li	a0,1
 b7c:	8082                	ret

0000000000000b7e <thread_create>:
static int __time_slot_size = 10;
static int is_thread_start = 0;
static jmp_buf env_st;
// static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg, int execution_time_slot){
 b7e:	7179                	addi	sp,sp,-48
 b80:	f406                	sd	ra,40(sp)
 b82:	f022                	sd	s0,32(sp)
 b84:	ec26                	sd	s1,24(sp)
 b86:	e84a                	sd	s2,16(sp)
 b88:	e44e                	sd	s3,8(sp)
 b8a:	e052                	sd	s4,0(sp)
 b8c:	1800                	addi	s0,sp,48
 b8e:	8a2a                	mv	s4,a0
 b90:	89ae                	mv	s3,a1
 b92:	8932                	mv	s2,a2
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
 b94:	0c800513          	li	a0,200
 b98:	00000097          	auipc	ra,0x0
 b9c:	e8c080e7          	jalr	-372(ra) # a24 <malloc>
 ba0:	84aa                	mv	s1,a0
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
 ba2:	6505                	lui	a0,0x1
 ba4:	80050513          	addi	a0,a0,-2048 # 800 <vprintf+0xa6>
 ba8:	00000097          	auipc	ra,0x0
 bac:	e7c080e7          	jalr	-388(ra) # a24 <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
 bb0:	0144b023          	sd	s4,0(s1)
    t->arg = arg;
 bb4:	0134b423          	sd	s3,8(s1)
    t->ID  = -1;
 bb8:	57fd                	li	a5,-1
 bba:	08f4a823          	sw	a5,144(s1)
    t->buf_set = 0;
 bbe:	0804ae23          	sw	zero,156(s1)
    t->stack = (void*) new_stack;
 bc2:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
 bc4:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
 bc8:	ec88                	sd	a0,24(s1)

    if( is_thread_start == 0 )
 bca:	00000797          	auipc	a5,0x0
 bce:	5767a783          	lw	a5,1398(a5) # 1140 <is_thread_start>
 bd2:	c799                	beqz	a5,be0 <thread_create+0x62>
        t->remain_execution_time = execution_time_slot;
    else
        t->remain_execution_time = execution_time_slot * __time_slot_size;
 bd4:	00000797          	auipc	a5,0x0
 bd8:	5407a783          	lw	a5,1344(a5) # 1114 <__time_slot_size>
 bdc:	0327893b          	mulw	s2,a5,s2
 be0:	0b24ac23          	sw	s2,184(s1)

    t->is_yield = 0;
 be4:	0c04a023          	sw	zero,192(s1)
    t->is_exited = 0;
 be8:	0c04a223          	sw	zero,196(s1)

    return t;
}
 bec:	8526                	mv	a0,s1
 bee:	70a2                	ld	ra,40(sp)
 bf0:	7402                	ld	s0,32(sp)
 bf2:	64e2                	ld	s1,24(sp)
 bf4:	6942                	ld	s2,16(sp)
 bf6:	69a2                	ld	s3,8(sp)
 bf8:	6a02                	ld	s4,0(sp)
 bfa:	6145                	addi	sp,sp,48
 bfc:	8082                	ret

0000000000000bfe <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
 bfe:	1101                	addi	sp,sp,-32
 c00:	ec06                	sd	ra,24(sp)
 c02:	e822                	sd	s0,16(sp)
 c04:	e426                	sd	s1,8(sp)
 c06:	1000                	addi	s0,sp,32
 c08:	84aa                	mv	s1,a0
    t->start_time = uptime();
 c0a:	00000097          	auipc	ra,0x0
 c0e:	a64080e7          	jalr	-1436(ra) # 66e <uptime>
 c12:	0aa4ae23          	sw	a0,188(s1)
    t->ID  = id;
 c16:	00000717          	auipc	a4,0x0
 c1a:	50270713          	addi	a4,a4,1282 # 1118 <id>
 c1e:	431c                	lw	a5,0(a4)
 c20:	08f4a823          	sw	a5,144(s1)
    id ++;
 c24:	2785                	addiw	a5,a5,1
 c26:	c31c                	sw	a5,0(a4)
    if(current_thread == NULL){
 c28:	00000797          	auipc	a5,0x0
 c2c:	5207b783          	ld	a5,1312(a5) # 1148 <current_thread>
 c30:	c395                	beqz	a5,c54 <thread_add_runqueue+0x56>
        current_thread->previous = t;
        current_thread->next = t;
        return;
    }
    else{
        if(current_thread->previous->ID == current_thread->ID){
 c32:	73d8                	ld	a4,160(a5)
 c34:	09072603          	lw	a2,144(a4)
 c38:	0907a683          	lw	a3,144(a5)
 c3c:	02d60363          	beq	a2,a3,c62 <thread_add_runqueue+0x64>
            t->previous = current_thread;
            t->next = current_thread;
        }
        else{
            //Two or more threads in queue
            current_thread->previous->next = t;
 c40:	f744                	sd	s1,168(a4)
            t->previous = current_thread->previous;
 c42:	73d8                	ld	a4,160(a5)
 c44:	f0d8                	sd	a4,160(s1)
            t->next = current_thread;
 c46:	f4dc                	sd	a5,168(s1)
            current_thread->previous = t;
 c48:	f3c4                	sd	s1,160(a5)
        }
    }
}
 c4a:	60e2                	ld	ra,24(sp)
 c4c:	6442                	ld	s0,16(sp)
 c4e:	64a2                	ld	s1,8(sp)
 c50:	6105                	addi	sp,sp,32
 c52:	8082                	ret
        current_thread = t;
 c54:	00000797          	auipc	a5,0x0
 c58:	4e97ba23          	sd	s1,1268(a5) # 1148 <current_thread>
        current_thread->previous = t;
 c5c:	f0c4                	sd	s1,160(s1)
        current_thread->next = t;
 c5e:	f4c4                	sd	s1,168(s1)
        return;
 c60:	b7ed                	j	c4a <thread_add_runqueue+0x4c>
            current_thread->previous = t;
 c62:	f3c4                	sd	s1,160(a5)
            current_thread->next = t;
 c64:	f7c4                	sd	s1,168(a5)
            t->previous = current_thread;
 c66:	f0dc                	sd	a5,160(s1)
            t->next = current_thread;
 c68:	f4dc                	sd	a5,168(s1)
 c6a:	b7c5                	j	c4a <thread_add_runqueue+0x4c>

0000000000000c6c <schedule>:
        
       
    }
    thread_exit();
}
void schedule(void){
 c6c:	1141                	addi	sp,sp,-16
 c6e:	e422                	sd	s0,8(sp)
 c70:	0800                	addi	s0,sp,16
    if( is_thread_start == 0 )
 c72:	00000797          	auipc	a5,0x0
 c76:	4ce7a783          	lw	a5,1230(a5) # 1140 <is_thread_start>
 c7a:	cf85                	beqz	a5,cb2 <schedule+0x46>
        }
        current_thread = t;
        //printf("id %d, remain_execution_time %d\n", current_thread->ID, current_thread->remain_execution_time);
        return ;
    }
    else if(current_thread->is_exited == 1 || current_thread->is_yield == 1)
 c7c:	00000797          	auipc	a5,0x0
 c80:	4cc7b783          	ld	a5,1228(a5) # 1148 <current_thread>
 c84:	0c47a683          	lw	a3,196(a5)
 c88:	4705                	li	a4,1
 c8a:	00e68663          	beq	a3,a4,c96 <schedule+0x2a>
 c8e:	0c07a683          	lw	a3,192(a5)
 c92:	0ce69463          	bne	a3,a4,d5a <schedule+0xee>
    {   
    
        current_thread = current_thread->next;
 c96:	77c8                	ld	a0,168(a5)
        int current_id = current_thread->ID;
 c98:	09052583          	lw	a1,144(a0)
        int min_id = current_thread->ID;
        int min_remain_time = -1;
        if(current_thread->remain_execution_time > 0)
 c9c:	0b852603          	lw	a2,184(a0)
 ca0:	06c05c63          	blez	a2,d18 <schedule+0xac>
            min_remain_time = current_thread->remain_execution_time;
        struct thread *t = current_thread;
        current_thread = current_thread->next;
 ca4:	755c                	ld	a5,168(a0)
        while(current_thread->ID != current_id){
 ca6:	0907a683          	lw	a3,144(a5)
 caa:	0ad58463          	beq	a1,a3,d52 <schedule+0xe6>
        int min_id = current_thread->ID;
 cae:	882e                	mv	a6,a1
 cb0:	a059                	j	d36 <schedule+0xca>
        int current_id = current_thread->ID;
 cb2:	00000517          	auipc	a0,0x0
 cb6:	49653503          	ld	a0,1174(a0) # 1148 <current_thread>
 cba:	09052583          	lw	a1,144(a0)
        if(current_thread->remain_execution_time > 0)
 cbe:	0b852603          	lw	a2,184(a0)
 cc2:	00c05963          	blez	a2,cd4 <schedule+0x68>
        current_thread = current_thread->next;
 cc6:	755c                	ld	a5,168(a0)
        while(current_thread->ID != current_id){
 cc8:	0907a683          	lw	a3,144(a5)
 ccc:	04d58163          	beq	a1,a3,d0e <schedule+0xa2>
        int min_id = current_thread->ID;
 cd0:	882e                	mv	a6,a1
 cd2:	a005                	j	cf2 <schedule+0x86>
        int min_remain_time = -1;
 cd4:	567d                	li	a2,-1
 cd6:	bfc5                	j	cc6 <schedule+0x5a>
                    (current_thread->remain_execution_time == min_remain_time && current_thread->ID < min_id) || 
 cd8:	0106d863          	bge	a3,a6,ce8 <schedule+0x7c>
 cdc:	853e                	mv	a0,a5
 cde:	8836                	mv	a6,a3
 ce0:	a021                	j	ce8 <schedule+0x7c>
 ce2:	853e                	mv	a0,a5
                    min_remain_time = current_thread->remain_execution_time;
 ce4:	863a                	mv	a2,a4
 ce6:	8836                	mv	a6,a3
            current_thread = current_thread->next;    
 ce8:	77dc                	ld	a5,168(a5)
        while(current_thread->ID != current_id){
 cea:	0907a683          	lw	a3,144(a5)
 cee:	02b68063          	beq	a3,a1,d0e <schedule+0xa2>
            if(current_thread->remain_execution_time > 0){
 cf2:	0b87a703          	lw	a4,184(a5)
 cf6:	fee059e3          	blez	a4,ce8 <schedule+0x7c>
                if(current_thread->remain_execution_time < min_remain_time ||
 cfa:	fec744e3          	blt	a4,a2,ce2 <schedule+0x76>
 cfe:	fcc70de3          	beq	a4,a2,cd8 <schedule+0x6c>
                    (current_thread->remain_execution_time == min_remain_time && current_thread->ID < min_id) || 
 d02:	fec043e3          	bgtz	a2,ce8 <schedule+0x7c>
 d06:	853e                	mv	a0,a5
                    min_remain_time = current_thread->remain_execution_time;
 d08:	863a                	mv	a2,a4
                    (current_thread->remain_execution_time == min_remain_time && current_thread->ID < min_id) || 
 d0a:	8836                	mv	a6,a3
 d0c:	bff1                	j	ce8 <schedule+0x7c>
        current_thread = t;
 d0e:	00000797          	auipc	a5,0x0
 d12:	42a7bd23          	sd	a0,1082(a5) # 1148 <current_thread>
        return ;
 d16:	a091                	j	d5a <schedule+0xee>
        int min_remain_time = -1;
 d18:	567d                	li	a2,-1
 d1a:	b769                	j	ca4 <schedule+0x38>
        //    printf("id %d, remain_execution_time %d\n", current_thread->ID, current_thread->remain_execution_time);
            if(current_thread->remain_execution_time > 0){
                if(current_thread->remain_execution_time < min_remain_time ||
                    (current_thread->remain_execution_time == min_remain_time && current_thread->ID < min_id) || 
 d1c:	0106d863          	bge	a3,a6,d2c <schedule+0xc0>
 d20:	853e                	mv	a0,a5
 d22:	8836                	mv	a6,a3
 d24:	a021                	j	d2c <schedule+0xc0>
 d26:	853e                	mv	a0,a5
                    min_remain_time <= 0){
                    t = current_thread;
                    min_id = current_thread->ID;
                    min_remain_time = current_thread->remain_execution_time;
 d28:	863a                	mv	a2,a4
 d2a:	8836                	mv	a6,a3
                }
            }
            current_thread = current_thread->next;    
 d2c:	77dc                	ld	a5,168(a5)
        while(current_thread->ID != current_id){
 d2e:	0907a683          	lw	a3,144(a5)
 d32:	02b68063          	beq	a3,a1,d52 <schedule+0xe6>
            if(current_thread->remain_execution_time > 0){
 d36:	0b87a703          	lw	a4,184(a5)
 d3a:	fee059e3          	blez	a4,d2c <schedule+0xc0>
                if(current_thread->remain_execution_time < min_remain_time ||
 d3e:	fec744e3          	blt	a4,a2,d26 <schedule+0xba>
 d42:	fcc70de3          	beq	a4,a2,d1c <schedule+0xb0>
                    (current_thread->remain_execution_time == min_remain_time && current_thread->ID < min_id) || 
 d46:	fec043e3          	bgtz	a2,d2c <schedule+0xc0>
 d4a:	853e                	mv	a0,a5
                    min_remain_time = current_thread->remain_execution_time;
 d4c:	863a                	mv	a2,a4
                    (current_thread->remain_execution_time == min_remain_time && current_thread->ID < min_id) || 
 d4e:	8836                	mv	a6,a3
 d50:	bff1                	j	d2c <schedule+0xc0>
        }
        current_thread = t;
 d52:	00000797          	auipc	a5,0x0
 d56:	3ea7bb23          	sd	a0,1014(a5) # 1148 <current_thread>
    }
    else
    {   
    
    }
}
 d5a:	6422                	ld	s0,8(sp)
 d5c:	0141                	addi	sp,sp,16
 d5e:	8082                	ret

0000000000000d60 <thread_exit>:

void thread_exit(void){
 d60:	1101                	addi	sp,sp,-32
 d62:	ec06                	sd	ra,24(sp)
 d64:	e822                	sd	s0,16(sp)
 d66:	e426                	sd	s1,8(sp)
 d68:	e04a                	sd	s2,0(sp)
 d6a:	1000                	addi	s0,sp,32
    // remove the thread immediately, and cancel previous thrdstop.
    thrdresume(current_thread->thrdstop_context_id, 1);
 d6c:	00000497          	auipc	s1,0x0
 d70:	3dc48493          	addi	s1,s1,988 # 1148 <current_thread>
 d74:	609c                	ld	a5,0(s1)
 d76:	4585                	li	a1,1
 d78:	0b47a503          	lw	a0,180(a5)
 d7c:	00000097          	auipc	ra,0x0
 d80:	902080e7          	jalr	-1790(ra) # 67e <thrdresume>
    struct thread* to_remove = current_thread;
 d84:	6084                	ld	s1,0(s1)
    printf("thread id %d exec %d ticks\n", to_remove->ID, uptime() - to_remove->start_time);
 d86:	0904a903          	lw	s2,144(s1)
 d8a:	00000097          	auipc	ra,0x0
 d8e:	8e4080e7          	jalr	-1820(ra) # 66e <uptime>
 d92:	0bc4a603          	lw	a2,188(s1)
 d96:	40c5063b          	subw	a2,a0,a2
 d9a:	85ca                	mv	a1,s2
 d9c:	00000517          	auipc	a0,0x0
 da0:	32c50513          	addi	a0,a0,812 # 10c8 <digits+0x18>
 da4:	00000097          	auipc	ra,0x0
 da8:	bc2080e7          	jalr	-1086(ra) # 966 <printf>

    to_remove->is_exited = 1;
 dac:	4785                	li	a5,1
 dae:	0cf4a223          	sw	a5,196(s1)

    if(to_remove->next != to_remove){
 db2:	74dc                	ld	a5,168(s1)
 db4:	02978e63          	beq	a5,s1,df0 <thread_exit+0x90>
        //Still more thread to execute
        schedule() ;
 db8:	00000097          	auipc	ra,0x0
 dbc:	eb4080e7          	jalr	-332(ra) # c6c <schedule>
        //Connect the remaining threads
        struct thread* to_remove_next = to_remove->next;
 dc0:	74d8                	ld	a4,168(s1)
        to_remove_next->previous = to_remove->previous;
 dc2:	70dc                	ld	a5,160(s1)
 dc4:	f35c                	sd	a5,160(a4)
        to_remove->previous->next = to_remove_next;
 dc6:	f7d8                	sd	a4,168(a5)


        //free pointers
        free(to_remove->stack);
 dc8:	6888                	ld	a0,16(s1)
 dca:	00000097          	auipc	ra,0x0
 dce:	bd2080e7          	jalr	-1070(ra) # 99c <free>
        free(to_remove);
 dd2:	8526                	mv	a0,s1
 dd4:	00000097          	auipc	ra,0x0
 dd8:	bc8080e7          	jalr	-1080(ra) # 99c <free>
        dispatch();
 ddc:	00000097          	auipc	ra,0x0
 de0:	028080e7          	jalr	40(ra) # e04 <dispatch>
    }
    else{
        //No more thread to execute
        longjmp(env_st, -1);
    }
}
 de4:	60e2                	ld	ra,24(sp)
 de6:	6442                	ld	s0,16(sp)
 de8:	64a2                	ld	s1,8(sp)
 dea:	6902                	ld	s2,0(sp)
 dec:	6105                	addi	sp,sp,32
 dee:	8082                	ret
        longjmp(env_st, -1);
 df0:	55fd                	li	a1,-1
 df2:	00000517          	auipc	a0,0x0
 df6:	36e50513          	addi	a0,a0,878 # 1160 <env_st>
 dfa:	00000097          	auipc	ra,0x0
 dfe:	d46080e7          	jalr	-698(ra) # b40 <longjmp>
}
 e02:	b7cd                	j	de4 <thread_exit+0x84>

0000000000000e04 <dispatch>:
void dispatch(void){
 e04:	1101                	addi	sp,sp,-32
 e06:	ec06                	sd	ra,24(sp)
 e08:	e822                	sd	s0,16(sp)
 e0a:	e426                	sd	s1,8(sp)
 e0c:	e04a                	sd	s2,0(sp)
 e0e:	1000                	addi	s0,sp,32
    if(current_thread->buf_set)
 e10:	00000497          	auipc	s1,0x0
 e14:	3384b483          	ld	s1,824(s1) # 1148 <current_thread>
 e18:	09c4a783          	lw	a5,156(s1)
 e1c:	cfb1                	beqz	a5,e78 <dispatch+0x74>
        thrdstop( next_time, current_thread->thrdstop_context_id, my_thrdstop_handler); // after next_time ticks, my_thrdstop_handler will be called.
 e1e:	0b44a583          	lw	a1,180(s1)
        int next_time = (__time_slot_size >= current_thread->remain_execution_time )? current_thread->remain_execution_time: __time_slot_size;
 e22:	00000797          	auipc	a5,0x0
 e26:	2f27a783          	lw	a5,754(a5) # 1114 <__time_slot_size>
 e2a:	0b84a503          	lw	a0,184(s1)
 e2e:	0005069b          	sext.w	a3,a0
 e32:	0007871b          	sext.w	a4,a5
 e36:	00d75363          	bge	a4,a3,e3c <dispatch+0x38>
 e3a:	853e                	mv	a0,a5
        thrdstop( next_time, current_thread->thrdstop_context_id, my_thrdstop_handler); // after next_time ticks, my_thrdstop_handler will be called.
 e3c:	00000617          	auipc	a2,0x0
 e40:	09860613          	addi	a2,a2,152 # ed4 <my_thrdstop_handler>
 e44:	2501                	sext.w	a0,a0
 e46:	00000097          	auipc	ra,0x0
 e4a:	830080e7          	jalr	-2000(ra) # 676 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id, 0);
 e4e:	4581                	li	a1,0
 e50:	00000797          	auipc	a5,0x0
 e54:	2f87b783          	ld	a5,760(a5) # 1148 <current_thread>
 e58:	0b47a503          	lw	a0,180(a5)
 e5c:	00000097          	auipc	ra,0x0
 e60:	822080e7          	jalr	-2014(ra) # 67e <thrdresume>
    thread_exit();
 e64:	00000097          	auipc	ra,0x0
 e68:	efc080e7          	jalr	-260(ra) # d60 <thread_exit>
}
 e6c:	60e2                	ld	ra,24(sp)
 e6e:	6442                	ld	s0,16(sp)
 e70:	64a2                	ld	s1,8(sp)
 e72:	6902                	ld	s2,0(sp)
 e74:	6105                	addi	sp,sp,32
 e76:	8082                	ret
        current_thread->buf_set = 1;
 e78:	4785                	li	a5,1
 e7a:	08f4ae23          	sw	a5,156(s1)
        new_stack_p = (unsigned long) current_thread->stack_p;      
 e7e:	0184b903          	ld	s2,24(s1)
        current_thread->thrdstop_context_id = thrdstop( __time_slot_size, -1, my_thrdstop_handler);
 e82:	00000617          	auipc	a2,0x0
 e86:	05260613          	addi	a2,a2,82 # ed4 <my_thrdstop_handler>
 e8a:	55fd                	li	a1,-1
 e8c:	00000517          	auipc	a0,0x0
 e90:	28852503          	lw	a0,648(a0) # 1114 <__time_slot_size>
 e94:	fffff097          	auipc	ra,0xfffff
 e98:	7e2080e7          	jalr	2018(ra) # 676 <thrdstop>
 e9c:	0aa4aa23          	sw	a0,180(s1)
        if( current_thread->thrdstop_context_id < 0 )
 ea0:	00000797          	auipc	a5,0x0
 ea4:	2a87b783          	ld	a5,680(a5) # 1148 <current_thread>
 ea8:	0b47a703          	lw	a4,180(a5)
 eac:	00074763          	bltz	a4,eba <dispatch+0xb6>
        asm volatile("mv sp, %0" : : "r" (new_stack_p));
 eb0:	814a                	mv	sp,s2
        current_thread->fp(current_thread->arg);
 eb2:	6398                	ld	a4,0(a5)
 eb4:	6788                	ld	a0,8(a5)
 eb6:	9702                	jalr	a4
 eb8:	b775                	j	e64 <dispatch+0x60>
            printf("error: number of threads may exceed\n");
 eba:	00000517          	auipc	a0,0x0
 ebe:	22e50513          	addi	a0,a0,558 # 10e8 <digits+0x38>
 ec2:	00000097          	auipc	ra,0x0
 ec6:	aa4080e7          	jalr	-1372(ra) # 966 <printf>
            exit(1);
 eca:	4505                	li	a0,1
 ecc:	fffff097          	auipc	ra,0xfffff
 ed0:	70a080e7          	jalr	1802(ra) # 5d6 <exit>

0000000000000ed4 <my_thrdstop_handler>:
void my_thrdstop_handler(void){
 ed4:	1141                	addi	sp,sp,-16
 ed6:	e406                	sd	ra,8(sp)
 ed8:	e022                	sd	s0,0(sp)
 eda:	0800                	addi	s0,sp,16
    current_thread->remain_execution_time -= __time_slot_size ;
 edc:	00000717          	auipc	a4,0x0
 ee0:	26c73703          	ld	a4,620(a4) # 1148 <current_thread>
 ee4:	0b872783          	lw	a5,184(a4)
 ee8:	00000697          	auipc	a3,0x0
 eec:	22c6a683          	lw	a3,556(a3) # 1114 <__time_slot_size>
 ef0:	9f95                	subw	a5,a5,a3
 ef2:	0007869b          	sext.w	a3,a5
 ef6:	0af72c23          	sw	a5,184(a4)
    if( current_thread->remain_execution_time <= 0 )
 efa:	00d05e63          	blez	a3,f16 <my_thrdstop_handler+0x42>
        schedule();
 efe:	00000097          	auipc	ra,0x0
 f02:	d6e080e7          	jalr	-658(ra) # c6c <schedule>
        dispatch();
 f06:	00000097          	auipc	ra,0x0
 f0a:	efe080e7          	jalr	-258(ra) # e04 <dispatch>
}
 f0e:	60a2                	ld	ra,8(sp)
 f10:	6402                	ld	s0,0(sp)
 f12:	0141                	addi	sp,sp,16
 f14:	8082                	ret
        thread_exit();
 f16:	00000097          	auipc	ra,0x0
 f1a:	e4a080e7          	jalr	-438(ra) # d60 <thread_exit>
 f1e:	bfc5                	j	f0e <my_thrdstop_handler+0x3a>

0000000000000f20 <thread_yield>:
void thread_yield(void){
 f20:	1101                	addi	sp,sp,-32
 f22:	ec06                	sd	ra,24(sp)
 f24:	e822                	sd	s0,16(sp)
 f26:	e426                	sd	s1,8(sp)
 f28:	1000                	addi	s0,sp,32
    int consume_ticks = cancelthrdstop( current_thread->thrdstop_context_id ); // cancel previous thrdstop and save the current thread context
 f2a:	00000497          	auipc	s1,0x0
 f2e:	21e48493          	addi	s1,s1,542 # 1148 <current_thread>
 f32:	609c                	ld	a5,0(s1)
 f34:	0b47a503          	lw	a0,180(a5)
 f38:	fffff097          	auipc	ra,0xfffff
 f3c:	74e080e7          	jalr	1870(ra) # 686 <cancelthrdstop>
    if( current_thread->is_yield == 0 )
 f40:	609c                	ld	a5,0(s1)
 f42:	0c07a703          	lw	a4,192(a5)
 f46:	ef05                	bnez	a4,f7e <thread_yield+0x5e>
        current_thread->remain_execution_time -= consume_ticks ;
 f48:	0b87a703          	lw	a4,184(a5)
 f4c:	40a7053b          	subw	a0,a4,a0
 f50:	0005071b          	sext.w	a4,a0
 f54:	0aa7ac23          	sw	a0,184(a5)
        current_thread->is_yield = 1;
 f58:	4685                	li	a3,1
 f5a:	0cd7a023          	sw	a3,192(a5)
        if( current_thread->remain_execution_time <= 0 )
 f5e:	00e05b63          	blez	a4,f74 <thread_yield+0x54>
            schedule();
 f62:	00000097          	auipc	ra,0x0
 f66:	d0a080e7          	jalr	-758(ra) # c6c <schedule>
            dispatch();
 f6a:	00000097          	auipc	ra,0x0
 f6e:	e9a080e7          	jalr	-358(ra) # e04 <dispatch>
 f72:	a801                	j	f82 <thread_yield+0x62>
            thread_exit();
 f74:	00000097          	auipc	ra,0x0
 f78:	dec080e7          	jalr	-532(ra) # d60 <thread_exit>
 f7c:	a019                	j	f82 <thread_yield+0x62>
        current_thread->is_yield = 0;
 f7e:	0c07a023          	sw	zero,192(a5)
}
 f82:	60e2                	ld	ra,24(sp)
 f84:	6442                	ld	s0,16(sp)
 f86:	64a2                	ld	s1,8(sp)
 f88:	6105                	addi	sp,sp,32
 f8a:	8082                	ret

0000000000000f8c <thread_start_threading>:
void thread_start_threading(int time_slot_size){
 f8c:	1141                	addi	sp,sp,-16
 f8e:	e406                	sd	ra,8(sp)
 f90:	e022                	sd	s0,0(sp)
 f92:	0800                	addi	s0,sp,16
    __time_slot_size = time_slot_size;
 f94:	00000797          	auipc	a5,0x0
 f98:	18a7a023          	sw	a0,384(a5) # 1114 <__time_slot_size>
    
    struct thread* tmp_thread = current_thread;
 f9c:	00000697          	auipc	a3,0x0
 fa0:	1ac6b683          	ld	a3,428(a3) # 1148 <current_thread>
 fa4:	87b6                	mv	a5,a3
    while (tmp_thread != NULL)
 fa6:	cb91                	beqz	a5,fba <thread_start_threading+0x2e>
    {
        tmp_thread->remain_execution_time *= time_slot_size;
 fa8:	0b87a703          	lw	a4,184(a5)
 fac:	02a7073b          	mulw	a4,a4,a0
 fb0:	0ae7ac23          	sw	a4,184(a5)
        tmp_thread = tmp_thread->next;
 fb4:	77dc                	ld	a5,168(a5)
        if( tmp_thread == current_thread )
 fb6:	fef698e3          	bne	a3,a5,fa6 <thread_start_threading+0x1a>
            break;
    }

    int r;
    r = setjmp(env_st);
 fba:	00000517          	auipc	a0,0x0
 fbe:	1a650513          	addi	a0,a0,422 # 1160 <env_st>
 fc2:	00000097          	auipc	ra,0x0
 fc6:	b46080e7          	jalr	-1210(ra) # b08 <setjmp>
    
    if(current_thread != NULL && r==0){
 fca:	00000797          	auipc	a5,0x0
 fce:	17e7b783          	ld	a5,382(a5) # 1148 <current_thread>
 fd2:	c391                	beqz	a5,fd6 <thread_start_threading+0x4a>
 fd4:	c509                	beqz	a0,fde <thread_start_threading+0x52>
        schedule() ;
        is_thread_start = 1;
        dispatch();
    }
}
 fd6:	60a2                	ld	ra,8(sp)
 fd8:	6402                	ld	s0,0(sp)
 fda:	0141                	addi	sp,sp,16
 fdc:	8082                	ret
        schedule() ;
 fde:	00000097          	auipc	ra,0x0
 fe2:	c8e080e7          	jalr	-882(ra) # c6c <schedule>
        is_thread_start = 1;
 fe6:	4785                	li	a5,1
 fe8:	00000717          	auipc	a4,0x0
 fec:	14f72c23          	sw	a5,344(a4) # 1140 <is_thread_start>
        dispatch();
 ff0:	00000097          	auipc	ra,0x0
 ff4:	e14080e7          	jalr	-492(ra) # e04 <dispatch>
}
 ff8:	bff9                	j	fd6 <thread_start_threading+0x4a>
