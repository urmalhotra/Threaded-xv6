
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 55 11 80       	mov    $0x801155d0,%esp
8010002d:	b8 60 30 10 80       	mov    $0x80103060,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 c0 74 10 80       	push   $0x801074c0
80100051:	68 20 a5 10 80       	push   $0x8010a520
80100056:	e8 f5 45 00 00       	call   80104650 <initlock>
8010005b:	83 c4 10             	add    $0x10,%esp
8010005e:	b8 1c ec 10 80       	mov    $0x8010ec1c,%eax
80100063:	c7 05 6c ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec6c
8010006a:	ec 10 80 
8010006d:	c7 05 70 ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec70
80100074:	ec 10 80 
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 d3                	mov    %edx,%ebx
80100082:	89 43 54             	mov    %eax,0x54(%ebx)
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	8d 43 0c             	lea    0xc(%ebx),%eax
8010008b:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
80100092:	68 c7 74 10 80       	push   $0x801074c7
80100097:	50                   	push   %eax
80100098:	e8 83 44 00 00       	call   80104520 <initsleeplock>
8010009d:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
801000a2:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a8:	83 c4 10             	add    $0x10,%esp
801000ab:	89 58 50             	mov    %ebx,0x50(%eax)
801000ae:	89 d8                	mov    %ebx,%eax
801000b0:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
801000b6:	81 fb c0 e9 10 80    	cmp    $0x8010e9c0,%ebx
801000bc:	75 c2                	jne    80100080 <binit+0x40>
801000be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c1:	c9                   	leave  
801000c2:	c3                   	ret    
801000c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 20 a5 10 80       	push   $0x8010a520
801000e4:	e8 37 47 00 00       	call   80104820 <acquire>
801000e9:	8b 1d 70 ec 10 80    	mov    0x8010ec70,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010011f:	90                   	nop
80100120:	8b 1d 6c ec 10 80    	mov    0x8010ec6c,%ebx
80100126:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 6e                	jmp    8010019e <bread+0xce>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100139:	74 63                	je     8010019e <bread+0xce>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 20 a5 10 80       	push   $0x8010a520
80100162:	e8 59 46 00 00       	call   801047c0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ee 43 00 00       	call   80104560 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret    
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 4f 21 00 00       	call   801022e0 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret    
8010019e:	83 ec 0c             	sub    $0xc,%esp
801001a1:	68 ce 74 10 80       	push   $0x801074ce
801001a6:	e8 d5 01 00 00       	call   80100380 <panic>
801001ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001af:	90                   	nop

801001b0 <bwrite>:
801001b0:	55                   	push   %ebp
801001b1:	89 e5                	mov    %esp,%ebp
801001b3:	53                   	push   %ebx
801001b4:	83 ec 10             	sub    $0x10,%esp
801001b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801001bd:	50                   	push   %eax
801001be:	e8 3d 44 00 00       	call   80104600 <holdingsleep>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	85 c0                	test   %eax,%eax
801001c8:	74 0f                	je     801001d9 <bwrite+0x29>
801001ca:	83 0b 04             	orl    $0x4,(%ebx)
801001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d3:	c9                   	leave  
801001d4:	e9 07 21 00 00       	jmp    801022e0 <iderw>
801001d9:	83 ec 0c             	sub    $0xc,%esp
801001dc:	68 df 74 10 80       	push   $0x801074df
801001e1:	e8 9a 01 00 00       	call   80100380 <panic>
801001e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801001ed:	8d 76 00             	lea    0x0(%esi),%esi

801001f0 <brelse>:
801001f0:	55                   	push   %ebp
801001f1:	89 e5                	mov    %esp,%ebp
801001f3:	56                   	push   %esi
801001f4:	53                   	push   %ebx
801001f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001f8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 fc 43 00 00       	call   80104600 <holdingsleep>
80100204:	83 c4 10             	add    $0x10,%esp
80100207:	85 c0                	test   %eax,%eax
80100209:	74 66                	je     80100271 <brelse+0x81>
8010020b:	83 ec 0c             	sub    $0xc,%esp
8010020e:	56                   	push   %esi
8010020f:	e8 ac 43 00 00       	call   801045c0 <releasesleep>
80100214:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010021b:	e8 00 46 00 00       	call   80104820 <acquire>
80100220:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100223:	83 c4 10             	add    $0x10,%esp
80100226:	83 e8 01             	sub    $0x1,%eax
80100229:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010022c:	85 c0                	test   %eax,%eax
8010022e:	75 2f                	jne    8010025f <brelse+0x6f>
80100230:	8b 43 54             	mov    0x54(%ebx),%eax
80100233:	8b 53 50             	mov    0x50(%ebx),%edx
80100236:	89 50 50             	mov    %edx,0x50(%eax)
80100239:	8b 43 50             	mov    0x50(%ebx),%eax
8010023c:	8b 53 54             	mov    0x54(%ebx),%edx
8010023f:	89 50 54             	mov    %edx,0x54(%eax)
80100242:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100247:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
8010024e:	89 43 54             	mov    %eax,0x54(%ebx)
80100251:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100256:	89 58 50             	mov    %ebx,0x50(%eax)
80100259:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
8010025f:	c7 45 08 20 a5 10 80 	movl   $0x8010a520,0x8(%ebp)
80100266:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100269:	5b                   	pop    %ebx
8010026a:	5e                   	pop    %esi
8010026b:	5d                   	pop    %ebp
8010026c:	e9 4f 45 00 00       	jmp    801047c0 <release>
80100271:	83 ec 0c             	sub    $0xc,%esp
80100274:	68 e6 74 10 80       	push   $0x801074e6
80100279:	e8 02 01 00 00       	call   80100380 <panic>
8010027e:	66 90                	xchg   %ax,%ax

80100280 <consoleread>:
80100280:	55                   	push   %ebp
80100281:	89 e5                	mov    %esp,%ebp
80100283:	57                   	push   %edi
80100284:	56                   	push   %esi
80100285:	53                   	push   %ebx
80100286:	83 ec 18             	sub    $0x18,%esp
80100289:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010028c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010028f:	ff 75 08             	push   0x8(%ebp)
80100292:	89 df                	mov    %ebx,%edi
80100294:	e8 c7 15 00 00       	call   80101860 <iunlock>
80100299:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801002a0:	e8 7b 45 00 00       	call   80104820 <acquire>
801002a5:	83 c4 10             	add    $0x10,%esp
801002a8:	85 db                	test   %ebx,%ebx
801002aa:	0f 8e 94 00 00 00    	jle    80100344 <consoleread+0xc4>
801002b0:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801002b5:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002bb:	74 25                	je     801002e2 <consoleread+0x62>
801002bd:	eb 59                	jmp    80100318 <consoleread+0x98>
801002bf:	90                   	nop
801002c0:	83 ec 08             	sub    $0x8,%esp
801002c3:	68 20 ef 10 80       	push   $0x8010ef20
801002c8:	68 00 ef 10 80       	push   $0x8010ef00
801002cd:	e8 ee 3f 00 00       	call   801042c0 <sleep>
801002d2:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801002d7:	83 c4 10             	add    $0x10,%esp
801002da:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002e0:	75 36                	jne    80100318 <consoleread+0x98>
801002e2:	e8 89 36 00 00       	call   80103970 <myproc>
801002e7:	8b 48 28             	mov    0x28(%eax),%ecx
801002ea:	85 c9                	test   %ecx,%ecx
801002ec:	74 d2                	je     801002c0 <consoleread+0x40>
801002ee:	83 ec 0c             	sub    $0xc,%esp
801002f1:	68 20 ef 10 80       	push   $0x8010ef20
801002f6:	e8 c5 44 00 00       	call   801047c0 <release>
801002fb:	5a                   	pop    %edx
801002fc:	ff 75 08             	push   0x8(%ebp)
801002ff:	e8 7c 14 00 00       	call   80101780 <ilock>
80100304:	83 c4 10             	add    $0x10,%esp
80100307:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010030a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010030f:	5b                   	pop    %ebx
80100310:	5e                   	pop    %esi
80100311:	5f                   	pop    %edi
80100312:	5d                   	pop    %ebp
80100313:	c3                   	ret    
80100314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100318:	8d 50 01             	lea    0x1(%eax),%edx
8010031b:	89 15 00 ef 10 80    	mov    %edx,0x8010ef00
80100321:	89 c2                	mov    %eax,%edx
80100323:	83 e2 7f             	and    $0x7f,%edx
80100326:	0f be 8a 80 ee 10 80 	movsbl -0x7fef1180(%edx),%ecx
8010032d:	80 f9 04             	cmp    $0x4,%cl
80100330:	74 37                	je     80100369 <consoleread+0xe9>
80100332:	83 c6 01             	add    $0x1,%esi
80100335:	83 eb 01             	sub    $0x1,%ebx
80100338:	88 4e ff             	mov    %cl,-0x1(%esi)
8010033b:	83 f9 0a             	cmp    $0xa,%ecx
8010033e:	0f 85 64 ff ff ff    	jne    801002a8 <consoleread+0x28>
80100344:	83 ec 0c             	sub    $0xc,%esp
80100347:	68 20 ef 10 80       	push   $0x8010ef20
8010034c:	e8 6f 44 00 00       	call   801047c0 <release>
80100351:	58                   	pop    %eax
80100352:	ff 75 08             	push   0x8(%ebp)
80100355:	e8 26 14 00 00       	call   80101780 <ilock>
8010035a:	89 f8                	mov    %edi,%eax
8010035c:	83 c4 10             	add    $0x10,%esp
8010035f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100362:	29 d8                	sub    %ebx,%eax
80100364:	5b                   	pop    %ebx
80100365:	5e                   	pop    %esi
80100366:	5f                   	pop    %edi
80100367:	5d                   	pop    %ebp
80100368:	c3                   	ret    
80100369:	39 fb                	cmp    %edi,%ebx
8010036b:	73 d7                	jae    80100344 <consoleread+0xc4>
8010036d:	a3 00 ef 10 80       	mov    %eax,0x8010ef00
80100372:	eb d0                	jmp    80100344 <consoleread+0xc4>
80100374:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010037b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010037f:	90                   	nop

80100380 <panic>:
80100380:	55                   	push   %ebp
80100381:	89 e5                	mov    %esp,%ebp
80100383:	56                   	push   %esi
80100384:	53                   	push   %ebx
80100385:	83 ec 30             	sub    $0x30,%esp
80100388:	fa                   	cli    
80100389:	c7 05 54 ef 10 80 00 	movl   $0x0,0x8010ef54
80100390:	00 00 00 
80100393:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100396:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100399:	e8 52 25 00 00       	call   801028f0 <lapicid>
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	50                   	push   %eax
801003a2:	68 ed 74 10 80       	push   $0x801074ed
801003a7:	e8 f4 02 00 00       	call   801006a0 <cprintf>
801003ac:	58                   	pop    %eax
801003ad:	ff 75 08             	push   0x8(%ebp)
801003b0:	e8 eb 02 00 00       	call   801006a0 <cprintf>
801003b5:	c7 04 24 1f 7e 10 80 	movl   $0x80107e1f,(%esp)
801003bc:	e8 df 02 00 00       	call   801006a0 <cprintf>
801003c1:	8d 45 08             	lea    0x8(%ebp),%eax
801003c4:	5a                   	pop    %edx
801003c5:	59                   	pop    %ecx
801003c6:	53                   	push   %ebx
801003c7:	50                   	push   %eax
801003c8:	e8 a3 42 00 00       	call   80104670 <getcallerpcs>
801003cd:	83 c4 10             	add    $0x10,%esp
801003d0:	83 ec 08             	sub    $0x8,%esp
801003d3:	ff 33                	push   (%ebx)
801003d5:	83 c3 04             	add    $0x4,%ebx
801003d8:	68 01 75 10 80       	push   $0x80107501
801003dd:	e8 be 02 00 00       	call   801006a0 <cprintf>
801003e2:	83 c4 10             	add    $0x10,%esp
801003e5:	39 f3                	cmp    %esi,%ebx
801003e7:	75 e7                	jne    801003d0 <panic+0x50>
801003e9:	c7 05 58 ef 10 80 01 	movl   $0x1,0x8010ef58
801003f0:	00 00 00 
801003f3:	eb fe                	jmp    801003f3 <panic+0x73>
801003f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100400 <consputc.part.0>:
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 1c             	sub    $0x1c,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 ea 00 00 00    	je     80100500 <consputc.part.0+0x100>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 b1 5b 00 00       	call   80105fd0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c8             	movzbl %al,%ecx
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	b8 0f 00 00 00       	mov    $0xf,%eax
80100441:	c1 e1 08             	shl    $0x8,%ecx
80100444:	ee                   	out    %al,(%dx)
80100445:	89 f2                	mov    %esi,%edx
80100447:	ec                   	in     (%dx),%al
80100448:	0f b6 c0             	movzbl %al,%eax
8010044b:	09 c8                	or     %ecx,%eax
8010044d:	83 fb 0a             	cmp    $0xa,%ebx
80100450:	0f 84 92 00 00 00    	je     801004e8 <consputc.part.0+0xe8>
80100456:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045c:	74 72                	je     801004d0 <consputc.part.0+0xd0>
8010045e:	0f b6 db             	movzbl %bl,%ebx
80100461:	8d 70 01             	lea    0x1(%eax),%esi
80100464:	80 cf 07             	or     $0x7,%bh
80100467:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
8010046e:	80 
8010046f:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
80100475:	0f 8f fb 00 00 00    	jg     80100576 <consputc.part.0+0x176>
8010047b:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100481:	0f 8f a9 00 00 00    	jg     80100530 <consputc.part.0+0x130>
80100487:	89 f0                	mov    %esi,%eax
80100489:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
80100490:	88 45 e7             	mov    %al,-0x19(%ebp)
80100493:	0f b6 fc             	movzbl %ah,%edi
80100496:	bb d4 03 00 00       	mov    $0x3d4,%ebx
8010049b:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a0:	89 da                	mov    %ebx,%edx
801004a2:	ee                   	out    %al,(%dx)
801004a3:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004a8:	89 f8                	mov    %edi,%eax
801004aa:	89 ca                	mov    %ecx,%edx
801004ac:	ee                   	out    %al,(%dx)
801004ad:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b2:	89 da                	mov    %ebx,%edx
801004b4:	ee                   	out    %al,(%dx)
801004b5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004b9:	89 ca                	mov    %ecx,%edx
801004bb:	ee                   	out    %al,(%dx)
801004bc:	b8 20 07 00 00       	mov    $0x720,%eax
801004c1:	66 89 06             	mov    %ax,(%esi)
801004c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c7:	5b                   	pop    %ebx
801004c8:	5e                   	pop    %esi
801004c9:	5f                   	pop    %edi
801004ca:	5d                   	pop    %ebp
801004cb:	c3                   	ret    
801004cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801004d0:	8d 70 ff             	lea    -0x1(%eax),%esi
801004d3:	85 c0                	test   %eax,%eax
801004d5:	75 98                	jne    8010046f <consputc.part.0+0x6f>
801004d7:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
801004db:	be 00 80 0b 80       	mov    $0x800b8000,%esi
801004e0:	31 ff                	xor    %edi,%edi
801004e2:	eb b2                	jmp    80100496 <consputc.part.0+0x96>
801004e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801004e8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
801004ed:	f7 e2                	mul    %edx
801004ef:	c1 ea 06             	shr    $0x6,%edx
801004f2:	8d 04 92             	lea    (%edx,%edx,4),%eax
801004f5:	c1 e0 04             	shl    $0x4,%eax
801004f8:	8d 70 50             	lea    0x50(%eax),%esi
801004fb:	e9 6f ff ff ff       	jmp    8010046f <consputc.part.0+0x6f>
80100500:	83 ec 0c             	sub    $0xc,%esp
80100503:	6a 08                	push   $0x8
80100505:	e8 c6 5a 00 00       	call   80105fd0 <uartputc>
8010050a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100511:	e8 ba 5a 00 00       	call   80105fd0 <uartputc>
80100516:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010051d:	e8 ae 5a 00 00       	call   80105fd0 <uartputc>
80100522:	83 c4 10             	add    $0x10,%esp
80100525:	e9 f8 fe ff ff       	jmp    80100422 <consputc.part.0+0x22>
8010052a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100530:	83 ec 04             	sub    $0x4,%esp
80100533:	8d 5e b0             	lea    -0x50(%esi),%ebx
80100536:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
8010053d:	bf 07 00 00 00       	mov    $0x7,%edi
80100542:	68 60 0e 00 00       	push   $0xe60
80100547:	68 a0 80 0b 80       	push   $0x800b80a0
8010054c:	68 00 80 0b 80       	push   $0x800b8000
80100551:	e8 2a 44 00 00       	call   80104980 <memmove>
80100556:	b8 80 07 00 00       	mov    $0x780,%eax
8010055b:	83 c4 0c             	add    $0xc,%esp
8010055e:	29 d8                	sub    %ebx,%eax
80100560:	01 c0                	add    %eax,%eax
80100562:	50                   	push   %eax
80100563:	6a 00                	push   $0x0
80100565:	56                   	push   %esi
80100566:	e8 75 43 00 00       	call   801048e0 <memset>
8010056b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010056e:	83 c4 10             	add    $0x10,%esp
80100571:	e9 20 ff ff ff       	jmp    80100496 <consputc.part.0+0x96>
80100576:	83 ec 0c             	sub    $0xc,%esp
80100579:	68 05 75 10 80       	push   $0x80107505
8010057e:	e8 fd fd ff ff       	call   80100380 <panic>
80100583:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010058a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100590 <consolewrite>:
80100590:	55                   	push   %ebp
80100591:	89 e5                	mov    %esp,%ebp
80100593:	57                   	push   %edi
80100594:	56                   	push   %esi
80100595:	53                   	push   %ebx
80100596:	83 ec 18             	sub    $0x18,%esp
80100599:	ff 75 08             	push   0x8(%ebp)
8010059c:	8b 75 10             	mov    0x10(%ebp),%esi
8010059f:	e8 bc 12 00 00       	call   80101860 <iunlock>
801005a4:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801005ab:	e8 70 42 00 00       	call   80104820 <acquire>
801005b0:	83 c4 10             	add    $0x10,%esp
801005b3:	85 f6                	test   %esi,%esi
801005b5:	7e 25                	jle    801005dc <consolewrite+0x4c>
801005b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801005ba:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
801005bd:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
801005c3:	0f b6 03             	movzbl (%ebx),%eax
801005c6:	85 d2                	test   %edx,%edx
801005c8:	74 06                	je     801005d0 <consolewrite+0x40>
801005ca:	fa                   	cli    
801005cb:	eb fe                	jmp    801005cb <consolewrite+0x3b>
801005cd:	8d 76 00             	lea    0x0(%esi),%esi
801005d0:	e8 2b fe ff ff       	call   80100400 <consputc.part.0>
801005d5:	83 c3 01             	add    $0x1,%ebx
801005d8:	39 df                	cmp    %ebx,%edi
801005da:	75 e1                	jne    801005bd <consolewrite+0x2d>
801005dc:	83 ec 0c             	sub    $0xc,%esp
801005df:	68 20 ef 10 80       	push   $0x8010ef20
801005e4:	e8 d7 41 00 00       	call   801047c0 <release>
801005e9:	58                   	pop    %eax
801005ea:	ff 75 08             	push   0x8(%ebp)
801005ed:	e8 8e 11 00 00       	call   80101780 <ilock>
801005f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801005f5:	89 f0                	mov    %esi,%eax
801005f7:	5b                   	pop    %ebx
801005f8:	5e                   	pop    %esi
801005f9:	5f                   	pop    %edi
801005fa:	5d                   	pop    %ebp
801005fb:	c3                   	ret    
801005fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100600 <printint>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 2c             	sub    $0x2c,%esp
80100609:	89 55 d4             	mov    %edx,-0x2c(%ebp)
8010060c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
8010060f:	85 c9                	test   %ecx,%ecx
80100611:	74 04                	je     80100617 <printint+0x17>
80100613:	85 c0                	test   %eax,%eax
80100615:	78 6d                	js     80100684 <printint+0x84>
80100617:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
8010061e:	89 c1                	mov    %eax,%ecx
80100620:	31 db                	xor    %ebx,%ebx
80100622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100628:	89 c8                	mov    %ecx,%eax
8010062a:	31 d2                	xor    %edx,%edx
8010062c:	89 de                	mov    %ebx,%esi
8010062e:	89 cf                	mov    %ecx,%edi
80100630:	f7 75 d4             	divl   -0x2c(%ebp)
80100633:	8d 5b 01             	lea    0x1(%ebx),%ebx
80100636:	0f b6 92 30 75 10 80 	movzbl -0x7fef8ad0(%edx),%edx
8010063d:	89 c1                	mov    %eax,%ecx
8010063f:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
80100643:	3b 7d d4             	cmp    -0x2c(%ebp),%edi
80100646:	73 e0                	jae    80100628 <printint+0x28>
80100648:	8b 4d d0             	mov    -0x30(%ebp),%ecx
8010064b:	85 c9                	test   %ecx,%ecx
8010064d:	74 0c                	je     8010065b <printint+0x5b>
8010064f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
80100654:	89 de                	mov    %ebx,%esi
80100656:	ba 2d 00 00 00       	mov    $0x2d,%edx
8010065b:	8d 5c 35 d7          	lea    -0x29(%ebp,%esi,1),%ebx
8010065f:	0f be c2             	movsbl %dl,%eax
80100662:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100668:	85 d2                	test   %edx,%edx
8010066a:	74 04                	je     80100670 <printint+0x70>
8010066c:	fa                   	cli    
8010066d:	eb fe                	jmp    8010066d <printint+0x6d>
8010066f:	90                   	nop
80100670:	e8 8b fd ff ff       	call   80100400 <consputc.part.0>
80100675:	8d 45 d7             	lea    -0x29(%ebp),%eax
80100678:	39 c3                	cmp    %eax,%ebx
8010067a:	74 0e                	je     8010068a <printint+0x8a>
8010067c:	0f be 03             	movsbl (%ebx),%eax
8010067f:	83 eb 01             	sub    $0x1,%ebx
80100682:	eb de                	jmp    80100662 <printint+0x62>
80100684:	f7 d8                	neg    %eax
80100686:	89 c1                	mov    %eax,%ecx
80100688:	eb 96                	jmp    80100620 <printint+0x20>
8010068a:	83 c4 2c             	add    $0x2c,%esp
8010068d:	5b                   	pop    %ebx
8010068e:	5e                   	pop    %esi
8010068f:	5f                   	pop    %edi
80100690:	5d                   	pop    %ebp
80100691:	c3                   	ret    
80100692:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801006a0 <cprintf>:
801006a0:	55                   	push   %ebp
801006a1:	89 e5                	mov    %esp,%ebp
801006a3:	57                   	push   %edi
801006a4:	56                   	push   %esi
801006a5:	53                   	push   %ebx
801006a6:	83 ec 1c             	sub    $0x1c,%esp
801006a9:	a1 54 ef 10 80       	mov    0x8010ef54,%eax
801006ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006b1:	85 c0                	test   %eax,%eax
801006b3:	0f 85 27 01 00 00    	jne    801007e0 <cprintf+0x140>
801006b9:	8b 75 08             	mov    0x8(%ebp),%esi
801006bc:	85 f6                	test   %esi,%esi
801006be:	0f 84 ac 01 00 00    	je     80100870 <cprintf+0x1d0>
801006c4:	0f b6 06             	movzbl (%esi),%eax
801006c7:	8d 7d 0c             	lea    0xc(%ebp),%edi
801006ca:	31 db                	xor    %ebx,%ebx
801006cc:	85 c0                	test   %eax,%eax
801006ce:	74 56                	je     80100726 <cprintf+0x86>
801006d0:	83 f8 25             	cmp    $0x25,%eax
801006d3:	0f 85 cf 00 00 00    	jne    801007a8 <cprintf+0x108>
801006d9:	83 c3 01             	add    $0x1,%ebx
801006dc:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
801006e0:	85 d2                	test   %edx,%edx
801006e2:	74 42                	je     80100726 <cprintf+0x86>
801006e4:	83 fa 70             	cmp    $0x70,%edx
801006e7:	0f 84 90 00 00 00    	je     8010077d <cprintf+0xdd>
801006ed:	7f 51                	jg     80100740 <cprintf+0xa0>
801006ef:	83 fa 25             	cmp    $0x25,%edx
801006f2:	0f 84 c0 00 00 00    	je     801007b8 <cprintf+0x118>
801006f8:	83 fa 64             	cmp    $0x64,%edx
801006fb:	0f 85 f4 00 00 00    	jne    801007f5 <cprintf+0x155>
80100701:	8d 47 04             	lea    0x4(%edi),%eax
80100704:	b9 01 00 00 00       	mov    $0x1,%ecx
80100709:	ba 0a 00 00 00       	mov    $0xa,%edx
8010070e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100711:	8b 07                	mov    (%edi),%eax
80100713:	e8 e8 fe ff ff       	call   80100600 <printint>
80100718:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010071b:	83 c3 01             	add    $0x1,%ebx
8010071e:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100722:	85 c0                	test   %eax,%eax
80100724:	75 aa                	jne    801006d0 <cprintf+0x30>
80100726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100729:	85 c0                	test   %eax,%eax
8010072b:	0f 85 22 01 00 00    	jne    80100853 <cprintf+0x1b3>
80100731:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100734:	5b                   	pop    %ebx
80100735:	5e                   	pop    %esi
80100736:	5f                   	pop    %edi
80100737:	5d                   	pop    %ebp
80100738:	c3                   	ret    
80100739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100740:	83 fa 73             	cmp    $0x73,%edx
80100743:	75 33                	jne    80100778 <cprintf+0xd8>
80100745:	8d 47 04             	lea    0x4(%edi),%eax
80100748:	8b 3f                	mov    (%edi),%edi
8010074a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010074d:	85 ff                	test   %edi,%edi
8010074f:	0f 84 e3 00 00 00    	je     80100838 <cprintf+0x198>
80100755:	0f be 07             	movsbl (%edi),%eax
80100758:	84 c0                	test   %al,%al
8010075a:	0f 84 08 01 00 00    	je     80100868 <cprintf+0x1c8>
80100760:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100766:	85 d2                	test   %edx,%edx
80100768:	0f 84 b2 00 00 00    	je     80100820 <cprintf+0x180>
8010076e:	fa                   	cli    
8010076f:	eb fe                	jmp    8010076f <cprintf+0xcf>
80100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100778:	83 fa 78             	cmp    $0x78,%edx
8010077b:	75 78                	jne    801007f5 <cprintf+0x155>
8010077d:	8d 47 04             	lea    0x4(%edi),%eax
80100780:	31 c9                	xor    %ecx,%ecx
80100782:	ba 10 00 00 00       	mov    $0x10,%edx
80100787:	83 c3 01             	add    $0x1,%ebx
8010078a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010078d:	8b 07                	mov    (%edi),%eax
8010078f:	e8 6c fe ff ff       	call   80100600 <printint>
80100794:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100798:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010079b:	85 c0                	test   %eax,%eax
8010079d:	0f 85 2d ff ff ff    	jne    801006d0 <cprintf+0x30>
801007a3:	eb 81                	jmp    80100726 <cprintf+0x86>
801007a5:	8d 76 00             	lea    0x0(%esi),%esi
801007a8:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801007ae:	85 c9                	test   %ecx,%ecx
801007b0:	74 14                	je     801007c6 <cprintf+0x126>
801007b2:	fa                   	cli    
801007b3:	eb fe                	jmp    801007b3 <cprintf+0x113>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
801007b8:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
801007bd:	85 c0                	test   %eax,%eax
801007bf:	75 6c                	jne    8010082d <cprintf+0x18d>
801007c1:	b8 25 00 00 00       	mov    $0x25,%eax
801007c6:	e8 35 fc ff ff       	call   80100400 <consputc.part.0>
801007cb:	83 c3 01             	add    $0x1,%ebx
801007ce:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801007d2:	85 c0                	test   %eax,%eax
801007d4:	0f 85 f6 fe ff ff    	jne    801006d0 <cprintf+0x30>
801007da:	e9 47 ff ff ff       	jmp    80100726 <cprintf+0x86>
801007df:	90                   	nop
801007e0:	83 ec 0c             	sub    $0xc,%esp
801007e3:	68 20 ef 10 80       	push   $0x8010ef20
801007e8:	e8 33 40 00 00       	call   80104820 <acquire>
801007ed:	83 c4 10             	add    $0x10,%esp
801007f0:	e9 c4 fe ff ff       	jmp    801006b9 <cprintf+0x19>
801007f5:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801007fb:	85 c9                	test   %ecx,%ecx
801007fd:	75 31                	jne    80100830 <cprintf+0x190>
801007ff:	b8 25 00 00 00       	mov    $0x25,%eax
80100804:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100807:	e8 f4 fb ff ff       	call   80100400 <consputc.part.0>
8010080c:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100812:	85 d2                	test   %edx,%edx
80100814:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100817:	74 2e                	je     80100847 <cprintf+0x1a7>
80100819:	fa                   	cli    
8010081a:	eb fe                	jmp    8010081a <cprintf+0x17a>
8010081c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100820:	e8 db fb ff ff       	call   80100400 <consputc.part.0>
80100825:	83 c7 01             	add    $0x1,%edi
80100828:	e9 28 ff ff ff       	jmp    80100755 <cprintf+0xb5>
8010082d:	fa                   	cli    
8010082e:	eb fe                	jmp    8010082e <cprintf+0x18e>
80100830:	fa                   	cli    
80100831:	eb fe                	jmp    80100831 <cprintf+0x191>
80100833:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100837:	90                   	nop
80100838:	bf 18 75 10 80       	mov    $0x80107518,%edi
8010083d:	b8 28 00 00 00       	mov    $0x28,%eax
80100842:	e9 19 ff ff ff       	jmp    80100760 <cprintf+0xc0>
80100847:	89 d0                	mov    %edx,%eax
80100849:	e8 b2 fb ff ff       	call   80100400 <consputc.part.0>
8010084e:	e9 c8 fe ff ff       	jmp    8010071b <cprintf+0x7b>
80100853:	83 ec 0c             	sub    $0xc,%esp
80100856:	68 20 ef 10 80       	push   $0x8010ef20
8010085b:	e8 60 3f 00 00       	call   801047c0 <release>
80100860:	83 c4 10             	add    $0x10,%esp
80100863:	e9 c9 fe ff ff       	jmp    80100731 <cprintf+0x91>
80100868:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010086b:	e9 ab fe ff ff       	jmp    8010071b <cprintf+0x7b>
80100870:	83 ec 0c             	sub    $0xc,%esp
80100873:	68 1f 75 10 80       	push   $0x8010751f
80100878:	e8 03 fb ff ff       	call   80100380 <panic>
8010087d:	8d 76 00             	lea    0x0(%esi),%esi

80100880 <consoleintr>:
80100880:	55                   	push   %ebp
80100881:	89 e5                	mov    %esp,%ebp
80100883:	57                   	push   %edi
80100884:	56                   	push   %esi
80100885:	31 f6                	xor    %esi,%esi
80100887:	53                   	push   %ebx
80100888:	83 ec 18             	sub    $0x18,%esp
8010088b:	8b 7d 08             	mov    0x8(%ebp),%edi
8010088e:	68 20 ef 10 80       	push   $0x8010ef20
80100893:	e8 88 3f 00 00       	call   80104820 <acquire>
80100898:	83 c4 10             	add    $0x10,%esp
8010089b:	eb 1a                	jmp    801008b7 <consoleintr+0x37>
8010089d:	8d 76 00             	lea    0x0(%esi),%esi
801008a0:	83 fb 08             	cmp    $0x8,%ebx
801008a3:	0f 84 d7 00 00 00    	je     80100980 <consoleintr+0x100>
801008a9:	83 fb 10             	cmp    $0x10,%ebx
801008ac:	0f 85 32 01 00 00    	jne    801009e4 <consoleintr+0x164>
801008b2:	be 01 00 00 00       	mov    $0x1,%esi
801008b7:	ff d7                	call   *%edi
801008b9:	89 c3                	mov    %eax,%ebx
801008bb:	85 c0                	test   %eax,%eax
801008bd:	0f 88 05 01 00 00    	js     801009c8 <consoleintr+0x148>
801008c3:	83 fb 15             	cmp    $0x15,%ebx
801008c6:	74 78                	je     80100940 <consoleintr+0xc0>
801008c8:	7e d6                	jle    801008a0 <consoleintr+0x20>
801008ca:	83 fb 7f             	cmp    $0x7f,%ebx
801008cd:	0f 84 ad 00 00 00    	je     80100980 <consoleintr+0x100>
801008d3:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801008d8:	89 c2                	mov    %eax,%edx
801008da:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
801008e0:	83 fa 7f             	cmp    $0x7f,%edx
801008e3:	77 d2                	ja     801008b7 <consoleintr+0x37>
801008e5:	8d 48 01             	lea    0x1(%eax),%ecx
801008e8:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
801008ee:	83 e0 7f             	and    $0x7f,%eax
801008f1:	89 0d 08 ef 10 80    	mov    %ecx,0x8010ef08
801008f7:	83 fb 0d             	cmp    $0xd,%ebx
801008fa:	0f 84 13 01 00 00    	je     80100a13 <consoleintr+0x193>
80100900:	88 98 80 ee 10 80    	mov    %bl,-0x7fef1180(%eax)
80100906:	85 d2                	test   %edx,%edx
80100908:	0f 85 10 01 00 00    	jne    80100a1e <consoleintr+0x19e>
8010090e:	89 d8                	mov    %ebx,%eax
80100910:	e8 eb fa ff ff       	call   80100400 <consputc.part.0>
80100915:	83 fb 0a             	cmp    $0xa,%ebx
80100918:	0f 84 14 01 00 00    	je     80100a32 <consoleintr+0x1b2>
8010091e:	83 fb 04             	cmp    $0x4,%ebx
80100921:	0f 84 0b 01 00 00    	je     80100a32 <consoleintr+0x1b2>
80100927:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010092c:	83 e8 80             	sub    $0xffffff80,%eax
8010092f:	39 05 08 ef 10 80    	cmp    %eax,0x8010ef08
80100935:	75 80                	jne    801008b7 <consoleintr+0x37>
80100937:	e9 fb 00 00 00       	jmp    80100a37 <consoleintr+0x1b7>
8010093c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100940:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100945:	39 05 04 ef 10 80    	cmp    %eax,0x8010ef04
8010094b:	0f 84 66 ff ff ff    	je     801008b7 <consoleintr+0x37>
80100951:	83 e8 01             	sub    $0x1,%eax
80100954:	89 c2                	mov    %eax,%edx
80100956:	83 e2 7f             	and    $0x7f,%edx
80100959:	80 ba 80 ee 10 80 0a 	cmpb   $0xa,-0x7fef1180(%edx)
80100960:	0f 84 51 ff ff ff    	je     801008b7 <consoleintr+0x37>
80100966:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010096c:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
80100971:	85 d2                	test   %edx,%edx
80100973:	74 33                	je     801009a8 <consoleintr+0x128>
80100975:	fa                   	cli    
80100976:	eb fe                	jmp    80100976 <consoleintr+0xf6>
80100978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010097f:	90                   	nop
80100980:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100985:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
8010098b:	0f 84 26 ff ff ff    	je     801008b7 <consoleintr+0x37>
80100991:	83 e8 01             	sub    $0x1,%eax
80100994:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
80100999:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
8010099e:	85 c0                	test   %eax,%eax
801009a0:	74 56                	je     801009f8 <consoleintr+0x178>
801009a2:	fa                   	cli    
801009a3:	eb fe                	jmp    801009a3 <consoleintr+0x123>
801009a5:	8d 76 00             	lea    0x0(%esi),%esi
801009a8:	b8 00 01 00 00       	mov    $0x100,%eax
801009ad:	e8 4e fa ff ff       	call   80100400 <consputc.part.0>
801009b2:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801009b7:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801009bd:	75 92                	jne    80100951 <consoleintr+0xd1>
801009bf:	e9 f3 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
801009c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009c8:	83 ec 0c             	sub    $0xc,%esp
801009cb:	68 20 ef 10 80       	push   $0x8010ef20
801009d0:	e8 eb 3d 00 00       	call   801047c0 <release>
801009d5:	83 c4 10             	add    $0x10,%esp
801009d8:	85 f6                	test   %esi,%esi
801009da:	75 2b                	jne    80100a07 <consoleintr+0x187>
801009dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009df:	5b                   	pop    %ebx
801009e0:	5e                   	pop    %esi
801009e1:	5f                   	pop    %edi
801009e2:	5d                   	pop    %ebp
801009e3:	c3                   	ret    
801009e4:	85 db                	test   %ebx,%ebx
801009e6:	0f 84 cb fe ff ff    	je     801008b7 <consoleintr+0x37>
801009ec:	e9 e2 fe ff ff       	jmp    801008d3 <consoleintr+0x53>
801009f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801009f8:	b8 00 01 00 00       	mov    $0x100,%eax
801009fd:	e8 fe f9 ff ff       	call   80100400 <consputc.part.0>
80100a02:	e9 b0 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
80100a07:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a0a:	5b                   	pop    %ebx
80100a0b:	5e                   	pop    %esi
80100a0c:	5f                   	pop    %edi
80100a0d:	5d                   	pop    %ebp
80100a0e:	e9 4d 3a 00 00       	jmp    80104460 <procdump>
80100a13:	c6 80 80 ee 10 80 0a 	movb   $0xa,-0x7fef1180(%eax)
80100a1a:	85 d2                	test   %edx,%edx
80100a1c:	74 0a                	je     80100a28 <consoleintr+0x1a8>
80100a1e:	fa                   	cli    
80100a1f:	eb fe                	jmp    80100a1f <consoleintr+0x19f>
80100a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a28:	b8 0a 00 00 00       	mov    $0xa,%eax
80100a2d:	e8 ce f9 ff ff       	call   80100400 <consputc.part.0>
80100a32:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100a37:	83 ec 0c             	sub    $0xc,%esp
80100a3a:	a3 04 ef 10 80       	mov    %eax,0x8010ef04
80100a3f:	68 00 ef 10 80       	push   $0x8010ef00
80100a44:	e8 37 39 00 00       	call   80104380 <wakeup>
80100a49:	83 c4 10             	add    $0x10,%esp
80100a4c:	e9 66 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
80100a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a5f:	90                   	nop

80100a60 <consoleinit>:
80100a60:	55                   	push   %ebp
80100a61:	89 e5                	mov    %esp,%ebp
80100a63:	83 ec 10             	sub    $0x10,%esp
80100a66:	68 28 75 10 80       	push   $0x80107528
80100a6b:	68 20 ef 10 80       	push   $0x8010ef20
80100a70:	e8 db 3b 00 00       	call   80104650 <initlock>
80100a75:	58                   	pop    %eax
80100a76:	5a                   	pop    %edx
80100a77:	6a 00                	push   $0x0
80100a79:	6a 01                	push   $0x1
80100a7b:	c7 05 0c f9 10 80 90 	movl   $0x80100590,0x8010f90c
80100a82:	05 10 80 
80100a85:	c7 05 08 f9 10 80 80 	movl   $0x80100280,0x8010f908
80100a8c:	02 10 80 
80100a8f:	c7 05 54 ef 10 80 01 	movl   $0x1,0x8010ef54
80100a96:	00 00 00 
80100a99:	e8 e2 19 00 00       	call   80102480 <ioapicenable>
80100a9e:	83 c4 10             	add    $0x10,%esp
80100aa1:	c9                   	leave  
80100aa2:	c3                   	ret    
80100aa3:	66 90                	xchg   %ax,%ax
80100aa5:	66 90                	xchg   %ax,%ax
80100aa7:	66 90                	xchg   %ax,%ax
80100aa9:	66 90                	xchg   %ax,%ax
80100aab:	66 90                	xchg   %ax,%ax
80100aad:	66 90                	xchg   %ax,%ax
80100aaf:	90                   	nop

80100ab0 <exec>:
80100ab0:	55                   	push   %ebp
80100ab1:	89 e5                	mov    %esp,%ebp
80100ab3:	57                   	push   %edi
80100ab4:	56                   	push   %esi
80100ab5:	53                   	push   %ebx
80100ab6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100abc:	e8 af 2e 00 00       	call   80103970 <myproc>
80100ac1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ac7:	e8 94 22 00 00       	call   80102d60 <begin_op>
80100acc:	83 ec 0c             	sub    $0xc,%esp
80100acf:	ff 75 08             	push   0x8(%ebp)
80100ad2:	e8 c9 15 00 00       	call   801020a0 <namei>
80100ad7:	83 c4 10             	add    $0x10,%esp
80100ada:	85 c0                	test   %eax,%eax
80100adc:	0f 84 02 03 00 00    	je     80100de4 <exec+0x334>
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	89 c3                	mov    %eax,%ebx
80100ae7:	50                   	push   %eax
80100ae8:	e8 93 0c 00 00       	call   80101780 <ilock>
80100aed:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100af3:	6a 34                	push   $0x34
80100af5:	6a 00                	push   $0x0
80100af7:	50                   	push   %eax
80100af8:	53                   	push   %ebx
80100af9:	e8 92 0f 00 00       	call   80101a90 <readi>
80100afe:	83 c4 20             	add    $0x20,%esp
80100b01:	83 f8 34             	cmp    $0x34,%eax
80100b04:	74 22                	je     80100b28 <exec+0x78>
80100b06:	83 ec 0c             	sub    $0xc,%esp
80100b09:	53                   	push   %ebx
80100b0a:	e8 01 0f 00 00       	call   80101a10 <iunlockput>
80100b0f:	e8 bc 22 00 00       	call   80102dd0 <end_op>
80100b14:	83 c4 10             	add    $0x10,%esp
80100b17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b1f:	5b                   	pop    %ebx
80100b20:	5e                   	pop    %esi
80100b21:	5f                   	pop    %edi
80100b22:	5d                   	pop    %ebp
80100b23:	c3                   	ret    
80100b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100b28:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b2f:	45 4c 46 
80100b32:	75 d2                	jne    80100b06 <exec+0x56>
80100b34:	e8 27 66 00 00       	call   80107160 <setupkvm>
80100b39:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b3f:	85 c0                	test   %eax,%eax
80100b41:	74 c3                	je     80100b06 <exec+0x56>
80100b43:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b4a:	00 
80100b4b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b51:	0f 84 ac 02 00 00    	je     80100e03 <exec+0x353>
80100b57:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b5e:	00 00 00 
80100b61:	31 ff                	xor    %edi,%edi
80100b63:	e9 8e 00 00 00       	jmp    80100bf6 <exec+0x146>
80100b68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100b6f:	90                   	nop
80100b70:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b77:	75 6c                	jne    80100be5 <exec+0x135>
80100b79:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b7f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b85:	0f 82 87 00 00 00    	jb     80100c12 <exec+0x162>
80100b8b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b91:	72 7f                	jb     80100c12 <exec+0x162>
80100b93:	83 ec 04             	sub    $0x4,%esp
80100b96:	50                   	push   %eax
80100b97:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
80100b9d:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100ba3:	e8 d8 63 00 00       	call   80106f80 <allocuvm>
80100ba8:	83 c4 10             	add    $0x10,%esp
80100bab:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100bb1:	85 c0                	test   %eax,%eax
80100bb3:	74 5d                	je     80100c12 <exec+0x162>
80100bb5:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100bbb:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100bc0:	75 50                	jne    80100c12 <exec+0x162>
80100bc2:	83 ec 0c             	sub    $0xc,%esp
80100bc5:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100bcb:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100bd1:	53                   	push   %ebx
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100bd9:	e8 b2 62 00 00       	call   80106e90 <loaduvm>
80100bde:	83 c4 20             	add    $0x20,%esp
80100be1:	85 c0                	test   %eax,%eax
80100be3:	78 2d                	js     80100c12 <exec+0x162>
80100be5:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bec:	83 c7 01             	add    $0x1,%edi
80100bef:	83 c6 20             	add    $0x20,%esi
80100bf2:	39 f8                	cmp    %edi,%eax
80100bf4:	7e 3a                	jle    80100c30 <exec+0x180>
80100bf6:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bfc:	6a 20                	push   $0x20
80100bfe:	56                   	push   %esi
80100bff:	50                   	push   %eax
80100c00:	53                   	push   %ebx
80100c01:	e8 8a 0e 00 00       	call   80101a90 <readi>
80100c06:	83 c4 10             	add    $0x10,%esp
80100c09:	83 f8 20             	cmp    $0x20,%eax
80100c0c:	0f 84 5e ff ff ff    	je     80100b70 <exec+0xc0>
80100c12:	83 ec 0c             	sub    $0xc,%esp
80100c15:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100c1b:	e8 c0 64 00 00       	call   801070e0 <freevm>
80100c20:	83 c4 10             	add    $0x10,%esp
80100c23:	e9 de fe ff ff       	jmp    80100b06 <exec+0x56>
80100c28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100c2f:	90                   	nop
80100c30:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c36:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100c3c:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100c42:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	53                   	push   %ebx
80100c4c:	e8 bf 0d 00 00       	call   80101a10 <iunlockput>
80100c51:	e8 7a 21 00 00       	call   80102dd0 <end_op>
80100c56:	83 c4 0c             	add    $0xc,%esp
80100c59:	56                   	push   %esi
80100c5a:	57                   	push   %edi
80100c5b:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c61:	57                   	push   %edi
80100c62:	e8 19 63 00 00       	call   80106f80 <allocuvm>
80100c67:	83 c4 10             	add    $0x10,%esp
80100c6a:	89 c6                	mov    %eax,%esi
80100c6c:	85 c0                	test   %eax,%eax
80100c6e:	0f 84 94 00 00 00    	je     80100d08 <exec+0x258>
80100c74:	83 ec 08             	sub    $0x8,%esp
80100c77:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c7d:	89 f3                	mov    %esi,%ebx
80100c7f:	50                   	push   %eax
80100c80:	57                   	push   %edi
80100c81:	31 ff                	xor    %edi,%edi
80100c83:	e8 78 65 00 00       	call   80107200 <clearpteu>
80100c88:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8b:	83 c4 10             	add    $0x10,%esp
80100c8e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c94:	8b 00                	mov    (%eax),%eax
80100c96:	85 c0                	test   %eax,%eax
80100c98:	0f 84 8b 00 00 00    	je     80100d29 <exec+0x279>
80100c9e:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100ca4:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100caa:	eb 23                	jmp    80100ccf <exec+0x21f>
80100cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100cb0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb3:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100cba:	83 c7 01             	add    $0x1,%edi
80100cbd:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100cc3:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100cc6:	85 c0                	test   %eax,%eax
80100cc8:	74 59                	je     80100d23 <exec+0x273>
80100cca:	83 ff 20             	cmp    $0x20,%edi
80100ccd:	74 39                	je     80100d08 <exec+0x258>
80100ccf:	83 ec 0c             	sub    $0xc,%esp
80100cd2:	50                   	push   %eax
80100cd3:	e8 08 3e 00 00       	call   80104ae0 <strlen>
80100cd8:	29 c3                	sub    %eax,%ebx
80100cda:	58                   	pop    %eax
80100cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cde:	83 eb 01             	sub    $0x1,%ebx
80100ce1:	ff 34 b8             	push   (%eax,%edi,4)
80100ce4:	83 e3 fc             	and    $0xfffffffc,%ebx
80100ce7:	e8 f4 3d 00 00       	call   80104ae0 <strlen>
80100cec:	83 c0 01             	add    $0x1,%eax
80100cef:	50                   	push   %eax
80100cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cf3:	ff 34 b8             	push   (%eax,%edi,4)
80100cf6:	53                   	push   %ebx
80100cf7:	56                   	push   %esi
80100cf8:	e8 d3 66 00 00       	call   801073d0 <copyout>
80100cfd:	83 c4 20             	add    $0x20,%esp
80100d00:	85 c0                	test   %eax,%eax
80100d02:	79 ac                	jns    80100cb0 <exec+0x200>
80100d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d08:	83 ec 0c             	sub    $0xc,%esp
80100d0b:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d11:	e8 ca 63 00 00       	call   801070e0 <freevm>
80100d16:	83 c4 10             	add    $0x10,%esp
80100d19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100d1e:	e9 f9 fd ff ff       	jmp    80100b1c <exec+0x6c>
80100d23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100d29:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100d30:	89 d9                	mov    %ebx,%ecx
80100d32:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100d39:	00 00 00 00 
80100d3d:	29 c1                	sub    %eax,%ecx
80100d3f:	83 c0 0c             	add    $0xc,%eax
80100d42:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100d48:	29 c3                	sub    %eax,%ebx
80100d4a:	50                   	push   %eax
80100d4b:	52                   	push   %edx
80100d4c:	53                   	push   %ebx
80100d4d:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d53:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d5a:	ff ff ff 
80100d5d:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100d63:	e8 68 66 00 00       	call   801073d0 <copyout>
80100d68:	83 c4 10             	add    $0x10,%esp
80100d6b:	85 c0                	test   %eax,%eax
80100d6d:	78 99                	js     80100d08 <exec+0x258>
80100d6f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d72:	8b 55 08             	mov    0x8(%ebp),%edx
80100d75:	0f b6 00             	movzbl (%eax),%eax
80100d78:	84 c0                	test   %al,%al
80100d7a:	74 13                	je     80100d8f <exec+0x2df>
80100d7c:	89 d1                	mov    %edx,%ecx
80100d7e:	66 90                	xchg   %ax,%ax
80100d80:	83 c1 01             	add    $0x1,%ecx
80100d83:	3c 2f                	cmp    $0x2f,%al
80100d85:	0f b6 01             	movzbl (%ecx),%eax
80100d88:	0f 44 d1             	cmove  %ecx,%edx
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <exec+0x2d0>
80100d8f:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
80100d95:	83 ec 04             	sub    $0x4,%esp
80100d98:	6a 10                	push   $0x10
80100d9a:	89 f8                	mov    %edi,%eax
80100d9c:	52                   	push   %edx
80100d9d:	83 c0 70             	add    $0x70,%eax
80100da0:	50                   	push   %eax
80100da1:	e8 fa 3c 00 00       	call   80104aa0 <safestrcpy>
80100da6:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100dac:	89 f8                	mov    %edi,%eax
80100dae:	8b 7f 04             	mov    0x4(%edi),%edi
80100db1:	89 30                	mov    %esi,(%eax)
80100db3:	89 48 04             	mov    %ecx,0x4(%eax)
80100db6:	89 c1                	mov    %eax,%ecx
80100db8:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100dbe:	8b 40 1c             	mov    0x1c(%eax),%eax
80100dc1:	89 50 38             	mov    %edx,0x38(%eax)
80100dc4:	8b 41 1c             	mov    0x1c(%ecx),%eax
80100dc7:	89 58 44             	mov    %ebx,0x44(%eax)
80100dca:	89 0c 24             	mov    %ecx,(%esp)
80100dcd:	e8 2e 5f 00 00       	call   80106d00 <switchuvm>
80100dd2:	89 3c 24             	mov    %edi,(%esp)
80100dd5:	e8 06 63 00 00       	call   801070e0 <freevm>
80100dda:	83 c4 10             	add    $0x10,%esp
80100ddd:	31 c0                	xor    %eax,%eax
80100ddf:	e9 38 fd ff ff       	jmp    80100b1c <exec+0x6c>
80100de4:	e8 e7 1f 00 00       	call   80102dd0 <end_op>
80100de9:	83 ec 0c             	sub    $0xc,%esp
80100dec:	68 41 75 10 80       	push   $0x80107541
80100df1:	e8 aa f8 ff ff       	call   801006a0 <cprintf>
80100df6:	83 c4 10             	add    $0x10,%esp
80100df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dfe:	e9 19 fd ff ff       	jmp    80100b1c <exec+0x6c>
80100e03:	be 00 20 00 00       	mov    $0x2000,%esi
80100e08:	31 ff                	xor    %edi,%edi
80100e0a:	e9 39 fe ff ff       	jmp    80100c48 <exec+0x198>
80100e0f:	90                   	nop

80100e10 <fileinit>:
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	83 ec 10             	sub    $0x10,%esp
80100e16:	68 4d 75 10 80       	push   $0x8010754d
80100e1b:	68 60 ef 10 80       	push   $0x8010ef60
80100e20:	e8 2b 38 00 00       	call   80104650 <initlock>
80100e25:	83 c4 10             	add    $0x10,%esp
80100e28:	c9                   	leave  
80100e29:	c3                   	ret    
80100e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e30 <filealloc>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
80100e34:	bb 94 ef 10 80       	mov    $0x8010ef94,%ebx
80100e39:	83 ec 10             	sub    $0x10,%esp
80100e3c:	68 60 ef 10 80       	push   $0x8010ef60
80100e41:	e8 da 39 00 00       	call   80104820 <acquire>
80100e46:	83 c4 10             	add    $0x10,%esp
80100e49:	eb 10                	jmp    80100e5b <filealloc+0x2b>
80100e4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e4f:	90                   	nop
80100e50:	83 c3 18             	add    $0x18,%ebx
80100e53:	81 fb f4 f8 10 80    	cmp    $0x8010f8f4,%ebx
80100e59:	74 25                	je     80100e80 <filealloc+0x50>
80100e5b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e5e:	85 c0                	test   %eax,%eax
80100e60:	75 ee                	jne    80100e50 <filealloc+0x20>
80100e62:	83 ec 0c             	sub    $0xc,%esp
80100e65:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100e6c:	68 60 ef 10 80       	push   $0x8010ef60
80100e71:	e8 4a 39 00 00       	call   801047c0 <release>
80100e76:	89 d8                	mov    %ebx,%eax
80100e78:	83 c4 10             	add    $0x10,%esp
80100e7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e7e:	c9                   	leave  
80100e7f:	c3                   	ret    
80100e80:	83 ec 0c             	sub    $0xc,%esp
80100e83:	31 db                	xor    %ebx,%ebx
80100e85:	68 60 ef 10 80       	push   $0x8010ef60
80100e8a:	e8 31 39 00 00       	call   801047c0 <release>
80100e8f:	89 d8                	mov    %ebx,%eax
80100e91:	83 c4 10             	add    $0x10,%esp
80100e94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e97:	c9                   	leave  
80100e98:	c3                   	ret    
80100e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ea0 <filedup>:
80100ea0:	55                   	push   %ebp
80100ea1:	89 e5                	mov    %esp,%ebp
80100ea3:	53                   	push   %ebx
80100ea4:	83 ec 10             	sub    $0x10,%esp
80100ea7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eaa:	68 60 ef 10 80       	push   $0x8010ef60
80100eaf:	e8 6c 39 00 00       	call   80104820 <acquire>
80100eb4:	8b 43 04             	mov    0x4(%ebx),%eax
80100eb7:	83 c4 10             	add    $0x10,%esp
80100eba:	85 c0                	test   %eax,%eax
80100ebc:	7e 1a                	jle    80100ed8 <filedup+0x38>
80100ebe:	83 c0 01             	add    $0x1,%eax
80100ec1:	83 ec 0c             	sub    $0xc,%esp
80100ec4:	89 43 04             	mov    %eax,0x4(%ebx)
80100ec7:	68 60 ef 10 80       	push   $0x8010ef60
80100ecc:	e8 ef 38 00 00       	call   801047c0 <release>
80100ed1:	89 d8                	mov    %ebx,%eax
80100ed3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ed6:	c9                   	leave  
80100ed7:	c3                   	ret    
80100ed8:	83 ec 0c             	sub    $0xc,%esp
80100edb:	68 54 75 10 80       	push   $0x80107554
80100ee0:	e8 9b f4 ff ff       	call   80100380 <panic>
80100ee5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <fileclose>:
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	57                   	push   %edi
80100ef4:	56                   	push   %esi
80100ef5:	53                   	push   %ebx
80100ef6:	83 ec 28             	sub    $0x28,%esp
80100ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100efc:	68 60 ef 10 80       	push   $0x8010ef60
80100f01:	e8 1a 39 00 00       	call   80104820 <acquire>
80100f06:	8b 53 04             	mov    0x4(%ebx),%edx
80100f09:	83 c4 10             	add    $0x10,%esp
80100f0c:	85 d2                	test   %edx,%edx
80100f0e:	0f 8e a5 00 00 00    	jle    80100fb9 <fileclose+0xc9>
80100f14:	83 ea 01             	sub    $0x1,%edx
80100f17:	89 53 04             	mov    %edx,0x4(%ebx)
80100f1a:	75 44                	jne    80100f60 <fileclose+0x70>
80100f1c:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100f20:	83 ec 0c             	sub    $0xc,%esp
80100f23:	8b 3b                	mov    (%ebx),%edi
80100f25:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100f2b:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f2e:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f31:	8b 43 10             	mov    0x10(%ebx),%eax
80100f34:	68 60 ef 10 80       	push   $0x8010ef60
80100f39:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100f3c:	e8 7f 38 00 00       	call   801047c0 <release>
80100f41:	83 c4 10             	add    $0x10,%esp
80100f44:	83 ff 01             	cmp    $0x1,%edi
80100f47:	74 57                	je     80100fa0 <fileclose+0xb0>
80100f49:	83 ff 02             	cmp    $0x2,%edi
80100f4c:	74 2a                	je     80100f78 <fileclose+0x88>
80100f4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f51:	5b                   	pop    %ebx
80100f52:	5e                   	pop    %esi
80100f53:	5f                   	pop    %edi
80100f54:	5d                   	pop    %ebp
80100f55:	c3                   	ret    
80100f56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f5d:	8d 76 00             	lea    0x0(%esi),%esi
80100f60:	c7 45 08 60 ef 10 80 	movl   $0x8010ef60,0x8(%ebp)
80100f67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f6a:	5b                   	pop    %ebx
80100f6b:	5e                   	pop    %esi
80100f6c:	5f                   	pop    %edi
80100f6d:	5d                   	pop    %ebp
80100f6e:	e9 4d 38 00 00       	jmp    801047c0 <release>
80100f73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f77:	90                   	nop
80100f78:	e8 e3 1d 00 00       	call   80102d60 <begin_op>
80100f7d:	83 ec 0c             	sub    $0xc,%esp
80100f80:	ff 75 e0             	push   -0x20(%ebp)
80100f83:	e8 28 09 00 00       	call   801018b0 <iput>
80100f88:	83 c4 10             	add    $0x10,%esp
80100f8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8e:	5b                   	pop    %ebx
80100f8f:	5e                   	pop    %esi
80100f90:	5f                   	pop    %edi
80100f91:	5d                   	pop    %ebp
80100f92:	e9 39 1e 00 00       	jmp    80102dd0 <end_op>
80100f97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f9e:	66 90                	xchg   %ax,%ax
80100fa0:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100fa4:	83 ec 08             	sub    $0x8,%esp
80100fa7:	53                   	push   %ebx
80100fa8:	56                   	push   %esi
80100fa9:	e8 82 25 00 00       	call   80103530 <pipeclose>
80100fae:	83 c4 10             	add    $0x10,%esp
80100fb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb4:	5b                   	pop    %ebx
80100fb5:	5e                   	pop    %esi
80100fb6:	5f                   	pop    %edi
80100fb7:	5d                   	pop    %ebp
80100fb8:	c3                   	ret    
80100fb9:	83 ec 0c             	sub    $0xc,%esp
80100fbc:	68 5c 75 10 80       	push   $0x8010755c
80100fc1:	e8 ba f3 ff ff       	call   80100380 <panic>
80100fc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100fcd:	8d 76 00             	lea    0x0(%esi),%esi

80100fd0 <filestat>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	53                   	push   %ebx
80100fd4:	83 ec 04             	sub    $0x4,%esp
80100fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fda:	83 3b 02             	cmpl   $0x2,(%ebx)
80100fdd:	75 31                	jne    80101010 <filestat+0x40>
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	ff 73 10             	push   0x10(%ebx)
80100fe5:	e8 96 07 00 00       	call   80101780 <ilock>
80100fea:	58                   	pop    %eax
80100feb:	5a                   	pop    %edx
80100fec:	ff 75 0c             	push   0xc(%ebp)
80100fef:	ff 73 10             	push   0x10(%ebx)
80100ff2:	e8 69 0a 00 00       	call   80101a60 <stati>
80100ff7:	59                   	pop    %ecx
80100ff8:	ff 73 10             	push   0x10(%ebx)
80100ffb:	e8 60 08 00 00       	call   80101860 <iunlock>
80101000:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101003:	83 c4 10             	add    $0x10,%esp
80101006:	31 c0                	xor    %eax,%eax
80101008:	c9                   	leave  
80101009:	c3                   	ret    
8010100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101010:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101013:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101018:	c9                   	leave  
80101019:	c3                   	ret    
8010101a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101020 <fileread>:
80101020:	55                   	push   %ebp
80101021:	89 e5                	mov    %esp,%ebp
80101023:	57                   	push   %edi
80101024:	56                   	push   %esi
80101025:	53                   	push   %ebx
80101026:	83 ec 0c             	sub    $0xc,%esp
80101029:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010102c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010102f:	8b 7d 10             	mov    0x10(%ebp),%edi
80101032:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101036:	74 60                	je     80101098 <fileread+0x78>
80101038:	8b 03                	mov    (%ebx),%eax
8010103a:	83 f8 01             	cmp    $0x1,%eax
8010103d:	74 41                	je     80101080 <fileread+0x60>
8010103f:	83 f8 02             	cmp    $0x2,%eax
80101042:	75 5b                	jne    8010109f <fileread+0x7f>
80101044:	83 ec 0c             	sub    $0xc,%esp
80101047:	ff 73 10             	push   0x10(%ebx)
8010104a:	e8 31 07 00 00       	call   80101780 <ilock>
8010104f:	57                   	push   %edi
80101050:	ff 73 14             	push   0x14(%ebx)
80101053:	56                   	push   %esi
80101054:	ff 73 10             	push   0x10(%ebx)
80101057:	e8 34 0a 00 00       	call   80101a90 <readi>
8010105c:	83 c4 20             	add    $0x20,%esp
8010105f:	89 c6                	mov    %eax,%esi
80101061:	85 c0                	test   %eax,%eax
80101063:	7e 03                	jle    80101068 <fileread+0x48>
80101065:	01 43 14             	add    %eax,0x14(%ebx)
80101068:	83 ec 0c             	sub    $0xc,%esp
8010106b:	ff 73 10             	push   0x10(%ebx)
8010106e:	e8 ed 07 00 00       	call   80101860 <iunlock>
80101073:	83 c4 10             	add    $0x10,%esp
80101076:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101079:	89 f0                	mov    %esi,%eax
8010107b:	5b                   	pop    %ebx
8010107c:	5e                   	pop    %esi
8010107d:	5f                   	pop    %edi
8010107e:	5d                   	pop    %ebp
8010107f:	c3                   	ret    
80101080:	8b 43 0c             	mov    0xc(%ebx),%eax
80101083:	89 45 08             	mov    %eax,0x8(%ebp)
80101086:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101089:	5b                   	pop    %ebx
8010108a:	5e                   	pop    %esi
8010108b:	5f                   	pop    %edi
8010108c:	5d                   	pop    %ebp
8010108d:	e9 3e 26 00 00       	jmp    801036d0 <piperead>
80101092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101098:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010109d:	eb d7                	jmp    80101076 <fileread+0x56>
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	68 66 75 10 80       	push   $0x80107566
801010a7:	e8 d4 f2 ff ff       	call   80100380 <panic>
801010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801010b0 <filewrite>:
801010b0:	55                   	push   %ebp
801010b1:	89 e5                	mov    %esp,%ebp
801010b3:	57                   	push   %edi
801010b4:	56                   	push   %esi
801010b5:	53                   	push   %ebx
801010b6:	83 ec 1c             	sub    $0x1c,%esp
801010b9:	8b 45 0c             	mov    0xc(%ebp),%eax
801010bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801010bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010c2:	8b 45 10             	mov    0x10(%ebp),%eax
801010c5:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
801010c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801010cc:	0f 84 bd 00 00 00    	je     8010118f <filewrite+0xdf>
801010d2:	8b 03                	mov    (%ebx),%eax
801010d4:	83 f8 01             	cmp    $0x1,%eax
801010d7:	0f 84 bf 00 00 00    	je     8010119c <filewrite+0xec>
801010dd:	83 f8 02             	cmp    $0x2,%eax
801010e0:	0f 85 c8 00 00 00    	jne    801011ae <filewrite+0xfe>
801010e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010e9:	31 f6                	xor    %esi,%esi
801010eb:	85 c0                	test   %eax,%eax
801010ed:	7f 30                	jg     8010111f <filewrite+0x6f>
801010ef:	e9 94 00 00 00       	jmp    80101188 <filewrite+0xd8>
801010f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010f8:	01 43 14             	add    %eax,0x14(%ebx)
801010fb:	83 ec 0c             	sub    $0xc,%esp
801010fe:	ff 73 10             	push   0x10(%ebx)
80101101:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101104:	e8 57 07 00 00       	call   80101860 <iunlock>
80101109:	e8 c2 1c 00 00       	call   80102dd0 <end_op>
8010110e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101111:	83 c4 10             	add    $0x10,%esp
80101114:	39 c7                	cmp    %eax,%edi
80101116:	75 5c                	jne    80101174 <filewrite+0xc4>
80101118:	01 fe                	add    %edi,%esi
8010111a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010111d:	7e 69                	jle    80101188 <filewrite+0xd8>
8010111f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101122:	b8 00 06 00 00       	mov    $0x600,%eax
80101127:	29 f7                	sub    %esi,%edi
80101129:	39 c7                	cmp    %eax,%edi
8010112b:	0f 4f f8             	cmovg  %eax,%edi
8010112e:	e8 2d 1c 00 00       	call   80102d60 <begin_op>
80101133:	83 ec 0c             	sub    $0xc,%esp
80101136:	ff 73 10             	push   0x10(%ebx)
80101139:	e8 42 06 00 00       	call   80101780 <ilock>
8010113e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101141:	57                   	push   %edi
80101142:	ff 73 14             	push   0x14(%ebx)
80101145:	01 f0                	add    %esi,%eax
80101147:	50                   	push   %eax
80101148:	ff 73 10             	push   0x10(%ebx)
8010114b:	e8 40 0a 00 00       	call   80101b90 <writei>
80101150:	83 c4 20             	add    $0x20,%esp
80101153:	85 c0                	test   %eax,%eax
80101155:	7f a1                	jg     801010f8 <filewrite+0x48>
80101157:	83 ec 0c             	sub    $0xc,%esp
8010115a:	ff 73 10             	push   0x10(%ebx)
8010115d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101160:	e8 fb 06 00 00       	call   80101860 <iunlock>
80101165:	e8 66 1c 00 00       	call   80102dd0 <end_op>
8010116a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010116d:	83 c4 10             	add    $0x10,%esp
80101170:	85 c0                	test   %eax,%eax
80101172:	75 1b                	jne    8010118f <filewrite+0xdf>
80101174:	83 ec 0c             	sub    $0xc,%esp
80101177:	68 6f 75 10 80       	push   $0x8010756f
8010117c:	e8 ff f1 ff ff       	call   80100380 <panic>
80101181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101188:	89 f0                	mov    %esi,%eax
8010118a:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
8010118d:	74 05                	je     80101194 <filewrite+0xe4>
8010118f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101197:	5b                   	pop    %ebx
80101198:	5e                   	pop    %esi
80101199:	5f                   	pop    %edi
8010119a:	5d                   	pop    %ebp
8010119b:	c3                   	ret    
8010119c:	8b 43 0c             	mov    0xc(%ebx),%eax
8010119f:	89 45 08             	mov    %eax,0x8(%ebp)
801011a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011a5:	5b                   	pop    %ebx
801011a6:	5e                   	pop    %esi
801011a7:	5f                   	pop    %edi
801011a8:	5d                   	pop    %ebp
801011a9:	e9 22 24 00 00       	jmp    801035d0 <pipewrite>
801011ae:	83 ec 0c             	sub    $0xc,%esp
801011b1:	68 75 75 10 80       	push   $0x80107575
801011b6:	e8 c5 f1 ff ff       	call   80100380 <panic>
801011bb:	66 90                	xchg   %ax,%ax
801011bd:	66 90                	xchg   %ax,%ax
801011bf:	90                   	nop

801011c0 <bfree>:
801011c0:	55                   	push   %ebp
801011c1:	89 c1                	mov    %eax,%ecx
801011c3:	89 d0                	mov    %edx,%eax
801011c5:	c1 e8 0c             	shr    $0xc,%eax
801011c8:	03 05 cc 15 11 80    	add    0x801115cc,%eax
801011ce:	89 e5                	mov    %esp,%ebp
801011d0:	56                   	push   %esi
801011d1:	53                   	push   %ebx
801011d2:	89 d3                	mov    %edx,%ebx
801011d4:	83 ec 08             	sub    $0x8,%esp
801011d7:	50                   	push   %eax
801011d8:	51                   	push   %ecx
801011d9:	e8 f2 ee ff ff       	call   801000d0 <bread>
801011de:	89 d9                	mov    %ebx,%ecx
801011e0:	c1 fb 03             	sar    $0x3,%ebx
801011e3:	83 c4 10             	add    $0x10,%esp
801011e6:	89 c6                	mov    %eax,%esi
801011e8:	83 e1 07             	and    $0x7,%ecx
801011eb:	b8 01 00 00 00       	mov    $0x1,%eax
801011f0:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801011f6:	d3 e0                	shl    %cl,%eax
801011f8:	0f b6 4c 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%ecx
801011fd:	85 c1                	test   %eax,%ecx
801011ff:	74 23                	je     80101224 <bfree+0x64>
80101201:	f7 d0                	not    %eax
80101203:	83 ec 0c             	sub    $0xc,%esp
80101206:	21 c8                	and    %ecx,%eax
80101208:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010120c:	56                   	push   %esi
8010120d:	e8 2e 1d 00 00       	call   80102f40 <log_write>
80101212:	89 34 24             	mov    %esi,(%esp)
80101215:	e8 d6 ef ff ff       	call   801001f0 <brelse>
8010121a:	83 c4 10             	add    $0x10,%esp
8010121d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101220:	5b                   	pop    %ebx
80101221:	5e                   	pop    %esi
80101222:	5d                   	pop    %ebp
80101223:	c3                   	ret    
80101224:	83 ec 0c             	sub    $0xc,%esp
80101227:	68 7f 75 10 80       	push   $0x8010757f
8010122c:	e8 4f f1 ff ff       	call   80100380 <panic>
80101231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010123f:	90                   	nop

80101240 <balloc>:
80101240:	55                   	push   %ebp
80101241:	89 e5                	mov    %esp,%ebp
80101243:	57                   	push   %edi
80101244:	56                   	push   %esi
80101245:	53                   	push   %ebx
80101246:	83 ec 1c             	sub    $0x1c,%esp
80101249:	8b 0d b4 15 11 80    	mov    0x801115b4,%ecx
8010124f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101252:	85 c9                	test   %ecx,%ecx
80101254:	0f 84 87 00 00 00    	je     801012e1 <balloc+0xa1>
8010125a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101261:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101264:	83 ec 08             	sub    $0x8,%esp
80101267:	89 f0                	mov    %esi,%eax
80101269:	c1 f8 0c             	sar    $0xc,%eax
8010126c:	03 05 cc 15 11 80    	add    0x801115cc,%eax
80101272:	50                   	push   %eax
80101273:	ff 75 d8             	push   -0x28(%ebp)
80101276:	e8 55 ee ff ff       	call   801000d0 <bread>
8010127b:	83 c4 10             	add    $0x10,%esp
8010127e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101281:	a1 b4 15 11 80       	mov    0x801115b4,%eax
80101286:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101289:	31 c0                	xor    %eax,%eax
8010128b:	eb 2f                	jmp    801012bc <balloc+0x7c>
8010128d:	8d 76 00             	lea    0x0(%esi),%esi
80101290:	89 c1                	mov    %eax,%ecx
80101292:	bb 01 00 00 00       	mov    $0x1,%ebx
80101297:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010129a:	83 e1 07             	and    $0x7,%ecx
8010129d:	d3 e3                	shl    %cl,%ebx
8010129f:	89 c1                	mov    %eax,%ecx
801012a1:	c1 f9 03             	sar    $0x3,%ecx
801012a4:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
801012a9:	89 fa                	mov    %edi,%edx
801012ab:	85 df                	test   %ebx,%edi
801012ad:	74 41                	je     801012f0 <balloc+0xb0>
801012af:	83 c0 01             	add    $0x1,%eax
801012b2:	83 c6 01             	add    $0x1,%esi
801012b5:	3d 00 10 00 00       	cmp    $0x1000,%eax
801012ba:	74 05                	je     801012c1 <balloc+0x81>
801012bc:	39 75 e0             	cmp    %esi,-0x20(%ebp)
801012bf:	77 cf                	ja     80101290 <balloc+0x50>
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	ff 75 e4             	push   -0x1c(%ebp)
801012c7:	e8 24 ef ff ff       	call   801001f0 <brelse>
801012cc:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801012d3:	83 c4 10             	add    $0x10,%esp
801012d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801012d9:	39 05 b4 15 11 80    	cmp    %eax,0x801115b4
801012df:	77 80                	ja     80101261 <balloc+0x21>
801012e1:	83 ec 0c             	sub    $0xc,%esp
801012e4:	68 92 75 10 80       	push   $0x80107592
801012e9:	e8 92 f0 ff ff       	call   80100380 <panic>
801012ee:	66 90                	xchg   %ax,%ax
801012f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801012f3:	83 ec 0c             	sub    $0xc,%esp
801012f6:	09 da                	or     %ebx,%edx
801012f8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801012fc:	57                   	push   %edi
801012fd:	e8 3e 1c 00 00       	call   80102f40 <log_write>
80101302:	89 3c 24             	mov    %edi,(%esp)
80101305:	e8 e6 ee ff ff       	call   801001f0 <brelse>
8010130a:	58                   	pop    %eax
8010130b:	5a                   	pop    %edx
8010130c:	56                   	push   %esi
8010130d:	ff 75 d8             	push   -0x28(%ebp)
80101310:	e8 bb ed ff ff       	call   801000d0 <bread>
80101315:	83 c4 0c             	add    $0xc,%esp
80101318:	89 c3                	mov    %eax,%ebx
8010131a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010131d:	68 00 02 00 00       	push   $0x200
80101322:	6a 00                	push   $0x0
80101324:	50                   	push   %eax
80101325:	e8 b6 35 00 00       	call   801048e0 <memset>
8010132a:	89 1c 24             	mov    %ebx,(%esp)
8010132d:	e8 0e 1c 00 00       	call   80102f40 <log_write>
80101332:	89 1c 24             	mov    %ebx,(%esp)
80101335:	e8 b6 ee ff ff       	call   801001f0 <brelse>
8010133a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133d:	89 f0                	mov    %esi,%eax
8010133f:	5b                   	pop    %ebx
80101340:	5e                   	pop    %esi
80101341:	5f                   	pop    %edi
80101342:	5d                   	pop    %ebp
80101343:	c3                   	ret    
80101344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010134b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010134f:	90                   	nop

80101350 <iget>:
80101350:	55                   	push   %ebp
80101351:	89 e5                	mov    %esp,%ebp
80101353:	57                   	push   %edi
80101354:	89 c7                	mov    %eax,%edi
80101356:	56                   	push   %esi
80101357:	31 f6                	xor    %esi,%esi
80101359:	53                   	push   %ebx
8010135a:	bb 94 f9 10 80       	mov    $0x8010f994,%ebx
8010135f:	83 ec 28             	sub    $0x28,%esp
80101362:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101365:	68 60 f9 10 80       	push   $0x8010f960
8010136a:	e8 b1 34 00 00       	call   80104820 <acquire>
8010136f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101372:	83 c4 10             	add    $0x10,%esp
80101375:	eb 1b                	jmp    80101392 <iget+0x42>
80101377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010137e:	66 90                	xchg   %ax,%ax
80101380:	39 3b                	cmp    %edi,(%ebx)
80101382:	74 6c                	je     801013f0 <iget+0xa0>
80101384:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010138a:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101390:	73 26                	jae    801013b8 <iget+0x68>
80101392:	8b 43 08             	mov    0x8(%ebx),%eax
80101395:	85 c0                	test   %eax,%eax
80101397:	7f e7                	jg     80101380 <iget+0x30>
80101399:	85 f6                	test   %esi,%esi
8010139b:	75 e7                	jne    80101384 <iget+0x34>
8010139d:	85 c0                	test   %eax,%eax
8010139f:	75 76                	jne    80101417 <iget+0xc7>
801013a1:	89 de                	mov    %ebx,%esi
801013a3:	81 c3 90 00 00 00    	add    $0x90,%ebx
801013a9:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
801013af:	72 e1                	jb     80101392 <iget+0x42>
801013b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801013b8:	85 f6                	test   %esi,%esi
801013ba:	74 79                	je     80101435 <iget+0xe5>
801013bc:	83 ec 0c             	sub    $0xc,%esp
801013bf:	89 3e                	mov    %edi,(%esi)
801013c1:	89 56 04             	mov    %edx,0x4(%esi)
801013c4:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801013cb:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801013d2:	68 60 f9 10 80       	push   $0x8010f960
801013d7:	e8 e4 33 00 00       	call   801047c0 <release>
801013dc:	83 c4 10             	add    $0x10,%esp
801013df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013e2:	89 f0                	mov    %esi,%eax
801013e4:	5b                   	pop    %ebx
801013e5:	5e                   	pop    %esi
801013e6:	5f                   	pop    %edi
801013e7:	5d                   	pop    %ebp
801013e8:	c3                   	ret    
801013e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801013f0:	39 53 04             	cmp    %edx,0x4(%ebx)
801013f3:	75 8f                	jne    80101384 <iget+0x34>
801013f5:	83 ec 0c             	sub    $0xc,%esp
801013f8:	83 c0 01             	add    $0x1,%eax
801013fb:	89 de                	mov    %ebx,%esi
801013fd:	68 60 f9 10 80       	push   $0x8010f960
80101402:	89 43 08             	mov    %eax,0x8(%ebx)
80101405:	e8 b6 33 00 00       	call   801047c0 <release>
8010140a:	83 c4 10             	add    $0x10,%esp
8010140d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101410:	89 f0                	mov    %esi,%eax
80101412:	5b                   	pop    %ebx
80101413:	5e                   	pop    %esi
80101414:	5f                   	pop    %edi
80101415:	5d                   	pop    %ebp
80101416:	c3                   	ret    
80101417:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010141d:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101423:	73 10                	jae    80101435 <iget+0xe5>
80101425:	8b 43 08             	mov    0x8(%ebx),%eax
80101428:	85 c0                	test   %eax,%eax
8010142a:	0f 8f 50 ff ff ff    	jg     80101380 <iget+0x30>
80101430:	e9 68 ff ff ff       	jmp    8010139d <iget+0x4d>
80101435:	83 ec 0c             	sub    $0xc,%esp
80101438:	68 a8 75 10 80       	push   $0x801075a8
8010143d:	e8 3e ef ff ff       	call   80100380 <panic>
80101442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101450 <bmap>:
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	57                   	push   %edi
80101454:	56                   	push   %esi
80101455:	89 c6                	mov    %eax,%esi
80101457:	53                   	push   %ebx
80101458:	83 ec 1c             	sub    $0x1c,%esp
8010145b:	83 fa 0b             	cmp    $0xb,%edx
8010145e:	0f 86 8c 00 00 00    	jbe    801014f0 <bmap+0xa0>
80101464:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101467:	83 fb 7f             	cmp    $0x7f,%ebx
8010146a:	0f 87 a2 00 00 00    	ja     80101512 <bmap+0xc2>
80101470:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101476:	85 c0                	test   %eax,%eax
80101478:	74 5e                	je     801014d8 <bmap+0x88>
8010147a:	83 ec 08             	sub    $0x8,%esp
8010147d:	50                   	push   %eax
8010147e:	ff 36                	push   (%esi)
80101480:	e8 4b ec ff ff       	call   801000d0 <bread>
80101485:	83 c4 10             	add    $0x10,%esp
80101488:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
8010148c:	89 c2                	mov    %eax,%edx
8010148e:	8b 3b                	mov    (%ebx),%edi
80101490:	85 ff                	test   %edi,%edi
80101492:	74 1c                	je     801014b0 <bmap+0x60>
80101494:	83 ec 0c             	sub    $0xc,%esp
80101497:	52                   	push   %edx
80101498:	e8 53 ed ff ff       	call   801001f0 <brelse>
8010149d:	83 c4 10             	add    $0x10,%esp
801014a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014a3:	89 f8                	mov    %edi,%eax
801014a5:	5b                   	pop    %ebx
801014a6:	5e                   	pop    %esi
801014a7:	5f                   	pop    %edi
801014a8:	5d                   	pop    %ebp
801014a9:	c3                   	ret    
801014aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801014b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801014b3:	8b 06                	mov    (%esi),%eax
801014b5:	e8 86 fd ff ff       	call   80101240 <balloc>
801014ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014bd:	83 ec 0c             	sub    $0xc,%esp
801014c0:	89 03                	mov    %eax,(%ebx)
801014c2:	89 c7                	mov    %eax,%edi
801014c4:	52                   	push   %edx
801014c5:	e8 76 1a 00 00       	call   80102f40 <log_write>
801014ca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014cd:	83 c4 10             	add    $0x10,%esp
801014d0:	eb c2                	jmp    80101494 <bmap+0x44>
801014d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801014d8:	8b 06                	mov    (%esi),%eax
801014da:	e8 61 fd ff ff       	call   80101240 <balloc>
801014df:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801014e5:	eb 93                	jmp    8010147a <bmap+0x2a>
801014e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801014ee:	66 90                	xchg   %ax,%ax
801014f0:	8d 5a 14             	lea    0x14(%edx),%ebx
801014f3:	8b 7c 98 0c          	mov    0xc(%eax,%ebx,4),%edi
801014f7:	85 ff                	test   %edi,%edi
801014f9:	75 a5                	jne    801014a0 <bmap+0x50>
801014fb:	8b 00                	mov    (%eax),%eax
801014fd:	e8 3e fd ff ff       	call   80101240 <balloc>
80101502:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
80101506:	89 c7                	mov    %eax,%edi
80101508:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010150b:	5b                   	pop    %ebx
8010150c:	89 f8                	mov    %edi,%eax
8010150e:	5e                   	pop    %esi
8010150f:	5f                   	pop    %edi
80101510:	5d                   	pop    %ebp
80101511:	c3                   	ret    
80101512:	83 ec 0c             	sub    $0xc,%esp
80101515:	68 b8 75 10 80       	push   $0x801075b8
8010151a:	e8 61 ee ff ff       	call   80100380 <panic>
8010151f:	90                   	nop

80101520 <readsb>:
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	56                   	push   %esi
80101524:	53                   	push   %ebx
80101525:	8b 75 0c             	mov    0xc(%ebp),%esi
80101528:	83 ec 08             	sub    $0x8,%esp
8010152b:	6a 01                	push   $0x1
8010152d:	ff 75 08             	push   0x8(%ebp)
80101530:	e8 9b eb ff ff       	call   801000d0 <bread>
80101535:	83 c4 0c             	add    $0xc,%esp
80101538:	89 c3                	mov    %eax,%ebx
8010153a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010153d:	6a 1c                	push   $0x1c
8010153f:	50                   	push   %eax
80101540:	56                   	push   %esi
80101541:	e8 3a 34 00 00       	call   80104980 <memmove>
80101546:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101549:	83 c4 10             	add    $0x10,%esp
8010154c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010154f:	5b                   	pop    %ebx
80101550:	5e                   	pop    %esi
80101551:	5d                   	pop    %ebp
80101552:	e9 99 ec ff ff       	jmp    801001f0 <brelse>
80101557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010155e:	66 90                	xchg   %ax,%ax

80101560 <iinit>:
80101560:	55                   	push   %ebp
80101561:	89 e5                	mov    %esp,%ebp
80101563:	53                   	push   %ebx
80101564:	bb a0 f9 10 80       	mov    $0x8010f9a0,%ebx
80101569:	83 ec 0c             	sub    $0xc,%esp
8010156c:	68 cb 75 10 80       	push   $0x801075cb
80101571:	68 60 f9 10 80       	push   $0x8010f960
80101576:	e8 d5 30 00 00       	call   80104650 <initlock>
8010157b:	83 c4 10             	add    $0x10,%esp
8010157e:	66 90                	xchg   %ax,%ax
80101580:	83 ec 08             	sub    $0x8,%esp
80101583:	68 d2 75 10 80       	push   $0x801075d2
80101588:	53                   	push   %ebx
80101589:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010158f:	e8 8c 2f 00 00       	call   80104520 <initsleeplock>
80101594:	83 c4 10             	add    $0x10,%esp
80101597:	81 fb c0 15 11 80    	cmp    $0x801115c0,%ebx
8010159d:	75 e1                	jne    80101580 <iinit+0x20>
8010159f:	83 ec 08             	sub    $0x8,%esp
801015a2:	6a 01                	push   $0x1
801015a4:	ff 75 08             	push   0x8(%ebp)
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
801015ac:	83 c4 0c             	add    $0xc,%esp
801015af:	89 c3                	mov    %eax,%ebx
801015b1:	8d 40 5c             	lea    0x5c(%eax),%eax
801015b4:	6a 1c                	push   $0x1c
801015b6:	50                   	push   %eax
801015b7:	68 b4 15 11 80       	push   $0x801115b4
801015bc:	e8 bf 33 00 00       	call   80104980 <memmove>
801015c1:	89 1c 24             	mov    %ebx,(%esp)
801015c4:	e8 27 ec ff ff       	call   801001f0 <brelse>
801015c9:	ff 35 cc 15 11 80    	push   0x801115cc
801015cf:	ff 35 c8 15 11 80    	push   0x801115c8
801015d5:	ff 35 c4 15 11 80    	push   0x801115c4
801015db:	ff 35 c0 15 11 80    	push   0x801115c0
801015e1:	ff 35 bc 15 11 80    	push   0x801115bc
801015e7:	ff 35 b8 15 11 80    	push   0x801115b8
801015ed:	ff 35 b4 15 11 80    	push   0x801115b4
801015f3:	68 38 76 10 80       	push   $0x80107638
801015f8:	e8 a3 f0 ff ff       	call   801006a0 <cprintf>
801015fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101600:	83 c4 30             	add    $0x30,%esp
80101603:	c9                   	leave  
80101604:	c3                   	ret    
80101605:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010160c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101610 <ialloc>:
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	57                   	push   %edi
80101614:	56                   	push   %esi
80101615:	53                   	push   %ebx
80101616:	83 ec 1c             	sub    $0x1c,%esp
80101619:	8b 45 0c             	mov    0xc(%ebp),%eax
8010161c:	83 3d bc 15 11 80 01 	cmpl   $0x1,0x801115bc
80101623:	8b 75 08             	mov    0x8(%ebp),%esi
80101626:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101629:	0f 86 91 00 00 00    	jbe    801016c0 <ialloc+0xb0>
8010162f:	bf 01 00 00 00       	mov    $0x1,%edi
80101634:	eb 21                	jmp    80101657 <ialloc+0x47>
80101636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010163d:	8d 76 00             	lea    0x0(%esi),%esi
80101640:	83 ec 0c             	sub    $0xc,%esp
80101643:	83 c7 01             	add    $0x1,%edi
80101646:	53                   	push   %ebx
80101647:	e8 a4 eb ff ff       	call   801001f0 <brelse>
8010164c:	83 c4 10             	add    $0x10,%esp
8010164f:	3b 3d bc 15 11 80    	cmp    0x801115bc,%edi
80101655:	73 69                	jae    801016c0 <ialloc+0xb0>
80101657:	89 f8                	mov    %edi,%eax
80101659:	83 ec 08             	sub    $0x8,%esp
8010165c:	c1 e8 03             	shr    $0x3,%eax
8010165f:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101665:	50                   	push   %eax
80101666:	56                   	push   %esi
80101667:	e8 64 ea ff ff       	call   801000d0 <bread>
8010166c:	83 c4 10             	add    $0x10,%esp
8010166f:	89 c3                	mov    %eax,%ebx
80101671:	89 f8                	mov    %edi,%eax
80101673:	83 e0 07             	and    $0x7,%eax
80101676:	c1 e0 06             	shl    $0x6,%eax
80101679:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
8010167d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101681:	75 bd                	jne    80101640 <ialloc+0x30>
80101683:	83 ec 04             	sub    $0x4,%esp
80101686:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101689:	6a 40                	push   $0x40
8010168b:	6a 00                	push   $0x0
8010168d:	51                   	push   %ecx
8010168e:	e8 4d 32 00 00       	call   801048e0 <memset>
80101693:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101697:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010169a:	66 89 01             	mov    %ax,(%ecx)
8010169d:	89 1c 24             	mov    %ebx,(%esp)
801016a0:	e8 9b 18 00 00       	call   80102f40 <log_write>
801016a5:	89 1c 24             	mov    %ebx,(%esp)
801016a8:	e8 43 eb ff ff       	call   801001f0 <brelse>
801016ad:	83 c4 10             	add    $0x10,%esp
801016b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801016b3:	89 fa                	mov    %edi,%edx
801016b5:	5b                   	pop    %ebx
801016b6:	89 f0                	mov    %esi,%eax
801016b8:	5e                   	pop    %esi
801016b9:	5f                   	pop    %edi
801016ba:	5d                   	pop    %ebp
801016bb:	e9 90 fc ff ff       	jmp    80101350 <iget>
801016c0:	83 ec 0c             	sub    $0xc,%esp
801016c3:	68 d8 75 10 80       	push   $0x801075d8
801016c8:	e8 b3 ec ff ff       	call   80100380 <panic>
801016cd:	8d 76 00             	lea    0x0(%esi),%esi

801016d0 <iupdate>:
801016d0:	55                   	push   %ebp
801016d1:	89 e5                	mov    %esp,%ebp
801016d3:	56                   	push   %esi
801016d4:	53                   	push   %ebx
801016d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016d8:	8b 43 04             	mov    0x4(%ebx),%eax
801016db:	83 c3 5c             	add    $0x5c,%ebx
801016de:	83 ec 08             	sub    $0x8,%esp
801016e1:	c1 e8 03             	shr    $0x3,%eax
801016e4:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801016ea:	50                   	push   %eax
801016eb:	ff 73 a4             	push   -0x5c(%ebx)
801016ee:	e8 dd e9 ff ff       	call   801000d0 <bread>
801016f3:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801016f7:	83 c4 0c             	add    $0xc,%esp
801016fa:	89 c6                	mov    %eax,%esi
801016fc:	8b 43 a8             	mov    -0x58(%ebx),%eax
801016ff:	83 e0 07             	and    $0x7,%eax
80101702:	c1 e0 06             	shl    $0x6,%eax
80101705:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101709:	66 89 10             	mov    %dx,(%eax)
8010170c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101710:	83 c0 0c             	add    $0xc,%eax
80101713:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101717:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010171b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010171f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101723:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101727:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010172a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010172d:	6a 34                	push   $0x34
8010172f:	53                   	push   %ebx
80101730:	50                   	push   %eax
80101731:	e8 4a 32 00 00       	call   80104980 <memmove>
80101736:	89 34 24             	mov    %esi,(%esp)
80101739:	e8 02 18 00 00       	call   80102f40 <log_write>
8010173e:	89 75 08             	mov    %esi,0x8(%ebp)
80101741:	83 c4 10             	add    $0x10,%esp
80101744:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101747:	5b                   	pop    %ebx
80101748:	5e                   	pop    %esi
80101749:	5d                   	pop    %ebp
8010174a:	e9 a1 ea ff ff       	jmp    801001f0 <brelse>
8010174f:	90                   	nop

80101750 <idup>:
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	53                   	push   %ebx
80101754:	83 ec 10             	sub    $0x10,%esp
80101757:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010175a:	68 60 f9 10 80       	push   $0x8010f960
8010175f:	e8 bc 30 00 00       	call   80104820 <acquire>
80101764:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101768:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010176f:	e8 4c 30 00 00       	call   801047c0 <release>
80101774:	89 d8                	mov    %ebx,%eax
80101776:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101779:	c9                   	leave  
8010177a:	c3                   	ret    
8010177b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010177f:	90                   	nop

80101780 <ilock>:
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	56                   	push   %esi
80101784:	53                   	push   %ebx
80101785:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101788:	85 db                	test   %ebx,%ebx
8010178a:	0f 84 b7 00 00 00    	je     80101847 <ilock+0xc7>
80101790:	8b 53 08             	mov    0x8(%ebx),%edx
80101793:	85 d2                	test   %edx,%edx
80101795:	0f 8e ac 00 00 00    	jle    80101847 <ilock+0xc7>
8010179b:	83 ec 0c             	sub    $0xc,%esp
8010179e:	8d 43 0c             	lea    0xc(%ebx),%eax
801017a1:	50                   	push   %eax
801017a2:	e8 b9 2d 00 00       	call   80104560 <acquiresleep>
801017a7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801017aa:	83 c4 10             	add    $0x10,%esp
801017ad:	85 c0                	test   %eax,%eax
801017af:	74 0f                	je     801017c0 <ilock+0x40>
801017b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017b4:	5b                   	pop    %ebx
801017b5:	5e                   	pop    %esi
801017b6:	5d                   	pop    %ebp
801017b7:	c3                   	ret    
801017b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017bf:	90                   	nop
801017c0:	8b 43 04             	mov    0x4(%ebx),%eax
801017c3:	83 ec 08             	sub    $0x8,%esp
801017c6:	c1 e8 03             	shr    $0x3,%eax
801017c9:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801017cf:	50                   	push   %eax
801017d0:	ff 33                	push   (%ebx)
801017d2:	e8 f9 e8 ff ff       	call   801000d0 <bread>
801017d7:	83 c4 0c             	add    $0xc,%esp
801017da:	89 c6                	mov    %eax,%esi
801017dc:	8b 43 04             	mov    0x4(%ebx),%eax
801017df:	83 e0 07             	and    $0x7,%eax
801017e2:	c1 e0 06             	shl    $0x6,%eax
801017e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801017e9:	0f b7 10             	movzwl (%eax),%edx
801017ec:	83 c0 0c             	add    $0xc,%eax
801017ef:	66 89 53 50          	mov    %dx,0x50(%ebx)
801017f3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017f7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801017fb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017ff:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101803:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101807:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010180b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010180e:	89 53 58             	mov    %edx,0x58(%ebx)
80101811:	6a 34                	push   $0x34
80101813:	50                   	push   %eax
80101814:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101817:	50                   	push   %eax
80101818:	e8 63 31 00 00       	call   80104980 <memmove>
8010181d:	89 34 24             	mov    %esi,(%esp)
80101820:	e8 cb e9 ff ff       	call   801001f0 <brelse>
80101825:	83 c4 10             	add    $0x10,%esp
80101828:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010182d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101834:	0f 85 77 ff ff ff    	jne    801017b1 <ilock+0x31>
8010183a:	83 ec 0c             	sub    $0xc,%esp
8010183d:	68 f0 75 10 80       	push   $0x801075f0
80101842:	e8 39 eb ff ff       	call   80100380 <panic>
80101847:	83 ec 0c             	sub    $0xc,%esp
8010184a:	68 ea 75 10 80       	push   $0x801075ea
8010184f:	e8 2c eb ff ff       	call   80100380 <panic>
80101854:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010185b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010185f:	90                   	nop

80101860 <iunlock>:
80101860:	55                   	push   %ebp
80101861:	89 e5                	mov    %esp,%ebp
80101863:	56                   	push   %esi
80101864:	53                   	push   %ebx
80101865:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101868:	85 db                	test   %ebx,%ebx
8010186a:	74 28                	je     80101894 <iunlock+0x34>
8010186c:	83 ec 0c             	sub    $0xc,%esp
8010186f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101872:	56                   	push   %esi
80101873:	e8 88 2d 00 00       	call   80104600 <holdingsleep>
80101878:	83 c4 10             	add    $0x10,%esp
8010187b:	85 c0                	test   %eax,%eax
8010187d:	74 15                	je     80101894 <iunlock+0x34>
8010187f:	8b 43 08             	mov    0x8(%ebx),%eax
80101882:	85 c0                	test   %eax,%eax
80101884:	7e 0e                	jle    80101894 <iunlock+0x34>
80101886:	89 75 08             	mov    %esi,0x8(%ebp)
80101889:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010188c:	5b                   	pop    %ebx
8010188d:	5e                   	pop    %esi
8010188e:	5d                   	pop    %ebp
8010188f:	e9 2c 2d 00 00       	jmp    801045c0 <releasesleep>
80101894:	83 ec 0c             	sub    $0xc,%esp
80101897:	68 ff 75 10 80       	push   $0x801075ff
8010189c:	e8 df ea ff ff       	call   80100380 <panic>
801018a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018af:	90                   	nop

801018b0 <iput>:
801018b0:	55                   	push   %ebp
801018b1:	89 e5                	mov    %esp,%ebp
801018b3:	57                   	push   %edi
801018b4:	56                   	push   %esi
801018b5:	53                   	push   %ebx
801018b6:	83 ec 28             	sub    $0x28,%esp
801018b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018bc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801018bf:	57                   	push   %edi
801018c0:	e8 9b 2c 00 00       	call   80104560 <acquiresleep>
801018c5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801018c8:	83 c4 10             	add    $0x10,%esp
801018cb:	85 d2                	test   %edx,%edx
801018cd:	74 07                	je     801018d6 <iput+0x26>
801018cf:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801018d4:	74 32                	je     80101908 <iput+0x58>
801018d6:	83 ec 0c             	sub    $0xc,%esp
801018d9:	57                   	push   %edi
801018da:	e8 e1 2c 00 00       	call   801045c0 <releasesleep>
801018df:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
801018e6:	e8 35 2f 00 00       	call   80104820 <acquire>
801018eb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801018ef:	83 c4 10             	add    $0x10,%esp
801018f2:	c7 45 08 60 f9 10 80 	movl   $0x8010f960,0x8(%ebp)
801018f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018fc:	5b                   	pop    %ebx
801018fd:	5e                   	pop    %esi
801018fe:	5f                   	pop    %edi
801018ff:	5d                   	pop    %ebp
80101900:	e9 bb 2e 00 00       	jmp    801047c0 <release>
80101905:	8d 76 00             	lea    0x0(%esi),%esi
80101908:	83 ec 0c             	sub    $0xc,%esp
8010190b:	68 60 f9 10 80       	push   $0x8010f960
80101910:	e8 0b 2f 00 00       	call   80104820 <acquire>
80101915:	8b 73 08             	mov    0x8(%ebx),%esi
80101918:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010191f:	e8 9c 2e 00 00       	call   801047c0 <release>
80101924:	83 c4 10             	add    $0x10,%esp
80101927:	83 fe 01             	cmp    $0x1,%esi
8010192a:	75 aa                	jne    801018d6 <iput+0x26>
8010192c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101932:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101935:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101938:	89 cf                	mov    %ecx,%edi
8010193a:	eb 0b                	jmp    80101947 <iput+0x97>
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101940:	83 c6 04             	add    $0x4,%esi
80101943:	39 fe                	cmp    %edi,%esi
80101945:	74 19                	je     80101960 <iput+0xb0>
80101947:	8b 16                	mov    (%esi),%edx
80101949:	85 d2                	test   %edx,%edx
8010194b:	74 f3                	je     80101940 <iput+0x90>
8010194d:	8b 03                	mov    (%ebx),%eax
8010194f:	e8 6c f8 ff ff       	call   801011c0 <bfree>
80101954:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010195a:	eb e4                	jmp    80101940 <iput+0x90>
8010195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101960:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101966:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101969:	85 c0                	test   %eax,%eax
8010196b:	75 2d                	jne    8010199a <iput+0xea>
8010196d:	83 ec 0c             	sub    $0xc,%esp
80101970:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101977:	53                   	push   %ebx
80101978:	e8 53 fd ff ff       	call   801016d0 <iupdate>
8010197d:	31 c0                	xor    %eax,%eax
8010197f:	66 89 43 50          	mov    %ax,0x50(%ebx)
80101983:	89 1c 24             	mov    %ebx,(%esp)
80101986:	e8 45 fd ff ff       	call   801016d0 <iupdate>
8010198b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101992:	83 c4 10             	add    $0x10,%esp
80101995:	e9 3c ff ff ff       	jmp    801018d6 <iput+0x26>
8010199a:	83 ec 08             	sub    $0x8,%esp
8010199d:	50                   	push   %eax
8010199e:	ff 33                	push   (%ebx)
801019a0:	e8 2b e7 ff ff       	call   801000d0 <bread>
801019a5:	89 7d e0             	mov    %edi,-0x20(%ebp)
801019a8:	83 c4 10             	add    $0x10,%esp
801019ab:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801019b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801019b4:	8d 70 5c             	lea    0x5c(%eax),%esi
801019b7:	89 cf                	mov    %ecx,%edi
801019b9:	eb 0c                	jmp    801019c7 <iput+0x117>
801019bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019bf:	90                   	nop
801019c0:	83 c6 04             	add    $0x4,%esi
801019c3:	39 f7                	cmp    %esi,%edi
801019c5:	74 0f                	je     801019d6 <iput+0x126>
801019c7:	8b 16                	mov    (%esi),%edx
801019c9:	85 d2                	test   %edx,%edx
801019cb:	74 f3                	je     801019c0 <iput+0x110>
801019cd:	8b 03                	mov    (%ebx),%eax
801019cf:	e8 ec f7 ff ff       	call   801011c0 <bfree>
801019d4:	eb ea                	jmp    801019c0 <iput+0x110>
801019d6:	83 ec 0c             	sub    $0xc,%esp
801019d9:	ff 75 e4             	push   -0x1c(%ebp)
801019dc:	8b 7d e0             	mov    -0x20(%ebp),%edi
801019df:	e8 0c e8 ff ff       	call   801001f0 <brelse>
801019e4:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801019ea:	8b 03                	mov    (%ebx),%eax
801019ec:	e8 cf f7 ff ff       	call   801011c0 <bfree>
801019f1:	83 c4 10             	add    $0x10,%esp
801019f4:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801019fb:	00 00 00 
801019fe:	e9 6a ff ff ff       	jmp    8010196d <iput+0xbd>
80101a03:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101a10 <iunlockput>:
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	56                   	push   %esi
80101a14:	53                   	push   %ebx
80101a15:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101a18:	85 db                	test   %ebx,%ebx
80101a1a:	74 34                	je     80101a50 <iunlockput+0x40>
80101a1c:	83 ec 0c             	sub    $0xc,%esp
80101a1f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101a22:	56                   	push   %esi
80101a23:	e8 d8 2b 00 00       	call   80104600 <holdingsleep>
80101a28:	83 c4 10             	add    $0x10,%esp
80101a2b:	85 c0                	test   %eax,%eax
80101a2d:	74 21                	je     80101a50 <iunlockput+0x40>
80101a2f:	8b 43 08             	mov    0x8(%ebx),%eax
80101a32:	85 c0                	test   %eax,%eax
80101a34:	7e 1a                	jle    80101a50 <iunlockput+0x40>
80101a36:	83 ec 0c             	sub    $0xc,%esp
80101a39:	56                   	push   %esi
80101a3a:	e8 81 2b 00 00       	call   801045c0 <releasesleep>
80101a3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a42:	83 c4 10             	add    $0x10,%esp
80101a45:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101a48:	5b                   	pop    %ebx
80101a49:	5e                   	pop    %esi
80101a4a:	5d                   	pop    %ebp
80101a4b:	e9 60 fe ff ff       	jmp    801018b0 <iput>
80101a50:	83 ec 0c             	sub    $0xc,%esp
80101a53:	68 ff 75 10 80       	push   $0x801075ff
80101a58:	e8 23 e9 ff ff       	call   80100380 <panic>
80101a5d:	8d 76 00             	lea    0x0(%esi),%esi

80101a60 <stati>:
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	8b 55 08             	mov    0x8(%ebp),%edx
80101a66:	8b 45 0c             	mov    0xc(%ebp),%eax
80101a69:	8b 0a                	mov    (%edx),%ecx
80101a6b:	89 48 04             	mov    %ecx,0x4(%eax)
80101a6e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a71:	89 48 08             	mov    %ecx,0x8(%eax)
80101a74:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a78:	66 89 08             	mov    %cx,(%eax)
80101a7b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a7f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101a83:	8b 52 58             	mov    0x58(%edx),%edx
80101a86:	89 50 10             	mov    %edx,0x10(%eax)
80101a89:	5d                   	pop    %ebp
80101a8a:	c3                   	ret    
80101a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101a8f:	90                   	nop

80101a90 <readi>:
80101a90:	55                   	push   %ebp
80101a91:	89 e5                	mov    %esp,%ebp
80101a93:	57                   	push   %edi
80101a94:	56                   	push   %esi
80101a95:	53                   	push   %ebx
80101a96:	83 ec 1c             	sub    $0x1c,%esp
80101a99:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a9c:	8b 45 08             	mov    0x8(%ebp),%eax
80101a9f:	8b 75 10             	mov    0x10(%ebp),%esi
80101aa2:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101aa5:	8b 7d 14             	mov    0x14(%ebp),%edi
80101aa8:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101aad:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101ab0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101ab3:	0f 84 a7 00 00 00    	je     80101b60 <readi+0xd0>
80101ab9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101abc:	8b 40 58             	mov    0x58(%eax),%eax
80101abf:	39 c6                	cmp    %eax,%esi
80101ac1:	0f 87 ba 00 00 00    	ja     80101b81 <readi+0xf1>
80101ac7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101aca:	31 c9                	xor    %ecx,%ecx
80101acc:	89 da                	mov    %ebx,%edx
80101ace:	01 f2                	add    %esi,%edx
80101ad0:	0f 92 c1             	setb   %cl
80101ad3:	89 cf                	mov    %ecx,%edi
80101ad5:	0f 82 a6 00 00 00    	jb     80101b81 <readi+0xf1>
80101adb:	89 c1                	mov    %eax,%ecx
80101add:	29 f1                	sub    %esi,%ecx
80101adf:	39 d0                	cmp    %edx,%eax
80101ae1:	0f 43 cb             	cmovae %ebx,%ecx
80101ae4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101ae7:	85 c9                	test   %ecx,%ecx
80101ae9:	74 67                	je     80101b52 <readi+0xc2>
80101aeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101aef:	90                   	nop
80101af0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101af3:	89 f2                	mov    %esi,%edx
80101af5:	c1 ea 09             	shr    $0x9,%edx
80101af8:	89 d8                	mov    %ebx,%eax
80101afa:	e8 51 f9 ff ff       	call   80101450 <bmap>
80101aff:	83 ec 08             	sub    $0x8,%esp
80101b02:	50                   	push   %eax
80101b03:	ff 33                	push   (%ebx)
80101b05:	e8 c6 e5 ff ff       	call   801000d0 <bread>
80101b0a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101b0d:	b9 00 02 00 00       	mov    $0x200,%ecx
80101b12:	89 c2                	mov    %eax,%edx
80101b14:	89 f0                	mov    %esi,%eax
80101b16:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b1b:	29 fb                	sub    %edi,%ebx
80101b1d:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101b20:	29 c1                	sub    %eax,%ecx
80101b22:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101b26:	39 d9                	cmp    %ebx,%ecx
80101b28:	0f 46 d9             	cmovbe %ecx,%ebx
80101b2b:	83 c4 0c             	add    $0xc,%esp
80101b2e:	53                   	push   %ebx
80101b2f:	01 df                	add    %ebx,%edi
80101b31:	01 de                	add    %ebx,%esi
80101b33:	50                   	push   %eax
80101b34:	ff 75 e0             	push   -0x20(%ebp)
80101b37:	e8 44 2e 00 00       	call   80104980 <memmove>
80101b3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b3f:	89 14 24             	mov    %edx,(%esp)
80101b42:	e8 a9 e6 ff ff       	call   801001f0 <brelse>
80101b47:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b4a:	83 c4 10             	add    $0x10,%esp
80101b4d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b50:	77 9e                	ja     80101af0 <readi+0x60>
80101b52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b58:	5b                   	pop    %ebx
80101b59:	5e                   	pop    %esi
80101b5a:	5f                   	pop    %edi
80101b5b:	5d                   	pop    %ebp
80101b5c:	c3                   	ret    
80101b5d:	8d 76 00             	lea    0x0(%esi),%esi
80101b60:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b64:	66 83 f8 09          	cmp    $0x9,%ax
80101b68:	77 17                	ja     80101b81 <readi+0xf1>
80101b6a:	8b 04 c5 00 f9 10 80 	mov    -0x7fef0700(,%eax,8),%eax
80101b71:	85 c0                	test   %eax,%eax
80101b73:	74 0c                	je     80101b81 <readi+0xf1>
80101b75:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b7b:	5b                   	pop    %ebx
80101b7c:	5e                   	pop    %esi
80101b7d:	5f                   	pop    %edi
80101b7e:	5d                   	pop    %ebp
80101b7f:	ff e0                	jmp    *%eax
80101b81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b86:	eb cd                	jmp    80101b55 <readi+0xc5>
80101b88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b8f:	90                   	nop

80101b90 <writei>:
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	57                   	push   %edi
80101b94:	56                   	push   %esi
80101b95:	53                   	push   %ebx
80101b96:	83 ec 1c             	sub    $0x1c,%esp
80101b99:	8b 45 08             	mov    0x8(%ebp),%eax
80101b9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b9f:	8b 55 14             	mov    0x14(%ebp),%edx
80101ba2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101ba7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101baa:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101bad:	8b 75 10             	mov    0x10(%ebp),%esi
80101bb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101bb3:	0f 84 b7 00 00 00    	je     80101c70 <writei+0xe0>
80101bb9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bbc:	3b 70 58             	cmp    0x58(%eax),%esi
80101bbf:	0f 87 e7 00 00 00    	ja     80101cac <writei+0x11c>
80101bc5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101bc8:	31 d2                	xor    %edx,%edx
80101bca:	89 f8                	mov    %edi,%eax
80101bcc:	01 f0                	add    %esi,%eax
80101bce:	0f 92 c2             	setb   %dl
80101bd1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101bd6:	0f 87 d0 00 00 00    	ja     80101cac <writei+0x11c>
80101bdc:	85 d2                	test   %edx,%edx
80101bde:	0f 85 c8 00 00 00    	jne    80101cac <writei+0x11c>
80101be4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101beb:	85 ff                	test   %edi,%edi
80101bed:	74 72                	je     80101c61 <writei+0xd1>
80101bef:	90                   	nop
80101bf0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101bf3:	89 f2                	mov    %esi,%edx
80101bf5:	c1 ea 09             	shr    $0x9,%edx
80101bf8:	89 f8                	mov    %edi,%eax
80101bfa:	e8 51 f8 ff ff       	call   80101450 <bmap>
80101bff:	83 ec 08             	sub    $0x8,%esp
80101c02:	50                   	push   %eax
80101c03:	ff 37                	push   (%edi)
80101c05:	e8 c6 e4 ff ff       	call   801000d0 <bread>
80101c0a:	b9 00 02 00 00       	mov    $0x200,%ecx
80101c0f:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101c12:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101c15:	89 c7                	mov    %eax,%edi
80101c17:	89 f0                	mov    %esi,%eax
80101c19:	25 ff 01 00 00       	and    $0x1ff,%eax
80101c1e:	29 c1                	sub    %eax,%ecx
80101c20:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101c24:	39 d9                	cmp    %ebx,%ecx
80101c26:	0f 46 d9             	cmovbe %ecx,%ebx
80101c29:	83 c4 0c             	add    $0xc,%esp
80101c2c:	53                   	push   %ebx
80101c2d:	01 de                	add    %ebx,%esi
80101c2f:	ff 75 dc             	push   -0x24(%ebp)
80101c32:	50                   	push   %eax
80101c33:	e8 48 2d 00 00       	call   80104980 <memmove>
80101c38:	89 3c 24             	mov    %edi,(%esp)
80101c3b:	e8 00 13 00 00       	call   80102f40 <log_write>
80101c40:	89 3c 24             	mov    %edi,(%esp)
80101c43:	e8 a8 e5 ff ff       	call   801001f0 <brelse>
80101c48:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c4b:	83 c4 10             	add    $0x10,%esp
80101c4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c51:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c54:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101c57:	77 97                	ja     80101bf0 <writei+0x60>
80101c59:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c5c:	3b 70 58             	cmp    0x58(%eax),%esi
80101c5f:	77 37                	ja     80101c98 <writei+0x108>
80101c61:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101c64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c67:	5b                   	pop    %ebx
80101c68:	5e                   	pop    %esi
80101c69:	5f                   	pop    %edi
80101c6a:	5d                   	pop    %ebp
80101c6b:	c3                   	ret    
80101c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c74:	66 83 f8 09          	cmp    $0x9,%ax
80101c78:	77 32                	ja     80101cac <writei+0x11c>
80101c7a:	8b 04 c5 04 f9 10 80 	mov    -0x7fef06fc(,%eax,8),%eax
80101c81:	85 c0                	test   %eax,%eax
80101c83:	74 27                	je     80101cac <writei+0x11c>
80101c85:	89 55 10             	mov    %edx,0x10(%ebp)
80101c88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c8b:	5b                   	pop    %ebx
80101c8c:	5e                   	pop    %esi
80101c8d:	5f                   	pop    %edi
80101c8e:	5d                   	pop    %ebp
80101c8f:	ff e0                	jmp    *%eax
80101c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c98:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c9b:	83 ec 0c             	sub    $0xc,%esp
80101c9e:	89 70 58             	mov    %esi,0x58(%eax)
80101ca1:	50                   	push   %eax
80101ca2:	e8 29 fa ff ff       	call   801016d0 <iupdate>
80101ca7:	83 c4 10             	add    $0x10,%esp
80101caa:	eb b5                	jmp    80101c61 <writei+0xd1>
80101cac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101cb1:	eb b1                	jmp    80101c64 <writei+0xd4>
80101cb3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101cc0 <namecmp>:
80101cc0:	55                   	push   %ebp
80101cc1:	89 e5                	mov    %esp,%ebp
80101cc3:	83 ec 0c             	sub    $0xc,%esp
80101cc6:	6a 0e                	push   $0xe
80101cc8:	ff 75 0c             	push   0xc(%ebp)
80101ccb:	ff 75 08             	push   0x8(%ebp)
80101cce:	e8 1d 2d 00 00       	call   801049f0 <strncmp>
80101cd3:	c9                   	leave  
80101cd4:	c3                   	ret    
80101cd5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101ce0 <dirlookup>:
80101ce0:	55                   	push   %ebp
80101ce1:	89 e5                	mov    %esp,%ebp
80101ce3:	57                   	push   %edi
80101ce4:	56                   	push   %esi
80101ce5:	53                   	push   %ebx
80101ce6:	83 ec 1c             	sub    $0x1c,%esp
80101ce9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101cec:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101cf1:	0f 85 85 00 00 00    	jne    80101d7c <dirlookup+0x9c>
80101cf7:	8b 53 58             	mov    0x58(%ebx),%edx
80101cfa:	31 ff                	xor    %edi,%edi
80101cfc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101cff:	85 d2                	test   %edx,%edx
80101d01:	74 3e                	je     80101d41 <dirlookup+0x61>
80101d03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d07:	90                   	nop
80101d08:	6a 10                	push   $0x10
80101d0a:	57                   	push   %edi
80101d0b:	56                   	push   %esi
80101d0c:	53                   	push   %ebx
80101d0d:	e8 7e fd ff ff       	call   80101a90 <readi>
80101d12:	83 c4 10             	add    $0x10,%esp
80101d15:	83 f8 10             	cmp    $0x10,%eax
80101d18:	75 55                	jne    80101d6f <dirlookup+0x8f>
80101d1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101d1f:	74 18                	je     80101d39 <dirlookup+0x59>
80101d21:	83 ec 04             	sub    $0x4,%esp
80101d24:	8d 45 da             	lea    -0x26(%ebp),%eax
80101d27:	6a 0e                	push   $0xe
80101d29:	50                   	push   %eax
80101d2a:	ff 75 0c             	push   0xc(%ebp)
80101d2d:	e8 be 2c 00 00       	call   801049f0 <strncmp>
80101d32:	83 c4 10             	add    $0x10,%esp
80101d35:	85 c0                	test   %eax,%eax
80101d37:	74 17                	je     80101d50 <dirlookup+0x70>
80101d39:	83 c7 10             	add    $0x10,%edi
80101d3c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101d3f:	72 c7                	jb     80101d08 <dirlookup+0x28>
80101d41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d44:	31 c0                	xor    %eax,%eax
80101d46:	5b                   	pop    %ebx
80101d47:	5e                   	pop    %esi
80101d48:	5f                   	pop    %edi
80101d49:	5d                   	pop    %ebp
80101d4a:	c3                   	ret    
80101d4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d4f:	90                   	nop
80101d50:	8b 45 10             	mov    0x10(%ebp),%eax
80101d53:	85 c0                	test   %eax,%eax
80101d55:	74 05                	je     80101d5c <dirlookup+0x7c>
80101d57:	8b 45 10             	mov    0x10(%ebp),%eax
80101d5a:	89 38                	mov    %edi,(%eax)
80101d5c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101d60:	8b 03                	mov    (%ebx),%eax
80101d62:	e8 e9 f5 ff ff       	call   80101350 <iget>
80101d67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d6a:	5b                   	pop    %ebx
80101d6b:	5e                   	pop    %esi
80101d6c:	5f                   	pop    %edi
80101d6d:	5d                   	pop    %ebp
80101d6e:	c3                   	ret    
80101d6f:	83 ec 0c             	sub    $0xc,%esp
80101d72:	68 19 76 10 80       	push   $0x80107619
80101d77:	e8 04 e6 ff ff       	call   80100380 <panic>
80101d7c:	83 ec 0c             	sub    $0xc,%esp
80101d7f:	68 07 76 10 80       	push   $0x80107607
80101d84:	e8 f7 e5 ff ff       	call   80100380 <panic>
80101d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101d90 <namex>:
80101d90:	55                   	push   %ebp
80101d91:	89 e5                	mov    %esp,%ebp
80101d93:	57                   	push   %edi
80101d94:	56                   	push   %esi
80101d95:	53                   	push   %ebx
80101d96:	89 c3                	mov    %eax,%ebx
80101d98:	83 ec 1c             	sub    $0x1c,%esp
80101d9b:	80 38 2f             	cmpb   $0x2f,(%eax)
80101d9e:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101da1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101da4:	0f 84 64 01 00 00    	je     80101f0e <namex+0x17e>
80101daa:	e8 c1 1b 00 00       	call   80103970 <myproc>
80101daf:	83 ec 0c             	sub    $0xc,%esp
80101db2:	8b 70 6c             	mov    0x6c(%eax),%esi
80101db5:	68 60 f9 10 80       	push   $0x8010f960
80101dba:	e8 61 2a 00 00       	call   80104820 <acquire>
80101dbf:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101dc3:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101dca:	e8 f1 29 00 00       	call   801047c0 <release>
80101dcf:	83 c4 10             	add    $0x10,%esp
80101dd2:	eb 07                	jmp    80101ddb <namex+0x4b>
80101dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101dd8:	83 c3 01             	add    $0x1,%ebx
80101ddb:	0f b6 03             	movzbl (%ebx),%eax
80101dde:	3c 2f                	cmp    $0x2f,%al
80101de0:	74 f6                	je     80101dd8 <namex+0x48>
80101de2:	84 c0                	test   %al,%al
80101de4:	0f 84 06 01 00 00    	je     80101ef0 <namex+0x160>
80101dea:	0f b6 03             	movzbl (%ebx),%eax
80101ded:	84 c0                	test   %al,%al
80101def:	0f 84 10 01 00 00    	je     80101f05 <namex+0x175>
80101df5:	89 df                	mov    %ebx,%edi
80101df7:	3c 2f                	cmp    $0x2f,%al
80101df9:	0f 84 06 01 00 00    	je     80101f05 <namex+0x175>
80101dff:	90                   	nop
80101e00:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80101e04:	83 c7 01             	add    $0x1,%edi
80101e07:	3c 2f                	cmp    $0x2f,%al
80101e09:	74 04                	je     80101e0f <namex+0x7f>
80101e0b:	84 c0                	test   %al,%al
80101e0d:	75 f1                	jne    80101e00 <namex+0x70>
80101e0f:	89 f8                	mov    %edi,%eax
80101e11:	29 d8                	sub    %ebx,%eax
80101e13:	83 f8 0d             	cmp    $0xd,%eax
80101e16:	0f 8e ac 00 00 00    	jle    80101ec8 <namex+0x138>
80101e1c:	83 ec 04             	sub    $0x4,%esp
80101e1f:	6a 0e                	push   $0xe
80101e21:	53                   	push   %ebx
80101e22:	89 fb                	mov    %edi,%ebx
80101e24:	ff 75 e4             	push   -0x1c(%ebp)
80101e27:	e8 54 2b 00 00       	call   80104980 <memmove>
80101e2c:	83 c4 10             	add    $0x10,%esp
80101e2f:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101e32:	75 0c                	jne    80101e40 <namex+0xb0>
80101e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e38:	83 c3 01             	add    $0x1,%ebx
80101e3b:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e3e:	74 f8                	je     80101e38 <namex+0xa8>
80101e40:	83 ec 0c             	sub    $0xc,%esp
80101e43:	56                   	push   %esi
80101e44:	e8 37 f9 ff ff       	call   80101780 <ilock>
80101e49:	83 c4 10             	add    $0x10,%esp
80101e4c:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e51:	0f 85 cd 00 00 00    	jne    80101f24 <namex+0x194>
80101e57:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e5a:	85 c0                	test   %eax,%eax
80101e5c:	74 09                	je     80101e67 <namex+0xd7>
80101e5e:	80 3b 00             	cmpb   $0x0,(%ebx)
80101e61:	0f 84 22 01 00 00    	je     80101f89 <namex+0x1f9>
80101e67:	83 ec 04             	sub    $0x4,%esp
80101e6a:	6a 00                	push   $0x0
80101e6c:	ff 75 e4             	push   -0x1c(%ebp)
80101e6f:	56                   	push   %esi
80101e70:	e8 6b fe ff ff       	call   80101ce0 <dirlookup>
80101e75:	8d 56 0c             	lea    0xc(%esi),%edx
80101e78:	83 c4 10             	add    $0x10,%esp
80101e7b:	89 c7                	mov    %eax,%edi
80101e7d:	85 c0                	test   %eax,%eax
80101e7f:	0f 84 e1 00 00 00    	je     80101f66 <namex+0x1d6>
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101e8b:	52                   	push   %edx
80101e8c:	e8 6f 27 00 00       	call   80104600 <holdingsleep>
80101e91:	83 c4 10             	add    $0x10,%esp
80101e94:	85 c0                	test   %eax,%eax
80101e96:	0f 84 30 01 00 00    	je     80101fcc <namex+0x23c>
80101e9c:	8b 56 08             	mov    0x8(%esi),%edx
80101e9f:	85 d2                	test   %edx,%edx
80101ea1:	0f 8e 25 01 00 00    	jle    80101fcc <namex+0x23c>
80101ea7:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101eaa:	83 ec 0c             	sub    $0xc,%esp
80101ead:	52                   	push   %edx
80101eae:	e8 0d 27 00 00       	call   801045c0 <releasesleep>
80101eb3:	89 34 24             	mov    %esi,(%esp)
80101eb6:	89 fe                	mov    %edi,%esi
80101eb8:	e8 f3 f9 ff ff       	call   801018b0 <iput>
80101ebd:	83 c4 10             	add    $0x10,%esp
80101ec0:	e9 16 ff ff ff       	jmp    80101ddb <namex+0x4b>
80101ec5:	8d 76 00             	lea    0x0(%esi),%esi
80101ec8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101ecb:	8d 14 01             	lea    (%ecx,%eax,1),%edx
80101ece:	83 ec 04             	sub    $0x4,%esp
80101ed1:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101ed4:	50                   	push   %eax
80101ed5:	53                   	push   %ebx
80101ed6:	89 fb                	mov    %edi,%ebx
80101ed8:	ff 75 e4             	push   -0x1c(%ebp)
80101edb:	e8 a0 2a 00 00       	call   80104980 <memmove>
80101ee0:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ee3:	83 c4 10             	add    $0x10,%esp
80101ee6:	c6 02 00             	movb   $0x0,(%edx)
80101ee9:	e9 41 ff ff ff       	jmp    80101e2f <namex+0x9f>
80101eee:	66 90                	xchg   %ax,%ax
80101ef0:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101ef3:	85 c0                	test   %eax,%eax
80101ef5:	0f 85 be 00 00 00    	jne    80101fb9 <namex+0x229>
80101efb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101efe:	89 f0                	mov    %esi,%eax
80101f00:	5b                   	pop    %ebx
80101f01:	5e                   	pop    %esi
80101f02:	5f                   	pop    %edi
80101f03:	5d                   	pop    %ebp
80101f04:	c3                   	ret    
80101f05:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f08:	89 df                	mov    %ebx,%edi
80101f0a:	31 c0                	xor    %eax,%eax
80101f0c:	eb c0                	jmp    80101ece <namex+0x13e>
80101f0e:	ba 01 00 00 00       	mov    $0x1,%edx
80101f13:	b8 01 00 00 00       	mov    $0x1,%eax
80101f18:	e8 33 f4 ff ff       	call   80101350 <iget>
80101f1d:	89 c6                	mov    %eax,%esi
80101f1f:	e9 b7 fe ff ff       	jmp    80101ddb <namex+0x4b>
80101f24:	83 ec 0c             	sub    $0xc,%esp
80101f27:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f2a:	53                   	push   %ebx
80101f2b:	e8 d0 26 00 00       	call   80104600 <holdingsleep>
80101f30:	83 c4 10             	add    $0x10,%esp
80101f33:	85 c0                	test   %eax,%eax
80101f35:	0f 84 91 00 00 00    	je     80101fcc <namex+0x23c>
80101f3b:	8b 46 08             	mov    0x8(%esi),%eax
80101f3e:	85 c0                	test   %eax,%eax
80101f40:	0f 8e 86 00 00 00    	jle    80101fcc <namex+0x23c>
80101f46:	83 ec 0c             	sub    $0xc,%esp
80101f49:	53                   	push   %ebx
80101f4a:	e8 71 26 00 00       	call   801045c0 <releasesleep>
80101f4f:	89 34 24             	mov    %esi,(%esp)
80101f52:	31 f6                	xor    %esi,%esi
80101f54:	e8 57 f9 ff ff       	call   801018b0 <iput>
80101f59:	83 c4 10             	add    $0x10,%esp
80101f5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f5f:	89 f0                	mov    %esi,%eax
80101f61:	5b                   	pop    %ebx
80101f62:	5e                   	pop    %esi
80101f63:	5f                   	pop    %edi
80101f64:	5d                   	pop    %ebp
80101f65:	c3                   	ret    
80101f66:	83 ec 0c             	sub    $0xc,%esp
80101f69:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101f6c:	52                   	push   %edx
80101f6d:	e8 8e 26 00 00       	call   80104600 <holdingsleep>
80101f72:	83 c4 10             	add    $0x10,%esp
80101f75:	85 c0                	test   %eax,%eax
80101f77:	74 53                	je     80101fcc <namex+0x23c>
80101f79:	8b 4e 08             	mov    0x8(%esi),%ecx
80101f7c:	85 c9                	test   %ecx,%ecx
80101f7e:	7e 4c                	jle    80101fcc <namex+0x23c>
80101f80:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f83:	83 ec 0c             	sub    $0xc,%esp
80101f86:	52                   	push   %edx
80101f87:	eb c1                	jmp    80101f4a <namex+0x1ba>
80101f89:	83 ec 0c             	sub    $0xc,%esp
80101f8c:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f8f:	53                   	push   %ebx
80101f90:	e8 6b 26 00 00       	call   80104600 <holdingsleep>
80101f95:	83 c4 10             	add    $0x10,%esp
80101f98:	85 c0                	test   %eax,%eax
80101f9a:	74 30                	je     80101fcc <namex+0x23c>
80101f9c:	8b 7e 08             	mov    0x8(%esi),%edi
80101f9f:	85 ff                	test   %edi,%edi
80101fa1:	7e 29                	jle    80101fcc <namex+0x23c>
80101fa3:	83 ec 0c             	sub    $0xc,%esp
80101fa6:	53                   	push   %ebx
80101fa7:	e8 14 26 00 00       	call   801045c0 <releasesleep>
80101fac:	83 c4 10             	add    $0x10,%esp
80101faf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fb2:	89 f0                	mov    %esi,%eax
80101fb4:	5b                   	pop    %ebx
80101fb5:	5e                   	pop    %esi
80101fb6:	5f                   	pop    %edi
80101fb7:	5d                   	pop    %ebp
80101fb8:	c3                   	ret    
80101fb9:	83 ec 0c             	sub    $0xc,%esp
80101fbc:	56                   	push   %esi
80101fbd:	31 f6                	xor    %esi,%esi
80101fbf:	e8 ec f8 ff ff       	call   801018b0 <iput>
80101fc4:	83 c4 10             	add    $0x10,%esp
80101fc7:	e9 2f ff ff ff       	jmp    80101efb <namex+0x16b>
80101fcc:	83 ec 0c             	sub    $0xc,%esp
80101fcf:	68 ff 75 10 80       	push   $0x801075ff
80101fd4:	e8 a7 e3 ff ff       	call   80100380 <panic>
80101fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101fe0 <dirlink>:
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	57                   	push   %edi
80101fe4:	56                   	push   %esi
80101fe5:	53                   	push   %ebx
80101fe6:	83 ec 20             	sub    $0x20,%esp
80101fe9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101fec:	6a 00                	push   $0x0
80101fee:	ff 75 0c             	push   0xc(%ebp)
80101ff1:	53                   	push   %ebx
80101ff2:	e8 e9 fc ff ff       	call   80101ce0 <dirlookup>
80101ff7:	83 c4 10             	add    $0x10,%esp
80101ffa:	85 c0                	test   %eax,%eax
80101ffc:	75 67                	jne    80102065 <dirlink+0x85>
80101ffe:	8b 7b 58             	mov    0x58(%ebx),%edi
80102001:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102004:	85 ff                	test   %edi,%edi
80102006:	74 29                	je     80102031 <dirlink+0x51>
80102008:	31 ff                	xor    %edi,%edi
8010200a:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010200d:	eb 09                	jmp    80102018 <dirlink+0x38>
8010200f:	90                   	nop
80102010:	83 c7 10             	add    $0x10,%edi
80102013:	3b 7b 58             	cmp    0x58(%ebx),%edi
80102016:	73 19                	jae    80102031 <dirlink+0x51>
80102018:	6a 10                	push   $0x10
8010201a:	57                   	push   %edi
8010201b:	56                   	push   %esi
8010201c:	53                   	push   %ebx
8010201d:	e8 6e fa ff ff       	call   80101a90 <readi>
80102022:	83 c4 10             	add    $0x10,%esp
80102025:	83 f8 10             	cmp    $0x10,%eax
80102028:	75 4e                	jne    80102078 <dirlink+0x98>
8010202a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010202f:	75 df                	jne    80102010 <dirlink+0x30>
80102031:	83 ec 04             	sub    $0x4,%esp
80102034:	8d 45 da             	lea    -0x26(%ebp),%eax
80102037:	6a 0e                	push   $0xe
80102039:	ff 75 0c             	push   0xc(%ebp)
8010203c:	50                   	push   %eax
8010203d:	e8 fe 29 00 00       	call   80104a40 <strncpy>
80102042:	6a 10                	push   $0x10
80102044:	8b 45 10             	mov    0x10(%ebp),%eax
80102047:	57                   	push   %edi
80102048:	56                   	push   %esi
80102049:	53                   	push   %ebx
8010204a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
8010204e:	e8 3d fb ff ff       	call   80101b90 <writei>
80102053:	83 c4 20             	add    $0x20,%esp
80102056:	83 f8 10             	cmp    $0x10,%eax
80102059:	75 2a                	jne    80102085 <dirlink+0xa5>
8010205b:	31 c0                	xor    %eax,%eax
8010205d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102060:	5b                   	pop    %ebx
80102061:	5e                   	pop    %esi
80102062:	5f                   	pop    %edi
80102063:	5d                   	pop    %ebp
80102064:	c3                   	ret    
80102065:	83 ec 0c             	sub    $0xc,%esp
80102068:	50                   	push   %eax
80102069:	e8 42 f8 ff ff       	call   801018b0 <iput>
8010206e:	83 c4 10             	add    $0x10,%esp
80102071:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102076:	eb e5                	jmp    8010205d <dirlink+0x7d>
80102078:	83 ec 0c             	sub    $0xc,%esp
8010207b:	68 28 76 10 80       	push   $0x80107628
80102080:	e8 fb e2 ff ff       	call   80100380 <panic>
80102085:	83 ec 0c             	sub    $0xc,%esp
80102088:	68 06 7c 10 80       	push   $0x80107c06
8010208d:	e8 ee e2 ff ff       	call   80100380 <panic>
80102092:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801020a0 <namei>:
801020a0:	55                   	push   %ebp
801020a1:	31 d2                	xor    %edx,%edx
801020a3:	89 e5                	mov    %esp,%ebp
801020a5:	83 ec 18             	sub    $0x18,%esp
801020a8:	8b 45 08             	mov    0x8(%ebp),%eax
801020ab:	8d 4d ea             	lea    -0x16(%ebp),%ecx
801020ae:	e8 dd fc ff ff       	call   80101d90 <namex>
801020b3:	c9                   	leave  
801020b4:	c3                   	ret    
801020b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <nameiparent>:
801020c0:	55                   	push   %ebp
801020c1:	ba 01 00 00 00       	mov    $0x1,%edx
801020c6:	89 e5                	mov    %esp,%ebp
801020c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801020cb:	8b 45 08             	mov    0x8(%ebp),%eax
801020ce:	5d                   	pop    %ebp
801020cf:	e9 bc fc ff ff       	jmp    80101d90 <namex>
801020d4:	66 90                	xchg   %ax,%ax
801020d6:	66 90                	xchg   %ax,%ax
801020d8:	66 90                	xchg   %ax,%ax
801020da:	66 90                	xchg   %ax,%ax
801020dc:	66 90                	xchg   %ax,%ax
801020de:	66 90                	xchg   %ax,%ax

801020e0 <idestart>:
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	57                   	push   %edi
801020e4:	56                   	push   %esi
801020e5:	53                   	push   %ebx
801020e6:	83 ec 0c             	sub    $0xc,%esp
801020e9:	85 c0                	test   %eax,%eax
801020eb:	0f 84 b4 00 00 00    	je     801021a5 <idestart+0xc5>
801020f1:	8b 70 08             	mov    0x8(%eax),%esi
801020f4:	89 c3                	mov    %eax,%ebx
801020f6:	81 fe 1f 4e 00 00    	cmp    $0x4e1f,%esi
801020fc:	0f 87 96 00 00 00    	ja     80102198 <idestart+0xb8>
80102102:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010210e:	66 90                	xchg   %ax,%ax
80102110:	89 ca                	mov    %ecx,%edx
80102112:	ec                   	in     (%dx),%al
80102113:	83 e0 c0             	and    $0xffffffc0,%eax
80102116:	3c 40                	cmp    $0x40,%al
80102118:	75 f6                	jne    80102110 <idestart+0x30>
8010211a:	31 ff                	xor    %edi,%edi
8010211c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102121:	89 f8                	mov    %edi,%eax
80102123:	ee                   	out    %al,(%dx)
80102124:	b8 01 00 00 00       	mov    $0x1,%eax
80102129:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010212e:	ee                   	out    %al,(%dx)
8010212f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102134:	89 f0                	mov    %esi,%eax
80102136:	ee                   	out    %al,(%dx)
80102137:	89 f0                	mov    %esi,%eax
80102139:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010213e:	c1 f8 08             	sar    $0x8,%eax
80102141:	ee                   	out    %al,(%dx)
80102142:	ba f5 01 00 00       	mov    $0x1f5,%edx
80102147:	89 f8                	mov    %edi,%eax
80102149:	ee                   	out    %al,(%dx)
8010214a:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
8010214e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102153:	c1 e0 04             	shl    $0x4,%eax
80102156:	83 e0 10             	and    $0x10,%eax
80102159:	83 c8 e0             	or     $0xffffffe0,%eax
8010215c:	ee                   	out    %al,(%dx)
8010215d:	f6 03 04             	testb  $0x4,(%ebx)
80102160:	75 16                	jne    80102178 <idestart+0x98>
80102162:	b8 20 00 00 00       	mov    $0x20,%eax
80102167:	89 ca                	mov    %ecx,%edx
80102169:	ee                   	out    %al,(%dx)
8010216a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010216d:	5b                   	pop    %ebx
8010216e:	5e                   	pop    %esi
8010216f:	5f                   	pop    %edi
80102170:	5d                   	pop    %ebp
80102171:	c3                   	ret    
80102172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102178:	b8 30 00 00 00       	mov    $0x30,%eax
8010217d:	89 ca                	mov    %ecx,%edx
8010217f:	ee                   	out    %al,(%dx)
80102180:	b9 80 00 00 00       	mov    $0x80,%ecx
80102185:	8d 73 5c             	lea    0x5c(%ebx),%esi
80102188:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010218d:	fc                   	cld    
8010218e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102190:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102193:	5b                   	pop    %ebx
80102194:	5e                   	pop    %esi
80102195:	5f                   	pop    %edi
80102196:	5d                   	pop    %ebp
80102197:	c3                   	ret    
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 94 76 10 80       	push   $0x80107694
801021a0:	e8 db e1 ff ff       	call   80100380 <panic>
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 8b 76 10 80       	push   $0x8010768b
801021ad:	e8 ce e1 ff ff       	call   80100380 <panic>
801021b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801021c0 <ideinit>:
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 10             	sub    $0x10,%esp
801021c6:	68 a6 76 10 80       	push   $0x801076a6
801021cb:	68 00 16 11 80       	push   $0x80111600
801021d0:	e8 7b 24 00 00       	call   80104650 <initlock>
801021d5:	58                   	pop    %eax
801021d6:	a1 84 17 11 80       	mov    0x80111784,%eax
801021db:	5a                   	pop    %edx
801021dc:	83 e8 01             	sub    $0x1,%eax
801021df:	50                   	push   %eax
801021e0:	6a 0e                	push   $0xe
801021e2:	e8 99 02 00 00       	call   80102480 <ioapicenable>
801021e7:	83 c4 10             	add    $0x10,%esp
801021ea:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021ef:	90                   	nop
801021f0:	ec                   	in     (%dx),%al
801021f1:	83 e0 c0             	and    $0xffffffc0,%eax
801021f4:	3c 40                	cmp    $0x40,%al
801021f6:	75 f8                	jne    801021f0 <ideinit+0x30>
801021f8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801021fd:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102202:	ee                   	out    %al,(%dx)
80102203:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102208:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010220d:	eb 06                	jmp    80102215 <ideinit+0x55>
8010220f:	90                   	nop
80102210:	83 e9 01             	sub    $0x1,%ecx
80102213:	74 0f                	je     80102224 <ideinit+0x64>
80102215:	ec                   	in     (%dx),%al
80102216:	84 c0                	test   %al,%al
80102218:	74 f6                	je     80102210 <ideinit+0x50>
8010221a:	c7 05 e0 15 11 80 01 	movl   $0x1,0x801115e0
80102221:	00 00 00 
80102224:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102229:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010222e:	ee                   	out    %al,(%dx)
8010222f:	c9                   	leave  
80102230:	c3                   	ret    
80102231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010223f:	90                   	nop

80102240 <ideintr>:
80102240:	55                   	push   %ebp
80102241:	89 e5                	mov    %esp,%ebp
80102243:	57                   	push   %edi
80102244:	56                   	push   %esi
80102245:	53                   	push   %ebx
80102246:	83 ec 18             	sub    $0x18,%esp
80102249:	68 00 16 11 80       	push   $0x80111600
8010224e:	e8 cd 25 00 00       	call   80104820 <acquire>
80102253:	8b 1d e4 15 11 80    	mov    0x801115e4,%ebx
80102259:	83 c4 10             	add    $0x10,%esp
8010225c:	85 db                	test   %ebx,%ebx
8010225e:	74 63                	je     801022c3 <ideintr+0x83>
80102260:	8b 43 58             	mov    0x58(%ebx),%eax
80102263:	a3 e4 15 11 80       	mov    %eax,0x801115e4
80102268:	8b 33                	mov    (%ebx),%esi
8010226a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102270:	75 2f                	jne    801022a1 <ideintr+0x61>
80102272:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010227e:	66 90                	xchg   %ax,%ax
80102280:	ec                   	in     (%dx),%al
80102281:	89 c1                	mov    %eax,%ecx
80102283:	83 e1 c0             	and    $0xffffffc0,%ecx
80102286:	80 f9 40             	cmp    $0x40,%cl
80102289:	75 f5                	jne    80102280 <ideintr+0x40>
8010228b:	a8 21                	test   $0x21,%al
8010228d:	75 12                	jne    801022a1 <ideintr+0x61>
8010228f:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80102292:	b9 80 00 00 00       	mov    $0x80,%ecx
80102297:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010229c:	fc                   	cld    
8010229d:	f3 6d                	rep insl (%dx),%es:(%edi)
8010229f:	8b 33                	mov    (%ebx),%esi
801022a1:	83 e6 fb             	and    $0xfffffffb,%esi
801022a4:	83 ec 0c             	sub    $0xc,%esp
801022a7:	83 ce 02             	or     $0x2,%esi
801022aa:	89 33                	mov    %esi,(%ebx)
801022ac:	53                   	push   %ebx
801022ad:	e8 ce 20 00 00       	call   80104380 <wakeup>
801022b2:	a1 e4 15 11 80       	mov    0x801115e4,%eax
801022b7:	83 c4 10             	add    $0x10,%esp
801022ba:	85 c0                	test   %eax,%eax
801022bc:	74 05                	je     801022c3 <ideintr+0x83>
801022be:	e8 1d fe ff ff       	call   801020e0 <idestart>
801022c3:	83 ec 0c             	sub    $0xc,%esp
801022c6:	68 00 16 11 80       	push   $0x80111600
801022cb:	e8 f0 24 00 00       	call   801047c0 <release>
801022d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801022d3:	5b                   	pop    %ebx
801022d4:	5e                   	pop    %esi
801022d5:	5f                   	pop    %edi
801022d6:	5d                   	pop    %ebp
801022d7:	c3                   	ret    
801022d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801022df:	90                   	nop

801022e0 <iderw>:
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 10             	sub    $0x10,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ea:	8d 43 0c             	lea    0xc(%ebx),%eax
801022ed:	50                   	push   %eax
801022ee:	e8 0d 23 00 00       	call   80104600 <holdingsleep>
801022f3:	83 c4 10             	add    $0x10,%esp
801022f6:	85 c0                	test   %eax,%eax
801022f8:	0f 84 c3 00 00 00    	je     801023c1 <iderw+0xe1>
801022fe:	8b 03                	mov    (%ebx),%eax
80102300:	83 e0 06             	and    $0x6,%eax
80102303:	83 f8 02             	cmp    $0x2,%eax
80102306:	0f 84 a8 00 00 00    	je     801023b4 <iderw+0xd4>
8010230c:	8b 53 04             	mov    0x4(%ebx),%edx
8010230f:	85 d2                	test   %edx,%edx
80102311:	74 0d                	je     80102320 <iderw+0x40>
80102313:	a1 e0 15 11 80       	mov    0x801115e0,%eax
80102318:	85 c0                	test   %eax,%eax
8010231a:	0f 84 87 00 00 00    	je     801023a7 <iderw+0xc7>
80102320:	83 ec 0c             	sub    $0xc,%esp
80102323:	68 00 16 11 80       	push   $0x80111600
80102328:	e8 f3 24 00 00       	call   80104820 <acquire>
8010232d:	a1 e4 15 11 80       	mov    0x801115e4,%eax
80102332:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80102339:	83 c4 10             	add    $0x10,%esp
8010233c:	85 c0                	test   %eax,%eax
8010233e:	74 60                	je     801023a0 <iderw+0xc0>
80102340:	89 c2                	mov    %eax,%edx
80102342:	8b 40 58             	mov    0x58(%eax),%eax
80102345:	85 c0                	test   %eax,%eax
80102347:	75 f7                	jne    80102340 <iderw+0x60>
80102349:	83 c2 58             	add    $0x58,%edx
8010234c:	89 1a                	mov    %ebx,(%edx)
8010234e:	39 1d e4 15 11 80    	cmp    %ebx,0x801115e4
80102354:	74 3a                	je     80102390 <iderw+0xb0>
80102356:	8b 03                	mov    (%ebx),%eax
80102358:	83 e0 06             	and    $0x6,%eax
8010235b:	83 f8 02             	cmp    $0x2,%eax
8010235e:	74 1b                	je     8010237b <iderw+0x9b>
80102360:	83 ec 08             	sub    $0x8,%esp
80102363:	68 00 16 11 80       	push   $0x80111600
80102368:	53                   	push   %ebx
80102369:	e8 52 1f 00 00       	call   801042c0 <sleep>
8010236e:	8b 03                	mov    (%ebx),%eax
80102370:	83 c4 10             	add    $0x10,%esp
80102373:	83 e0 06             	and    $0x6,%eax
80102376:	83 f8 02             	cmp    $0x2,%eax
80102379:	75 e5                	jne    80102360 <iderw+0x80>
8010237b:	c7 45 08 00 16 11 80 	movl   $0x80111600,0x8(%ebp)
80102382:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102385:	c9                   	leave  
80102386:	e9 35 24 00 00       	jmp    801047c0 <release>
8010238b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010238f:	90                   	nop
80102390:	89 d8                	mov    %ebx,%eax
80102392:	e8 49 fd ff ff       	call   801020e0 <idestart>
80102397:	eb bd                	jmp    80102356 <iderw+0x76>
80102399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023a0:	ba e4 15 11 80       	mov    $0x801115e4,%edx
801023a5:	eb a5                	jmp    8010234c <iderw+0x6c>
801023a7:	83 ec 0c             	sub    $0xc,%esp
801023aa:	68 d5 76 10 80       	push   $0x801076d5
801023af:	e8 cc df ff ff       	call   80100380 <panic>
801023b4:	83 ec 0c             	sub    $0xc,%esp
801023b7:	68 c0 76 10 80       	push   $0x801076c0
801023bc:	e8 bf df ff ff       	call   80100380 <panic>
801023c1:	83 ec 0c             	sub    $0xc,%esp
801023c4:	68 aa 76 10 80       	push   $0x801076aa
801023c9:	e8 b2 df ff ff       	call   80100380 <panic>
801023ce:	66 90                	xchg   %ax,%ax

801023d0 <ioapicinit>:
801023d0:	55                   	push   %ebp
801023d1:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
801023d8:	00 c0 fe 
801023db:	89 e5                	mov    %esp,%ebp
801023dd:	56                   	push   %esi
801023de:	53                   	push   %ebx
801023df:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801023e6:	00 00 00 
801023e9:	8b 15 34 16 11 80    	mov    0x80111634,%edx
801023ef:	8b 72 10             	mov    0x10(%edx),%esi
801023f2:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801023f8:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
801023fe:	0f b6 15 80 17 11 80 	movzbl 0x80111780,%edx
80102405:	c1 ee 10             	shr    $0x10,%esi
80102408:	89 f0                	mov    %esi,%eax
8010240a:	0f b6 f0             	movzbl %al,%esi
8010240d:	8b 41 10             	mov    0x10(%ecx),%eax
80102410:	c1 e8 18             	shr    $0x18,%eax
80102413:	39 c2                	cmp    %eax,%edx
80102415:	74 16                	je     8010242d <ioapicinit+0x5d>
80102417:	83 ec 0c             	sub    $0xc,%esp
8010241a:	68 f4 76 10 80       	push   $0x801076f4
8010241f:	e8 7c e2 ff ff       	call   801006a0 <cprintf>
80102424:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010242a:	83 c4 10             	add    $0x10,%esp
8010242d:	83 c6 21             	add    $0x21,%esi
80102430:	ba 10 00 00 00       	mov    $0x10,%edx
80102435:	b8 20 00 00 00       	mov    $0x20,%eax
8010243a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102440:	89 11                	mov    %edx,(%ecx)
80102442:	89 c3                	mov    %eax,%ebx
80102444:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010244a:	83 c0 01             	add    $0x1,%eax
8010244d:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102453:	89 59 10             	mov    %ebx,0x10(%ecx)
80102456:	8d 5a 01             	lea    0x1(%edx),%ebx
80102459:	83 c2 02             	add    $0x2,%edx
8010245c:	89 19                	mov    %ebx,(%ecx)
8010245e:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102464:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010246b:	39 f0                	cmp    %esi,%eax
8010246d:	75 d1                	jne    80102440 <ioapicinit+0x70>
8010246f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102472:	5b                   	pop    %ebx
80102473:	5e                   	pop    %esi
80102474:	5d                   	pop    %ebp
80102475:	c3                   	ret    
80102476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010247d:	8d 76 00             	lea    0x0(%esi),%esi

80102480 <ioapicenable>:
80102480:	55                   	push   %ebp
80102481:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102487:	89 e5                	mov    %esp,%ebp
80102489:	8b 45 08             	mov    0x8(%ebp),%eax
8010248c:	8d 50 20             	lea    0x20(%eax),%edx
8010248f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102493:	89 01                	mov    %eax,(%ecx)
80102495:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010249b:	83 c0 01             	add    $0x1,%eax
8010249e:	89 51 10             	mov    %edx,0x10(%ecx)
801024a1:	8b 55 0c             	mov    0xc(%ebp),%edx
801024a4:	89 01                	mov    %eax,(%ecx)
801024a6:	a1 34 16 11 80       	mov    0x80111634,%eax
801024ab:	c1 e2 18             	shl    $0x18,%edx
801024ae:	89 50 10             	mov    %edx,0x10(%eax)
801024b1:	5d                   	pop    %ebp
801024b2:	c3                   	ret    
801024b3:	66 90                	xchg   %ax,%ax
801024b5:	66 90                	xchg   %ax,%ax
801024b7:	66 90                	xchg   %ax,%ax
801024b9:	66 90                	xchg   %ax,%ax
801024bb:	66 90                	xchg   %ax,%ax
801024bd:	66 90                	xchg   %ax,%ax
801024bf:	90                   	nop

801024c0 <kfree>:
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	53                   	push   %ebx
801024c4:	83 ec 04             	sub    $0x4,%esp
801024c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801024ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801024d0:	75 76                	jne    80102548 <kfree+0x88>
801024d2:	81 fb d0 55 11 80    	cmp    $0x801155d0,%ebx
801024d8:	72 6e                	jb     80102548 <kfree+0x88>
801024da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801024e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801024e5:	77 61                	ja     80102548 <kfree+0x88>
801024e7:	83 ec 04             	sub    $0x4,%esp
801024ea:	68 00 10 00 00       	push   $0x1000
801024ef:	6a 01                	push   $0x1
801024f1:	53                   	push   %ebx
801024f2:	e8 e9 23 00 00       	call   801048e0 <memset>
801024f7:	8b 15 74 16 11 80    	mov    0x80111674,%edx
801024fd:	83 c4 10             	add    $0x10,%esp
80102500:	85 d2                	test   %edx,%edx
80102502:	75 1c                	jne    80102520 <kfree+0x60>
80102504:	a1 78 16 11 80       	mov    0x80111678,%eax
80102509:	89 03                	mov    %eax,(%ebx)
8010250b:	a1 74 16 11 80       	mov    0x80111674,%eax
80102510:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
80102516:	85 c0                	test   %eax,%eax
80102518:	75 1e                	jne    80102538 <kfree+0x78>
8010251a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010251d:	c9                   	leave  
8010251e:	c3                   	ret    
8010251f:	90                   	nop
80102520:	83 ec 0c             	sub    $0xc,%esp
80102523:	68 40 16 11 80       	push   $0x80111640
80102528:	e8 f3 22 00 00       	call   80104820 <acquire>
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	eb d2                	jmp    80102504 <kfree+0x44>
80102532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102538:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
8010253f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102542:	c9                   	leave  
80102543:	e9 78 22 00 00       	jmp    801047c0 <release>
80102548:	83 ec 0c             	sub    $0xc,%esp
8010254b:	68 26 77 10 80       	push   $0x80107726
80102550:	e8 2b de ff ff       	call   80100380 <panic>
80102555:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010255c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102560 <freerange>:
80102560:	55                   	push   %ebp
80102561:	89 e5                	mov    %esp,%ebp
80102563:	56                   	push   %esi
80102564:	8b 45 08             	mov    0x8(%ebp),%eax
80102567:	8b 75 0c             	mov    0xc(%ebp),%esi
8010256a:	53                   	push   %ebx
8010256b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102571:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102577:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010257d:	39 de                	cmp    %ebx,%esi
8010257f:	72 23                	jb     801025a4 <freerange+0x44>
80102581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102588:	83 ec 0c             	sub    $0xc,%esp
8010258b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102591:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102597:	50                   	push   %eax
80102598:	e8 23 ff ff ff       	call   801024c0 <kfree>
8010259d:	83 c4 10             	add    $0x10,%esp
801025a0:	39 f3                	cmp    %esi,%ebx
801025a2:	76 e4                	jbe    80102588 <freerange+0x28>
801025a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025a7:	5b                   	pop    %ebx
801025a8:	5e                   	pop    %esi
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025af:	90                   	nop

801025b0 <kinit2>:
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	56                   	push   %esi
801025b4:	8b 45 08             	mov    0x8(%ebp),%eax
801025b7:	8b 75 0c             	mov    0xc(%ebp),%esi
801025ba:	53                   	push   %ebx
801025bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801025c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025cd:	39 de                	cmp    %ebx,%esi
801025cf:	72 23                	jb     801025f4 <kinit2+0x44>
801025d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025d8:	83 ec 0c             	sub    $0xc,%esp
801025db:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801025e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025e7:	50                   	push   %eax
801025e8:	e8 d3 fe ff ff       	call   801024c0 <kfree>
801025ed:	83 c4 10             	add    $0x10,%esp
801025f0:	39 de                	cmp    %ebx,%esi
801025f2:	73 e4                	jae    801025d8 <kinit2+0x28>
801025f4:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
801025fb:	00 00 00 
801025fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102601:	5b                   	pop    %ebx
80102602:	5e                   	pop    %esi
80102603:	5d                   	pop    %ebp
80102604:	c3                   	ret    
80102605:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010260c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102610 <kinit1>:
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	56                   	push   %esi
80102614:	53                   	push   %ebx
80102615:	8b 75 0c             	mov    0xc(%ebp),%esi
80102618:	83 ec 08             	sub    $0x8,%esp
8010261b:	68 2c 77 10 80       	push   $0x8010772c
80102620:	68 40 16 11 80       	push   $0x80111640
80102625:	e8 26 20 00 00       	call   80104650 <initlock>
8010262a:	8b 45 08             	mov    0x8(%ebp),%eax
8010262d:	83 c4 10             	add    $0x10,%esp
80102630:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
80102637:	00 00 00 
8010263a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102640:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102646:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010264c:	39 de                	cmp    %ebx,%esi
8010264e:	72 1c                	jb     8010266c <kinit1+0x5c>
80102650:	83 ec 0c             	sub    $0xc,%esp
80102653:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102659:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010265f:	50                   	push   %eax
80102660:	e8 5b fe ff ff       	call   801024c0 <kfree>
80102665:	83 c4 10             	add    $0x10,%esp
80102668:	39 de                	cmp    %ebx,%esi
8010266a:	73 e4                	jae    80102650 <kinit1+0x40>
8010266c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010266f:	5b                   	pop    %ebx
80102670:	5e                   	pop    %esi
80102671:	5d                   	pop    %ebp
80102672:	c3                   	ret    
80102673:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010267a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102680 <kalloc>:
80102680:	a1 74 16 11 80       	mov    0x80111674,%eax
80102685:	85 c0                	test   %eax,%eax
80102687:	75 1f                	jne    801026a8 <kalloc+0x28>
80102689:	a1 78 16 11 80       	mov    0x80111678,%eax
8010268e:	85 c0                	test   %eax,%eax
80102690:	74 0e                	je     801026a0 <kalloc+0x20>
80102692:	8b 10                	mov    (%eax),%edx
80102694:	89 15 78 16 11 80    	mov    %edx,0x80111678
8010269a:	c3                   	ret    
8010269b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010269f:	90                   	nop
801026a0:	c3                   	ret    
801026a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026a8:	55                   	push   %ebp
801026a9:	89 e5                	mov    %esp,%ebp
801026ab:	83 ec 24             	sub    $0x24,%esp
801026ae:	68 40 16 11 80       	push   $0x80111640
801026b3:	e8 68 21 00 00       	call   80104820 <acquire>
801026b8:	a1 78 16 11 80       	mov    0x80111678,%eax
801026bd:	8b 15 74 16 11 80    	mov    0x80111674,%edx
801026c3:	83 c4 10             	add    $0x10,%esp
801026c6:	85 c0                	test   %eax,%eax
801026c8:	74 08                	je     801026d2 <kalloc+0x52>
801026ca:	8b 08                	mov    (%eax),%ecx
801026cc:	89 0d 78 16 11 80    	mov    %ecx,0x80111678
801026d2:	85 d2                	test   %edx,%edx
801026d4:	74 16                	je     801026ec <kalloc+0x6c>
801026d6:	83 ec 0c             	sub    $0xc,%esp
801026d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
801026dc:	68 40 16 11 80       	push   $0x80111640
801026e1:	e8 da 20 00 00       	call   801047c0 <release>
801026e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801026e9:	83 c4 10             	add    $0x10,%esp
801026ec:	c9                   	leave  
801026ed:	c3                   	ret    
801026ee:	66 90                	xchg   %ax,%ax

801026f0 <kbdgetc>:
801026f0:	ba 64 00 00 00       	mov    $0x64,%edx
801026f5:	ec                   	in     (%dx),%al
801026f6:	a8 01                	test   $0x1,%al
801026f8:	0f 84 c2 00 00 00    	je     801027c0 <kbdgetc+0xd0>
801026fe:	55                   	push   %ebp
801026ff:	ba 60 00 00 00       	mov    $0x60,%edx
80102704:	89 e5                	mov    %esp,%ebp
80102706:	53                   	push   %ebx
80102707:	ec                   	in     (%dx),%al
80102708:	8b 1d 7c 16 11 80    	mov    0x8011167c,%ebx
8010270e:	0f b6 c8             	movzbl %al,%ecx
80102711:	3c e0                	cmp    $0xe0,%al
80102713:	74 5b                	je     80102770 <kbdgetc+0x80>
80102715:	89 da                	mov    %ebx,%edx
80102717:	83 e2 40             	and    $0x40,%edx
8010271a:	84 c0                	test   %al,%al
8010271c:	78 62                	js     80102780 <kbdgetc+0x90>
8010271e:	85 d2                	test   %edx,%edx
80102720:	74 09                	je     8010272b <kbdgetc+0x3b>
80102722:	83 c8 80             	or     $0xffffff80,%eax
80102725:	83 e3 bf             	and    $0xffffffbf,%ebx
80102728:	0f b6 c8             	movzbl %al,%ecx
8010272b:	0f b6 91 60 78 10 80 	movzbl -0x7fef87a0(%ecx),%edx
80102732:	0f b6 81 60 77 10 80 	movzbl -0x7fef88a0(%ecx),%eax
80102739:	09 da                	or     %ebx,%edx
8010273b:	31 c2                	xor    %eax,%edx
8010273d:	89 d0                	mov    %edx,%eax
8010273f:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
80102745:	83 e0 03             	and    $0x3,%eax
80102748:	83 e2 08             	and    $0x8,%edx
8010274b:	8b 04 85 40 77 10 80 	mov    -0x7fef88c0(,%eax,4),%eax
80102752:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
80102756:	74 0b                	je     80102763 <kbdgetc+0x73>
80102758:	8d 50 9f             	lea    -0x61(%eax),%edx
8010275b:	83 fa 19             	cmp    $0x19,%edx
8010275e:	77 48                	ja     801027a8 <kbdgetc+0xb8>
80102760:	83 e8 20             	sub    $0x20,%eax
80102763:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102766:	c9                   	leave  
80102767:	c3                   	ret    
80102768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010276f:	90                   	nop
80102770:	83 cb 40             	or     $0x40,%ebx
80102773:	31 c0                	xor    %eax,%eax
80102775:	89 1d 7c 16 11 80    	mov    %ebx,0x8011167c
8010277b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010277e:	c9                   	leave  
8010277f:	c3                   	ret    
80102780:	83 e0 7f             	and    $0x7f,%eax
80102783:	85 d2                	test   %edx,%edx
80102785:	0f 44 c8             	cmove  %eax,%ecx
80102788:	0f b6 81 60 78 10 80 	movzbl -0x7fef87a0(%ecx),%eax
8010278f:	83 c8 40             	or     $0x40,%eax
80102792:	0f b6 c0             	movzbl %al,%eax
80102795:	f7 d0                	not    %eax
80102797:	21 d8                	and    %ebx,%eax
80102799:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010279c:	a3 7c 16 11 80       	mov    %eax,0x8011167c
801027a1:	31 c0                	xor    %eax,%eax
801027a3:	c9                   	leave  
801027a4:	c3                   	ret    
801027a5:	8d 76 00             	lea    0x0(%esi),%esi
801027a8:	8d 48 bf             	lea    -0x41(%eax),%ecx
801027ab:	8d 50 20             	lea    0x20(%eax),%edx
801027ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801027b1:	c9                   	leave  
801027b2:	83 f9 1a             	cmp    $0x1a,%ecx
801027b5:	0f 42 c2             	cmovb  %edx,%eax
801027b8:	c3                   	ret    
801027b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801027c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801027c5:	c3                   	ret    
801027c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <kbdintr>:
801027d0:	55                   	push   %ebp
801027d1:	89 e5                	mov    %esp,%ebp
801027d3:	83 ec 14             	sub    $0x14,%esp
801027d6:	68 f0 26 10 80       	push   $0x801026f0
801027db:	e8 a0 e0 ff ff       	call   80100880 <consoleintr>
801027e0:	83 c4 10             	add    $0x10,%esp
801027e3:	c9                   	leave  
801027e4:	c3                   	ret    
801027e5:	66 90                	xchg   %ax,%ax
801027e7:	66 90                	xchg   %ax,%ax
801027e9:	66 90                	xchg   %ax,%ax
801027eb:	66 90                	xchg   %ax,%ax
801027ed:	66 90                	xchg   %ax,%ax
801027ef:	90                   	nop

801027f0 <lapicinit>:
801027f0:	a1 80 16 11 80       	mov    0x80111680,%eax
801027f5:	85 c0                	test   %eax,%eax
801027f7:	0f 84 cb 00 00 00    	je     801028c8 <lapicinit+0xd8>
801027fd:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102804:	01 00 00 
80102807:	8b 50 20             	mov    0x20(%eax),%edx
8010280a:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102811:	00 00 00 
80102814:	8b 50 20             	mov    0x20(%eax),%edx
80102817:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010281e:	00 02 00 
80102821:	8b 50 20             	mov    0x20(%eax),%edx
80102824:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010282b:	96 98 00 
8010282e:	8b 50 20             	mov    0x20(%eax),%edx
80102831:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
80102838:	00 01 00 
8010283b:	8b 50 20             	mov    0x20(%eax),%edx
8010283e:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102845:	00 01 00 
80102848:	8b 50 20             	mov    0x20(%eax),%edx
8010284b:	8b 50 30             	mov    0x30(%eax),%edx
8010284e:	c1 ea 10             	shr    $0x10,%edx
80102851:	81 e2 fc 00 00 00    	and    $0xfc,%edx
80102857:	75 77                	jne    801028d0 <lapicinit+0xe0>
80102859:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102860:	00 00 00 
80102863:	8b 50 20             	mov    0x20(%eax),%edx
80102866:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010286d:	00 00 00 
80102870:	8b 50 20             	mov    0x20(%eax),%edx
80102873:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010287a:	00 00 00 
8010287d:	8b 50 20             	mov    0x20(%eax),%edx
80102880:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102887:	00 00 00 
8010288a:	8b 50 20             	mov    0x20(%eax),%edx
8010288d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102894:	00 00 00 
80102897:	8b 50 20             	mov    0x20(%eax),%edx
8010289a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801028a1:	85 08 00 
801028a4:	8b 50 20             	mov    0x20(%eax),%edx
801028a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028ae:	66 90                	xchg   %ax,%ax
801028b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801028b6:	80 e6 10             	and    $0x10,%dh
801028b9:	75 f5                	jne    801028b0 <lapicinit+0xc0>
801028bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801028c2:	00 00 00 
801028c5:	8b 40 20             	mov    0x20(%eax),%eax
801028c8:	c3                   	ret    
801028c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801028d7:	00 01 00 
801028da:	8b 50 20             	mov    0x20(%eax),%edx
801028dd:	e9 77 ff ff ff       	jmp    80102859 <lapicinit+0x69>
801028e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801028f0 <lapicid>:
801028f0:	a1 80 16 11 80       	mov    0x80111680,%eax
801028f5:	85 c0                	test   %eax,%eax
801028f7:	74 07                	je     80102900 <lapicid+0x10>
801028f9:	8b 40 20             	mov    0x20(%eax),%eax
801028fc:	c1 e8 18             	shr    $0x18,%eax
801028ff:	c3                   	ret    
80102900:	31 c0                	xor    %eax,%eax
80102902:	c3                   	ret    
80102903:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010290a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102910 <lapiceoi>:
80102910:	a1 80 16 11 80       	mov    0x80111680,%eax
80102915:	85 c0                	test   %eax,%eax
80102917:	74 0d                	je     80102926 <lapiceoi+0x16>
80102919:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102920:	00 00 00 
80102923:	8b 40 20             	mov    0x20(%eax),%eax
80102926:	c3                   	ret    
80102927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010292e:	66 90                	xchg   %ax,%ax

80102930 <microdelay>:
80102930:	c3                   	ret    
80102931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102938:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010293f:	90                   	nop

80102940 <lapicstartap>:
80102940:	55                   	push   %ebp
80102941:	b8 0f 00 00 00       	mov    $0xf,%eax
80102946:	ba 70 00 00 00       	mov    $0x70,%edx
8010294b:	89 e5                	mov    %esp,%ebp
8010294d:	53                   	push   %ebx
8010294e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102951:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102954:	ee                   	out    %al,(%dx)
80102955:	b8 0a 00 00 00       	mov    $0xa,%eax
8010295a:	ba 71 00 00 00       	mov    $0x71,%edx
8010295f:	ee                   	out    %al,(%dx)
80102960:	31 c0                	xor    %eax,%eax
80102962:	c1 e3 18             	shl    $0x18,%ebx
80102965:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010296b:	89 c8                	mov    %ecx,%eax
8010296d:	c1 e9 0c             	shr    $0xc,%ecx
80102970:	89 da                	mov    %ebx,%edx
80102972:	c1 e8 04             	shr    $0x4,%eax
80102975:	80 cd 06             	or     $0x6,%ch
80102978:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010297e:	a1 80 16 11 80       	mov    0x80111680,%eax
80102983:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102989:	8b 58 20             	mov    0x20(%eax),%ebx
8010298c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102993:	c5 00 00 
80102996:	8b 58 20             	mov    0x20(%eax),%ebx
80102999:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801029a0:	85 00 00 
801029a3:	8b 58 20             	mov    0x20(%eax),%ebx
801029a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801029ac:	8b 58 20             	mov    0x20(%eax),%ebx
801029af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801029b5:	8b 58 20             	mov    0x20(%eax),%ebx
801029b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801029be:	8b 50 20             	mov    0x20(%eax),%edx
801029c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801029c7:	8b 40 20             	mov    0x20(%eax),%eax
801029ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801029cd:	c9                   	leave  
801029ce:	c3                   	ret    
801029cf:	90                   	nop

801029d0 <cmostime>:
801029d0:	55                   	push   %ebp
801029d1:	b8 0b 00 00 00       	mov    $0xb,%eax
801029d6:	ba 70 00 00 00       	mov    $0x70,%edx
801029db:	89 e5                	mov    %esp,%ebp
801029dd:	57                   	push   %edi
801029de:	56                   	push   %esi
801029df:	53                   	push   %ebx
801029e0:	83 ec 4c             	sub    $0x4c,%esp
801029e3:	ee                   	out    %al,(%dx)
801029e4:	ba 71 00 00 00       	mov    $0x71,%edx
801029e9:	ec                   	in     (%dx),%al
801029ea:	83 e0 04             	and    $0x4,%eax
801029ed:	bb 70 00 00 00       	mov    $0x70,%ebx
801029f2:	88 45 b3             	mov    %al,-0x4d(%ebp)
801029f5:	8d 76 00             	lea    0x0(%esi),%esi
801029f8:	31 c0                	xor    %eax,%eax
801029fa:	89 da                	mov    %ebx,%edx
801029fc:	ee                   	out    %al,(%dx)
801029fd:	b9 71 00 00 00       	mov    $0x71,%ecx
80102a02:	89 ca                	mov    %ecx,%edx
80102a04:	ec                   	in     (%dx),%al
80102a05:	88 45 b7             	mov    %al,-0x49(%ebp)
80102a08:	89 da                	mov    %ebx,%edx
80102a0a:	b8 02 00 00 00       	mov    $0x2,%eax
80102a0f:	ee                   	out    %al,(%dx)
80102a10:	89 ca                	mov    %ecx,%edx
80102a12:	ec                   	in     (%dx),%al
80102a13:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102a16:	89 da                	mov    %ebx,%edx
80102a18:	b8 04 00 00 00       	mov    $0x4,%eax
80102a1d:	ee                   	out    %al,(%dx)
80102a1e:	89 ca                	mov    %ecx,%edx
80102a20:	ec                   	in     (%dx),%al
80102a21:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102a24:	89 da                	mov    %ebx,%edx
80102a26:	b8 07 00 00 00       	mov    $0x7,%eax
80102a2b:	ee                   	out    %al,(%dx)
80102a2c:	89 ca                	mov    %ecx,%edx
80102a2e:	ec                   	in     (%dx),%al
80102a2f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80102a32:	89 da                	mov    %ebx,%edx
80102a34:	b8 08 00 00 00       	mov    $0x8,%eax
80102a39:	ee                   	out    %al,(%dx)
80102a3a:	89 ca                	mov    %ecx,%edx
80102a3c:	ec                   	in     (%dx),%al
80102a3d:	89 c7                	mov    %eax,%edi
80102a3f:	89 da                	mov    %ebx,%edx
80102a41:	b8 09 00 00 00       	mov    $0x9,%eax
80102a46:	ee                   	out    %al,(%dx)
80102a47:	89 ca                	mov    %ecx,%edx
80102a49:	ec                   	in     (%dx),%al
80102a4a:	89 c6                	mov    %eax,%esi
80102a4c:	89 da                	mov    %ebx,%edx
80102a4e:	b8 0a 00 00 00       	mov    $0xa,%eax
80102a53:	ee                   	out    %al,(%dx)
80102a54:	89 ca                	mov    %ecx,%edx
80102a56:	ec                   	in     (%dx),%al
80102a57:	84 c0                	test   %al,%al
80102a59:	78 9d                	js     801029f8 <cmostime+0x28>
80102a5b:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102a5f:	89 fa                	mov    %edi,%edx
80102a61:	0f b6 fa             	movzbl %dl,%edi
80102a64:	89 f2                	mov    %esi,%edx
80102a66:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102a69:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102a6d:	0f b6 f2             	movzbl %dl,%esi
80102a70:	89 da                	mov    %ebx,%edx
80102a72:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102a75:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102a78:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102a7c:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102a7f:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102a82:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102a86:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a89:	31 c0                	xor    %eax,%eax
80102a8b:	ee                   	out    %al,(%dx)
80102a8c:	89 ca                	mov    %ecx,%edx
80102a8e:	ec                   	in     (%dx),%al
80102a8f:	0f b6 c0             	movzbl %al,%eax
80102a92:	89 da                	mov    %ebx,%edx
80102a94:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102a97:	b8 02 00 00 00       	mov    $0x2,%eax
80102a9c:	ee                   	out    %al,(%dx)
80102a9d:	89 ca                	mov    %ecx,%edx
80102a9f:	ec                   	in     (%dx),%al
80102aa0:	0f b6 c0             	movzbl %al,%eax
80102aa3:	89 da                	mov    %ebx,%edx
80102aa5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102aa8:	b8 04 00 00 00       	mov    $0x4,%eax
80102aad:	ee                   	out    %al,(%dx)
80102aae:	89 ca                	mov    %ecx,%edx
80102ab0:	ec                   	in     (%dx),%al
80102ab1:	0f b6 c0             	movzbl %al,%eax
80102ab4:	89 da                	mov    %ebx,%edx
80102ab6:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102ab9:	b8 07 00 00 00       	mov    $0x7,%eax
80102abe:	ee                   	out    %al,(%dx)
80102abf:	89 ca                	mov    %ecx,%edx
80102ac1:	ec                   	in     (%dx),%al
80102ac2:	0f b6 c0             	movzbl %al,%eax
80102ac5:	89 da                	mov    %ebx,%edx
80102ac7:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102aca:	b8 08 00 00 00       	mov    $0x8,%eax
80102acf:	ee                   	out    %al,(%dx)
80102ad0:	89 ca                	mov    %ecx,%edx
80102ad2:	ec                   	in     (%dx),%al
80102ad3:	0f b6 c0             	movzbl %al,%eax
80102ad6:	89 da                	mov    %ebx,%edx
80102ad8:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102adb:	b8 09 00 00 00       	mov    $0x9,%eax
80102ae0:	ee                   	out    %al,(%dx)
80102ae1:	89 ca                	mov    %ecx,%edx
80102ae3:	ec                   	in     (%dx),%al
80102ae4:	0f b6 c0             	movzbl %al,%eax
80102ae7:	83 ec 04             	sub    $0x4,%esp
80102aea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102aed:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102af0:	6a 18                	push   $0x18
80102af2:	50                   	push   %eax
80102af3:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102af6:	50                   	push   %eax
80102af7:	e8 34 1e 00 00       	call   80104930 <memcmp>
80102afc:	83 c4 10             	add    $0x10,%esp
80102aff:	85 c0                	test   %eax,%eax
80102b01:	0f 85 f1 fe ff ff    	jne    801029f8 <cmostime+0x28>
80102b07:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102b0b:	75 78                	jne    80102b85 <cmostime+0x1b5>
80102b0d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b10:	89 c2                	mov    %eax,%edx
80102b12:	83 e0 0f             	and    $0xf,%eax
80102b15:	c1 ea 04             	shr    $0x4,%edx
80102b18:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b1b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b1e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102b21:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b24:	89 c2                	mov    %eax,%edx
80102b26:	83 e0 0f             	and    $0xf,%eax
80102b29:	c1 ea 04             	shr    $0x4,%edx
80102b2c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b2f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b32:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102b35:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b38:	89 c2                	mov    %eax,%edx
80102b3a:	83 e0 0f             	and    $0xf,%eax
80102b3d:	c1 ea 04             	shr    $0x4,%edx
80102b40:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b43:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b46:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102b49:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b4c:	89 c2                	mov    %eax,%edx
80102b4e:	83 e0 0f             	and    $0xf,%eax
80102b51:	c1 ea 04             	shr    $0x4,%edx
80102b54:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b57:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b5a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102b5d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b60:	89 c2                	mov    %eax,%edx
80102b62:	83 e0 0f             	and    $0xf,%eax
80102b65:	c1 ea 04             	shr    $0x4,%edx
80102b68:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b6b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b6e:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102b71:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b74:	89 c2                	mov    %eax,%edx
80102b76:	83 e0 0f             	and    $0xf,%eax
80102b79:	c1 ea 04             	shr    $0x4,%edx
80102b7c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b7f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b82:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102b85:	8b 75 08             	mov    0x8(%ebp),%esi
80102b88:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b8b:	89 06                	mov    %eax,(%esi)
80102b8d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b90:	89 46 04             	mov    %eax,0x4(%esi)
80102b93:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b96:	89 46 08             	mov    %eax,0x8(%esi)
80102b99:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b9c:	89 46 0c             	mov    %eax,0xc(%esi)
80102b9f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102ba2:	89 46 10             	mov    %eax,0x10(%esi)
80102ba5:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102ba8:	89 46 14             	mov    %eax,0x14(%esi)
80102bab:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102bb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102bb5:	5b                   	pop    %ebx
80102bb6:	5e                   	pop    %esi
80102bb7:	5f                   	pop    %edi
80102bb8:	5d                   	pop    %ebp
80102bb9:	c3                   	ret    
80102bba:	66 90                	xchg   %ax,%ax
80102bbc:	66 90                	xchg   %ax,%ax
80102bbe:	66 90                	xchg   %ax,%ax

80102bc0 <install_trans>:
80102bc0:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102bc6:	85 c9                	test   %ecx,%ecx
80102bc8:	0f 8e 8a 00 00 00    	jle    80102c58 <install_trans+0x98>
80102bce:	55                   	push   %ebp
80102bcf:	89 e5                	mov    %esp,%ebp
80102bd1:	57                   	push   %edi
80102bd2:	31 ff                	xor    %edi,%edi
80102bd4:	56                   	push   %esi
80102bd5:	53                   	push   %ebx
80102bd6:	83 ec 0c             	sub    $0xc,%esp
80102bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102be0:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102be5:	83 ec 08             	sub    $0x8,%esp
80102be8:	01 f8                	add    %edi,%eax
80102bea:	83 c0 01             	add    $0x1,%eax
80102bed:	50                   	push   %eax
80102bee:	ff 35 e4 16 11 80    	push   0x801116e4
80102bf4:	e8 d7 d4 ff ff       	call   801000d0 <bread>
80102bf9:	89 c6                	mov    %eax,%esi
80102bfb:	58                   	pop    %eax
80102bfc:	5a                   	pop    %edx
80102bfd:	ff 34 bd ec 16 11 80 	push   -0x7feee914(,%edi,4)
80102c04:	ff 35 e4 16 11 80    	push   0x801116e4
80102c0a:	83 c7 01             	add    $0x1,%edi
80102c0d:	e8 be d4 ff ff       	call   801000d0 <bread>
80102c12:	83 c4 0c             	add    $0xc,%esp
80102c15:	89 c3                	mov    %eax,%ebx
80102c17:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c1a:	68 00 02 00 00       	push   $0x200
80102c1f:	50                   	push   %eax
80102c20:	8d 43 5c             	lea    0x5c(%ebx),%eax
80102c23:	50                   	push   %eax
80102c24:	e8 57 1d 00 00       	call   80104980 <memmove>
80102c29:	89 1c 24             	mov    %ebx,(%esp)
80102c2c:	e8 7f d5 ff ff       	call   801001b0 <bwrite>
80102c31:	89 34 24             	mov    %esi,(%esp)
80102c34:	e8 b7 d5 ff ff       	call   801001f0 <brelse>
80102c39:	89 1c 24             	mov    %ebx,(%esp)
80102c3c:	e8 af d5 ff ff       	call   801001f0 <brelse>
80102c41:	83 c4 10             	add    $0x10,%esp
80102c44:	39 3d e8 16 11 80    	cmp    %edi,0x801116e8
80102c4a:	7f 94                	jg     80102be0 <install_trans+0x20>
80102c4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c4f:	5b                   	pop    %ebx
80102c50:	5e                   	pop    %esi
80102c51:	5f                   	pop    %edi
80102c52:	5d                   	pop    %ebp
80102c53:	c3                   	ret    
80102c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c58:	c3                   	ret    
80102c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102c60 <write_head>:
80102c60:	55                   	push   %ebp
80102c61:	89 e5                	mov    %esp,%ebp
80102c63:	53                   	push   %ebx
80102c64:	83 ec 0c             	sub    $0xc,%esp
80102c67:	ff 35 d4 16 11 80    	push   0x801116d4
80102c6d:	ff 35 e4 16 11 80    	push   0x801116e4
80102c73:	e8 58 d4 ff ff       	call   801000d0 <bread>
80102c78:	83 c4 10             	add    $0x10,%esp
80102c7b:	89 c3                	mov    %eax,%ebx
80102c7d:	a1 e8 16 11 80       	mov    0x801116e8,%eax
80102c82:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102c85:	85 c0                	test   %eax,%eax
80102c87:	7e 19                	jle    80102ca2 <write_head+0x42>
80102c89:	31 d2                	xor    %edx,%edx
80102c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c8f:	90                   	nop
80102c90:	8b 0c 95 ec 16 11 80 	mov    -0x7feee914(,%edx,4),%ecx
80102c97:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
80102c9b:	83 c2 01             	add    $0x1,%edx
80102c9e:	39 d0                	cmp    %edx,%eax
80102ca0:	75 ee                	jne    80102c90 <write_head+0x30>
80102ca2:	83 ec 0c             	sub    $0xc,%esp
80102ca5:	53                   	push   %ebx
80102ca6:	e8 05 d5 ff ff       	call   801001b0 <bwrite>
80102cab:	89 1c 24             	mov    %ebx,(%esp)
80102cae:	e8 3d d5 ff ff       	call   801001f0 <brelse>
80102cb3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102cb6:	83 c4 10             	add    $0x10,%esp
80102cb9:	c9                   	leave  
80102cba:	c3                   	ret    
80102cbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102cbf:	90                   	nop

80102cc0 <initlog>:
80102cc0:	55                   	push   %ebp
80102cc1:	89 e5                	mov    %esp,%ebp
80102cc3:	53                   	push   %ebx
80102cc4:	83 ec 2c             	sub    $0x2c,%esp
80102cc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102cca:	68 60 79 10 80       	push   $0x80107960
80102ccf:	68 a0 16 11 80       	push   $0x801116a0
80102cd4:	e8 77 19 00 00       	call   80104650 <initlock>
80102cd9:	58                   	pop    %eax
80102cda:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102cdd:	5a                   	pop    %edx
80102cde:	50                   	push   %eax
80102cdf:	53                   	push   %ebx
80102ce0:	e8 3b e8 ff ff       	call   80101520 <readsb>
80102ce5:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102ce8:	59                   	pop    %ecx
80102ce9:	89 1d e4 16 11 80    	mov    %ebx,0x801116e4
80102cef:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102cf2:	a3 d4 16 11 80       	mov    %eax,0x801116d4
80102cf7:	89 15 d8 16 11 80    	mov    %edx,0x801116d8
80102cfd:	5a                   	pop    %edx
80102cfe:	50                   	push   %eax
80102cff:	53                   	push   %ebx
80102d00:	e8 cb d3 ff ff       	call   801000d0 <bread>
80102d05:	83 c4 10             	add    $0x10,%esp
80102d08:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102d0b:	89 1d e8 16 11 80    	mov    %ebx,0x801116e8
80102d11:	85 db                	test   %ebx,%ebx
80102d13:	7e 1d                	jle    80102d32 <initlog+0x72>
80102d15:	31 d2                	xor    %edx,%edx
80102d17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d1e:	66 90                	xchg   %ax,%ax
80102d20:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102d24:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
80102d2b:	83 c2 01             	add    $0x1,%edx
80102d2e:	39 d3                	cmp    %edx,%ebx
80102d30:	75 ee                	jne    80102d20 <initlog+0x60>
80102d32:	83 ec 0c             	sub    $0xc,%esp
80102d35:	50                   	push   %eax
80102d36:	e8 b5 d4 ff ff       	call   801001f0 <brelse>
80102d3b:	e8 80 fe ff ff       	call   80102bc0 <install_trans>
80102d40:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102d47:	00 00 00 
80102d4a:	e8 11 ff ff ff       	call   80102c60 <write_head>
80102d4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d52:	83 c4 10             	add    $0x10,%esp
80102d55:	c9                   	leave  
80102d56:	c3                   	ret    
80102d57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d5e:	66 90                	xchg   %ax,%ax

80102d60 <begin_op>:
80102d60:	55                   	push   %ebp
80102d61:	89 e5                	mov    %esp,%ebp
80102d63:	83 ec 14             	sub    $0x14,%esp
80102d66:	68 a0 16 11 80       	push   $0x801116a0
80102d6b:	e8 b0 1a 00 00       	call   80104820 <acquire>
80102d70:	83 c4 10             	add    $0x10,%esp
80102d73:	eb 18                	jmp    80102d8d <begin_op+0x2d>
80102d75:	8d 76 00             	lea    0x0(%esi),%esi
80102d78:	83 ec 08             	sub    $0x8,%esp
80102d7b:	68 a0 16 11 80       	push   $0x801116a0
80102d80:	68 a0 16 11 80       	push   $0x801116a0
80102d85:	e8 36 15 00 00       	call   801042c0 <sleep>
80102d8a:	83 c4 10             	add    $0x10,%esp
80102d8d:	a1 e0 16 11 80       	mov    0x801116e0,%eax
80102d92:	85 c0                	test   %eax,%eax
80102d94:	75 e2                	jne    80102d78 <begin_op+0x18>
80102d96:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102d9b:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102da1:	83 c0 01             	add    $0x1,%eax
80102da4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102da7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102daa:	83 fa 1e             	cmp    $0x1e,%edx
80102dad:	7f c9                	jg     80102d78 <begin_op+0x18>
80102daf:	83 ec 0c             	sub    $0xc,%esp
80102db2:	a3 dc 16 11 80       	mov    %eax,0x801116dc
80102db7:	68 a0 16 11 80       	push   $0x801116a0
80102dbc:	e8 ff 19 00 00       	call   801047c0 <release>
80102dc1:	83 c4 10             	add    $0x10,%esp
80102dc4:	c9                   	leave  
80102dc5:	c3                   	ret    
80102dc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102dcd:	8d 76 00             	lea    0x0(%esi),%esi

80102dd0 <end_op>:
80102dd0:	55                   	push   %ebp
80102dd1:	89 e5                	mov    %esp,%ebp
80102dd3:	57                   	push   %edi
80102dd4:	56                   	push   %esi
80102dd5:	53                   	push   %ebx
80102dd6:	83 ec 18             	sub    $0x18,%esp
80102dd9:	68 a0 16 11 80       	push   $0x801116a0
80102dde:	e8 3d 1a 00 00       	call   80104820 <acquire>
80102de3:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102de8:	8b 35 e0 16 11 80    	mov    0x801116e0,%esi
80102dee:	83 c4 10             	add    $0x10,%esp
80102df1:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102df4:	89 1d dc 16 11 80    	mov    %ebx,0x801116dc
80102dfa:	85 f6                	test   %esi,%esi
80102dfc:	0f 85 22 01 00 00    	jne    80102f24 <end_op+0x154>
80102e02:	85 db                	test   %ebx,%ebx
80102e04:	0f 85 f6 00 00 00    	jne    80102f00 <end_op+0x130>
80102e0a:	c7 05 e0 16 11 80 01 	movl   $0x1,0x801116e0
80102e11:	00 00 00 
80102e14:	83 ec 0c             	sub    $0xc,%esp
80102e17:	68 a0 16 11 80       	push   $0x801116a0
80102e1c:	e8 9f 19 00 00       	call   801047c0 <release>
80102e21:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102e27:	83 c4 10             	add    $0x10,%esp
80102e2a:	85 c9                	test   %ecx,%ecx
80102e2c:	7f 42                	jg     80102e70 <end_op+0xa0>
80102e2e:	83 ec 0c             	sub    $0xc,%esp
80102e31:	68 a0 16 11 80       	push   $0x801116a0
80102e36:	e8 e5 19 00 00       	call   80104820 <acquire>
80102e3b:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102e42:	c7 05 e0 16 11 80 00 	movl   $0x0,0x801116e0
80102e49:	00 00 00 
80102e4c:	e8 2f 15 00 00       	call   80104380 <wakeup>
80102e51:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102e58:	e8 63 19 00 00       	call   801047c0 <release>
80102e5d:	83 c4 10             	add    $0x10,%esp
80102e60:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e63:	5b                   	pop    %ebx
80102e64:	5e                   	pop    %esi
80102e65:	5f                   	pop    %edi
80102e66:	5d                   	pop    %ebp
80102e67:	c3                   	ret    
80102e68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e6f:	90                   	nop
80102e70:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102e75:	83 ec 08             	sub    $0x8,%esp
80102e78:	01 d8                	add    %ebx,%eax
80102e7a:	83 c0 01             	add    $0x1,%eax
80102e7d:	50                   	push   %eax
80102e7e:	ff 35 e4 16 11 80    	push   0x801116e4
80102e84:	e8 47 d2 ff ff       	call   801000d0 <bread>
80102e89:	89 c6                	mov    %eax,%esi
80102e8b:	58                   	pop    %eax
80102e8c:	5a                   	pop    %edx
80102e8d:	ff 34 9d ec 16 11 80 	push   -0x7feee914(,%ebx,4)
80102e94:	ff 35 e4 16 11 80    	push   0x801116e4
80102e9a:	83 c3 01             	add    $0x1,%ebx
80102e9d:	e8 2e d2 ff ff       	call   801000d0 <bread>
80102ea2:	83 c4 0c             	add    $0xc,%esp
80102ea5:	89 c7                	mov    %eax,%edi
80102ea7:	8d 40 5c             	lea    0x5c(%eax),%eax
80102eaa:	68 00 02 00 00       	push   $0x200
80102eaf:	50                   	push   %eax
80102eb0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102eb3:	50                   	push   %eax
80102eb4:	e8 c7 1a 00 00       	call   80104980 <memmove>
80102eb9:	89 34 24             	mov    %esi,(%esp)
80102ebc:	e8 ef d2 ff ff       	call   801001b0 <bwrite>
80102ec1:	89 3c 24             	mov    %edi,(%esp)
80102ec4:	e8 27 d3 ff ff       	call   801001f0 <brelse>
80102ec9:	89 34 24             	mov    %esi,(%esp)
80102ecc:	e8 1f d3 ff ff       	call   801001f0 <brelse>
80102ed1:	83 c4 10             	add    $0x10,%esp
80102ed4:	3b 1d e8 16 11 80    	cmp    0x801116e8,%ebx
80102eda:	7c 94                	jl     80102e70 <end_op+0xa0>
80102edc:	e8 7f fd ff ff       	call   80102c60 <write_head>
80102ee1:	e8 da fc ff ff       	call   80102bc0 <install_trans>
80102ee6:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102eed:	00 00 00 
80102ef0:	e8 6b fd ff ff       	call   80102c60 <write_head>
80102ef5:	e9 34 ff ff ff       	jmp    80102e2e <end_op+0x5e>
80102efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102f00:	83 ec 0c             	sub    $0xc,%esp
80102f03:	68 a0 16 11 80       	push   $0x801116a0
80102f08:	e8 73 14 00 00       	call   80104380 <wakeup>
80102f0d:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102f14:	e8 a7 18 00 00       	call   801047c0 <release>
80102f19:	83 c4 10             	add    $0x10,%esp
80102f1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f1f:	5b                   	pop    %ebx
80102f20:	5e                   	pop    %esi
80102f21:	5f                   	pop    %edi
80102f22:	5d                   	pop    %ebp
80102f23:	c3                   	ret    
80102f24:	83 ec 0c             	sub    $0xc,%esp
80102f27:	68 64 79 10 80       	push   $0x80107964
80102f2c:	e8 4f d4 ff ff       	call   80100380 <panic>
80102f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f3f:	90                   	nop

80102f40 <log_write>:
80102f40:	55                   	push   %ebp
80102f41:	89 e5                	mov    %esp,%ebp
80102f43:	53                   	push   %ebx
80102f44:	83 ec 04             	sub    $0x4,%esp
80102f47:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102f4d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f50:	83 fa 1d             	cmp    $0x1d,%edx
80102f53:	0f 8f 85 00 00 00    	jg     80102fde <log_write+0x9e>
80102f59:	a1 d8 16 11 80       	mov    0x801116d8,%eax
80102f5e:	83 e8 01             	sub    $0x1,%eax
80102f61:	39 c2                	cmp    %eax,%edx
80102f63:	7d 79                	jge    80102fde <log_write+0x9e>
80102f65:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102f6a:	85 c0                	test   %eax,%eax
80102f6c:	7e 7d                	jle    80102feb <log_write+0xab>
80102f6e:	83 ec 0c             	sub    $0xc,%esp
80102f71:	68 a0 16 11 80       	push   $0x801116a0
80102f76:	e8 a5 18 00 00       	call   80104820 <acquire>
80102f7b:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102f81:	83 c4 10             	add    $0x10,%esp
80102f84:	85 d2                	test   %edx,%edx
80102f86:	7e 4a                	jle    80102fd2 <log_write+0x92>
80102f88:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102f8b:	31 c0                	xor    %eax,%eax
80102f8d:	eb 08                	jmp    80102f97 <log_write+0x57>
80102f8f:	90                   	nop
80102f90:	83 c0 01             	add    $0x1,%eax
80102f93:	39 c2                	cmp    %eax,%edx
80102f95:	74 29                	je     80102fc0 <log_write+0x80>
80102f97:	39 0c 85 ec 16 11 80 	cmp    %ecx,-0x7feee914(,%eax,4)
80102f9e:	75 f0                	jne    80102f90 <log_write+0x50>
80102fa0:	89 0c 85 ec 16 11 80 	mov    %ecx,-0x7feee914(,%eax,4)
80102fa7:	83 0b 04             	orl    $0x4,(%ebx)
80102faa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102fad:	c7 45 08 a0 16 11 80 	movl   $0x801116a0,0x8(%ebp)
80102fb4:	c9                   	leave  
80102fb5:	e9 06 18 00 00       	jmp    801047c0 <release>
80102fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102fc0:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
80102fc7:	83 c2 01             	add    $0x1,%edx
80102fca:	89 15 e8 16 11 80    	mov    %edx,0x801116e8
80102fd0:	eb d5                	jmp    80102fa7 <log_write+0x67>
80102fd2:	8b 43 08             	mov    0x8(%ebx),%eax
80102fd5:	a3 ec 16 11 80       	mov    %eax,0x801116ec
80102fda:	75 cb                	jne    80102fa7 <log_write+0x67>
80102fdc:	eb e9                	jmp    80102fc7 <log_write+0x87>
80102fde:	83 ec 0c             	sub    $0xc,%esp
80102fe1:	68 73 79 10 80       	push   $0x80107973
80102fe6:	e8 95 d3 ff ff       	call   80100380 <panic>
80102feb:	83 ec 0c             	sub    $0xc,%esp
80102fee:	68 89 79 10 80       	push   $0x80107989
80102ff3:	e8 88 d3 ff ff       	call   80100380 <panic>
80102ff8:	66 90                	xchg   %ax,%ax
80102ffa:	66 90                	xchg   %ax,%ax
80102ffc:	66 90                	xchg   %ax,%ax
80102ffe:	66 90                	xchg   %ax,%ax

80103000 <mpmain>:
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	53                   	push   %ebx
80103004:	83 ec 04             	sub    $0x4,%esp
80103007:	e8 44 09 00 00       	call   80103950 <cpuid>
8010300c:	89 c3                	mov    %eax,%ebx
8010300e:	e8 3d 09 00 00       	call   80103950 <cpuid>
80103013:	83 ec 04             	sub    $0x4,%esp
80103016:	53                   	push   %ebx
80103017:	50                   	push   %eax
80103018:	68 a4 79 10 80       	push   $0x801079a4
8010301d:	e8 7e d6 ff ff       	call   801006a0 <cprintf>
80103022:	e8 d9 2b 00 00       	call   80105c00 <idtinit>
80103027:	e8 c4 08 00 00       	call   801038f0 <mycpu>
8010302c:	89 c2                	mov    %eax,%edx
8010302e:	b8 01 00 00 00       	mov    $0x1,%eax
80103033:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
8010303a:	e8 31 0d 00 00       	call   80103d70 <scheduler>
8010303f:	90                   	nop

80103040 <mpenter>:
80103040:	55                   	push   %ebp
80103041:	89 e5                	mov    %esp,%ebp
80103043:	83 ec 08             	sub    $0x8,%esp
80103046:	e8 a5 3c 00 00       	call   80106cf0 <switchkvm>
8010304b:	e8 10 3c 00 00       	call   80106c60 <seginit>
80103050:	e8 9b f7 ff ff       	call   801027f0 <lapicinit>
80103055:	e8 a6 ff ff ff       	call   80103000 <mpmain>
8010305a:	66 90                	xchg   %ax,%ax
8010305c:	66 90                	xchg   %ax,%ax
8010305e:	66 90                	xchg   %ax,%ax

80103060 <main>:
80103060:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103064:	83 e4 f0             	and    $0xfffffff0,%esp
80103067:	ff 71 fc             	push   -0x4(%ecx)
8010306a:	55                   	push   %ebp
8010306b:	89 e5                	mov    %esp,%ebp
8010306d:	53                   	push   %ebx
8010306e:	51                   	push   %ecx
8010306f:	83 ec 08             	sub    $0x8,%esp
80103072:	68 00 00 40 80       	push   $0x80400000
80103077:	68 d0 55 11 80       	push   $0x801155d0
8010307c:	e8 8f f5 ff ff       	call   80102610 <kinit1>
80103081:	e8 5a 41 00 00       	call   801071e0 <kvmalloc>
80103086:	e8 85 01 00 00       	call   80103210 <mpinit>
8010308b:	e8 60 f7 ff ff       	call   801027f0 <lapicinit>
80103090:	e8 cb 3b 00 00       	call   80106c60 <seginit>
80103095:	e8 76 03 00 00       	call   80103410 <picinit>
8010309a:	e8 31 f3 ff ff       	call   801023d0 <ioapicinit>
8010309f:	e8 bc d9 ff ff       	call   80100a60 <consoleinit>
801030a4:	e8 47 2e 00 00       	call   80105ef0 <uartinit>
801030a9:	e8 22 08 00 00       	call   801038d0 <pinit>
801030ae:	e8 cd 2a 00 00       	call   80105b80 <tvinit>
801030b3:	e8 88 cf ff ff       	call   80100040 <binit>
801030b8:	e8 53 dd ff ff       	call   80100e10 <fileinit>
801030bd:	e8 fe f0 ff ff       	call   801021c0 <ideinit>
801030c2:	83 c4 0c             	add    $0xc,%esp
801030c5:	68 8a 00 00 00       	push   $0x8a
801030ca:	68 8c a4 10 80       	push   $0x8010a48c
801030cf:	68 00 70 00 80       	push   $0x80007000
801030d4:	e8 a7 18 00 00       	call   80104980 <memmove>
801030d9:	83 c4 10             	add    $0x10,%esp
801030dc:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
801030e3:	00 00 00 
801030e6:	05 a0 17 11 80       	add    $0x801117a0,%eax
801030eb:	3d a0 17 11 80       	cmp    $0x801117a0,%eax
801030f0:	76 7e                	jbe    80103170 <main+0x110>
801030f2:	bb a0 17 11 80       	mov    $0x801117a0,%ebx
801030f7:	eb 20                	jmp    80103119 <main+0xb9>
801030f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103100:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
80103107:	00 00 00 
8010310a:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103110:	05 a0 17 11 80       	add    $0x801117a0,%eax
80103115:	39 c3                	cmp    %eax,%ebx
80103117:	73 57                	jae    80103170 <main+0x110>
80103119:	e8 d2 07 00 00       	call   801038f0 <mycpu>
8010311e:	39 c3                	cmp    %eax,%ebx
80103120:	74 de                	je     80103100 <main+0xa0>
80103122:	e8 59 f5 ff ff       	call   80102680 <kalloc>
80103127:	83 ec 08             	sub    $0x8,%esp
8010312a:	c7 05 f8 6f 00 80 40 	movl   $0x80103040,0x80006ff8
80103131:	30 10 80 
80103134:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
8010313b:	90 10 00 
8010313e:	05 00 10 00 00       	add    $0x1000,%eax
80103143:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80103148:	0f b6 03             	movzbl (%ebx),%eax
8010314b:	68 00 70 00 00       	push   $0x7000
80103150:	50                   	push   %eax
80103151:	e8 ea f7 ff ff       	call   80102940 <lapicstartap>
80103156:	83 c4 10             	add    $0x10,%esp
80103159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103160:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103166:	85 c0                	test   %eax,%eax
80103168:	74 f6                	je     80103160 <main+0x100>
8010316a:	eb 94                	jmp    80103100 <main+0xa0>
8010316c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103170:	83 ec 08             	sub    $0x8,%esp
80103173:	68 00 00 00 8e       	push   $0x8e000000
80103178:	68 00 00 40 80       	push   $0x80400000
8010317d:	e8 2e f4 ff ff       	call   801025b0 <kinit2>
80103182:	e8 19 08 00 00       	call   801039a0 <userinit>
80103187:	e8 74 fe ff ff       	call   80103000 <mpmain>
8010318c:	66 90                	xchg   %ax,%ax
8010318e:	66 90                	xchg   %ax,%ax

80103190 <mpsearch1>:
80103190:	55                   	push   %ebp
80103191:	89 e5                	mov    %esp,%ebp
80103193:	57                   	push   %edi
80103194:	56                   	push   %esi
80103195:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010319b:	53                   	push   %ebx
8010319c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010319f:	83 ec 0c             	sub    $0xc,%esp
801031a2:	39 de                	cmp    %ebx,%esi
801031a4:	72 10                	jb     801031b6 <mpsearch1+0x26>
801031a6:	eb 50                	jmp    801031f8 <mpsearch1+0x68>
801031a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801031af:	90                   	nop
801031b0:	89 fe                	mov    %edi,%esi
801031b2:	39 fb                	cmp    %edi,%ebx
801031b4:	76 42                	jbe    801031f8 <mpsearch1+0x68>
801031b6:	83 ec 04             	sub    $0x4,%esp
801031b9:	8d 7e 10             	lea    0x10(%esi),%edi
801031bc:	6a 04                	push   $0x4
801031be:	68 b8 79 10 80       	push   $0x801079b8
801031c3:	56                   	push   %esi
801031c4:	e8 67 17 00 00       	call   80104930 <memcmp>
801031c9:	83 c4 10             	add    $0x10,%esp
801031cc:	85 c0                	test   %eax,%eax
801031ce:	75 e0                	jne    801031b0 <mpsearch1+0x20>
801031d0:	89 f2                	mov    %esi,%edx
801031d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031d8:	0f b6 0a             	movzbl (%edx),%ecx
801031db:	83 c2 01             	add    $0x1,%edx
801031de:	01 c8                	add    %ecx,%eax
801031e0:	39 fa                	cmp    %edi,%edx
801031e2:	75 f4                	jne    801031d8 <mpsearch1+0x48>
801031e4:	84 c0                	test   %al,%al
801031e6:	75 c8                	jne    801031b0 <mpsearch1+0x20>
801031e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031eb:	89 f0                	mov    %esi,%eax
801031ed:	5b                   	pop    %ebx
801031ee:	5e                   	pop    %esi
801031ef:	5f                   	pop    %edi
801031f0:	5d                   	pop    %ebp
801031f1:	c3                   	ret    
801031f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031fb:	31 f6                	xor    %esi,%esi
801031fd:	5b                   	pop    %ebx
801031fe:	89 f0                	mov    %esi,%eax
80103200:	5e                   	pop    %esi
80103201:	5f                   	pop    %edi
80103202:	5d                   	pop    %ebp
80103203:	c3                   	ret    
80103204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010320b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010320f:	90                   	nop

80103210 <mpinit>:
80103210:	55                   	push   %ebp
80103211:	89 e5                	mov    %esp,%ebp
80103213:	57                   	push   %edi
80103214:	56                   	push   %esi
80103215:	53                   	push   %ebx
80103216:	83 ec 1c             	sub    $0x1c,%esp
80103219:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103220:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103227:	c1 e0 08             	shl    $0x8,%eax
8010322a:	09 d0                	or     %edx,%eax
8010322c:	c1 e0 04             	shl    $0x4,%eax
8010322f:	75 1b                	jne    8010324c <mpinit+0x3c>
80103231:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80103238:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
8010323f:	c1 e0 08             	shl    $0x8,%eax
80103242:	09 d0                	or     %edx,%eax
80103244:	c1 e0 0a             	shl    $0xa,%eax
80103247:	2d 00 04 00 00       	sub    $0x400,%eax
8010324c:	ba 00 04 00 00       	mov    $0x400,%edx
80103251:	e8 3a ff ff ff       	call   80103190 <mpsearch1>
80103256:	89 c3                	mov    %eax,%ebx
80103258:	85 c0                	test   %eax,%eax
8010325a:	0f 84 40 01 00 00    	je     801033a0 <mpinit+0x190>
80103260:	8b 73 04             	mov    0x4(%ebx),%esi
80103263:	85 f6                	test   %esi,%esi
80103265:	0f 84 25 01 00 00    	je     80103390 <mpinit+0x180>
8010326b:	83 ec 04             	sub    $0x4,%esp
8010326e:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80103274:	6a 04                	push   $0x4
80103276:	68 bd 79 10 80       	push   $0x801079bd
8010327b:	50                   	push   %eax
8010327c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010327f:	e8 ac 16 00 00       	call   80104930 <memcmp>
80103284:	83 c4 10             	add    $0x10,%esp
80103287:	85 c0                	test   %eax,%eax
80103289:	0f 85 01 01 00 00    	jne    80103390 <mpinit+0x180>
8010328f:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
80103296:	3c 01                	cmp    $0x1,%al
80103298:	74 08                	je     801032a2 <mpinit+0x92>
8010329a:	3c 04                	cmp    $0x4,%al
8010329c:	0f 85 ee 00 00 00    	jne    80103390 <mpinit+0x180>
801032a2:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
801032a9:	66 85 d2             	test   %dx,%dx
801032ac:	74 22                	je     801032d0 <mpinit+0xc0>
801032ae:	8d 3c 32             	lea    (%edx,%esi,1),%edi
801032b1:	89 f0                	mov    %esi,%eax
801032b3:	31 d2                	xor    %edx,%edx
801032b5:	8d 76 00             	lea    0x0(%esi),%esi
801032b8:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
801032bf:	83 c0 01             	add    $0x1,%eax
801032c2:	01 ca                	add    %ecx,%edx
801032c4:	39 c7                	cmp    %eax,%edi
801032c6:	75 f0                	jne    801032b8 <mpinit+0xa8>
801032c8:	84 d2                	test   %dl,%dl
801032ca:	0f 85 c0 00 00 00    	jne    80103390 <mpinit+0x180>
801032d0:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
801032d6:	a3 80 16 11 80       	mov    %eax,0x80111680
801032db:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
801032e2:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
801032e8:	be 01 00 00 00       	mov    $0x1,%esi
801032ed:	03 55 e4             	add    -0x1c(%ebp),%edx
801032f0:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801032f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801032f7:	90                   	nop
801032f8:	39 d0                	cmp    %edx,%eax
801032fa:	73 15                	jae    80103311 <mpinit+0x101>
801032fc:	0f b6 08             	movzbl (%eax),%ecx
801032ff:	80 f9 02             	cmp    $0x2,%cl
80103302:	74 4c                	je     80103350 <mpinit+0x140>
80103304:	77 3a                	ja     80103340 <mpinit+0x130>
80103306:	84 c9                	test   %cl,%cl
80103308:	74 56                	je     80103360 <mpinit+0x150>
8010330a:	83 c0 08             	add    $0x8,%eax
8010330d:	39 d0                	cmp    %edx,%eax
8010330f:	72 eb                	jb     801032fc <mpinit+0xec>
80103311:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103314:	85 f6                	test   %esi,%esi
80103316:	0f 84 d9 00 00 00    	je     801033f5 <mpinit+0x1e5>
8010331c:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
80103320:	74 15                	je     80103337 <mpinit+0x127>
80103322:	b8 70 00 00 00       	mov    $0x70,%eax
80103327:	ba 22 00 00 00       	mov    $0x22,%edx
8010332c:	ee                   	out    %al,(%dx)
8010332d:	ba 23 00 00 00       	mov    $0x23,%edx
80103332:	ec                   	in     (%dx),%al
80103333:	83 c8 01             	or     $0x1,%eax
80103336:	ee                   	out    %al,(%dx)
80103337:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010333a:	5b                   	pop    %ebx
8010333b:	5e                   	pop    %esi
8010333c:	5f                   	pop    %edi
8010333d:	5d                   	pop    %ebp
8010333e:	c3                   	ret    
8010333f:	90                   	nop
80103340:	83 e9 03             	sub    $0x3,%ecx
80103343:	80 f9 01             	cmp    $0x1,%cl
80103346:	76 c2                	jbe    8010330a <mpinit+0xfa>
80103348:	31 f6                	xor    %esi,%esi
8010334a:	eb ac                	jmp    801032f8 <mpinit+0xe8>
8010334c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103350:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
80103354:	83 c0 08             	add    $0x8,%eax
80103357:	88 0d 80 17 11 80    	mov    %cl,0x80111780
8010335d:	eb 99                	jmp    801032f8 <mpinit+0xe8>
8010335f:	90                   	nop
80103360:	8b 0d 84 17 11 80    	mov    0x80111784,%ecx
80103366:	83 f9 07             	cmp    $0x7,%ecx
80103369:	7f 19                	jg     80103384 <mpinit+0x174>
8010336b:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
80103371:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
80103375:	83 c1 01             	add    $0x1,%ecx
80103378:	89 0d 84 17 11 80    	mov    %ecx,0x80111784
8010337e:	88 9f a0 17 11 80    	mov    %bl,-0x7feee860(%edi)
80103384:	83 c0 14             	add    $0x14,%eax
80103387:	e9 6c ff ff ff       	jmp    801032f8 <mpinit+0xe8>
8010338c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103390:	83 ec 0c             	sub    $0xc,%esp
80103393:	68 c2 79 10 80       	push   $0x801079c2
80103398:	e8 e3 cf ff ff       	call   80100380 <panic>
8010339d:	8d 76 00             	lea    0x0(%esi),%esi
801033a0:	bb 00 00 0f 80       	mov    $0x800f0000,%ebx
801033a5:	eb 13                	jmp    801033ba <mpinit+0x1aa>
801033a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033ae:	66 90                	xchg   %ax,%ax
801033b0:	89 f3                	mov    %esi,%ebx
801033b2:	81 fe 00 00 10 80    	cmp    $0x80100000,%esi
801033b8:	74 d6                	je     80103390 <mpinit+0x180>
801033ba:	83 ec 04             	sub    $0x4,%esp
801033bd:	8d 73 10             	lea    0x10(%ebx),%esi
801033c0:	6a 04                	push   $0x4
801033c2:	68 b8 79 10 80       	push   $0x801079b8
801033c7:	53                   	push   %ebx
801033c8:	e8 63 15 00 00       	call   80104930 <memcmp>
801033cd:	83 c4 10             	add    $0x10,%esp
801033d0:	85 c0                	test   %eax,%eax
801033d2:	75 dc                	jne    801033b0 <mpinit+0x1a0>
801033d4:	89 da                	mov    %ebx,%edx
801033d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033dd:	8d 76 00             	lea    0x0(%esi),%esi
801033e0:	0f b6 0a             	movzbl (%edx),%ecx
801033e3:	83 c2 01             	add    $0x1,%edx
801033e6:	01 c8                	add    %ecx,%eax
801033e8:	39 d6                	cmp    %edx,%esi
801033ea:	75 f4                	jne    801033e0 <mpinit+0x1d0>
801033ec:	84 c0                	test   %al,%al
801033ee:	75 c0                	jne    801033b0 <mpinit+0x1a0>
801033f0:	e9 6b fe ff ff       	jmp    80103260 <mpinit+0x50>
801033f5:	83 ec 0c             	sub    $0xc,%esp
801033f8:	68 dc 79 10 80       	push   $0x801079dc
801033fd:	e8 7e cf ff ff       	call   80100380 <panic>
80103402:	66 90                	xchg   %ax,%ax
80103404:	66 90                	xchg   %ax,%ax
80103406:	66 90                	xchg   %ax,%ax
80103408:	66 90                	xchg   %ax,%ax
8010340a:	66 90                	xchg   %ax,%ax
8010340c:	66 90                	xchg   %ax,%ax
8010340e:	66 90                	xchg   %ax,%ax

80103410 <picinit>:
80103410:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103415:	ba 21 00 00 00       	mov    $0x21,%edx
8010341a:	ee                   	out    %al,(%dx)
8010341b:	ba a1 00 00 00       	mov    $0xa1,%edx
80103420:	ee                   	out    %al,(%dx)
80103421:	c3                   	ret    
80103422:	66 90                	xchg   %ax,%ax
80103424:	66 90                	xchg   %ax,%ax
80103426:	66 90                	xchg   %ax,%ax
80103428:	66 90                	xchg   %ax,%ax
8010342a:	66 90                	xchg   %ax,%ax
8010342c:	66 90                	xchg   %ax,%ax
8010342e:	66 90                	xchg   %ax,%ax

80103430 <pipealloc>:
80103430:	55                   	push   %ebp
80103431:	89 e5                	mov    %esp,%ebp
80103433:	57                   	push   %edi
80103434:	56                   	push   %esi
80103435:	53                   	push   %ebx
80103436:	83 ec 0c             	sub    $0xc,%esp
80103439:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010343c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010343f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103445:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010344b:	e8 e0 d9 ff ff       	call   80100e30 <filealloc>
80103450:	89 03                	mov    %eax,(%ebx)
80103452:	85 c0                	test   %eax,%eax
80103454:	0f 84 a8 00 00 00    	je     80103502 <pipealloc+0xd2>
8010345a:	e8 d1 d9 ff ff       	call   80100e30 <filealloc>
8010345f:	89 06                	mov    %eax,(%esi)
80103461:	85 c0                	test   %eax,%eax
80103463:	0f 84 87 00 00 00    	je     801034f0 <pipealloc+0xc0>
80103469:	e8 12 f2 ff ff       	call   80102680 <kalloc>
8010346e:	89 c7                	mov    %eax,%edi
80103470:	85 c0                	test   %eax,%eax
80103472:	0f 84 b0 00 00 00    	je     80103528 <pipealloc+0xf8>
80103478:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010347f:	00 00 00 
80103482:	83 ec 08             	sub    $0x8,%esp
80103485:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010348c:	00 00 00 
8010348f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103496:	00 00 00 
80103499:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801034a0:	00 00 00 
801034a3:	68 fb 79 10 80       	push   $0x801079fb
801034a8:	50                   	push   %eax
801034a9:	e8 a2 11 00 00       	call   80104650 <initlock>
801034ae:	8b 03                	mov    (%ebx),%eax
801034b0:	83 c4 10             	add    $0x10,%esp
801034b3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801034b9:	8b 03                	mov    (%ebx),%eax
801034bb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801034bf:	8b 03                	mov    (%ebx),%eax
801034c1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801034c5:	8b 03                	mov    (%ebx),%eax
801034c7:	89 78 0c             	mov    %edi,0xc(%eax)
801034ca:	8b 06                	mov    (%esi),%eax
801034cc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801034d2:	8b 06                	mov    (%esi),%eax
801034d4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
801034d8:	8b 06                	mov    (%esi),%eax
801034da:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801034de:	8b 06                	mov    (%esi),%eax
801034e0:	89 78 0c             	mov    %edi,0xc(%eax)
801034e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034e6:	31 c0                	xor    %eax,%eax
801034e8:	5b                   	pop    %ebx
801034e9:	5e                   	pop    %esi
801034ea:	5f                   	pop    %edi
801034eb:	5d                   	pop    %ebp
801034ec:	c3                   	ret    
801034ed:	8d 76 00             	lea    0x0(%esi),%esi
801034f0:	8b 03                	mov    (%ebx),%eax
801034f2:	85 c0                	test   %eax,%eax
801034f4:	74 1e                	je     80103514 <pipealloc+0xe4>
801034f6:	83 ec 0c             	sub    $0xc,%esp
801034f9:	50                   	push   %eax
801034fa:	e8 f1 d9 ff ff       	call   80100ef0 <fileclose>
801034ff:	83 c4 10             	add    $0x10,%esp
80103502:	8b 06                	mov    (%esi),%eax
80103504:	85 c0                	test   %eax,%eax
80103506:	74 0c                	je     80103514 <pipealloc+0xe4>
80103508:	83 ec 0c             	sub    $0xc,%esp
8010350b:	50                   	push   %eax
8010350c:	e8 df d9 ff ff       	call   80100ef0 <fileclose>
80103511:	83 c4 10             	add    $0x10,%esp
80103514:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103517:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010351c:	5b                   	pop    %ebx
8010351d:	5e                   	pop    %esi
8010351e:	5f                   	pop    %edi
8010351f:	5d                   	pop    %ebp
80103520:	c3                   	ret    
80103521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103528:	8b 03                	mov    (%ebx),%eax
8010352a:	85 c0                	test   %eax,%eax
8010352c:	75 c8                	jne    801034f6 <pipealloc+0xc6>
8010352e:	eb d2                	jmp    80103502 <pipealloc+0xd2>

80103530 <pipeclose>:
80103530:	55                   	push   %ebp
80103531:	89 e5                	mov    %esp,%ebp
80103533:	56                   	push   %esi
80103534:	53                   	push   %ebx
80103535:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103538:	8b 75 0c             	mov    0xc(%ebp),%esi
8010353b:	83 ec 0c             	sub    $0xc,%esp
8010353e:	53                   	push   %ebx
8010353f:	e8 dc 12 00 00       	call   80104820 <acquire>
80103544:	83 c4 10             	add    $0x10,%esp
80103547:	85 f6                	test   %esi,%esi
80103549:	74 65                	je     801035b0 <pipeclose+0x80>
8010354b:	83 ec 0c             	sub    $0xc,%esp
8010354e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103554:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010355b:	00 00 00 
8010355e:	50                   	push   %eax
8010355f:	e8 1c 0e 00 00       	call   80104380 <wakeup>
80103564:	83 c4 10             	add    $0x10,%esp
80103567:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010356d:	85 d2                	test   %edx,%edx
8010356f:	75 0a                	jne    8010357b <pipeclose+0x4b>
80103571:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103577:	85 c0                	test   %eax,%eax
80103579:	74 15                	je     80103590 <pipeclose+0x60>
8010357b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010357e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103581:	5b                   	pop    %ebx
80103582:	5e                   	pop    %esi
80103583:	5d                   	pop    %ebp
80103584:	e9 37 12 00 00       	jmp    801047c0 <release>
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103590:	83 ec 0c             	sub    $0xc,%esp
80103593:	53                   	push   %ebx
80103594:	e8 27 12 00 00       	call   801047c0 <release>
80103599:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010359c:	83 c4 10             	add    $0x10,%esp
8010359f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801035a2:	5b                   	pop    %ebx
801035a3:	5e                   	pop    %esi
801035a4:	5d                   	pop    %ebp
801035a5:	e9 16 ef ff ff       	jmp    801024c0 <kfree>
801035aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801035b0:	83 ec 0c             	sub    $0xc,%esp
801035b3:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801035b9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801035c0:	00 00 00 
801035c3:	50                   	push   %eax
801035c4:	e8 b7 0d 00 00       	call   80104380 <wakeup>
801035c9:	83 c4 10             	add    $0x10,%esp
801035cc:	eb 99                	jmp    80103567 <pipeclose+0x37>
801035ce:	66 90                	xchg   %ax,%ax

801035d0 <pipewrite>:
801035d0:	55                   	push   %ebp
801035d1:	89 e5                	mov    %esp,%ebp
801035d3:	57                   	push   %edi
801035d4:	56                   	push   %esi
801035d5:	53                   	push   %ebx
801035d6:	83 ec 28             	sub    $0x28,%esp
801035d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801035dc:	53                   	push   %ebx
801035dd:	e8 3e 12 00 00       	call   80104820 <acquire>
801035e2:	8b 45 10             	mov    0x10(%ebp),%eax
801035e5:	83 c4 10             	add    $0x10,%esp
801035e8:	85 c0                	test   %eax,%eax
801035ea:	0f 8e c0 00 00 00    	jle    801036b0 <pipewrite+0xe0>
801035f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801035f3:	8b 8b 38 02 00 00    	mov    0x238(%ebx),%ecx
801035f9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801035ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103602:	03 45 10             	add    0x10(%ebp),%eax
80103605:	89 45 e0             	mov    %eax,-0x20(%ebp)
80103608:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010360e:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103614:	89 ca                	mov    %ecx,%edx
80103616:	05 00 02 00 00       	add    $0x200,%eax
8010361b:	39 c1                	cmp    %eax,%ecx
8010361d:	74 3f                	je     8010365e <pipewrite+0x8e>
8010361f:	eb 67                	jmp    80103688 <pipewrite+0xb8>
80103621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103628:	e8 43 03 00 00       	call   80103970 <myproc>
8010362d:	8b 48 28             	mov    0x28(%eax),%ecx
80103630:	85 c9                	test   %ecx,%ecx
80103632:	75 34                	jne    80103668 <pipewrite+0x98>
80103634:	83 ec 0c             	sub    $0xc,%esp
80103637:	57                   	push   %edi
80103638:	e8 43 0d 00 00       	call   80104380 <wakeup>
8010363d:	58                   	pop    %eax
8010363e:	5a                   	pop    %edx
8010363f:	53                   	push   %ebx
80103640:	56                   	push   %esi
80103641:	e8 7a 0c 00 00       	call   801042c0 <sleep>
80103646:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010364c:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80103652:	83 c4 10             	add    $0x10,%esp
80103655:	05 00 02 00 00       	add    $0x200,%eax
8010365a:	39 c2                	cmp    %eax,%edx
8010365c:	75 2a                	jne    80103688 <pipewrite+0xb8>
8010365e:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103664:	85 c0                	test   %eax,%eax
80103666:	75 c0                	jne    80103628 <pipewrite+0x58>
80103668:	83 ec 0c             	sub    $0xc,%esp
8010366b:	53                   	push   %ebx
8010366c:	e8 4f 11 00 00       	call   801047c0 <release>
80103671:	83 c4 10             	add    $0x10,%esp
80103674:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103679:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010367c:	5b                   	pop    %ebx
8010367d:	5e                   	pop    %esi
8010367e:	5f                   	pop    %edi
8010367f:	5d                   	pop    %ebp
80103680:	c3                   	ret    
80103681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103688:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010368b:	8d 4a 01             	lea    0x1(%edx),%ecx
8010368e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103694:	89 8b 38 02 00 00    	mov    %ecx,0x238(%ebx)
8010369a:	0f b6 06             	movzbl (%esi),%eax
8010369d:	83 c6 01             	add    $0x1,%esi
801036a0:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801036a3:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
801036a7:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801036aa:	0f 85 58 ff ff ff    	jne    80103608 <pipewrite+0x38>
801036b0:	83 ec 0c             	sub    $0xc,%esp
801036b3:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801036b9:	50                   	push   %eax
801036ba:	e8 c1 0c 00 00       	call   80104380 <wakeup>
801036bf:	89 1c 24             	mov    %ebx,(%esp)
801036c2:	e8 f9 10 00 00       	call   801047c0 <release>
801036c7:	8b 45 10             	mov    0x10(%ebp),%eax
801036ca:	83 c4 10             	add    $0x10,%esp
801036cd:	eb aa                	jmp    80103679 <pipewrite+0xa9>
801036cf:	90                   	nop

801036d0 <piperead>:
801036d0:	55                   	push   %ebp
801036d1:	89 e5                	mov    %esp,%ebp
801036d3:	57                   	push   %edi
801036d4:	56                   	push   %esi
801036d5:	53                   	push   %ebx
801036d6:	83 ec 18             	sub    $0x18,%esp
801036d9:	8b 75 08             	mov    0x8(%ebp),%esi
801036dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801036df:	56                   	push   %esi
801036e0:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801036e6:	e8 35 11 00 00       	call   80104820 <acquire>
801036eb:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801036f1:	83 c4 10             	add    $0x10,%esp
801036f4:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
801036fa:	74 2f                	je     8010372b <piperead+0x5b>
801036fc:	eb 37                	jmp    80103735 <piperead+0x65>
801036fe:	66 90                	xchg   %ax,%ax
80103700:	e8 6b 02 00 00       	call   80103970 <myproc>
80103705:	8b 48 28             	mov    0x28(%eax),%ecx
80103708:	85 c9                	test   %ecx,%ecx
8010370a:	0f 85 80 00 00 00    	jne    80103790 <piperead+0xc0>
80103710:	83 ec 08             	sub    $0x8,%esp
80103713:	56                   	push   %esi
80103714:	53                   	push   %ebx
80103715:	e8 a6 0b 00 00       	call   801042c0 <sleep>
8010371a:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
80103720:	83 c4 10             	add    $0x10,%esp
80103723:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
80103729:	75 0a                	jne    80103735 <piperead+0x65>
8010372b:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
80103731:	85 c0                	test   %eax,%eax
80103733:	75 cb                	jne    80103700 <piperead+0x30>
80103735:	8b 55 10             	mov    0x10(%ebp),%edx
80103738:	31 db                	xor    %ebx,%ebx
8010373a:	85 d2                	test   %edx,%edx
8010373c:	7f 20                	jg     8010375e <piperead+0x8e>
8010373e:	eb 2c                	jmp    8010376c <piperead+0x9c>
80103740:	8d 48 01             	lea    0x1(%eax),%ecx
80103743:	25 ff 01 00 00       	and    $0x1ff,%eax
80103748:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010374e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103753:	88 04 1f             	mov    %al,(%edi,%ebx,1)
80103756:	83 c3 01             	add    $0x1,%ebx
80103759:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010375c:	74 0e                	je     8010376c <piperead+0x9c>
8010375e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103764:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010376a:	75 d4                	jne    80103740 <piperead+0x70>
8010376c:	83 ec 0c             	sub    $0xc,%esp
8010376f:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103775:	50                   	push   %eax
80103776:	e8 05 0c 00 00       	call   80104380 <wakeup>
8010377b:	89 34 24             	mov    %esi,(%esp)
8010377e:	e8 3d 10 00 00       	call   801047c0 <release>
80103783:	83 c4 10             	add    $0x10,%esp
80103786:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103789:	89 d8                	mov    %ebx,%eax
8010378b:	5b                   	pop    %ebx
8010378c:	5e                   	pop    %esi
8010378d:	5f                   	pop    %edi
8010378e:	5d                   	pop    %ebp
8010378f:	c3                   	ret    
80103790:	83 ec 0c             	sub    $0xc,%esp
80103793:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103798:	56                   	push   %esi
80103799:	e8 22 10 00 00       	call   801047c0 <release>
8010379e:	83 c4 10             	add    $0x10,%esp
801037a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801037a4:	89 d8                	mov    %ebx,%eax
801037a6:	5b                   	pop    %ebx
801037a7:	5e                   	pop    %esi
801037a8:	5f                   	pop    %edi
801037a9:	5d                   	pop    %ebp
801037aa:	c3                   	ret    
801037ab:	66 90                	xchg   %ax,%ax
801037ad:	66 90                	xchg   %ax,%ax
801037af:	90                   	nop

801037b0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037b4:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
{
801037b9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
801037bc:	68 20 1d 11 80       	push   $0x80111d20
801037c1:	e8 5a 10 00 00       	call   80104820 <acquire>
801037c6:	83 c4 10             	add    $0x10,%esp
801037c9:	eb 10                	jmp    801037db <allocproc+0x2b>
801037cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037cf:	90                   	nop
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037d0:	83 eb 80             	sub    $0xffffff80,%ebx
801037d3:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801037d9:	74 75                	je     80103850 <allocproc+0xa0>
    if(p->state == UNUSED)
801037db:	8b 43 10             	mov    0x10(%ebx),%eax
801037de:	85 c0                	test   %eax,%eax
801037e0:	75 ee                	jne    801037d0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801037e2:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
801037e7:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801037ea:	c7 43 10 01 00 00 00 	movl   $0x1,0x10(%ebx)
  p->pid = nextpid++;
801037f1:	89 43 14             	mov    %eax,0x14(%ebx)
801037f4:	8d 50 01             	lea    0x1(%eax),%edx
  release(&ptable.lock);
801037f7:	68 20 1d 11 80       	push   $0x80111d20
  p->pid = nextpid++;
801037fc:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
80103802:	e8 b9 0f 00 00       	call   801047c0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103807:	e8 74 ee ff ff       	call   80102680 <kalloc>
8010380c:	83 c4 10             	add    $0x10,%esp
8010380f:	89 43 08             	mov    %eax,0x8(%ebx)
80103812:	85 c0                	test   %eax,%eax
80103814:	74 53                	je     80103869 <allocproc+0xb9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103816:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010381c:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010381f:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
80103824:	89 53 1c             	mov    %edx,0x1c(%ebx)
  *(uint*)sp = (uint)trapret;
80103827:	c7 40 14 67 5b 10 80 	movl   $0x80105b67,0x14(%eax)
  p->context = (struct context*)sp;
8010382e:	89 43 20             	mov    %eax,0x20(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103831:	6a 14                	push   $0x14
80103833:	6a 00                	push   $0x0
80103835:	50                   	push   %eax
80103836:	e8 a5 10 00 00       	call   801048e0 <memset>
  p->context->eip = (uint)forkret;
8010383b:	8b 43 20             	mov    0x20(%ebx),%eax

  return p;
8010383e:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103841:	c7 40 10 80 38 10 80 	movl   $0x80103880,0x10(%eax)
}
80103848:	89 d8                	mov    %ebx,%eax
8010384a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010384d:	c9                   	leave  
8010384e:	c3                   	ret    
8010384f:	90                   	nop
  release(&ptable.lock);
80103850:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103853:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103855:	68 20 1d 11 80       	push   $0x80111d20
8010385a:	e8 61 0f 00 00       	call   801047c0 <release>
}
8010385f:	89 d8                	mov    %ebx,%eax
  return 0;
80103861:	83 c4 10             	add    $0x10,%esp
}
80103864:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103867:	c9                   	leave  
80103868:	c3                   	ret    
    p->state = UNUSED;
80103869:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return 0;
80103870:	31 db                	xor    %ebx,%ebx
}
80103872:	89 d8                	mov    %ebx,%eax
80103874:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103877:	c9                   	leave  
80103878:	c3                   	ret    
80103879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103880 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103880:	55                   	push   %ebp
80103881:	89 e5                	mov    %esp,%ebp
80103883:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103886:	68 20 1d 11 80       	push   $0x80111d20
8010388b:	e8 30 0f 00 00       	call   801047c0 <release>

  if (first) {
80103890:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103895:	83 c4 10             	add    $0x10,%esp
80103898:	85 c0                	test   %eax,%eax
8010389a:	75 04                	jne    801038a0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010389c:	c9                   	leave  
8010389d:	c3                   	ret    
8010389e:	66 90                	xchg   %ax,%ax
    first = 0;
801038a0:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801038a7:	00 00 00 
    iinit(ROOTDEV);
801038aa:	83 ec 0c             	sub    $0xc,%esp
801038ad:	6a 01                	push   $0x1
801038af:	e8 ac dc ff ff       	call   80101560 <iinit>
    initlog(ROOTDEV);
801038b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801038bb:	e8 00 f4 ff ff       	call   80102cc0 <initlog>
}
801038c0:	83 c4 10             	add    $0x10,%esp
801038c3:	c9                   	leave  
801038c4:	c3                   	ret    
801038c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801038cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038d0 <pinit>:
{
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801038d6:	68 00 7a 10 80       	push   $0x80107a00
801038db:	68 20 1d 11 80       	push   $0x80111d20
801038e0:	e8 6b 0d 00 00       	call   80104650 <initlock>
}
801038e5:	83 c4 10             	add    $0x10,%esp
801038e8:	c9                   	leave  
801038e9:	c3                   	ret    
801038ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801038f0 <mycpu>:
{
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	56                   	push   %esi
801038f4:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801038f5:	9c                   	pushf  
801038f6:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801038f7:	f6 c4 02             	test   $0x2,%ah
801038fa:	75 46                	jne    80103942 <mycpu+0x52>
  apicid = lapicid();
801038fc:	e8 ef ef ff ff       	call   801028f0 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103901:	8b 35 84 17 11 80    	mov    0x80111784,%esi
80103907:	85 f6                	test   %esi,%esi
80103909:	7e 2a                	jle    80103935 <mycpu+0x45>
8010390b:	31 d2                	xor    %edx,%edx
8010390d:	eb 08                	jmp    80103917 <mycpu+0x27>
8010390f:	90                   	nop
80103910:	83 c2 01             	add    $0x1,%edx
80103913:	39 f2                	cmp    %esi,%edx
80103915:	74 1e                	je     80103935 <mycpu+0x45>
    if (cpus[i].apicid == apicid)
80103917:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
8010391d:	0f b6 99 a0 17 11 80 	movzbl -0x7feee860(%ecx),%ebx
80103924:	39 c3                	cmp    %eax,%ebx
80103926:	75 e8                	jne    80103910 <mycpu+0x20>
}
80103928:	8d 65 f8             	lea    -0x8(%ebp),%esp
      return &cpus[i];
8010392b:	8d 81 a0 17 11 80    	lea    -0x7feee860(%ecx),%eax
}
80103931:	5b                   	pop    %ebx
80103932:	5e                   	pop    %esi
80103933:	5d                   	pop    %ebp
80103934:	c3                   	ret    
  panic("unknown apicid\n");
80103935:	83 ec 0c             	sub    $0xc,%esp
80103938:	68 07 7a 10 80       	push   $0x80107a07
8010393d:	e8 3e ca ff ff       	call   80100380 <panic>
    panic("mycpu called with interrupts enabled\n");
80103942:	83 ec 0c             	sub    $0xc,%esp
80103945:	68 e4 7a 10 80       	push   $0x80107ae4
8010394a:	e8 31 ca ff ff       	call   80100380 <panic>
8010394f:	90                   	nop

80103950 <cpuid>:
cpuid() {
80103950:	55                   	push   %ebp
80103951:	89 e5                	mov    %esp,%ebp
80103953:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103956:	e8 95 ff ff ff       	call   801038f0 <mycpu>
}
8010395b:	c9                   	leave  
  return mycpu()-cpus;
8010395c:	2d a0 17 11 80       	sub    $0x801117a0,%eax
80103961:	c1 f8 04             	sar    $0x4,%eax
80103964:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010396a:	c3                   	ret    
8010396b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010396f:	90                   	nop

80103970 <myproc>:
myproc(void) {
80103970:	55                   	push   %ebp
80103971:	89 e5                	mov    %esp,%ebp
80103973:	53                   	push   %ebx
80103974:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103977:	e8 54 0d 00 00       	call   801046d0 <pushcli>
  c = mycpu();
8010397c:	e8 6f ff ff ff       	call   801038f0 <mycpu>
  p = c->proc;
80103981:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103987:	e8 94 0d 00 00       	call   80104720 <popcli>
}
8010398c:	89 d8                	mov    %ebx,%eax
8010398e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103991:	c9                   	leave  
80103992:	c3                   	ret    
80103993:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010399a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801039a0 <userinit>:
{
801039a0:	55                   	push   %ebp
801039a1:	89 e5                	mov    %esp,%ebp
801039a3:	53                   	push   %ebx
801039a4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801039a7:	e8 04 fe ff ff       	call   801037b0 <allocproc>
801039ac:	89 c3                	mov    %eax,%ebx
  initproc = p;
801039ae:	a3 54 3d 11 80       	mov    %eax,0x80113d54
  if((p->pgdir = setupkvm()) == 0)
801039b3:	e8 a8 37 00 00       	call   80107160 <setupkvm>
801039b8:	89 43 04             	mov    %eax,0x4(%ebx)
801039bb:	85 c0                	test   %eax,%eax
801039bd:	0f 84 bd 00 00 00    	je     80103a80 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801039c3:	83 ec 04             	sub    $0x4,%esp
801039c6:	68 2c 00 00 00       	push   $0x2c
801039cb:	68 60 a4 10 80       	push   $0x8010a460
801039d0:	50                   	push   %eax
801039d1:	e8 3a 34 00 00       	call   80106e10 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
801039d6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
801039d9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801039df:	6a 4c                	push   $0x4c
801039e1:	6a 00                	push   $0x0
801039e3:	ff 73 1c             	push   0x1c(%ebx)
801039e6:	e8 f5 0e 00 00       	call   801048e0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801039eb:	8b 43 1c             	mov    0x1c(%ebx),%eax
801039ee:	ba 1b 00 00 00       	mov    $0x1b,%edx
  safestrcpy(p->name, "initcode", sizeof(p->name));
801039f3:	83 c4 0c             	add    $0xc,%esp
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801039f6:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801039fb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801039ff:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a02:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103a06:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a09:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a0d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103a11:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a14:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a18:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103a1c:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a1f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103a26:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a29:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103a30:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a33:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103a3a:	8d 43 70             	lea    0x70(%ebx),%eax
80103a3d:	6a 10                	push   $0x10
80103a3f:	68 30 7a 10 80       	push   $0x80107a30
80103a44:	50                   	push   %eax
80103a45:	e8 56 10 00 00       	call   80104aa0 <safestrcpy>
  p->cwd = namei("/");
80103a4a:	c7 04 24 39 7a 10 80 	movl   $0x80107a39,(%esp)
80103a51:	e8 4a e6 ff ff       	call   801020a0 <namei>
80103a56:	89 43 6c             	mov    %eax,0x6c(%ebx)
  acquire(&ptable.lock);
80103a59:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103a60:	e8 bb 0d 00 00       	call   80104820 <acquire>
  p->state = RUNNABLE;
80103a65:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  release(&ptable.lock);
80103a6c:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103a73:	e8 48 0d 00 00       	call   801047c0 <release>
}
80103a78:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a7b:	83 c4 10             	add    $0x10,%esp
80103a7e:	c9                   	leave  
80103a7f:	c3                   	ret    
    panic("userinit: out of memory?");
80103a80:	83 ec 0c             	sub    $0xc,%esp
80103a83:	68 17 7a 10 80       	push   $0x80107a17
80103a88:	e8 f3 c8 ff ff       	call   80100380 <panic>
80103a8d:	8d 76 00             	lea    0x0(%esi),%esi

80103a90 <growproc>:
{
80103a90:	55                   	push   %ebp
80103a91:	89 e5                	mov    %esp,%ebp
80103a93:	56                   	push   %esi
80103a94:	53                   	push   %ebx
80103a95:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103a98:	e8 33 0c 00 00       	call   801046d0 <pushcli>
  c = mycpu();
80103a9d:	e8 4e fe ff ff       	call   801038f0 <mycpu>
  p = c->proc;
80103aa2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103aa8:	e8 73 0c 00 00       	call   80104720 <popcli>
  sz = curproc->sz;
80103aad:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103aaf:	85 f6                	test   %esi,%esi
80103ab1:	7f 1d                	jg     80103ad0 <growproc+0x40>
  } else if(n < 0){
80103ab3:	75 3b                	jne    80103af0 <growproc+0x60>
  switchuvm(curproc);
80103ab5:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103ab8:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103aba:	53                   	push   %ebx
80103abb:	e8 40 32 00 00       	call   80106d00 <switchuvm>
  return 0;
80103ac0:	83 c4 10             	add    $0x10,%esp
80103ac3:	31 c0                	xor    %eax,%eax
}
80103ac5:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ac8:	5b                   	pop    %ebx
80103ac9:	5e                   	pop    %esi
80103aca:	5d                   	pop    %ebp
80103acb:	c3                   	ret    
80103acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103ad0:	83 ec 04             	sub    $0x4,%esp
80103ad3:	01 c6                	add    %eax,%esi
80103ad5:	56                   	push   %esi
80103ad6:	50                   	push   %eax
80103ad7:	ff 73 04             	push   0x4(%ebx)
80103ada:	e8 a1 34 00 00       	call   80106f80 <allocuvm>
80103adf:	83 c4 10             	add    $0x10,%esp
80103ae2:	85 c0                	test   %eax,%eax
80103ae4:	75 cf                	jne    80103ab5 <growproc+0x25>
      return -1;
80103ae6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103aeb:	eb d8                	jmp    80103ac5 <growproc+0x35>
80103aed:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103af0:	83 ec 04             	sub    $0x4,%esp
80103af3:	01 c6                	add    %eax,%esi
80103af5:	56                   	push   %esi
80103af6:	50                   	push   %eax
80103af7:	ff 73 04             	push   0x4(%ebx)
80103afa:	e8 b1 35 00 00       	call   801070b0 <deallocuvm>
80103aff:	83 c4 10             	add    $0x10,%esp
80103b02:	85 c0                	test   %eax,%eax
80103b04:	75 af                	jne    80103ab5 <growproc+0x25>
80103b06:	eb de                	jmp    80103ae6 <growproc+0x56>
80103b08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b0f:	90                   	nop

80103b10 <fork>:
{
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	57                   	push   %edi
80103b14:	56                   	push   %esi
80103b15:	53                   	push   %ebx
80103b16:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103b19:	e8 b2 0b 00 00       	call   801046d0 <pushcli>
  c = mycpu();
80103b1e:	e8 cd fd ff ff       	call   801038f0 <mycpu>
  p = c->proc;
80103b23:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b29:	e8 f2 0b 00 00       	call   80104720 <popcli>
  if((np = allocproc()) == 0){
80103b2e:	e8 7d fc ff ff       	call   801037b0 <allocproc>
80103b33:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103b36:	85 c0                	test   %eax,%eax
80103b38:	0f 84 b7 00 00 00    	je     80103bf5 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103b3e:	83 ec 08             	sub    $0x8,%esp
80103b41:	ff 33                	push   (%ebx)
80103b43:	89 c7                	mov    %eax,%edi
80103b45:	ff 73 04             	push   0x4(%ebx)
80103b48:	e8 03 37 00 00       	call   80107250 <copyuvm>
80103b4d:	83 c4 10             	add    $0x10,%esp
80103b50:	89 47 04             	mov    %eax,0x4(%edi)
80103b53:	85 c0                	test   %eax,%eax
80103b55:	0f 84 a1 00 00 00    	je     80103bfc <fork+0xec>
  np->sz = curproc->sz;
80103b5b:	8b 03                	mov    (%ebx),%eax
80103b5d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103b60:	89 01                	mov    %eax,(%ecx)
  *np->tf = *curproc->tf;
80103b62:	8b 79 1c             	mov    0x1c(%ecx),%edi
  np->parent = curproc;
80103b65:	89 c8                	mov    %ecx,%eax
80103b67:	89 59 18             	mov    %ebx,0x18(%ecx)
  *np->tf = *curproc->tf;
80103b6a:	b9 13 00 00 00       	mov    $0x13,%ecx
80103b6f:	8b 73 1c             	mov    0x1c(%ebx),%esi
80103b72:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103b74:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103b76:	8b 40 1c             	mov    0x1c(%eax),%eax
80103b79:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103b80:	8b 44 b3 2c          	mov    0x2c(%ebx,%esi,4),%eax
80103b84:	85 c0                	test   %eax,%eax
80103b86:	74 13                	je     80103b9b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103b88:	83 ec 0c             	sub    $0xc,%esp
80103b8b:	50                   	push   %eax
80103b8c:	e8 0f d3 ff ff       	call   80100ea0 <filedup>
80103b91:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b94:	83 c4 10             	add    $0x10,%esp
80103b97:	89 44 b2 2c          	mov    %eax,0x2c(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103b9b:	83 c6 01             	add    $0x1,%esi
80103b9e:	83 fe 10             	cmp    $0x10,%esi
80103ba1:	75 dd                	jne    80103b80 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103ba3:	83 ec 0c             	sub    $0xc,%esp
80103ba6:	ff 73 6c             	push   0x6c(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ba9:	83 c3 70             	add    $0x70,%ebx
  np->cwd = idup(curproc->cwd);
80103bac:	e8 9f db ff ff       	call   80101750 <idup>
80103bb1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103bb4:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103bb7:	89 47 6c             	mov    %eax,0x6c(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103bba:	8d 47 70             	lea    0x70(%edi),%eax
80103bbd:	6a 10                	push   $0x10
80103bbf:	53                   	push   %ebx
80103bc0:	50                   	push   %eax
80103bc1:	e8 da 0e 00 00       	call   80104aa0 <safestrcpy>
  pid = np->pid;
80103bc6:	8b 5f 14             	mov    0x14(%edi),%ebx
  acquire(&ptable.lock);
80103bc9:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103bd0:	e8 4b 0c 00 00       	call   80104820 <acquire>
  np->state = RUNNABLE;
80103bd5:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%edi)
  release(&ptable.lock);
80103bdc:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103be3:	e8 d8 0b 00 00       	call   801047c0 <release>
  return pid;
80103be8:	83 c4 10             	add    $0x10,%esp
}
80103beb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bee:	89 d8                	mov    %ebx,%eax
80103bf0:	5b                   	pop    %ebx
80103bf1:	5e                   	pop    %esi
80103bf2:	5f                   	pop    %edi
80103bf3:	5d                   	pop    %ebp
80103bf4:	c3                   	ret    
    return -1;
80103bf5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103bfa:	eb ef                	jmp    80103beb <fork+0xdb>
    kfree(np->kstack);
80103bfc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103bff:	83 ec 0c             	sub    $0xc,%esp
80103c02:	ff 73 08             	push   0x8(%ebx)
80103c05:	e8 b6 e8 ff ff       	call   801024c0 <kfree>
    np->kstack = 0;
80103c0a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    return -1;
80103c11:	83 c4 10             	add    $0x10,%esp
    np->state = UNUSED;
80103c14:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return -1;
80103c1b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103c20:	eb c9                	jmp    80103beb <fork+0xdb>
80103c22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c30 <clone>:
clone(void(*fcn)(void *, void *), void *arg1, void *arg2, void *stack){
80103c30:	55                   	push   %ebp
80103c31:	89 e5                	mov    %esp,%ebp
80103c33:	57                   	push   %edi
80103c34:	56                   	push   %esi
80103c35:	53                   	push   %ebx
80103c36:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103c39:	e8 92 0a 00 00       	call   801046d0 <pushcli>
  c = mycpu();
80103c3e:	e8 ad fc ff ff       	call   801038f0 <mycpu>
  p = c->proc;
80103c43:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80103c49:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  popcli();
80103c4c:	e8 cf 0a 00 00       	call   80104720 <popcli>
  if((np = allocproc()) == 0){
80103c51:	e8 5a fb ff ff       	call   801037b0 <allocproc>
80103c56:	85 c0                	test   %eax,%eax
80103c58:	0f 84 e7 00 00 00    	je     80103d45 <clone+0x115>
  if((np->pgdir = curproc->pgdir) == 0){
80103c5e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103c61:	89 c3                	mov    %eax,%ebx
80103c63:	8b 42 04             	mov    0x4(%edx),%eax
80103c66:	89 43 04             	mov    %eax,0x4(%ebx)
80103c69:	85 c0                	test   %eax,%eax
80103c6b:	0f 84 db 00 00 00    	je     80103d4c <clone+0x11c>
  np->sz = curproc->sz;
80103c71:	8b 02                	mov    (%edx),%eax
  *np->tf = *curproc->tf;
80103c73:	8b 7b 1c             	mov    0x1c(%ebx),%edi
  np->parent = curproc;
80103c76:	89 53 18             	mov    %edx,0x18(%ebx)
  *np->tf = *curproc->tf;
80103c79:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = curproc->sz;
80103c7e:	89 03                	mov    %eax,(%ebx)
  np->usrstack += PGSIZE;
80103c80:	8b 45 14             	mov    0x14(%ebp),%eax
  *np->tf = *curproc->tf;
80103c83:	8b 72 1c             	mov    0x1c(%edx),%esi
80103c86:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->usrstack += PGSIZE;
80103c88:	05 00 10 00 00       	add    $0x1000,%eax
  *((uint*)np->usrstack-4) = (uint)arg1;
80103c8d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for(i = 0; i < NOFILE; i++)
80103c90:	31 f6                	xor    %esi,%esi
  np->usrstack += PGSIZE;
80103c92:	89 43 0c             	mov    %eax,0xc(%ebx)
  *((uint*)np->usrstack-8) = (uint)0xffffffff;
80103c95:	8b 45 14             	mov    0x14(%ebp),%eax
  for(i = 0; i < NOFILE; i++)
80103c98:	89 d7                	mov    %edx,%edi
  *((uint*)np->usrstack-8) = (uint)0xffffffff;
80103c9a:	c7 80 e0 0f 00 00 ff 	movl   $0xffffffff,0xfe0(%eax)
80103ca1:	ff ff ff 
  *((uint*)np->usrstack-4) = (uint)arg1;
80103ca4:	8b 43 0c             	mov    0xc(%ebx),%eax
80103ca7:	89 48 f0             	mov    %ecx,-0x10(%eax)
  *((uint*)np->usrstack) = (uint)arg2;
80103caa:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103cad:	8b 43 0c             	mov    0xc(%ebx),%eax
80103cb0:	89 08                	mov    %ecx,(%eax)
  np->tf->eip = *(uint*)fcn;
80103cb2:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103cb5:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103cb8:	8b 09                	mov    (%ecx),%ecx
80103cba:	89 48 38             	mov    %ecx,0x38(%eax)
  np->tf->esp = *(uint*)stack;
80103cbd:	8b 45 14             	mov    0x14(%ebp),%eax
80103cc0:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
80103cc3:	8b 00                	mov    (%eax),%eax
80103cc5:	89 41 44             	mov    %eax,0x44(%ecx)
  np->tf->ebp = *(uint*)stack;
80103cc8:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
80103ccb:	89 41 08             	mov    %eax,0x8(%ecx)
  for(i = 0; i < NOFILE; i++)
80103cce:	66 90                	xchg   %ax,%ax
    if(curproc->ofile[i])
80103cd0:	8b 44 b7 2c          	mov    0x2c(%edi,%esi,4),%eax
80103cd4:	85 c0                	test   %eax,%eax
80103cd6:	74 10                	je     80103ce8 <clone+0xb8>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103cd8:	83 ec 0c             	sub    $0xc,%esp
80103cdb:	50                   	push   %eax
80103cdc:	e8 bf d1 ff ff       	call   80100ea0 <filedup>
80103ce1:	83 c4 10             	add    $0x10,%esp
80103ce4:	89 44 b3 2c          	mov    %eax,0x2c(%ebx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103ce8:	83 c6 01             	add    $0x1,%esi
80103ceb:	83 fe 10             	cmp    $0x10,%esi
80103cee:	75 e0                	jne    80103cd0 <clone+0xa0>
  np->cwd = idup(curproc->cwd);
80103cf0:	83 ec 0c             	sub    $0xc,%esp
80103cf3:	ff 77 6c             	push   0x6c(%edi)
80103cf6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80103cf9:	e8 52 da ff ff       	call   80101750 <idup>
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103cfe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103d01:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103d04:	89 43 6c             	mov    %eax,0x6c(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d07:	8d 43 70             	lea    0x70(%ebx),%eax
80103d0a:	83 c2 70             	add    $0x70,%edx
80103d0d:	6a 10                	push   $0x10
80103d0f:	52                   	push   %edx
80103d10:	50                   	push   %eax
80103d11:	e8 8a 0d 00 00       	call   80104aa0 <safestrcpy>
  pid = np->pid;
80103d16:	8b 73 14             	mov    0x14(%ebx),%esi
  acquire(&ptable.lock);
80103d19:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103d20:	e8 fb 0a 00 00       	call   80104820 <acquire>
  np->state = RUNNABLE;
80103d25:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  release(&ptable.lock);
80103d2c:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103d33:	e8 88 0a 00 00       	call   801047c0 <release>
  return pid;
80103d38:	83 c4 10             	add    $0x10,%esp
}
80103d3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103d3e:	89 f0                	mov    %esi,%eax
80103d40:	5b                   	pop    %ebx
80103d41:	5e                   	pop    %esi
80103d42:	5f                   	pop    %edi
80103d43:	5d                   	pop    %ebp
80103d44:	c3                   	ret    
    return -1;
80103d45:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103d4a:	eb ef                	jmp    80103d3b <clone+0x10b>
    kfree(np->kstack);
80103d4c:	83 ec 0c             	sub    $0xc,%esp
80103d4f:	ff 73 08             	push   0x8(%ebx)
    return -1;
80103d52:	be ff ff ff ff       	mov    $0xffffffff,%esi
    kfree(np->kstack);
80103d57:	e8 64 e7 ff ff       	call   801024c0 <kfree>
    np->kstack = 0;
80103d5c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    return -1;
80103d63:	83 c4 10             	add    $0x10,%esp
    np->state = UNUSED;
80103d66:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return -1;
80103d6d:	eb cc                	jmp    80103d3b <clone+0x10b>
80103d6f:	90                   	nop

80103d70 <scheduler>:
{
80103d70:	55                   	push   %ebp
80103d71:	89 e5                	mov    %esp,%ebp
80103d73:	57                   	push   %edi
80103d74:	56                   	push   %esi
80103d75:	53                   	push   %ebx
80103d76:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103d79:	e8 72 fb ff ff       	call   801038f0 <mycpu>
  c->proc = 0;
80103d7e:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103d85:	00 00 00 
  struct cpu *c = mycpu();
80103d88:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103d8a:	8d 78 04             	lea    0x4(%eax),%edi
80103d8d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103d90:	fb                   	sti    
    acquire(&ptable.lock);
80103d91:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d94:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
    acquire(&ptable.lock);
80103d99:	68 20 1d 11 80       	push   $0x80111d20
80103d9e:	e8 7d 0a 00 00       	call   80104820 <acquire>
80103da3:	83 c4 10             	add    $0x10,%esp
80103da6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103dad:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->state != RUNNABLE)
80103db0:	83 7b 10 03          	cmpl   $0x3,0x10(%ebx)
80103db4:	75 33                	jne    80103de9 <scheduler+0x79>
      switchuvm(p);
80103db6:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103db9:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103dbf:	53                   	push   %ebx
80103dc0:	e8 3b 2f 00 00       	call   80106d00 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103dc5:	58                   	pop    %eax
80103dc6:	5a                   	pop    %edx
80103dc7:	ff 73 20             	push   0x20(%ebx)
80103dca:	57                   	push   %edi
      p->state = RUNNING;
80103dcb:	c7 43 10 04 00 00 00 	movl   $0x4,0x10(%ebx)
      swtch(&(c->scheduler), p->context);
80103dd2:	e8 24 0d 00 00       	call   80104afb <swtch>
      switchkvm();
80103dd7:	e8 14 2f 00 00       	call   80106cf0 <switchkvm>
      c->proc = 0;
80103ddc:	83 c4 10             	add    $0x10,%esp
80103ddf:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103de6:	00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103de9:	83 eb 80             	sub    $0xffffff80,%ebx
80103dec:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103df2:	75 bc                	jne    80103db0 <scheduler+0x40>
    release(&ptable.lock);
80103df4:	83 ec 0c             	sub    $0xc,%esp
80103df7:	68 20 1d 11 80       	push   $0x80111d20
80103dfc:	e8 bf 09 00 00       	call   801047c0 <release>
    sti();
80103e01:	83 c4 10             	add    $0x10,%esp
80103e04:	eb 8a                	jmp    80103d90 <scheduler+0x20>
80103e06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e0d:	8d 76 00             	lea    0x0(%esi),%esi

80103e10 <sched>:
{
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	56                   	push   %esi
80103e14:	53                   	push   %ebx
  pushcli();
80103e15:	e8 b6 08 00 00       	call   801046d0 <pushcli>
  c = mycpu();
80103e1a:	e8 d1 fa ff ff       	call   801038f0 <mycpu>
  p = c->proc;
80103e1f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e25:	e8 f6 08 00 00       	call   80104720 <popcli>
  if(!holding(&ptable.lock))
80103e2a:	83 ec 0c             	sub    $0xc,%esp
80103e2d:	68 20 1d 11 80       	push   $0x80111d20
80103e32:	e8 49 09 00 00       	call   80104780 <holding>
80103e37:	83 c4 10             	add    $0x10,%esp
80103e3a:	85 c0                	test   %eax,%eax
80103e3c:	74 4f                	je     80103e8d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103e3e:	e8 ad fa ff ff       	call   801038f0 <mycpu>
80103e43:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103e4a:	75 68                	jne    80103eb4 <sched+0xa4>
  if(p->state == RUNNING)
80103e4c:	83 7b 10 04          	cmpl   $0x4,0x10(%ebx)
80103e50:	74 55                	je     80103ea7 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103e52:	9c                   	pushf  
80103e53:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103e54:	f6 c4 02             	test   $0x2,%ah
80103e57:	75 41                	jne    80103e9a <sched+0x8a>
  intena = mycpu()->intena;
80103e59:	e8 92 fa ff ff       	call   801038f0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103e5e:	83 c3 20             	add    $0x20,%ebx
  intena = mycpu()->intena;
80103e61:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103e67:	e8 84 fa ff ff       	call   801038f0 <mycpu>
80103e6c:	83 ec 08             	sub    $0x8,%esp
80103e6f:	ff 70 04             	push   0x4(%eax)
80103e72:	53                   	push   %ebx
80103e73:	e8 83 0c 00 00       	call   80104afb <swtch>
  mycpu()->intena = intena;
80103e78:	e8 73 fa ff ff       	call   801038f0 <mycpu>
}
80103e7d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103e80:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103e86:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e89:	5b                   	pop    %ebx
80103e8a:	5e                   	pop    %esi
80103e8b:	5d                   	pop    %ebp
80103e8c:	c3                   	ret    
    panic("sched ptable.lock");
80103e8d:	83 ec 0c             	sub    $0xc,%esp
80103e90:	68 3b 7a 10 80       	push   $0x80107a3b
80103e95:	e8 e6 c4 ff ff       	call   80100380 <panic>
    panic("sched interruptible");
80103e9a:	83 ec 0c             	sub    $0xc,%esp
80103e9d:	68 67 7a 10 80       	push   $0x80107a67
80103ea2:	e8 d9 c4 ff ff       	call   80100380 <panic>
    panic("sched running");
80103ea7:	83 ec 0c             	sub    $0xc,%esp
80103eaa:	68 59 7a 10 80       	push   $0x80107a59
80103eaf:	e8 cc c4 ff ff       	call   80100380 <panic>
    panic("sched locks");
80103eb4:	83 ec 0c             	sub    $0xc,%esp
80103eb7:	68 4d 7a 10 80       	push   $0x80107a4d
80103ebc:	e8 bf c4 ff ff       	call   80100380 <panic>
80103ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ec8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ecf:	90                   	nop

80103ed0 <exit>:
{
80103ed0:	55                   	push   %ebp
80103ed1:	89 e5                	mov    %esp,%ebp
80103ed3:	57                   	push   %edi
80103ed4:	56                   	push   %esi
80103ed5:	53                   	push   %ebx
80103ed6:	83 ec 0c             	sub    $0xc,%esp
  struct proc *curproc = myproc();
80103ed9:	e8 92 fa ff ff       	call   80103970 <myproc>
  if(curproc == initproc)
80103ede:	39 05 54 3d 11 80    	cmp    %eax,0x80113d54
80103ee4:	0f 84 fd 00 00 00    	je     80103fe7 <exit+0x117>
80103eea:	89 c3                	mov    %eax,%ebx
80103eec:	8d 70 2c             	lea    0x2c(%eax),%esi
80103eef:	8d 78 6c             	lea    0x6c(%eax),%edi
80103ef2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(curproc->ofile[fd]){
80103ef8:	8b 06                	mov    (%esi),%eax
80103efa:	85 c0                	test   %eax,%eax
80103efc:	74 12                	je     80103f10 <exit+0x40>
      fileclose(curproc->ofile[fd]);
80103efe:	83 ec 0c             	sub    $0xc,%esp
80103f01:	50                   	push   %eax
80103f02:	e8 e9 cf ff ff       	call   80100ef0 <fileclose>
      curproc->ofile[fd] = 0;
80103f07:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103f0d:	83 c4 10             	add    $0x10,%esp
  for(fd = 0; fd < NOFILE; fd++){
80103f10:	83 c6 04             	add    $0x4,%esi
80103f13:	39 f7                	cmp    %esi,%edi
80103f15:	75 e1                	jne    80103ef8 <exit+0x28>
  begin_op();
80103f17:	e8 44 ee ff ff       	call   80102d60 <begin_op>
  iput(curproc->cwd);
80103f1c:	83 ec 0c             	sub    $0xc,%esp
80103f1f:	ff 73 6c             	push   0x6c(%ebx)
80103f22:	e8 89 d9 ff ff       	call   801018b0 <iput>
  end_op();
80103f27:	e8 a4 ee ff ff       	call   80102dd0 <end_op>
  curproc->cwd = 0;
80103f2c:	c7 43 6c 00 00 00 00 	movl   $0x0,0x6c(%ebx)
  acquire(&ptable.lock);
80103f33:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103f3a:	e8 e1 08 00 00       	call   80104820 <acquire>
  wakeup1(curproc->parent);
80103f3f:	8b 53 18             	mov    0x18(%ebx),%edx
80103f42:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f45:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103f4a:	eb 0e                	jmp    80103f5a <exit+0x8a>
80103f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f50:	83 e8 80             	sub    $0xffffff80,%eax
80103f53:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103f58:	74 1c                	je     80103f76 <exit+0xa6>
    if(p->state == SLEEPING && p->chan == chan)
80103f5a:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
80103f5e:	75 f0                	jne    80103f50 <exit+0x80>
80103f60:	3b 50 24             	cmp    0x24(%eax),%edx
80103f63:	75 eb                	jne    80103f50 <exit+0x80>
      p->state = RUNNABLE;
80103f65:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f6c:	83 e8 80             	sub    $0xffffff80,%eax
80103f6f:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103f74:	75 e4                	jne    80103f5a <exit+0x8a>
      p->parent = initproc;
80103f76:	8b 0d 54 3d 11 80    	mov    0x80113d54,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f7c:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
80103f81:	eb 10                	jmp    80103f93 <exit+0xc3>
80103f83:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f87:	90                   	nop
80103f88:	83 ea 80             	sub    $0xffffff80,%edx
80103f8b:	81 fa 54 3d 11 80    	cmp    $0x80113d54,%edx
80103f91:	74 3b                	je     80103fce <exit+0xfe>
    if(p->parent == curproc){
80103f93:	39 5a 18             	cmp    %ebx,0x18(%edx)
80103f96:	75 f0                	jne    80103f88 <exit+0xb8>
      if(p->state == ZOMBIE)
80103f98:	83 7a 10 05          	cmpl   $0x5,0x10(%edx)
      p->parent = initproc;
80103f9c:	89 4a 18             	mov    %ecx,0x18(%edx)
      if(p->state == ZOMBIE)
80103f9f:	75 e7                	jne    80103f88 <exit+0xb8>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103fa1:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103fa6:	eb 12                	jmp    80103fba <exit+0xea>
80103fa8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103faf:	90                   	nop
80103fb0:	83 e8 80             	sub    $0xffffff80,%eax
80103fb3:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103fb8:	74 ce                	je     80103f88 <exit+0xb8>
    if(p->state == SLEEPING && p->chan == chan)
80103fba:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
80103fbe:	75 f0                	jne    80103fb0 <exit+0xe0>
80103fc0:	3b 48 24             	cmp    0x24(%eax),%ecx
80103fc3:	75 eb                	jne    80103fb0 <exit+0xe0>
      p->state = RUNNABLE;
80103fc5:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
80103fcc:	eb e2                	jmp    80103fb0 <exit+0xe0>
  curproc->state = ZOMBIE;
80103fce:	c7 43 10 05 00 00 00 	movl   $0x5,0x10(%ebx)
  sched();
80103fd5:	e8 36 fe ff ff       	call   80103e10 <sched>
  panic("zombie exit");
80103fda:	83 ec 0c             	sub    $0xc,%esp
80103fdd:	68 88 7a 10 80       	push   $0x80107a88
80103fe2:	e8 99 c3 ff ff       	call   80100380 <panic>
    panic("init exiting");
80103fe7:	83 ec 0c             	sub    $0xc,%esp
80103fea:	68 7b 7a 10 80       	push   $0x80107a7b
80103fef:	e8 8c c3 ff ff       	call   80100380 <panic>
80103ff4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ffb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fff:	90                   	nop

80104000 <wait>:
{
80104000:	55                   	push   %ebp
80104001:	89 e5                	mov    %esp,%ebp
80104003:	56                   	push   %esi
80104004:	53                   	push   %ebx
  pushcli();
80104005:	e8 c6 06 00 00       	call   801046d0 <pushcli>
  c = mycpu();
8010400a:	e8 e1 f8 ff ff       	call   801038f0 <mycpu>
  p = c->proc;
8010400f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104015:	e8 06 07 00 00       	call   80104720 <popcli>
  acquire(&ptable.lock);
8010401a:	83 ec 0c             	sub    $0xc,%esp
8010401d:	68 20 1d 11 80       	push   $0x80111d20
80104022:	e8 f9 07 00 00       	call   80104820 <acquire>
80104027:	83 c4 10             	add    $0x10,%esp
      if(p->pgdir == curproc->pgdir || p->parent != curproc)
8010402a:	8b 46 04             	mov    0x4(%esi),%eax
    havekids = 0;
8010402d:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010402f:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80104034:	eb 15                	jmp    8010404b <wait+0x4b>
80104036:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010403d:	8d 76 00             	lea    0x0(%esi),%esi
80104040:	83 eb 80             	sub    $0xffffff80,%ebx
80104043:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80104049:	74 20                	je     8010406b <wait+0x6b>
      if(p->pgdir == curproc->pgdir || p->parent != curproc)
8010404b:	39 43 04             	cmp    %eax,0x4(%ebx)
8010404e:	74 f0                	je     80104040 <wait+0x40>
80104050:	39 73 18             	cmp    %esi,0x18(%ebx)
80104053:	75 eb                	jne    80104040 <wait+0x40>
      if(p->state == ZOMBIE){
80104055:	83 7b 10 05          	cmpl   $0x5,0x10(%ebx)
80104059:	74 65                	je     801040c0 <wait+0xc0>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010405b:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
8010405e:	ba 01 00 00 00       	mov    $0x1,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104063:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80104069:	75 e0                	jne    8010404b <wait+0x4b>
    if(!havekids || curproc->killed){
8010406b:	85 d2                	test   %edx,%edx
8010406d:	0f 84 a3 00 00 00    	je     80104116 <wait+0x116>
80104073:	8b 46 28             	mov    0x28(%esi),%eax
80104076:	85 c0                	test   %eax,%eax
80104078:	0f 85 98 00 00 00    	jne    80104116 <wait+0x116>
  pushcli();
8010407e:	e8 4d 06 00 00       	call   801046d0 <pushcli>
  c = mycpu();
80104083:	e8 68 f8 ff ff       	call   801038f0 <mycpu>
  p = c->proc;
80104088:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010408e:	e8 8d 06 00 00       	call   80104720 <popcli>
  if(p == 0)
80104093:	85 db                	test   %ebx,%ebx
80104095:	0f 84 92 00 00 00    	je     8010412d <wait+0x12d>
  p->chan = chan;
8010409b:	89 73 24             	mov    %esi,0x24(%ebx)
  p->state = SLEEPING;
8010409e:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
801040a5:	e8 66 fd ff ff       	call   80103e10 <sched>
  p->chan = 0;
801040aa:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
}
801040b1:	e9 74 ff ff ff       	jmp    8010402a <wait+0x2a>
801040b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801040bd:	8d 76 00             	lea    0x0(%esi),%esi
        kfree(p->kstack);
801040c0:	83 ec 0c             	sub    $0xc,%esp
        pid = p->pid;
801040c3:	8b 73 14             	mov    0x14(%ebx),%esi
        kfree(p->kstack);
801040c6:	ff 73 08             	push   0x8(%ebx)
801040c9:	e8 f2 e3 ff ff       	call   801024c0 <kfree>
        p->kstack = 0;
801040ce:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
801040d5:	5a                   	pop    %edx
801040d6:	ff 73 04             	push   0x4(%ebx)
801040d9:	e8 02 30 00 00       	call   801070e0 <freevm>
        p->pid = 0;
801040de:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->parent = 0;
801040e5:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        p->name[0] = 0;
801040ec:	c6 43 70 00          	movb   $0x0,0x70(%ebx)
        p->killed = 0;
801040f0:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
        p->state = UNUSED;
801040f7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        release(&ptable.lock);
801040fe:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80104105:	e8 b6 06 00 00       	call   801047c0 <release>
        return pid;
8010410a:	83 c4 10             	add    $0x10,%esp
}
8010410d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104110:	89 f0                	mov    %esi,%eax
80104112:	5b                   	pop    %ebx
80104113:	5e                   	pop    %esi
80104114:	5d                   	pop    %ebp
80104115:	c3                   	ret    
      release(&ptable.lock);
80104116:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104119:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
8010411e:	68 20 1d 11 80       	push   $0x80111d20
80104123:	e8 98 06 00 00       	call   801047c0 <release>
      return -1;
80104128:	83 c4 10             	add    $0x10,%esp
8010412b:	eb e0                	jmp    8010410d <wait+0x10d>
    panic("sleep");
8010412d:	83 ec 0c             	sub    $0xc,%esp
80104130:	68 94 7a 10 80       	push   $0x80107a94
80104135:	e8 46 c2 ff ff       	call   80100380 <panic>
8010413a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104140 <join>:
join(void **stack){
80104140:	55                   	push   %ebp
80104141:	89 e5                	mov    %esp,%ebp
80104143:	56                   	push   %esi
80104144:	53                   	push   %ebx
  pushcli();
80104145:	e8 86 05 00 00       	call   801046d0 <pushcli>
  c = mycpu();
8010414a:	e8 a1 f7 ff ff       	call   801038f0 <mycpu>
  p = c->proc;
8010414f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104155:	e8 c6 05 00 00       	call   80104720 <popcli>
  acquire(&ptable.lock);
8010415a:	83 ec 0c             	sub    $0xc,%esp
8010415d:	68 20 1d 11 80       	push   $0x80111d20
80104162:	e8 b9 06 00 00       	call   80104820 <acquire>
80104167:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
8010416a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010416c:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80104171:	eb 10                	jmp    80104183 <join+0x43>
80104173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104177:	90                   	nop
80104178:	83 eb 80             	sub    $0xffffff80,%ebx
8010417b:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80104181:	74 1b                	je     8010419e <join+0x5e>
      if(p->parent != curproc)
80104183:	39 73 18             	cmp    %esi,0x18(%ebx)
80104186:	75 f0                	jne    80104178 <join+0x38>
      if(p->state == ZOMBIE){
80104188:	83 7b 10 05          	cmpl   $0x5,0x10(%ebx)
8010418c:	74 62                	je     801041f0 <join+0xb0>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010418e:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80104191:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104196:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
8010419c:	75 e5                	jne    80104183 <join+0x43>
    if(!havekids || curproc->killed){
8010419e:	85 c0                	test   %eax,%eax
801041a0:	0f 84 a6 00 00 00    	je     8010424c <join+0x10c>
801041a6:	8b 46 28             	mov    0x28(%esi),%eax
801041a9:	85 c0                	test   %eax,%eax
801041ab:	0f 85 9b 00 00 00    	jne    8010424c <join+0x10c>
  pushcli();
801041b1:	e8 1a 05 00 00       	call   801046d0 <pushcli>
  c = mycpu();
801041b6:	e8 35 f7 ff ff       	call   801038f0 <mycpu>
  p = c->proc;
801041bb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801041c1:	e8 5a 05 00 00       	call   80104720 <popcli>
  if(p == 0)
801041c6:	85 db                	test   %ebx,%ebx
801041c8:	0f 84 95 00 00 00    	je     80104263 <join+0x123>
  p->chan = chan;
801041ce:	89 73 24             	mov    %esi,0x24(%ebx)
  p->state = SLEEPING;
801041d1:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
801041d8:	e8 33 fc ff ff       	call   80103e10 <sched>
  p->chan = 0;
801041dd:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
}
801041e4:	eb 84                	jmp    8010416a <join+0x2a>
801041e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041ed:	8d 76 00             	lea    0x0(%esi),%esi
        *stack = p->usrstack;
801041f0:	8b 53 0c             	mov    0xc(%ebx),%edx
801041f3:	8b 45 08             	mov    0x8(%ebp),%eax
        kfree(p->kstack);
801041f6:	83 ec 0c             	sub    $0xc,%esp
        pid = p->pid;
801041f9:	8b 73 14             	mov    0x14(%ebx),%esi
        *stack = p->usrstack;
801041fc:	89 10                	mov    %edx,(%eax)
        kfree(p->kstack);
801041fe:	ff 73 08             	push   0x8(%ebx)
80104201:	e8 ba e2 ff ff       	call   801024c0 <kfree>
        p->kstack = 0;
80104206:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        p->pid = 0;
8010420d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->parent = 0;
80104214:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        p->name[0] = 0;
8010421b:	c6 43 70 00          	movb   $0x0,0x70(%ebx)
        p->killed = 0;
8010421f:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
        p->usrstack = 0;
80104226:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        p->state = UNUSED;
8010422d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        release(&ptable.lock);
80104234:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010423b:	e8 80 05 00 00       	call   801047c0 <release>
        return pid;
80104240:	83 c4 10             	add    $0x10,%esp
}
80104243:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104246:	89 f0                	mov    %esi,%eax
80104248:	5b                   	pop    %ebx
80104249:	5e                   	pop    %esi
8010424a:	5d                   	pop    %ebp
8010424b:	c3                   	ret    
      release(&ptable.lock);
8010424c:	83 ec 0c             	sub    $0xc,%esp
      return -1;
8010424f:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104254:	68 20 1d 11 80       	push   $0x80111d20
80104259:	e8 62 05 00 00       	call   801047c0 <release>
      return -1;
8010425e:	83 c4 10             	add    $0x10,%esp
80104261:	eb e0                	jmp    80104243 <join+0x103>
    panic("sleep");
80104263:	83 ec 0c             	sub    $0xc,%esp
80104266:	68 94 7a 10 80       	push   $0x80107a94
8010426b:	e8 10 c1 ff ff       	call   80100380 <panic>

80104270 <yield>:
{
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	53                   	push   %ebx
80104274:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80104277:	68 20 1d 11 80       	push   $0x80111d20
8010427c:	e8 9f 05 00 00       	call   80104820 <acquire>
  pushcli();
80104281:	e8 4a 04 00 00       	call   801046d0 <pushcli>
  c = mycpu();
80104286:	e8 65 f6 ff ff       	call   801038f0 <mycpu>
  p = c->proc;
8010428b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80104291:	e8 8a 04 00 00       	call   80104720 <popcli>
  myproc()->state = RUNNABLE;
80104296:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  sched();
8010429d:	e8 6e fb ff ff       	call   80103e10 <sched>
  release(&ptable.lock);
801042a2:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801042a9:	e8 12 05 00 00       	call   801047c0 <release>
}
801042ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042b1:	83 c4 10             	add    $0x10,%esp
801042b4:	c9                   	leave  
801042b5:	c3                   	ret    
801042b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042bd:	8d 76 00             	lea    0x0(%esi),%esi

801042c0 <sleep>:
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	57                   	push   %edi
801042c4:	56                   	push   %esi
801042c5:	53                   	push   %ebx
801042c6:	83 ec 0c             	sub    $0xc,%esp
801042c9:	8b 7d 08             	mov    0x8(%ebp),%edi
801042cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
801042cf:	e8 fc 03 00 00       	call   801046d0 <pushcli>
  c = mycpu();
801042d4:	e8 17 f6 ff ff       	call   801038f0 <mycpu>
  p = c->proc;
801042d9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801042df:	e8 3c 04 00 00       	call   80104720 <popcli>
  if(p == 0)
801042e4:	85 db                	test   %ebx,%ebx
801042e6:	0f 84 87 00 00 00    	je     80104373 <sleep+0xb3>
  if(lk == 0)
801042ec:	85 f6                	test   %esi,%esi
801042ee:	74 76                	je     80104366 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
801042f0:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
801042f6:	74 50                	je     80104348 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
801042f8:	83 ec 0c             	sub    $0xc,%esp
801042fb:	68 20 1d 11 80       	push   $0x80111d20
80104300:	e8 1b 05 00 00       	call   80104820 <acquire>
    release(lk);
80104305:	89 34 24             	mov    %esi,(%esp)
80104308:	e8 b3 04 00 00       	call   801047c0 <release>
  p->chan = chan;
8010430d:	89 7b 24             	mov    %edi,0x24(%ebx)
  p->state = SLEEPING;
80104310:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
80104317:	e8 f4 fa ff ff       	call   80103e10 <sched>
  p->chan = 0;
8010431c:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
    release(&ptable.lock);
80104323:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010432a:	e8 91 04 00 00       	call   801047c0 <release>
    acquire(lk);
8010432f:	89 75 08             	mov    %esi,0x8(%ebp)
80104332:	83 c4 10             	add    $0x10,%esp
}
80104335:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104338:	5b                   	pop    %ebx
80104339:	5e                   	pop    %esi
8010433a:	5f                   	pop    %edi
8010433b:	5d                   	pop    %ebp
    acquire(lk);
8010433c:	e9 df 04 00 00       	jmp    80104820 <acquire>
80104341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80104348:	89 7b 24             	mov    %edi,0x24(%ebx)
  p->state = SLEEPING;
8010434b:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
80104352:	e8 b9 fa ff ff       	call   80103e10 <sched>
  p->chan = 0;
80104357:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
}
8010435e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104361:	5b                   	pop    %ebx
80104362:	5e                   	pop    %esi
80104363:	5f                   	pop    %edi
80104364:	5d                   	pop    %ebp
80104365:	c3                   	ret    
    panic("sleep without lk");
80104366:	83 ec 0c             	sub    $0xc,%esp
80104369:	68 9a 7a 10 80       	push   $0x80107a9a
8010436e:	e8 0d c0 ff ff       	call   80100380 <panic>
    panic("sleep");
80104373:	83 ec 0c             	sub    $0xc,%esp
80104376:	68 94 7a 10 80       	push   $0x80107a94
8010437b:	e8 00 c0 ff ff       	call   80100380 <panic>

80104380 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104380:	55                   	push   %ebp
80104381:	89 e5                	mov    %esp,%ebp
80104383:	53                   	push   %ebx
80104384:	83 ec 10             	sub    $0x10,%esp
80104387:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010438a:	68 20 1d 11 80       	push   $0x80111d20
8010438f:	e8 8c 04 00 00       	call   80104820 <acquire>
80104394:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104397:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
8010439c:	eb 0c                	jmp    801043aa <wakeup+0x2a>
8010439e:	66 90                	xchg   %ax,%ax
801043a0:	83 e8 80             	sub    $0xffffff80,%eax
801043a3:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801043a8:	74 1c                	je     801043c6 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
801043aa:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
801043ae:	75 f0                	jne    801043a0 <wakeup+0x20>
801043b0:	3b 58 24             	cmp    0x24(%eax),%ebx
801043b3:	75 eb                	jne    801043a0 <wakeup+0x20>
      p->state = RUNNABLE;
801043b5:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043bc:	83 e8 80             	sub    $0xffffff80,%eax
801043bf:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801043c4:	75 e4                	jne    801043aa <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
801043c6:	c7 45 08 20 1d 11 80 	movl   $0x80111d20,0x8(%ebp)
}
801043cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043d0:	c9                   	leave  
  release(&ptable.lock);
801043d1:	e9 ea 03 00 00       	jmp    801047c0 <release>
801043d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043dd:	8d 76 00             	lea    0x0(%esi),%esi

801043e0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	53                   	push   %ebx
801043e4:	83 ec 10             	sub    $0x10,%esp
801043e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801043ea:	68 20 1d 11 80       	push   $0x80111d20
801043ef:	e8 2c 04 00 00       	call   80104820 <acquire>
801043f4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801043f7:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801043fc:	eb 0c                	jmp    8010440a <kill+0x2a>
801043fe:	66 90                	xchg   %ax,%ax
80104400:	83 e8 80             	sub    $0xffffff80,%eax
80104403:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80104408:	74 36                	je     80104440 <kill+0x60>
    if(p->pid == pid){
8010440a:	39 58 14             	cmp    %ebx,0x14(%eax)
8010440d:	75 f1                	jne    80104400 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010440f:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
      p->killed = 1;
80104413:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
      if(p->state == SLEEPING)
8010441a:	75 07                	jne    80104423 <kill+0x43>
        p->state = RUNNABLE;
8010441c:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
      release(&ptable.lock);
80104423:	83 ec 0c             	sub    $0xc,%esp
80104426:	68 20 1d 11 80       	push   $0x80111d20
8010442b:	e8 90 03 00 00       	call   801047c0 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80104430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return 0;
80104433:	83 c4 10             	add    $0x10,%esp
80104436:	31 c0                	xor    %eax,%eax
}
80104438:	c9                   	leave  
80104439:	c3                   	ret    
8010443a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104440:	83 ec 0c             	sub    $0xc,%esp
80104443:	68 20 1d 11 80       	push   $0x80111d20
80104448:	e8 73 03 00 00       	call   801047c0 <release>
}
8010444d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
80104450:	83 c4 10             	add    $0x10,%esp
80104453:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104458:	c9                   	leave  
80104459:	c3                   	ret    
8010445a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104460 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	57                   	push   %edi
80104464:	56                   	push   %esi
80104465:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104468:	53                   	push   %ebx
80104469:	bb c4 1d 11 80       	mov    $0x80111dc4,%ebx
8010446e:	83 ec 3c             	sub    $0x3c,%esp
80104471:	eb 24                	jmp    80104497 <procdump+0x37>
80104473:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104477:	90                   	nop
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104478:	83 ec 0c             	sub    $0xc,%esp
8010447b:	68 1f 7e 10 80       	push   $0x80107e1f
80104480:	e8 1b c2 ff ff       	call   801006a0 <cprintf>
80104485:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104488:	83 eb 80             	sub    $0xffffff80,%ebx
8010448b:	81 fb c4 3d 11 80    	cmp    $0x80113dc4,%ebx
80104491:	0f 84 81 00 00 00    	je     80104518 <procdump+0xb8>
    if(p->state == UNUSED)
80104497:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010449a:	85 c0                	test   %eax,%eax
8010449c:	74 ea                	je     80104488 <procdump+0x28>
      state = "???";
8010449e:	ba ab 7a 10 80       	mov    $0x80107aab,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801044a3:	83 f8 05             	cmp    $0x5,%eax
801044a6:	77 11                	ja     801044b9 <procdump+0x59>
801044a8:	8b 14 85 0c 7b 10 80 	mov    -0x7fef84f4(,%eax,4),%edx
      state = "???";
801044af:	b8 ab 7a 10 80       	mov    $0x80107aab,%eax
801044b4:	85 d2                	test   %edx,%edx
801044b6:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801044b9:	53                   	push   %ebx
801044ba:	52                   	push   %edx
801044bb:	ff 73 a4             	push   -0x5c(%ebx)
801044be:	68 af 7a 10 80       	push   $0x80107aaf
801044c3:	e8 d8 c1 ff ff       	call   801006a0 <cprintf>
    if(p->state == SLEEPING){
801044c8:	83 c4 10             	add    $0x10,%esp
801044cb:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801044cf:	75 a7                	jne    80104478 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801044d1:	83 ec 08             	sub    $0x8,%esp
801044d4:	8d 45 c0             	lea    -0x40(%ebp),%eax
801044d7:	8d 7d c0             	lea    -0x40(%ebp),%edi
801044da:	50                   	push   %eax
801044db:	8b 43 b0             	mov    -0x50(%ebx),%eax
801044de:	8b 40 0c             	mov    0xc(%eax),%eax
801044e1:	83 c0 08             	add    $0x8,%eax
801044e4:	50                   	push   %eax
801044e5:	e8 86 01 00 00       	call   80104670 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
801044ea:	83 c4 10             	add    $0x10,%esp
801044ed:	8d 76 00             	lea    0x0(%esi),%esi
801044f0:	8b 17                	mov    (%edi),%edx
801044f2:	85 d2                	test   %edx,%edx
801044f4:	74 82                	je     80104478 <procdump+0x18>
        cprintf(" %p", pc[i]);
801044f6:	83 ec 08             	sub    $0x8,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
801044f9:	83 c7 04             	add    $0x4,%edi
        cprintf(" %p", pc[i]);
801044fc:	52                   	push   %edx
801044fd:	68 01 75 10 80       	push   $0x80107501
80104502:	e8 99 c1 ff ff       	call   801006a0 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80104507:	83 c4 10             	add    $0x10,%esp
8010450a:	39 fe                	cmp    %edi,%esi
8010450c:	75 e2                	jne    801044f0 <procdump+0x90>
8010450e:	e9 65 ff ff ff       	jmp    80104478 <procdump+0x18>
80104513:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104517:	90                   	nop
  }
}
80104518:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010451b:	5b                   	pop    %ebx
8010451c:	5e                   	pop    %esi
8010451d:	5f                   	pop    %edi
8010451e:	5d                   	pop    %ebp
8010451f:	c3                   	ret    

80104520 <initsleeplock>:
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	53                   	push   %ebx
80104524:	83 ec 0c             	sub    $0xc,%esp
80104527:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010452a:	68 24 7b 10 80       	push   $0x80107b24
8010452f:	8d 43 04             	lea    0x4(%ebx),%eax
80104532:	50                   	push   %eax
80104533:	e8 18 01 00 00       	call   80104650 <initlock>
80104538:	8b 45 0c             	mov    0xc(%ebp),%eax
8010453b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104541:	83 c4 10             	add    $0x10,%esp
80104544:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010454b:	89 43 38             	mov    %eax,0x38(%ebx)
8010454e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104551:	c9                   	leave  
80104552:	c3                   	ret    
80104553:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010455a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104560 <acquiresleep>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	56                   	push   %esi
80104564:	53                   	push   %ebx
80104565:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104568:	8d 73 04             	lea    0x4(%ebx),%esi
8010456b:	83 ec 0c             	sub    $0xc,%esp
8010456e:	56                   	push   %esi
8010456f:	e8 ac 02 00 00       	call   80104820 <acquire>
80104574:	8b 13                	mov    (%ebx),%edx
80104576:	83 c4 10             	add    $0x10,%esp
80104579:	85 d2                	test   %edx,%edx
8010457b:	74 16                	je     80104593 <acquiresleep+0x33>
8010457d:	8d 76 00             	lea    0x0(%esi),%esi
80104580:	83 ec 08             	sub    $0x8,%esp
80104583:	56                   	push   %esi
80104584:	53                   	push   %ebx
80104585:	e8 36 fd ff ff       	call   801042c0 <sleep>
8010458a:	8b 03                	mov    (%ebx),%eax
8010458c:	83 c4 10             	add    $0x10,%esp
8010458f:	85 c0                	test   %eax,%eax
80104591:	75 ed                	jne    80104580 <acquiresleep+0x20>
80104593:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104599:	e8 d2 f3 ff ff       	call   80103970 <myproc>
8010459e:	8b 40 14             	mov    0x14(%eax),%eax
801045a1:	89 43 3c             	mov    %eax,0x3c(%ebx)
801045a4:	89 75 08             	mov    %esi,0x8(%ebp)
801045a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045aa:	5b                   	pop    %ebx
801045ab:	5e                   	pop    %esi
801045ac:	5d                   	pop    %ebp
801045ad:	e9 0e 02 00 00       	jmp    801047c0 <release>
801045b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801045c0 <releasesleep>:
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	56                   	push   %esi
801045c4:	53                   	push   %ebx
801045c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045c8:	8d 73 04             	lea    0x4(%ebx),%esi
801045cb:	83 ec 0c             	sub    $0xc,%esp
801045ce:	56                   	push   %esi
801045cf:	e8 4c 02 00 00       	call   80104820 <acquire>
801045d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801045da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801045e1:	89 1c 24             	mov    %ebx,(%esp)
801045e4:	e8 97 fd ff ff       	call   80104380 <wakeup>
801045e9:	89 75 08             	mov    %esi,0x8(%ebp)
801045ec:	83 c4 10             	add    $0x10,%esp
801045ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045f2:	5b                   	pop    %ebx
801045f3:	5e                   	pop    %esi
801045f4:	5d                   	pop    %ebp
801045f5:	e9 c6 01 00 00       	jmp    801047c0 <release>
801045fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104600 <holdingsleep>:
80104600:	55                   	push   %ebp
80104601:	89 e5                	mov    %esp,%ebp
80104603:	57                   	push   %edi
80104604:	31 ff                	xor    %edi,%edi
80104606:	56                   	push   %esi
80104607:	53                   	push   %ebx
80104608:	83 ec 18             	sub    $0x18,%esp
8010460b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010460e:	8d 73 04             	lea    0x4(%ebx),%esi
80104611:	56                   	push   %esi
80104612:	e8 09 02 00 00       	call   80104820 <acquire>
80104617:	8b 03                	mov    (%ebx),%eax
80104619:	83 c4 10             	add    $0x10,%esp
8010461c:	85 c0                	test   %eax,%eax
8010461e:	75 18                	jne    80104638 <holdingsleep+0x38>
80104620:	83 ec 0c             	sub    $0xc,%esp
80104623:	56                   	push   %esi
80104624:	e8 97 01 00 00       	call   801047c0 <release>
80104629:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010462c:	89 f8                	mov    %edi,%eax
8010462e:	5b                   	pop    %ebx
8010462f:	5e                   	pop    %esi
80104630:	5f                   	pop    %edi
80104631:	5d                   	pop    %ebp
80104632:	c3                   	ret    
80104633:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104637:	90                   	nop
80104638:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
8010463b:	e8 30 f3 ff ff       	call   80103970 <myproc>
80104640:	39 58 14             	cmp    %ebx,0x14(%eax)
80104643:	0f 94 c0             	sete   %al
80104646:	0f b6 c0             	movzbl %al,%eax
80104649:	89 c7                	mov    %eax,%edi
8010464b:	eb d3                	jmp    80104620 <holdingsleep+0x20>
8010464d:	66 90                	xchg   %ax,%ax
8010464f:	90                   	nop

80104650 <initlock>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	8b 45 08             	mov    0x8(%ebp),%eax
80104656:	8b 55 0c             	mov    0xc(%ebp),%edx
80104659:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010465f:	89 50 04             	mov    %edx,0x4(%eax)
80104662:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104669:	5d                   	pop    %ebp
8010466a:	c3                   	ret    
8010466b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010466f:	90                   	nop

80104670 <getcallerpcs>:
80104670:	55                   	push   %ebp
80104671:	31 d2                	xor    %edx,%edx
80104673:	89 e5                	mov    %esp,%ebp
80104675:	53                   	push   %ebx
80104676:	8b 45 08             	mov    0x8(%ebp),%eax
80104679:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010467c:	83 e8 08             	sub    $0x8,%eax
8010467f:	90                   	nop
80104680:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104686:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010468c:	77 1a                	ja     801046a8 <getcallerpcs+0x38>
8010468e:	8b 58 04             	mov    0x4(%eax),%ebx
80104691:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80104694:	83 c2 01             	add    $0x1,%edx
80104697:	8b 00                	mov    (%eax),%eax
80104699:	83 fa 0a             	cmp    $0xa,%edx
8010469c:	75 e2                	jne    80104680 <getcallerpcs+0x10>
8010469e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801046a1:	c9                   	leave  
801046a2:	c3                   	ret    
801046a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046a7:	90                   	nop
801046a8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801046ab:	8d 51 28             	lea    0x28(%ecx),%edx
801046ae:	66 90                	xchg   %ax,%ax
801046b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801046b6:	83 c0 04             	add    $0x4,%eax
801046b9:	39 d0                	cmp    %edx,%eax
801046bb:	75 f3                	jne    801046b0 <getcallerpcs+0x40>
801046bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801046c0:	c9                   	leave  
801046c1:	c3                   	ret    
801046c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801046d0 <pushcli>:
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	53                   	push   %ebx
801046d4:	83 ec 04             	sub    $0x4,%esp
801046d7:	9c                   	pushf  
801046d8:	5b                   	pop    %ebx
801046d9:	fa                   	cli    
801046da:	e8 11 f2 ff ff       	call   801038f0 <mycpu>
801046df:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801046e5:	85 c0                	test   %eax,%eax
801046e7:	74 17                	je     80104700 <pushcli+0x30>
801046e9:	e8 02 f2 ff ff       	call   801038f0 <mycpu>
801046ee:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
801046f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801046f8:	c9                   	leave  
801046f9:	c3                   	ret    
801046fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104700:	e8 eb f1 ff ff       	call   801038f0 <mycpu>
80104705:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010470b:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80104711:	eb d6                	jmp    801046e9 <pushcli+0x19>
80104713:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010471a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104720 <popcli>:
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	83 ec 08             	sub    $0x8,%esp
80104726:	9c                   	pushf  
80104727:	58                   	pop    %eax
80104728:	f6 c4 02             	test   $0x2,%ah
8010472b:	75 35                	jne    80104762 <popcli+0x42>
8010472d:	e8 be f1 ff ff       	call   801038f0 <mycpu>
80104732:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104739:	78 34                	js     8010476f <popcli+0x4f>
8010473b:	e8 b0 f1 ff ff       	call   801038f0 <mycpu>
80104740:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104746:	85 d2                	test   %edx,%edx
80104748:	74 06                	je     80104750 <popcli+0x30>
8010474a:	c9                   	leave  
8010474b:	c3                   	ret    
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104750:	e8 9b f1 ff ff       	call   801038f0 <mycpu>
80104755:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010475b:	85 c0                	test   %eax,%eax
8010475d:	74 eb                	je     8010474a <popcli+0x2a>
8010475f:	fb                   	sti    
80104760:	c9                   	leave  
80104761:	c3                   	ret    
80104762:	83 ec 0c             	sub    $0xc,%esp
80104765:	68 2f 7b 10 80       	push   $0x80107b2f
8010476a:	e8 11 bc ff ff       	call   80100380 <panic>
8010476f:	83 ec 0c             	sub    $0xc,%esp
80104772:	68 46 7b 10 80       	push   $0x80107b46
80104777:	e8 04 bc ff ff       	call   80100380 <panic>
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104780 <holding>:
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	8b 75 08             	mov    0x8(%ebp),%esi
80104788:	31 db                	xor    %ebx,%ebx
8010478a:	e8 41 ff ff ff       	call   801046d0 <pushcli>
8010478f:	8b 06                	mov    (%esi),%eax
80104791:	85 c0                	test   %eax,%eax
80104793:	75 0b                	jne    801047a0 <holding+0x20>
80104795:	e8 86 ff ff ff       	call   80104720 <popcli>
8010479a:	89 d8                	mov    %ebx,%eax
8010479c:	5b                   	pop    %ebx
8010479d:	5e                   	pop    %esi
8010479e:	5d                   	pop    %ebp
8010479f:	c3                   	ret    
801047a0:	8b 5e 08             	mov    0x8(%esi),%ebx
801047a3:	e8 48 f1 ff ff       	call   801038f0 <mycpu>
801047a8:	39 c3                	cmp    %eax,%ebx
801047aa:	0f 94 c3             	sete   %bl
801047ad:	e8 6e ff ff ff       	call   80104720 <popcli>
801047b2:	0f b6 db             	movzbl %bl,%ebx
801047b5:	89 d8                	mov    %ebx,%eax
801047b7:	5b                   	pop    %ebx
801047b8:	5e                   	pop    %esi
801047b9:	5d                   	pop    %ebp
801047ba:	c3                   	ret    
801047bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047bf:	90                   	nop

801047c0 <release>:
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
801047c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047c8:	e8 03 ff ff ff       	call   801046d0 <pushcli>
801047cd:	8b 03                	mov    (%ebx),%eax
801047cf:	85 c0                	test   %eax,%eax
801047d1:	75 15                	jne    801047e8 <release+0x28>
801047d3:	e8 48 ff ff ff       	call   80104720 <popcli>
801047d8:	83 ec 0c             	sub    $0xc,%esp
801047db:	68 4d 7b 10 80       	push   $0x80107b4d
801047e0:	e8 9b bb ff ff       	call   80100380 <panic>
801047e5:	8d 76 00             	lea    0x0(%esi),%esi
801047e8:	8b 73 08             	mov    0x8(%ebx),%esi
801047eb:	e8 00 f1 ff ff       	call   801038f0 <mycpu>
801047f0:	39 c6                	cmp    %eax,%esi
801047f2:	75 df                	jne    801047d3 <release+0x13>
801047f4:	e8 27 ff ff ff       	call   80104720 <popcli>
801047f9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80104800:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104807:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010480c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104812:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104815:	5b                   	pop    %ebx
80104816:	5e                   	pop    %esi
80104817:	5d                   	pop    %ebp
80104818:	e9 03 ff ff ff       	jmp    80104720 <popcli>
8010481d:	8d 76 00             	lea    0x0(%esi),%esi

80104820 <acquire>:
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	53                   	push   %ebx
80104824:	83 ec 04             	sub    $0x4,%esp
80104827:	e8 a4 fe ff ff       	call   801046d0 <pushcli>
8010482c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010482f:	e8 9c fe ff ff       	call   801046d0 <pushcli>
80104834:	8b 03                	mov    (%ebx),%eax
80104836:	85 c0                	test   %eax,%eax
80104838:	75 7e                	jne    801048b8 <acquire+0x98>
8010483a:	e8 e1 fe ff ff       	call   80104720 <popcli>
8010483f:	b9 01 00 00 00       	mov    $0x1,%ecx
80104844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104848:	8b 55 08             	mov    0x8(%ebp),%edx
8010484b:	89 c8                	mov    %ecx,%eax
8010484d:	f0 87 02             	lock xchg %eax,(%edx)
80104850:	85 c0                	test   %eax,%eax
80104852:	75 f4                	jne    80104848 <acquire+0x28>
80104854:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104859:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010485c:	e8 8f f0 ff ff       	call   801038f0 <mycpu>
80104861:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104864:	89 ea                	mov    %ebp,%edx
80104866:	89 43 08             	mov    %eax,0x8(%ebx)
80104869:	31 c0                	xor    %eax,%eax
8010486b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010486f:	90                   	nop
80104870:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104876:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010487c:	77 1a                	ja     80104898 <acquire+0x78>
8010487e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104881:	89 5c 81 0c          	mov    %ebx,0xc(%ecx,%eax,4)
80104885:	83 c0 01             	add    $0x1,%eax
80104888:	8b 12                	mov    (%edx),%edx
8010488a:	83 f8 0a             	cmp    $0xa,%eax
8010488d:	75 e1                	jne    80104870 <acquire+0x50>
8010488f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104892:	c9                   	leave  
80104893:	c3                   	ret    
80104894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104898:	8d 44 81 0c          	lea    0xc(%ecx,%eax,4),%eax
8010489c:	8d 51 34             	lea    0x34(%ecx),%edx
8010489f:	90                   	nop
801048a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801048a6:	83 c0 04             	add    $0x4,%eax
801048a9:	39 c2                	cmp    %eax,%edx
801048ab:	75 f3                	jne    801048a0 <acquire+0x80>
801048ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801048b0:	c9                   	leave  
801048b1:	c3                   	ret    
801048b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048b8:	8b 5b 08             	mov    0x8(%ebx),%ebx
801048bb:	e8 30 f0 ff ff       	call   801038f0 <mycpu>
801048c0:	39 c3                	cmp    %eax,%ebx
801048c2:	0f 85 72 ff ff ff    	jne    8010483a <acquire+0x1a>
801048c8:	e8 53 fe ff ff       	call   80104720 <popcli>
801048cd:	83 ec 0c             	sub    $0xc,%esp
801048d0:	68 55 7b 10 80       	push   $0x80107b55
801048d5:	e8 a6 ba ff ff       	call   80100380 <panic>
801048da:	66 90                	xchg   %ax,%ax
801048dc:	66 90                	xchg   %ax,%ax
801048de:	66 90                	xchg   %ax,%ax

801048e0 <memset>:
801048e0:	55                   	push   %ebp
801048e1:	89 e5                	mov    %esp,%ebp
801048e3:	57                   	push   %edi
801048e4:	8b 55 08             	mov    0x8(%ebp),%edx
801048e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048ea:	53                   	push   %ebx
801048eb:	8b 45 0c             	mov    0xc(%ebp),%eax
801048ee:	89 d7                	mov    %edx,%edi
801048f0:	09 cf                	or     %ecx,%edi
801048f2:	83 e7 03             	and    $0x3,%edi
801048f5:	75 29                	jne    80104920 <memset+0x40>
801048f7:	0f b6 f8             	movzbl %al,%edi
801048fa:	c1 e0 18             	shl    $0x18,%eax
801048fd:	89 fb                	mov    %edi,%ebx
801048ff:	c1 e9 02             	shr    $0x2,%ecx
80104902:	c1 e3 10             	shl    $0x10,%ebx
80104905:	09 d8                	or     %ebx,%eax
80104907:	09 f8                	or     %edi,%eax
80104909:	c1 e7 08             	shl    $0x8,%edi
8010490c:	09 f8                	or     %edi,%eax
8010490e:	89 d7                	mov    %edx,%edi
80104910:	fc                   	cld    
80104911:	f3 ab                	rep stos %eax,%es:(%edi)
80104913:	5b                   	pop    %ebx
80104914:	89 d0                	mov    %edx,%eax
80104916:	5f                   	pop    %edi
80104917:	5d                   	pop    %ebp
80104918:	c3                   	ret    
80104919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104920:	89 d7                	mov    %edx,%edi
80104922:	fc                   	cld    
80104923:	f3 aa                	rep stos %al,%es:(%edi)
80104925:	5b                   	pop    %ebx
80104926:	89 d0                	mov    %edx,%eax
80104928:	5f                   	pop    %edi
80104929:	5d                   	pop    %ebp
8010492a:	c3                   	ret    
8010492b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010492f:	90                   	nop

80104930 <memcmp>:
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	56                   	push   %esi
80104934:	8b 75 10             	mov    0x10(%ebp),%esi
80104937:	8b 55 08             	mov    0x8(%ebp),%edx
8010493a:	53                   	push   %ebx
8010493b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010493e:	85 f6                	test   %esi,%esi
80104940:	74 2e                	je     80104970 <memcmp+0x40>
80104942:	01 c6                	add    %eax,%esi
80104944:	eb 14                	jmp    8010495a <memcmp+0x2a>
80104946:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010494d:	8d 76 00             	lea    0x0(%esi),%esi
80104950:	83 c0 01             	add    $0x1,%eax
80104953:	83 c2 01             	add    $0x1,%edx
80104956:	39 f0                	cmp    %esi,%eax
80104958:	74 16                	je     80104970 <memcmp+0x40>
8010495a:	0f b6 0a             	movzbl (%edx),%ecx
8010495d:	0f b6 18             	movzbl (%eax),%ebx
80104960:	38 d9                	cmp    %bl,%cl
80104962:	74 ec                	je     80104950 <memcmp+0x20>
80104964:	0f b6 c1             	movzbl %cl,%eax
80104967:	29 d8                	sub    %ebx,%eax
80104969:	5b                   	pop    %ebx
8010496a:	5e                   	pop    %esi
8010496b:	5d                   	pop    %ebp
8010496c:	c3                   	ret    
8010496d:	8d 76 00             	lea    0x0(%esi),%esi
80104970:	5b                   	pop    %ebx
80104971:	31 c0                	xor    %eax,%eax
80104973:	5e                   	pop    %esi
80104974:	5d                   	pop    %ebp
80104975:	c3                   	ret    
80104976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010497d:	8d 76 00             	lea    0x0(%esi),%esi

80104980 <memmove>:
80104980:	55                   	push   %ebp
80104981:	89 e5                	mov    %esp,%ebp
80104983:	57                   	push   %edi
80104984:	8b 55 08             	mov    0x8(%ebp),%edx
80104987:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010498a:	56                   	push   %esi
8010498b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010498e:	39 d6                	cmp    %edx,%esi
80104990:	73 26                	jae    801049b8 <memmove+0x38>
80104992:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
80104995:	39 fa                	cmp    %edi,%edx
80104997:	73 1f                	jae    801049b8 <memmove+0x38>
80104999:	8d 41 ff             	lea    -0x1(%ecx),%eax
8010499c:	85 c9                	test   %ecx,%ecx
8010499e:	74 0c                	je     801049ac <memmove+0x2c>
801049a0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801049a4:	88 0c 02             	mov    %cl,(%edx,%eax,1)
801049a7:	83 e8 01             	sub    $0x1,%eax
801049aa:	73 f4                	jae    801049a0 <memmove+0x20>
801049ac:	5e                   	pop    %esi
801049ad:	89 d0                	mov    %edx,%eax
801049af:	5f                   	pop    %edi
801049b0:	5d                   	pop    %ebp
801049b1:	c3                   	ret    
801049b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049b8:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
801049bb:	89 d7                	mov    %edx,%edi
801049bd:	85 c9                	test   %ecx,%ecx
801049bf:	74 eb                	je     801049ac <memmove+0x2c>
801049c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049c8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
801049c9:	39 c6                	cmp    %eax,%esi
801049cb:	75 fb                	jne    801049c8 <memmove+0x48>
801049cd:	5e                   	pop    %esi
801049ce:	89 d0                	mov    %edx,%eax
801049d0:	5f                   	pop    %edi
801049d1:	5d                   	pop    %ebp
801049d2:	c3                   	ret    
801049d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801049e0 <memcpy>:
801049e0:	eb 9e                	jmp    80104980 <memmove>
801049e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801049f0 <strncmp>:
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	56                   	push   %esi
801049f4:	8b 75 10             	mov    0x10(%ebp),%esi
801049f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
801049fa:	53                   	push   %ebx
801049fb:	8b 55 0c             	mov    0xc(%ebp),%edx
801049fe:	85 f6                	test   %esi,%esi
80104a00:	74 2e                	je     80104a30 <strncmp+0x40>
80104a02:	01 d6                	add    %edx,%esi
80104a04:	eb 18                	jmp    80104a1e <strncmp+0x2e>
80104a06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a0d:	8d 76 00             	lea    0x0(%esi),%esi
80104a10:	38 d8                	cmp    %bl,%al
80104a12:	75 14                	jne    80104a28 <strncmp+0x38>
80104a14:	83 c2 01             	add    $0x1,%edx
80104a17:	83 c1 01             	add    $0x1,%ecx
80104a1a:	39 f2                	cmp    %esi,%edx
80104a1c:	74 12                	je     80104a30 <strncmp+0x40>
80104a1e:	0f b6 01             	movzbl (%ecx),%eax
80104a21:	0f b6 1a             	movzbl (%edx),%ebx
80104a24:	84 c0                	test   %al,%al
80104a26:	75 e8                	jne    80104a10 <strncmp+0x20>
80104a28:	29 d8                	sub    %ebx,%eax
80104a2a:	5b                   	pop    %ebx
80104a2b:	5e                   	pop    %esi
80104a2c:	5d                   	pop    %ebp
80104a2d:	c3                   	ret    
80104a2e:	66 90                	xchg   %ax,%ax
80104a30:	5b                   	pop    %ebx
80104a31:	31 c0                	xor    %eax,%eax
80104a33:	5e                   	pop    %esi
80104a34:	5d                   	pop    %ebp
80104a35:	c3                   	ret    
80104a36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a3d:	8d 76 00             	lea    0x0(%esi),%esi

80104a40 <strncpy>:
80104a40:	55                   	push   %ebp
80104a41:	89 e5                	mov    %esp,%ebp
80104a43:	57                   	push   %edi
80104a44:	56                   	push   %esi
80104a45:	8b 75 08             	mov    0x8(%ebp),%esi
80104a48:	53                   	push   %ebx
80104a49:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104a4c:	89 f0                	mov    %esi,%eax
80104a4e:	eb 15                	jmp    80104a65 <strncpy+0x25>
80104a50:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80104a54:	8b 7d 0c             	mov    0xc(%ebp),%edi
80104a57:	83 c0 01             	add    $0x1,%eax
80104a5a:	0f b6 57 ff          	movzbl -0x1(%edi),%edx
80104a5e:	88 50 ff             	mov    %dl,-0x1(%eax)
80104a61:	84 d2                	test   %dl,%dl
80104a63:	74 09                	je     80104a6e <strncpy+0x2e>
80104a65:	89 cb                	mov    %ecx,%ebx
80104a67:	83 e9 01             	sub    $0x1,%ecx
80104a6a:	85 db                	test   %ebx,%ebx
80104a6c:	7f e2                	jg     80104a50 <strncpy+0x10>
80104a6e:	89 c2                	mov    %eax,%edx
80104a70:	85 c9                	test   %ecx,%ecx
80104a72:	7e 17                	jle    80104a8b <strncpy+0x4b>
80104a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a78:	83 c2 01             	add    $0x1,%edx
80104a7b:	89 c1                	mov    %eax,%ecx
80104a7d:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
80104a81:	29 d1                	sub    %edx,%ecx
80104a83:	8d 4c 0b ff          	lea    -0x1(%ebx,%ecx,1),%ecx
80104a87:	85 c9                	test   %ecx,%ecx
80104a89:	7f ed                	jg     80104a78 <strncpy+0x38>
80104a8b:	5b                   	pop    %ebx
80104a8c:	89 f0                	mov    %esi,%eax
80104a8e:	5e                   	pop    %esi
80104a8f:	5f                   	pop    %edi
80104a90:	5d                   	pop    %ebp
80104a91:	c3                   	ret    
80104a92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104aa0 <safestrcpy>:
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	56                   	push   %esi
80104aa4:	8b 55 10             	mov    0x10(%ebp),%edx
80104aa7:	8b 75 08             	mov    0x8(%ebp),%esi
80104aaa:	53                   	push   %ebx
80104aab:	8b 45 0c             	mov    0xc(%ebp),%eax
80104aae:	85 d2                	test   %edx,%edx
80104ab0:	7e 25                	jle    80104ad7 <safestrcpy+0x37>
80104ab2:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
80104ab6:	89 f2                	mov    %esi,%edx
80104ab8:	eb 16                	jmp    80104ad0 <safestrcpy+0x30>
80104aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ac0:	0f b6 08             	movzbl (%eax),%ecx
80104ac3:	83 c0 01             	add    $0x1,%eax
80104ac6:	83 c2 01             	add    $0x1,%edx
80104ac9:	88 4a ff             	mov    %cl,-0x1(%edx)
80104acc:	84 c9                	test   %cl,%cl
80104ace:	74 04                	je     80104ad4 <safestrcpy+0x34>
80104ad0:	39 d8                	cmp    %ebx,%eax
80104ad2:	75 ec                	jne    80104ac0 <safestrcpy+0x20>
80104ad4:	c6 02 00             	movb   $0x0,(%edx)
80104ad7:	89 f0                	mov    %esi,%eax
80104ad9:	5b                   	pop    %ebx
80104ada:	5e                   	pop    %esi
80104adb:	5d                   	pop    %ebp
80104adc:	c3                   	ret    
80104add:	8d 76 00             	lea    0x0(%esi),%esi

80104ae0 <strlen>:
80104ae0:	55                   	push   %ebp
80104ae1:	31 c0                	xor    %eax,%eax
80104ae3:	89 e5                	mov    %esp,%ebp
80104ae5:	8b 55 08             	mov    0x8(%ebp),%edx
80104ae8:	80 3a 00             	cmpb   $0x0,(%edx)
80104aeb:	74 0c                	je     80104af9 <strlen+0x19>
80104aed:	8d 76 00             	lea    0x0(%esi),%esi
80104af0:	83 c0 01             	add    $0x1,%eax
80104af3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104af7:	75 f7                	jne    80104af0 <strlen+0x10>
80104af9:	5d                   	pop    %ebp
80104afa:	c3                   	ret    

80104afb <swtch>:
80104afb:	8b 44 24 04          	mov    0x4(%esp),%eax
80104aff:	8b 54 24 08          	mov    0x8(%esp),%edx
80104b03:	55                   	push   %ebp
80104b04:	53                   	push   %ebx
80104b05:	56                   	push   %esi
80104b06:	57                   	push   %edi
80104b07:	89 20                	mov    %esp,(%eax)
80104b09:	89 d4                	mov    %edx,%esp
80104b0b:	5f                   	pop    %edi
80104b0c:	5e                   	pop    %esi
80104b0d:	5b                   	pop    %ebx
80104b0e:	5d                   	pop    %ebp
80104b0f:	c3                   	ret    

80104b10 <fetchint>:
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	53                   	push   %ebx
80104b14:	83 ec 04             	sub    $0x4,%esp
80104b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b1a:	e8 51 ee ff ff       	call   80103970 <myproc>
80104b1f:	8b 00                	mov    (%eax),%eax
80104b21:	39 d8                	cmp    %ebx,%eax
80104b23:	76 1b                	jbe    80104b40 <fetchint+0x30>
80104b25:	8d 53 04             	lea    0x4(%ebx),%edx
80104b28:	39 d0                	cmp    %edx,%eax
80104b2a:	72 14                	jb     80104b40 <fetchint+0x30>
80104b2c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b2f:	8b 13                	mov    (%ebx),%edx
80104b31:	89 10                	mov    %edx,(%eax)
80104b33:	31 c0                	xor    %eax,%eax
80104b35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b38:	c9                   	leave  
80104b39:	c3                   	ret    
80104b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b45:	eb ee                	jmp    80104b35 <fetchint+0x25>
80104b47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b4e:	66 90                	xchg   %ax,%ax

80104b50 <fetchstr>:
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	53                   	push   %ebx
80104b54:	83 ec 04             	sub    $0x4,%esp
80104b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b5a:	e8 11 ee ff ff       	call   80103970 <myproc>
80104b5f:	39 18                	cmp    %ebx,(%eax)
80104b61:	76 2d                	jbe    80104b90 <fetchstr+0x40>
80104b63:	8b 55 0c             	mov    0xc(%ebp),%edx
80104b66:	89 1a                	mov    %ebx,(%edx)
80104b68:	8b 10                	mov    (%eax),%edx
80104b6a:	39 d3                	cmp    %edx,%ebx
80104b6c:	73 22                	jae    80104b90 <fetchstr+0x40>
80104b6e:	89 d8                	mov    %ebx,%eax
80104b70:	eb 0d                	jmp    80104b7f <fetchstr+0x2f>
80104b72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b78:	83 c0 01             	add    $0x1,%eax
80104b7b:	39 c2                	cmp    %eax,%edx
80104b7d:	76 11                	jbe    80104b90 <fetchstr+0x40>
80104b7f:	80 38 00             	cmpb   $0x0,(%eax)
80104b82:	75 f4                	jne    80104b78 <fetchstr+0x28>
80104b84:	29 d8                	sub    %ebx,%eax
80104b86:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b89:	c9                   	leave  
80104b8a:	c3                   	ret    
80104b8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b8f:	90                   	nop
80104b90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b98:	c9                   	leave  
80104b99:	c3                   	ret    
80104b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104ba0 <argint>:
80104ba0:	55                   	push   %ebp
80104ba1:	89 e5                	mov    %esp,%ebp
80104ba3:	56                   	push   %esi
80104ba4:	53                   	push   %ebx
80104ba5:	e8 c6 ed ff ff       	call   80103970 <myproc>
80104baa:	8b 55 08             	mov    0x8(%ebp),%edx
80104bad:	8b 40 1c             	mov    0x1c(%eax),%eax
80104bb0:	8b 40 44             	mov    0x44(%eax),%eax
80104bb3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104bb6:	e8 b5 ed ff ff       	call   80103970 <myproc>
80104bbb:	8d 73 04             	lea    0x4(%ebx),%esi
80104bbe:	8b 00                	mov    (%eax),%eax
80104bc0:	39 c6                	cmp    %eax,%esi
80104bc2:	73 1c                	jae    80104be0 <argint+0x40>
80104bc4:	8d 53 08             	lea    0x8(%ebx),%edx
80104bc7:	39 d0                	cmp    %edx,%eax
80104bc9:	72 15                	jb     80104be0 <argint+0x40>
80104bcb:	8b 45 0c             	mov    0xc(%ebp),%eax
80104bce:	8b 53 04             	mov    0x4(%ebx),%edx
80104bd1:	89 10                	mov    %edx,(%eax)
80104bd3:	31 c0                	xor    %eax,%eax
80104bd5:	5b                   	pop    %ebx
80104bd6:	5e                   	pop    %esi
80104bd7:	5d                   	pop    %ebp
80104bd8:	c3                   	ret    
80104bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104be0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104be5:	eb ee                	jmp    80104bd5 <argint+0x35>
80104be7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bee:	66 90                	xchg   %ax,%ax

80104bf0 <argptr>:
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	57                   	push   %edi
80104bf4:	56                   	push   %esi
80104bf5:	53                   	push   %ebx
80104bf6:	83 ec 0c             	sub    $0xc,%esp
80104bf9:	e8 72 ed ff ff       	call   80103970 <myproc>
80104bfe:	89 c6                	mov    %eax,%esi
80104c00:	e8 6b ed ff ff       	call   80103970 <myproc>
80104c05:	8b 55 08             	mov    0x8(%ebp),%edx
80104c08:	8b 40 1c             	mov    0x1c(%eax),%eax
80104c0b:	8b 40 44             	mov    0x44(%eax),%eax
80104c0e:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104c11:	e8 5a ed ff ff       	call   80103970 <myproc>
80104c16:	8d 7b 04             	lea    0x4(%ebx),%edi
80104c19:	8b 00                	mov    (%eax),%eax
80104c1b:	39 c7                	cmp    %eax,%edi
80104c1d:	73 31                	jae    80104c50 <argptr+0x60>
80104c1f:	8d 4b 08             	lea    0x8(%ebx),%ecx
80104c22:	39 c8                	cmp    %ecx,%eax
80104c24:	72 2a                	jb     80104c50 <argptr+0x60>
80104c26:	8b 55 10             	mov    0x10(%ebp),%edx
80104c29:	8b 43 04             	mov    0x4(%ebx),%eax
80104c2c:	85 d2                	test   %edx,%edx
80104c2e:	78 20                	js     80104c50 <argptr+0x60>
80104c30:	8b 16                	mov    (%esi),%edx
80104c32:	39 c2                	cmp    %eax,%edx
80104c34:	76 1a                	jbe    80104c50 <argptr+0x60>
80104c36:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104c39:	01 c3                	add    %eax,%ebx
80104c3b:	39 da                	cmp    %ebx,%edx
80104c3d:	72 11                	jb     80104c50 <argptr+0x60>
80104c3f:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c42:	89 02                	mov    %eax,(%edx)
80104c44:	31 c0                	xor    %eax,%eax
80104c46:	83 c4 0c             	add    $0xc,%esp
80104c49:	5b                   	pop    %ebx
80104c4a:	5e                   	pop    %esi
80104c4b:	5f                   	pop    %edi
80104c4c:	5d                   	pop    %ebp
80104c4d:	c3                   	ret    
80104c4e:	66 90                	xchg   %ax,%ax
80104c50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c55:	eb ef                	jmp    80104c46 <argptr+0x56>
80104c57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c5e:	66 90                	xchg   %ax,%ax

80104c60 <argstr>:
80104c60:	55                   	push   %ebp
80104c61:	89 e5                	mov    %esp,%ebp
80104c63:	56                   	push   %esi
80104c64:	53                   	push   %ebx
80104c65:	e8 06 ed ff ff       	call   80103970 <myproc>
80104c6a:	8b 55 08             	mov    0x8(%ebp),%edx
80104c6d:	8b 40 1c             	mov    0x1c(%eax),%eax
80104c70:	8b 40 44             	mov    0x44(%eax),%eax
80104c73:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104c76:	e8 f5 ec ff ff       	call   80103970 <myproc>
80104c7b:	8d 73 04             	lea    0x4(%ebx),%esi
80104c7e:	8b 00                	mov    (%eax),%eax
80104c80:	39 c6                	cmp    %eax,%esi
80104c82:	73 44                	jae    80104cc8 <argstr+0x68>
80104c84:	8d 53 08             	lea    0x8(%ebx),%edx
80104c87:	39 d0                	cmp    %edx,%eax
80104c89:	72 3d                	jb     80104cc8 <argstr+0x68>
80104c8b:	8b 5b 04             	mov    0x4(%ebx),%ebx
80104c8e:	e8 dd ec ff ff       	call   80103970 <myproc>
80104c93:	3b 18                	cmp    (%eax),%ebx
80104c95:	73 31                	jae    80104cc8 <argstr+0x68>
80104c97:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c9a:	89 1a                	mov    %ebx,(%edx)
80104c9c:	8b 10                	mov    (%eax),%edx
80104c9e:	39 d3                	cmp    %edx,%ebx
80104ca0:	73 26                	jae    80104cc8 <argstr+0x68>
80104ca2:	89 d8                	mov    %ebx,%eax
80104ca4:	eb 11                	jmp    80104cb7 <argstr+0x57>
80104ca6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104cad:	8d 76 00             	lea    0x0(%esi),%esi
80104cb0:	83 c0 01             	add    $0x1,%eax
80104cb3:	39 c2                	cmp    %eax,%edx
80104cb5:	76 11                	jbe    80104cc8 <argstr+0x68>
80104cb7:	80 38 00             	cmpb   $0x0,(%eax)
80104cba:	75 f4                	jne    80104cb0 <argstr+0x50>
80104cbc:	29 d8                	sub    %ebx,%eax
80104cbe:	5b                   	pop    %ebx
80104cbf:	5e                   	pop    %esi
80104cc0:	5d                   	pop    %ebp
80104cc1:	c3                   	ret    
80104cc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104cc8:	5b                   	pop    %ebx
80104cc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cce:	5e                   	pop    %esi
80104ccf:	5d                   	pop    %ebp
80104cd0:	c3                   	ret    
80104cd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104cd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104cdf:	90                   	nop

80104ce0 <syscall>:
80104ce0:	55                   	push   %ebp
80104ce1:	89 e5                	mov    %esp,%ebp
80104ce3:	53                   	push   %ebx
80104ce4:	83 ec 04             	sub    $0x4,%esp
80104ce7:	e8 84 ec ff ff       	call   80103970 <myproc>
80104cec:	89 c3                	mov    %eax,%ebx
80104cee:	8b 40 1c             	mov    0x1c(%eax),%eax
80104cf1:	8b 40 1c             	mov    0x1c(%eax),%eax
80104cf4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104cf7:	83 fa 16             	cmp    $0x16,%edx
80104cfa:	77 24                	ja     80104d20 <syscall+0x40>
80104cfc:	8b 14 85 80 7b 10 80 	mov    -0x7fef8480(,%eax,4),%edx
80104d03:	85 d2                	test   %edx,%edx
80104d05:	74 19                	je     80104d20 <syscall+0x40>
80104d07:	ff d2                	call   *%edx
80104d09:	89 c2                	mov    %eax,%edx
80104d0b:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104d0e:	89 50 1c             	mov    %edx,0x1c(%eax)
80104d11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d14:	c9                   	leave  
80104d15:	c3                   	ret    
80104d16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d1d:	8d 76 00             	lea    0x0(%esi),%esi
80104d20:	50                   	push   %eax
80104d21:	8d 43 70             	lea    0x70(%ebx),%eax
80104d24:	50                   	push   %eax
80104d25:	ff 73 14             	push   0x14(%ebx)
80104d28:	68 5d 7b 10 80       	push   $0x80107b5d
80104d2d:	e8 6e b9 ff ff       	call   801006a0 <cprintf>
80104d32:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104d35:	83 c4 10             	add    $0x10,%esp
80104d38:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104d3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d42:	c9                   	leave  
80104d43:	c3                   	ret    
80104d44:	66 90                	xchg   %ax,%ax
80104d46:	66 90                	xchg   %ax,%ax
80104d48:	66 90                	xchg   %ax,%ax
80104d4a:	66 90                	xchg   %ax,%ax
80104d4c:	66 90                	xchg   %ax,%ax
80104d4e:	66 90                	xchg   %ax,%ax

80104d50 <create>:
80104d50:	55                   	push   %ebp
80104d51:	89 e5                	mov    %esp,%ebp
80104d53:	57                   	push   %edi
80104d54:	56                   	push   %esi
80104d55:	8d 7d da             	lea    -0x26(%ebp),%edi
80104d58:	53                   	push   %ebx
80104d59:	83 ec 34             	sub    $0x34,%esp
80104d5c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104d5f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104d62:	57                   	push   %edi
80104d63:	50                   	push   %eax
80104d64:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104d67:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80104d6a:	e8 51 d3 ff ff       	call   801020c0 <nameiparent>
80104d6f:	83 c4 10             	add    $0x10,%esp
80104d72:	85 c0                	test   %eax,%eax
80104d74:	0f 84 46 01 00 00    	je     80104ec0 <create+0x170>
80104d7a:	83 ec 0c             	sub    $0xc,%esp
80104d7d:	89 c3                	mov    %eax,%ebx
80104d7f:	50                   	push   %eax
80104d80:	e8 fb c9 ff ff       	call   80101780 <ilock>
80104d85:	83 c4 0c             	add    $0xc,%esp
80104d88:	6a 00                	push   $0x0
80104d8a:	57                   	push   %edi
80104d8b:	53                   	push   %ebx
80104d8c:	e8 4f cf ff ff       	call   80101ce0 <dirlookup>
80104d91:	83 c4 10             	add    $0x10,%esp
80104d94:	89 c6                	mov    %eax,%esi
80104d96:	85 c0                	test   %eax,%eax
80104d98:	74 56                	je     80104df0 <create+0xa0>
80104d9a:	83 ec 0c             	sub    $0xc,%esp
80104d9d:	53                   	push   %ebx
80104d9e:	e8 6d cc ff ff       	call   80101a10 <iunlockput>
80104da3:	89 34 24             	mov    %esi,(%esp)
80104da6:	e8 d5 c9 ff ff       	call   80101780 <ilock>
80104dab:	83 c4 10             	add    $0x10,%esp
80104dae:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104db3:	75 1b                	jne    80104dd0 <create+0x80>
80104db5:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104dba:	75 14                	jne    80104dd0 <create+0x80>
80104dbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dbf:	89 f0                	mov    %esi,%eax
80104dc1:	5b                   	pop    %ebx
80104dc2:	5e                   	pop    %esi
80104dc3:	5f                   	pop    %edi
80104dc4:	5d                   	pop    %ebp
80104dc5:	c3                   	ret    
80104dc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104dcd:	8d 76 00             	lea    0x0(%esi),%esi
80104dd0:	83 ec 0c             	sub    $0xc,%esp
80104dd3:	56                   	push   %esi
80104dd4:	31 f6                	xor    %esi,%esi
80104dd6:	e8 35 cc ff ff       	call   80101a10 <iunlockput>
80104ddb:	83 c4 10             	add    $0x10,%esp
80104dde:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104de1:	89 f0                	mov    %esi,%eax
80104de3:	5b                   	pop    %ebx
80104de4:	5e                   	pop    %esi
80104de5:	5f                   	pop    %edi
80104de6:	5d                   	pop    %ebp
80104de7:	c3                   	ret    
80104de8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104def:	90                   	nop
80104df0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104df4:	83 ec 08             	sub    $0x8,%esp
80104df7:	50                   	push   %eax
80104df8:	ff 33                	push   (%ebx)
80104dfa:	e8 11 c8 ff ff       	call   80101610 <ialloc>
80104dff:	83 c4 10             	add    $0x10,%esp
80104e02:	89 c6                	mov    %eax,%esi
80104e04:	85 c0                	test   %eax,%eax
80104e06:	0f 84 cd 00 00 00    	je     80104ed9 <create+0x189>
80104e0c:	83 ec 0c             	sub    $0xc,%esp
80104e0f:	50                   	push   %eax
80104e10:	e8 6b c9 ff ff       	call   80101780 <ilock>
80104e15:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104e19:	66 89 46 52          	mov    %ax,0x52(%esi)
80104e1d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104e21:	66 89 46 54          	mov    %ax,0x54(%esi)
80104e25:	b8 01 00 00 00       	mov    $0x1,%eax
80104e2a:	66 89 46 56          	mov    %ax,0x56(%esi)
80104e2e:	89 34 24             	mov    %esi,(%esp)
80104e31:	e8 9a c8 ff ff       	call   801016d0 <iupdate>
80104e36:	83 c4 10             	add    $0x10,%esp
80104e39:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104e3e:	74 30                	je     80104e70 <create+0x120>
80104e40:	83 ec 04             	sub    $0x4,%esp
80104e43:	ff 76 04             	push   0x4(%esi)
80104e46:	57                   	push   %edi
80104e47:	53                   	push   %ebx
80104e48:	e8 93 d1 ff ff       	call   80101fe0 <dirlink>
80104e4d:	83 c4 10             	add    $0x10,%esp
80104e50:	85 c0                	test   %eax,%eax
80104e52:	78 78                	js     80104ecc <create+0x17c>
80104e54:	83 ec 0c             	sub    $0xc,%esp
80104e57:	53                   	push   %ebx
80104e58:	e8 b3 cb ff ff       	call   80101a10 <iunlockput>
80104e5d:	83 c4 10             	add    $0x10,%esp
80104e60:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e63:	89 f0                	mov    %esi,%eax
80104e65:	5b                   	pop    %ebx
80104e66:	5e                   	pop    %esi
80104e67:	5f                   	pop    %edi
80104e68:	5d                   	pop    %ebp
80104e69:	c3                   	ret    
80104e6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e70:	83 ec 0c             	sub    $0xc,%esp
80104e73:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104e78:	53                   	push   %ebx
80104e79:	e8 52 c8 ff ff       	call   801016d0 <iupdate>
80104e7e:	83 c4 0c             	add    $0xc,%esp
80104e81:	ff 76 04             	push   0x4(%esi)
80104e84:	68 fc 7b 10 80       	push   $0x80107bfc
80104e89:	56                   	push   %esi
80104e8a:	e8 51 d1 ff ff       	call   80101fe0 <dirlink>
80104e8f:	83 c4 10             	add    $0x10,%esp
80104e92:	85 c0                	test   %eax,%eax
80104e94:	78 18                	js     80104eae <create+0x15e>
80104e96:	83 ec 04             	sub    $0x4,%esp
80104e99:	ff 73 04             	push   0x4(%ebx)
80104e9c:	68 fb 7b 10 80       	push   $0x80107bfb
80104ea1:	56                   	push   %esi
80104ea2:	e8 39 d1 ff ff       	call   80101fe0 <dirlink>
80104ea7:	83 c4 10             	add    $0x10,%esp
80104eaa:	85 c0                	test   %eax,%eax
80104eac:	79 92                	jns    80104e40 <create+0xf0>
80104eae:	83 ec 0c             	sub    $0xc,%esp
80104eb1:	68 ef 7b 10 80       	push   $0x80107bef
80104eb6:	e8 c5 b4 ff ff       	call   80100380 <panic>
80104ebb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ebf:	90                   	nop
80104ec0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ec3:	31 f6                	xor    %esi,%esi
80104ec5:	5b                   	pop    %ebx
80104ec6:	89 f0                	mov    %esi,%eax
80104ec8:	5e                   	pop    %esi
80104ec9:	5f                   	pop    %edi
80104eca:	5d                   	pop    %ebp
80104ecb:	c3                   	ret    
80104ecc:	83 ec 0c             	sub    $0xc,%esp
80104ecf:	68 fe 7b 10 80       	push   $0x80107bfe
80104ed4:	e8 a7 b4 ff ff       	call   80100380 <panic>
80104ed9:	83 ec 0c             	sub    $0xc,%esp
80104edc:	68 e0 7b 10 80       	push   $0x80107be0
80104ee1:	e8 9a b4 ff ff       	call   80100380 <panic>
80104ee6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104eed:	8d 76 00             	lea    0x0(%esi),%esi

80104ef0 <sys_dup>:
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	56                   	push   %esi
80104ef4:	53                   	push   %ebx
80104ef5:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ef8:	83 ec 18             	sub    $0x18,%esp
80104efb:	50                   	push   %eax
80104efc:	6a 00                	push   $0x0
80104efe:	e8 9d fc ff ff       	call   80104ba0 <argint>
80104f03:	83 c4 10             	add    $0x10,%esp
80104f06:	85 c0                	test   %eax,%eax
80104f08:	78 36                	js     80104f40 <sys_dup+0x50>
80104f0a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104f0e:	77 30                	ja     80104f40 <sys_dup+0x50>
80104f10:	e8 5b ea ff ff       	call   80103970 <myproc>
80104f15:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104f18:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
80104f1c:	85 f6                	test   %esi,%esi
80104f1e:	74 20                	je     80104f40 <sys_dup+0x50>
80104f20:	e8 4b ea ff ff       	call   80103970 <myproc>
80104f25:	31 db                	xor    %ebx,%ebx
80104f27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f2e:	66 90                	xchg   %ax,%ax
80104f30:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
80104f34:	85 d2                	test   %edx,%edx
80104f36:	74 18                	je     80104f50 <sys_dup+0x60>
80104f38:	83 c3 01             	add    $0x1,%ebx
80104f3b:	83 fb 10             	cmp    $0x10,%ebx
80104f3e:	75 f0                	jne    80104f30 <sys_dup+0x40>
80104f40:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f43:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104f48:	89 d8                	mov    %ebx,%eax
80104f4a:	5b                   	pop    %ebx
80104f4b:	5e                   	pop    %esi
80104f4c:	5d                   	pop    %ebp
80104f4d:	c3                   	ret    
80104f4e:	66 90                	xchg   %ax,%ax
80104f50:	83 ec 0c             	sub    $0xc,%esp
80104f53:	89 74 98 2c          	mov    %esi,0x2c(%eax,%ebx,4)
80104f57:	56                   	push   %esi
80104f58:	e8 43 bf ff ff       	call   80100ea0 <filedup>
80104f5d:	83 c4 10             	add    $0x10,%esp
80104f60:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f63:	89 d8                	mov    %ebx,%eax
80104f65:	5b                   	pop    %ebx
80104f66:	5e                   	pop    %esi
80104f67:	5d                   	pop    %ebp
80104f68:	c3                   	ret    
80104f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104f70 <sys_read>:
80104f70:	55                   	push   %ebp
80104f71:	89 e5                	mov    %esp,%ebp
80104f73:	56                   	push   %esi
80104f74:	53                   	push   %ebx
80104f75:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104f78:	83 ec 18             	sub    $0x18,%esp
80104f7b:	53                   	push   %ebx
80104f7c:	6a 00                	push   $0x0
80104f7e:	e8 1d fc ff ff       	call   80104ba0 <argint>
80104f83:	83 c4 10             	add    $0x10,%esp
80104f86:	85 c0                	test   %eax,%eax
80104f88:	78 5e                	js     80104fe8 <sys_read+0x78>
80104f8a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104f8e:	77 58                	ja     80104fe8 <sys_read+0x78>
80104f90:	e8 db e9 ff ff       	call   80103970 <myproc>
80104f95:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104f98:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
80104f9c:	85 f6                	test   %esi,%esi
80104f9e:	74 48                	je     80104fe8 <sys_read+0x78>
80104fa0:	83 ec 08             	sub    $0x8,%esp
80104fa3:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104fa6:	50                   	push   %eax
80104fa7:	6a 02                	push   $0x2
80104fa9:	e8 f2 fb ff ff       	call   80104ba0 <argint>
80104fae:	83 c4 10             	add    $0x10,%esp
80104fb1:	85 c0                	test   %eax,%eax
80104fb3:	78 33                	js     80104fe8 <sys_read+0x78>
80104fb5:	83 ec 04             	sub    $0x4,%esp
80104fb8:	ff 75 f0             	push   -0x10(%ebp)
80104fbb:	53                   	push   %ebx
80104fbc:	6a 01                	push   $0x1
80104fbe:	e8 2d fc ff ff       	call   80104bf0 <argptr>
80104fc3:	83 c4 10             	add    $0x10,%esp
80104fc6:	85 c0                	test   %eax,%eax
80104fc8:	78 1e                	js     80104fe8 <sys_read+0x78>
80104fca:	83 ec 04             	sub    $0x4,%esp
80104fcd:	ff 75 f0             	push   -0x10(%ebp)
80104fd0:	ff 75 f4             	push   -0xc(%ebp)
80104fd3:	56                   	push   %esi
80104fd4:	e8 47 c0 ff ff       	call   80101020 <fileread>
80104fd9:	83 c4 10             	add    $0x10,%esp
80104fdc:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104fdf:	5b                   	pop    %ebx
80104fe0:	5e                   	pop    %esi
80104fe1:	5d                   	pop    %ebp
80104fe2:	c3                   	ret    
80104fe3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104fe7:	90                   	nop
80104fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fed:	eb ed                	jmp    80104fdc <sys_read+0x6c>
80104fef:	90                   	nop

80104ff0 <sys_write>:
80104ff0:	55                   	push   %ebp
80104ff1:	89 e5                	mov    %esp,%ebp
80104ff3:	56                   	push   %esi
80104ff4:	53                   	push   %ebx
80104ff5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104ff8:	83 ec 18             	sub    $0x18,%esp
80104ffb:	53                   	push   %ebx
80104ffc:	6a 00                	push   $0x0
80104ffe:	e8 9d fb ff ff       	call   80104ba0 <argint>
80105003:	83 c4 10             	add    $0x10,%esp
80105006:	85 c0                	test   %eax,%eax
80105008:	78 5e                	js     80105068 <sys_write+0x78>
8010500a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010500e:	77 58                	ja     80105068 <sys_write+0x78>
80105010:	e8 5b e9 ff ff       	call   80103970 <myproc>
80105015:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105018:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
8010501c:	85 f6                	test   %esi,%esi
8010501e:	74 48                	je     80105068 <sys_write+0x78>
80105020:	83 ec 08             	sub    $0x8,%esp
80105023:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105026:	50                   	push   %eax
80105027:	6a 02                	push   $0x2
80105029:	e8 72 fb ff ff       	call   80104ba0 <argint>
8010502e:	83 c4 10             	add    $0x10,%esp
80105031:	85 c0                	test   %eax,%eax
80105033:	78 33                	js     80105068 <sys_write+0x78>
80105035:	83 ec 04             	sub    $0x4,%esp
80105038:	ff 75 f0             	push   -0x10(%ebp)
8010503b:	53                   	push   %ebx
8010503c:	6a 01                	push   $0x1
8010503e:	e8 ad fb ff ff       	call   80104bf0 <argptr>
80105043:	83 c4 10             	add    $0x10,%esp
80105046:	85 c0                	test   %eax,%eax
80105048:	78 1e                	js     80105068 <sys_write+0x78>
8010504a:	83 ec 04             	sub    $0x4,%esp
8010504d:	ff 75 f0             	push   -0x10(%ebp)
80105050:	ff 75 f4             	push   -0xc(%ebp)
80105053:	56                   	push   %esi
80105054:	e8 57 c0 ff ff       	call   801010b0 <filewrite>
80105059:	83 c4 10             	add    $0x10,%esp
8010505c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010505f:	5b                   	pop    %ebx
80105060:	5e                   	pop    %esi
80105061:	5d                   	pop    %ebp
80105062:	c3                   	ret    
80105063:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105067:	90                   	nop
80105068:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010506d:	eb ed                	jmp    8010505c <sys_write+0x6c>
8010506f:	90                   	nop

80105070 <sys_close>:
80105070:	55                   	push   %ebp
80105071:	89 e5                	mov    %esp,%ebp
80105073:	56                   	push   %esi
80105074:	53                   	push   %ebx
80105075:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105078:	83 ec 18             	sub    $0x18,%esp
8010507b:	50                   	push   %eax
8010507c:	6a 00                	push   $0x0
8010507e:	e8 1d fb ff ff       	call   80104ba0 <argint>
80105083:	83 c4 10             	add    $0x10,%esp
80105086:	85 c0                	test   %eax,%eax
80105088:	78 3e                	js     801050c8 <sys_close+0x58>
8010508a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010508e:	77 38                	ja     801050c8 <sys_close+0x58>
80105090:	e8 db e8 ff ff       	call   80103970 <myproc>
80105095:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105098:	8d 5a 08             	lea    0x8(%edx),%ebx
8010509b:	8b 74 98 0c          	mov    0xc(%eax,%ebx,4),%esi
8010509f:	85 f6                	test   %esi,%esi
801050a1:	74 25                	je     801050c8 <sys_close+0x58>
801050a3:	e8 c8 e8 ff ff       	call   80103970 <myproc>
801050a8:	83 ec 0c             	sub    $0xc,%esp
801050ab:	c7 44 98 0c 00 00 00 	movl   $0x0,0xc(%eax,%ebx,4)
801050b2:	00 
801050b3:	56                   	push   %esi
801050b4:	e8 37 be ff ff       	call   80100ef0 <fileclose>
801050b9:	83 c4 10             	add    $0x10,%esp
801050bc:	31 c0                	xor    %eax,%eax
801050be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801050c1:	5b                   	pop    %ebx
801050c2:	5e                   	pop    %esi
801050c3:	5d                   	pop    %ebp
801050c4:	c3                   	ret    
801050c5:	8d 76 00             	lea    0x0(%esi),%esi
801050c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050cd:	eb ef                	jmp    801050be <sys_close+0x4e>
801050cf:	90                   	nop

801050d0 <sys_fstat>:
801050d0:	55                   	push   %ebp
801050d1:	89 e5                	mov    %esp,%ebp
801050d3:	56                   	push   %esi
801050d4:	53                   	push   %ebx
801050d5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
801050d8:	83 ec 18             	sub    $0x18,%esp
801050db:	53                   	push   %ebx
801050dc:	6a 00                	push   $0x0
801050de:	e8 bd fa ff ff       	call   80104ba0 <argint>
801050e3:	83 c4 10             	add    $0x10,%esp
801050e6:	85 c0                	test   %eax,%eax
801050e8:	78 46                	js     80105130 <sys_fstat+0x60>
801050ea:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801050ee:	77 40                	ja     80105130 <sys_fstat+0x60>
801050f0:	e8 7b e8 ff ff       	call   80103970 <myproc>
801050f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
801050f8:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
801050fc:	85 f6                	test   %esi,%esi
801050fe:	74 30                	je     80105130 <sys_fstat+0x60>
80105100:	83 ec 04             	sub    $0x4,%esp
80105103:	6a 14                	push   $0x14
80105105:	53                   	push   %ebx
80105106:	6a 01                	push   $0x1
80105108:	e8 e3 fa ff ff       	call   80104bf0 <argptr>
8010510d:	83 c4 10             	add    $0x10,%esp
80105110:	85 c0                	test   %eax,%eax
80105112:	78 1c                	js     80105130 <sys_fstat+0x60>
80105114:	83 ec 08             	sub    $0x8,%esp
80105117:	ff 75 f4             	push   -0xc(%ebp)
8010511a:	56                   	push   %esi
8010511b:	e8 b0 be ff ff       	call   80100fd0 <filestat>
80105120:	83 c4 10             	add    $0x10,%esp
80105123:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105126:	5b                   	pop    %ebx
80105127:	5e                   	pop    %esi
80105128:	5d                   	pop    %ebp
80105129:	c3                   	ret    
8010512a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105130:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105135:	eb ec                	jmp    80105123 <sys_fstat+0x53>
80105137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010513e:	66 90                	xchg   %ax,%ax

80105140 <sys_link>:
80105140:	55                   	push   %ebp
80105141:	89 e5                	mov    %esp,%ebp
80105143:	57                   	push   %edi
80105144:	56                   	push   %esi
80105145:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80105148:	53                   	push   %ebx
80105149:	83 ec 34             	sub    $0x34,%esp
8010514c:	50                   	push   %eax
8010514d:	6a 00                	push   $0x0
8010514f:	e8 0c fb ff ff       	call   80104c60 <argstr>
80105154:	83 c4 10             	add    $0x10,%esp
80105157:	85 c0                	test   %eax,%eax
80105159:	0f 88 fb 00 00 00    	js     8010525a <sys_link+0x11a>
8010515f:	83 ec 08             	sub    $0x8,%esp
80105162:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105165:	50                   	push   %eax
80105166:	6a 01                	push   $0x1
80105168:	e8 f3 fa ff ff       	call   80104c60 <argstr>
8010516d:	83 c4 10             	add    $0x10,%esp
80105170:	85 c0                	test   %eax,%eax
80105172:	0f 88 e2 00 00 00    	js     8010525a <sys_link+0x11a>
80105178:	e8 e3 db ff ff       	call   80102d60 <begin_op>
8010517d:	83 ec 0c             	sub    $0xc,%esp
80105180:	ff 75 d4             	push   -0x2c(%ebp)
80105183:	e8 18 cf ff ff       	call   801020a0 <namei>
80105188:	83 c4 10             	add    $0x10,%esp
8010518b:	89 c3                	mov    %eax,%ebx
8010518d:	85 c0                	test   %eax,%eax
8010518f:	0f 84 e4 00 00 00    	je     80105279 <sys_link+0x139>
80105195:	83 ec 0c             	sub    $0xc,%esp
80105198:	50                   	push   %eax
80105199:	e8 e2 c5 ff ff       	call   80101780 <ilock>
8010519e:	83 c4 10             	add    $0x10,%esp
801051a1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051a6:	0f 84 b5 00 00 00    	je     80105261 <sys_link+0x121>
801051ac:	83 ec 0c             	sub    $0xc,%esp
801051af:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
801051b4:	8d 7d da             	lea    -0x26(%ebp),%edi
801051b7:	53                   	push   %ebx
801051b8:	e8 13 c5 ff ff       	call   801016d0 <iupdate>
801051bd:	89 1c 24             	mov    %ebx,(%esp)
801051c0:	e8 9b c6 ff ff       	call   80101860 <iunlock>
801051c5:	58                   	pop    %eax
801051c6:	5a                   	pop    %edx
801051c7:	57                   	push   %edi
801051c8:	ff 75 d0             	push   -0x30(%ebp)
801051cb:	e8 f0 ce ff ff       	call   801020c0 <nameiparent>
801051d0:	83 c4 10             	add    $0x10,%esp
801051d3:	89 c6                	mov    %eax,%esi
801051d5:	85 c0                	test   %eax,%eax
801051d7:	74 5b                	je     80105234 <sys_link+0xf4>
801051d9:	83 ec 0c             	sub    $0xc,%esp
801051dc:	50                   	push   %eax
801051dd:	e8 9e c5 ff ff       	call   80101780 <ilock>
801051e2:	8b 03                	mov    (%ebx),%eax
801051e4:	83 c4 10             	add    $0x10,%esp
801051e7:	39 06                	cmp    %eax,(%esi)
801051e9:	75 3d                	jne    80105228 <sys_link+0xe8>
801051eb:	83 ec 04             	sub    $0x4,%esp
801051ee:	ff 73 04             	push   0x4(%ebx)
801051f1:	57                   	push   %edi
801051f2:	56                   	push   %esi
801051f3:	e8 e8 cd ff ff       	call   80101fe0 <dirlink>
801051f8:	83 c4 10             	add    $0x10,%esp
801051fb:	85 c0                	test   %eax,%eax
801051fd:	78 29                	js     80105228 <sys_link+0xe8>
801051ff:	83 ec 0c             	sub    $0xc,%esp
80105202:	56                   	push   %esi
80105203:	e8 08 c8 ff ff       	call   80101a10 <iunlockput>
80105208:	89 1c 24             	mov    %ebx,(%esp)
8010520b:	e8 a0 c6 ff ff       	call   801018b0 <iput>
80105210:	e8 bb db ff ff       	call   80102dd0 <end_op>
80105215:	83 c4 10             	add    $0x10,%esp
80105218:	31 c0                	xor    %eax,%eax
8010521a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010521d:	5b                   	pop    %ebx
8010521e:	5e                   	pop    %esi
8010521f:	5f                   	pop    %edi
80105220:	5d                   	pop    %ebp
80105221:	c3                   	ret    
80105222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105228:	83 ec 0c             	sub    $0xc,%esp
8010522b:	56                   	push   %esi
8010522c:	e8 df c7 ff ff       	call   80101a10 <iunlockput>
80105231:	83 c4 10             	add    $0x10,%esp
80105234:	83 ec 0c             	sub    $0xc,%esp
80105237:	53                   	push   %ebx
80105238:	e8 43 c5 ff ff       	call   80101780 <ilock>
8010523d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105242:	89 1c 24             	mov    %ebx,(%esp)
80105245:	e8 86 c4 ff ff       	call   801016d0 <iupdate>
8010524a:	89 1c 24             	mov    %ebx,(%esp)
8010524d:	e8 be c7 ff ff       	call   80101a10 <iunlockput>
80105252:	e8 79 db ff ff       	call   80102dd0 <end_op>
80105257:	83 c4 10             	add    $0x10,%esp
8010525a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010525f:	eb b9                	jmp    8010521a <sys_link+0xda>
80105261:	83 ec 0c             	sub    $0xc,%esp
80105264:	53                   	push   %ebx
80105265:	e8 a6 c7 ff ff       	call   80101a10 <iunlockput>
8010526a:	e8 61 db ff ff       	call   80102dd0 <end_op>
8010526f:	83 c4 10             	add    $0x10,%esp
80105272:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105277:	eb a1                	jmp    8010521a <sys_link+0xda>
80105279:	e8 52 db ff ff       	call   80102dd0 <end_op>
8010527e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105283:	eb 95                	jmp    8010521a <sys_link+0xda>
80105285:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_unlink>:
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	57                   	push   %edi
80105294:	56                   	push   %esi
80105295:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105298:	53                   	push   %ebx
80105299:	83 ec 54             	sub    $0x54,%esp
8010529c:	50                   	push   %eax
8010529d:	6a 00                	push   $0x0
8010529f:	e8 bc f9 ff ff       	call   80104c60 <argstr>
801052a4:	83 c4 10             	add    $0x10,%esp
801052a7:	85 c0                	test   %eax,%eax
801052a9:	0f 88 7a 01 00 00    	js     80105429 <sys_unlink+0x199>
801052af:	e8 ac da ff ff       	call   80102d60 <begin_op>
801052b4:	8d 5d ca             	lea    -0x36(%ebp),%ebx
801052b7:	83 ec 08             	sub    $0x8,%esp
801052ba:	53                   	push   %ebx
801052bb:	ff 75 c0             	push   -0x40(%ebp)
801052be:	e8 fd cd ff ff       	call   801020c0 <nameiparent>
801052c3:	83 c4 10             	add    $0x10,%esp
801052c6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
801052c9:	85 c0                	test   %eax,%eax
801052cb:	0f 84 62 01 00 00    	je     80105433 <sys_unlink+0x1a3>
801052d1:	8b 7d b4             	mov    -0x4c(%ebp),%edi
801052d4:	83 ec 0c             	sub    $0xc,%esp
801052d7:	57                   	push   %edi
801052d8:	e8 a3 c4 ff ff       	call   80101780 <ilock>
801052dd:	58                   	pop    %eax
801052de:	5a                   	pop    %edx
801052df:	68 fc 7b 10 80       	push   $0x80107bfc
801052e4:	53                   	push   %ebx
801052e5:	e8 d6 c9 ff ff       	call   80101cc0 <namecmp>
801052ea:	83 c4 10             	add    $0x10,%esp
801052ed:	85 c0                	test   %eax,%eax
801052ef:	0f 84 fb 00 00 00    	je     801053f0 <sys_unlink+0x160>
801052f5:	83 ec 08             	sub    $0x8,%esp
801052f8:	68 fb 7b 10 80       	push   $0x80107bfb
801052fd:	53                   	push   %ebx
801052fe:	e8 bd c9 ff ff       	call   80101cc0 <namecmp>
80105303:	83 c4 10             	add    $0x10,%esp
80105306:	85 c0                	test   %eax,%eax
80105308:	0f 84 e2 00 00 00    	je     801053f0 <sys_unlink+0x160>
8010530e:	83 ec 04             	sub    $0x4,%esp
80105311:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105314:	50                   	push   %eax
80105315:	53                   	push   %ebx
80105316:	57                   	push   %edi
80105317:	e8 c4 c9 ff ff       	call   80101ce0 <dirlookup>
8010531c:	83 c4 10             	add    $0x10,%esp
8010531f:	89 c3                	mov    %eax,%ebx
80105321:	85 c0                	test   %eax,%eax
80105323:	0f 84 c7 00 00 00    	je     801053f0 <sys_unlink+0x160>
80105329:	83 ec 0c             	sub    $0xc,%esp
8010532c:	50                   	push   %eax
8010532d:	e8 4e c4 ff ff       	call   80101780 <ilock>
80105332:	83 c4 10             	add    $0x10,%esp
80105335:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010533a:	0f 8e 1c 01 00 00    	jle    8010545c <sys_unlink+0x1cc>
80105340:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105345:	8d 7d d8             	lea    -0x28(%ebp),%edi
80105348:	74 66                	je     801053b0 <sys_unlink+0x120>
8010534a:	83 ec 04             	sub    $0x4,%esp
8010534d:	6a 10                	push   $0x10
8010534f:	6a 00                	push   $0x0
80105351:	57                   	push   %edi
80105352:	e8 89 f5 ff ff       	call   801048e0 <memset>
80105357:	6a 10                	push   $0x10
80105359:	ff 75 c4             	push   -0x3c(%ebp)
8010535c:	57                   	push   %edi
8010535d:	ff 75 b4             	push   -0x4c(%ebp)
80105360:	e8 2b c8 ff ff       	call   80101b90 <writei>
80105365:	83 c4 20             	add    $0x20,%esp
80105368:	83 f8 10             	cmp    $0x10,%eax
8010536b:	0f 85 de 00 00 00    	jne    8010544f <sys_unlink+0x1bf>
80105371:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105376:	0f 84 94 00 00 00    	je     80105410 <sys_unlink+0x180>
8010537c:	83 ec 0c             	sub    $0xc,%esp
8010537f:	ff 75 b4             	push   -0x4c(%ebp)
80105382:	e8 89 c6 ff ff       	call   80101a10 <iunlockput>
80105387:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
8010538c:	89 1c 24             	mov    %ebx,(%esp)
8010538f:	e8 3c c3 ff ff       	call   801016d0 <iupdate>
80105394:	89 1c 24             	mov    %ebx,(%esp)
80105397:	e8 74 c6 ff ff       	call   80101a10 <iunlockput>
8010539c:	e8 2f da ff ff       	call   80102dd0 <end_op>
801053a1:	83 c4 10             	add    $0x10,%esp
801053a4:	31 c0                	xor    %eax,%eax
801053a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053a9:	5b                   	pop    %ebx
801053aa:	5e                   	pop    %esi
801053ab:	5f                   	pop    %edi
801053ac:	5d                   	pop    %ebp
801053ad:	c3                   	ret    
801053ae:	66 90                	xchg   %ax,%ax
801053b0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801053b4:	76 94                	jbe    8010534a <sys_unlink+0xba>
801053b6:	be 20 00 00 00       	mov    $0x20,%esi
801053bb:	eb 0b                	jmp    801053c8 <sys_unlink+0x138>
801053bd:	8d 76 00             	lea    0x0(%esi),%esi
801053c0:	83 c6 10             	add    $0x10,%esi
801053c3:	3b 73 58             	cmp    0x58(%ebx),%esi
801053c6:	73 82                	jae    8010534a <sys_unlink+0xba>
801053c8:	6a 10                	push   $0x10
801053ca:	56                   	push   %esi
801053cb:	57                   	push   %edi
801053cc:	53                   	push   %ebx
801053cd:	e8 be c6 ff ff       	call   80101a90 <readi>
801053d2:	83 c4 10             	add    $0x10,%esp
801053d5:	83 f8 10             	cmp    $0x10,%eax
801053d8:	75 68                	jne    80105442 <sys_unlink+0x1b2>
801053da:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801053df:	74 df                	je     801053c0 <sys_unlink+0x130>
801053e1:	83 ec 0c             	sub    $0xc,%esp
801053e4:	53                   	push   %ebx
801053e5:	e8 26 c6 ff ff       	call   80101a10 <iunlockput>
801053ea:	83 c4 10             	add    $0x10,%esp
801053ed:	8d 76 00             	lea    0x0(%esi),%esi
801053f0:	83 ec 0c             	sub    $0xc,%esp
801053f3:	ff 75 b4             	push   -0x4c(%ebp)
801053f6:	e8 15 c6 ff ff       	call   80101a10 <iunlockput>
801053fb:	e8 d0 d9 ff ff       	call   80102dd0 <end_op>
80105400:	83 c4 10             	add    $0x10,%esp
80105403:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105408:	eb 9c                	jmp    801053a6 <sys_unlink+0x116>
8010540a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105410:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80105413:	83 ec 0c             	sub    $0xc,%esp
80105416:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
8010541b:	50                   	push   %eax
8010541c:	e8 af c2 ff ff       	call   801016d0 <iupdate>
80105421:	83 c4 10             	add    $0x10,%esp
80105424:	e9 53 ff ff ff       	jmp    8010537c <sys_unlink+0xec>
80105429:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010542e:	e9 73 ff ff ff       	jmp    801053a6 <sys_unlink+0x116>
80105433:	e8 98 d9 ff ff       	call   80102dd0 <end_op>
80105438:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010543d:	e9 64 ff ff ff       	jmp    801053a6 <sys_unlink+0x116>
80105442:	83 ec 0c             	sub    $0xc,%esp
80105445:	68 20 7c 10 80       	push   $0x80107c20
8010544a:	e8 31 af ff ff       	call   80100380 <panic>
8010544f:	83 ec 0c             	sub    $0xc,%esp
80105452:	68 32 7c 10 80       	push   $0x80107c32
80105457:	e8 24 af ff ff       	call   80100380 <panic>
8010545c:	83 ec 0c             	sub    $0xc,%esp
8010545f:	68 0e 7c 10 80       	push   $0x80107c0e
80105464:	e8 17 af ff ff       	call   80100380 <panic>
80105469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105470 <sys_open>:
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	57                   	push   %edi
80105474:	56                   	push   %esi
80105475:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105478:	53                   	push   %ebx
80105479:	83 ec 24             	sub    $0x24,%esp
8010547c:	50                   	push   %eax
8010547d:	6a 00                	push   $0x0
8010547f:	e8 dc f7 ff ff       	call   80104c60 <argstr>
80105484:	83 c4 10             	add    $0x10,%esp
80105487:	85 c0                	test   %eax,%eax
80105489:	0f 88 8e 00 00 00    	js     8010551d <sys_open+0xad>
8010548f:	83 ec 08             	sub    $0x8,%esp
80105492:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105495:	50                   	push   %eax
80105496:	6a 01                	push   $0x1
80105498:	e8 03 f7 ff ff       	call   80104ba0 <argint>
8010549d:	83 c4 10             	add    $0x10,%esp
801054a0:	85 c0                	test   %eax,%eax
801054a2:	78 79                	js     8010551d <sys_open+0xad>
801054a4:	e8 b7 d8 ff ff       	call   80102d60 <begin_op>
801054a9:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801054ad:	75 79                	jne    80105528 <sys_open+0xb8>
801054af:	83 ec 0c             	sub    $0xc,%esp
801054b2:	ff 75 e0             	push   -0x20(%ebp)
801054b5:	e8 e6 cb ff ff       	call   801020a0 <namei>
801054ba:	83 c4 10             	add    $0x10,%esp
801054bd:	89 c6                	mov    %eax,%esi
801054bf:	85 c0                	test   %eax,%eax
801054c1:	0f 84 7e 00 00 00    	je     80105545 <sys_open+0xd5>
801054c7:	83 ec 0c             	sub    $0xc,%esp
801054ca:	50                   	push   %eax
801054cb:	e8 b0 c2 ff ff       	call   80101780 <ilock>
801054d0:	83 c4 10             	add    $0x10,%esp
801054d3:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801054d8:	0f 84 c2 00 00 00    	je     801055a0 <sys_open+0x130>
801054de:	e8 4d b9 ff ff       	call   80100e30 <filealloc>
801054e3:	89 c7                	mov    %eax,%edi
801054e5:	85 c0                	test   %eax,%eax
801054e7:	74 23                	je     8010550c <sys_open+0x9c>
801054e9:	e8 82 e4 ff ff       	call   80103970 <myproc>
801054ee:	31 db                	xor    %ebx,%ebx
801054f0:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
801054f4:	85 d2                	test   %edx,%edx
801054f6:	74 60                	je     80105558 <sys_open+0xe8>
801054f8:	83 c3 01             	add    $0x1,%ebx
801054fb:	83 fb 10             	cmp    $0x10,%ebx
801054fe:	75 f0                	jne    801054f0 <sys_open+0x80>
80105500:	83 ec 0c             	sub    $0xc,%esp
80105503:	57                   	push   %edi
80105504:	e8 e7 b9 ff ff       	call   80100ef0 <fileclose>
80105509:	83 c4 10             	add    $0x10,%esp
8010550c:	83 ec 0c             	sub    $0xc,%esp
8010550f:	56                   	push   %esi
80105510:	e8 fb c4 ff ff       	call   80101a10 <iunlockput>
80105515:	e8 b6 d8 ff ff       	call   80102dd0 <end_op>
8010551a:	83 c4 10             	add    $0x10,%esp
8010551d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105522:	eb 6d                	jmp    80105591 <sys_open+0x121>
80105524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105528:	83 ec 0c             	sub    $0xc,%esp
8010552b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010552e:	31 c9                	xor    %ecx,%ecx
80105530:	ba 02 00 00 00       	mov    $0x2,%edx
80105535:	6a 00                	push   $0x0
80105537:	e8 14 f8 ff ff       	call   80104d50 <create>
8010553c:	83 c4 10             	add    $0x10,%esp
8010553f:	89 c6                	mov    %eax,%esi
80105541:	85 c0                	test   %eax,%eax
80105543:	75 99                	jne    801054de <sys_open+0x6e>
80105545:	e8 86 d8 ff ff       	call   80102dd0 <end_op>
8010554a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010554f:	eb 40                	jmp    80105591 <sys_open+0x121>
80105551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105558:	83 ec 0c             	sub    $0xc,%esp
8010555b:	89 7c 98 2c          	mov    %edi,0x2c(%eax,%ebx,4)
8010555f:	56                   	push   %esi
80105560:	e8 fb c2 ff ff       	call   80101860 <iunlock>
80105565:	e8 66 d8 ff ff       	call   80102dd0 <end_op>
8010556a:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
80105570:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105573:	83 c4 10             	add    $0x10,%esp
80105576:	89 77 10             	mov    %esi,0x10(%edi)
80105579:	89 d0                	mov    %edx,%eax
8010557b:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
80105582:	f7 d0                	not    %eax
80105584:	83 e0 01             	and    $0x1,%eax
80105587:	83 e2 03             	and    $0x3,%edx
8010558a:	88 47 08             	mov    %al,0x8(%edi)
8010558d:	0f 95 47 09          	setne  0x9(%edi)
80105591:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105594:	89 d8                	mov    %ebx,%eax
80105596:	5b                   	pop    %ebx
80105597:	5e                   	pop    %esi
80105598:	5f                   	pop    %edi
80105599:	5d                   	pop    %ebp
8010559a:	c3                   	ret    
8010559b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010559f:	90                   	nop
801055a0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801055a3:	85 c9                	test   %ecx,%ecx
801055a5:	0f 84 33 ff ff ff    	je     801054de <sys_open+0x6e>
801055ab:	e9 5c ff ff ff       	jmp    8010550c <sys_open+0x9c>

801055b0 <sys_mkdir>:
801055b0:	55                   	push   %ebp
801055b1:	89 e5                	mov    %esp,%ebp
801055b3:	83 ec 18             	sub    $0x18,%esp
801055b6:	e8 a5 d7 ff ff       	call   80102d60 <begin_op>
801055bb:	83 ec 08             	sub    $0x8,%esp
801055be:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055c1:	50                   	push   %eax
801055c2:	6a 00                	push   $0x0
801055c4:	e8 97 f6 ff ff       	call   80104c60 <argstr>
801055c9:	83 c4 10             	add    $0x10,%esp
801055cc:	85 c0                	test   %eax,%eax
801055ce:	78 30                	js     80105600 <sys_mkdir+0x50>
801055d0:	83 ec 0c             	sub    $0xc,%esp
801055d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801055d6:	31 c9                	xor    %ecx,%ecx
801055d8:	ba 01 00 00 00       	mov    $0x1,%edx
801055dd:	6a 00                	push   $0x0
801055df:	e8 6c f7 ff ff       	call   80104d50 <create>
801055e4:	83 c4 10             	add    $0x10,%esp
801055e7:	85 c0                	test   %eax,%eax
801055e9:	74 15                	je     80105600 <sys_mkdir+0x50>
801055eb:	83 ec 0c             	sub    $0xc,%esp
801055ee:	50                   	push   %eax
801055ef:	e8 1c c4 ff ff       	call   80101a10 <iunlockput>
801055f4:	e8 d7 d7 ff ff       	call   80102dd0 <end_op>
801055f9:	83 c4 10             	add    $0x10,%esp
801055fc:	31 c0                	xor    %eax,%eax
801055fe:	c9                   	leave  
801055ff:	c3                   	ret    
80105600:	e8 cb d7 ff ff       	call   80102dd0 <end_op>
80105605:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010560a:	c9                   	leave  
8010560b:	c3                   	ret    
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105610 <sys_mknod>:
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	83 ec 18             	sub    $0x18,%esp
80105616:	e8 45 d7 ff ff       	call   80102d60 <begin_op>
8010561b:	83 ec 08             	sub    $0x8,%esp
8010561e:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105621:	50                   	push   %eax
80105622:	6a 00                	push   $0x0
80105624:	e8 37 f6 ff ff       	call   80104c60 <argstr>
80105629:	83 c4 10             	add    $0x10,%esp
8010562c:	85 c0                	test   %eax,%eax
8010562e:	78 60                	js     80105690 <sys_mknod+0x80>
80105630:	83 ec 08             	sub    $0x8,%esp
80105633:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105636:	50                   	push   %eax
80105637:	6a 01                	push   $0x1
80105639:	e8 62 f5 ff ff       	call   80104ba0 <argint>
8010563e:	83 c4 10             	add    $0x10,%esp
80105641:	85 c0                	test   %eax,%eax
80105643:	78 4b                	js     80105690 <sys_mknod+0x80>
80105645:	83 ec 08             	sub    $0x8,%esp
80105648:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010564b:	50                   	push   %eax
8010564c:	6a 02                	push   $0x2
8010564e:	e8 4d f5 ff ff       	call   80104ba0 <argint>
80105653:	83 c4 10             	add    $0x10,%esp
80105656:	85 c0                	test   %eax,%eax
80105658:	78 36                	js     80105690 <sys_mknod+0x80>
8010565a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010565e:	83 ec 0c             	sub    $0xc,%esp
80105661:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105665:	ba 03 00 00 00       	mov    $0x3,%edx
8010566a:	50                   	push   %eax
8010566b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010566e:	e8 dd f6 ff ff       	call   80104d50 <create>
80105673:	83 c4 10             	add    $0x10,%esp
80105676:	85 c0                	test   %eax,%eax
80105678:	74 16                	je     80105690 <sys_mknod+0x80>
8010567a:	83 ec 0c             	sub    $0xc,%esp
8010567d:	50                   	push   %eax
8010567e:	e8 8d c3 ff ff       	call   80101a10 <iunlockput>
80105683:	e8 48 d7 ff ff       	call   80102dd0 <end_op>
80105688:	83 c4 10             	add    $0x10,%esp
8010568b:	31 c0                	xor    %eax,%eax
8010568d:	c9                   	leave  
8010568e:	c3                   	ret    
8010568f:	90                   	nop
80105690:	e8 3b d7 ff ff       	call   80102dd0 <end_op>
80105695:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010569a:	c9                   	leave  
8010569b:	c3                   	ret    
8010569c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056a0 <sys_chdir>:
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	56                   	push   %esi
801056a4:	53                   	push   %ebx
801056a5:	83 ec 10             	sub    $0x10,%esp
801056a8:	e8 c3 e2 ff ff       	call   80103970 <myproc>
801056ad:	89 c6                	mov    %eax,%esi
801056af:	e8 ac d6 ff ff       	call   80102d60 <begin_op>
801056b4:	83 ec 08             	sub    $0x8,%esp
801056b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056ba:	50                   	push   %eax
801056bb:	6a 00                	push   $0x0
801056bd:	e8 9e f5 ff ff       	call   80104c60 <argstr>
801056c2:	83 c4 10             	add    $0x10,%esp
801056c5:	85 c0                	test   %eax,%eax
801056c7:	78 77                	js     80105740 <sys_chdir+0xa0>
801056c9:	83 ec 0c             	sub    $0xc,%esp
801056cc:	ff 75 f4             	push   -0xc(%ebp)
801056cf:	e8 cc c9 ff ff       	call   801020a0 <namei>
801056d4:	83 c4 10             	add    $0x10,%esp
801056d7:	89 c3                	mov    %eax,%ebx
801056d9:	85 c0                	test   %eax,%eax
801056db:	74 63                	je     80105740 <sys_chdir+0xa0>
801056dd:	83 ec 0c             	sub    $0xc,%esp
801056e0:	50                   	push   %eax
801056e1:	e8 9a c0 ff ff       	call   80101780 <ilock>
801056e6:	83 c4 10             	add    $0x10,%esp
801056e9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801056ee:	75 30                	jne    80105720 <sys_chdir+0x80>
801056f0:	83 ec 0c             	sub    $0xc,%esp
801056f3:	53                   	push   %ebx
801056f4:	e8 67 c1 ff ff       	call   80101860 <iunlock>
801056f9:	58                   	pop    %eax
801056fa:	ff 76 6c             	push   0x6c(%esi)
801056fd:	e8 ae c1 ff ff       	call   801018b0 <iput>
80105702:	e8 c9 d6 ff ff       	call   80102dd0 <end_op>
80105707:	89 5e 6c             	mov    %ebx,0x6c(%esi)
8010570a:	83 c4 10             	add    $0x10,%esp
8010570d:	31 c0                	xor    %eax,%eax
8010570f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105712:	5b                   	pop    %ebx
80105713:	5e                   	pop    %esi
80105714:	5d                   	pop    %ebp
80105715:	c3                   	ret    
80105716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010571d:	8d 76 00             	lea    0x0(%esi),%esi
80105720:	83 ec 0c             	sub    $0xc,%esp
80105723:	53                   	push   %ebx
80105724:	e8 e7 c2 ff ff       	call   80101a10 <iunlockput>
80105729:	e8 a2 d6 ff ff       	call   80102dd0 <end_op>
8010572e:	83 c4 10             	add    $0x10,%esp
80105731:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105736:	eb d7                	jmp    8010570f <sys_chdir+0x6f>
80105738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010573f:	90                   	nop
80105740:	e8 8b d6 ff ff       	call   80102dd0 <end_op>
80105745:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010574a:	eb c3                	jmp    8010570f <sys_chdir+0x6f>
8010574c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105750 <sys_exec>:
80105750:	55                   	push   %ebp
80105751:	89 e5                	mov    %esp,%ebp
80105753:	57                   	push   %edi
80105754:	56                   	push   %esi
80105755:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010575b:	53                   	push   %ebx
8010575c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105762:	50                   	push   %eax
80105763:	6a 00                	push   $0x0
80105765:	e8 f6 f4 ff ff       	call   80104c60 <argstr>
8010576a:	83 c4 10             	add    $0x10,%esp
8010576d:	85 c0                	test   %eax,%eax
8010576f:	0f 88 87 00 00 00    	js     801057fc <sys_exec+0xac>
80105775:	83 ec 08             	sub    $0x8,%esp
80105778:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010577e:	50                   	push   %eax
8010577f:	6a 01                	push   $0x1
80105781:	e8 1a f4 ff ff       	call   80104ba0 <argint>
80105786:	83 c4 10             	add    $0x10,%esp
80105789:	85 c0                	test   %eax,%eax
8010578b:	78 6f                	js     801057fc <sys_exec+0xac>
8010578d:	83 ec 04             	sub    $0x4,%esp
80105790:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105796:	31 db                	xor    %ebx,%ebx
80105798:	68 80 00 00 00       	push   $0x80
8010579d:	6a 00                	push   $0x0
8010579f:	56                   	push   %esi
801057a0:	e8 3b f1 ff ff       	call   801048e0 <memset>
801057a5:	83 c4 10             	add    $0x10,%esp
801057a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801057af:	90                   	nop
801057b0:	83 ec 08             	sub    $0x8,%esp
801057b3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
801057b9:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
801057c0:	50                   	push   %eax
801057c1:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801057c7:	01 f8                	add    %edi,%eax
801057c9:	50                   	push   %eax
801057ca:	e8 41 f3 ff ff       	call   80104b10 <fetchint>
801057cf:	83 c4 10             	add    $0x10,%esp
801057d2:	85 c0                	test   %eax,%eax
801057d4:	78 26                	js     801057fc <sys_exec+0xac>
801057d6:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801057dc:	85 c0                	test   %eax,%eax
801057de:	74 30                	je     80105810 <sys_exec+0xc0>
801057e0:	83 ec 08             	sub    $0x8,%esp
801057e3:	8d 14 3e             	lea    (%esi,%edi,1),%edx
801057e6:	52                   	push   %edx
801057e7:	50                   	push   %eax
801057e8:	e8 63 f3 ff ff       	call   80104b50 <fetchstr>
801057ed:	83 c4 10             	add    $0x10,%esp
801057f0:	85 c0                	test   %eax,%eax
801057f2:	78 08                	js     801057fc <sys_exec+0xac>
801057f4:	83 c3 01             	add    $0x1,%ebx
801057f7:	83 fb 20             	cmp    $0x20,%ebx
801057fa:	75 b4                	jne    801057b0 <sys_exec+0x60>
801057fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801057ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105804:	5b                   	pop    %ebx
80105805:	5e                   	pop    %esi
80105806:	5f                   	pop    %edi
80105807:	5d                   	pop    %ebp
80105808:	c3                   	ret    
80105809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105810:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105817:	00 00 00 00 
8010581b:	83 ec 08             	sub    $0x8,%esp
8010581e:	56                   	push   %esi
8010581f:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
80105825:	e8 86 b2 ff ff       	call   80100ab0 <exec>
8010582a:	83 c4 10             	add    $0x10,%esp
8010582d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105830:	5b                   	pop    %ebx
80105831:	5e                   	pop    %esi
80105832:	5f                   	pop    %edi
80105833:	5d                   	pop    %ebp
80105834:	c3                   	ret    
80105835:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010583c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105840 <sys_pipe>:
80105840:	55                   	push   %ebp
80105841:	89 e5                	mov    %esp,%ebp
80105843:	57                   	push   %edi
80105844:	56                   	push   %esi
80105845:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105848:	53                   	push   %ebx
80105849:	83 ec 20             	sub    $0x20,%esp
8010584c:	6a 08                	push   $0x8
8010584e:	50                   	push   %eax
8010584f:	6a 00                	push   $0x0
80105851:	e8 9a f3 ff ff       	call   80104bf0 <argptr>
80105856:	83 c4 10             	add    $0x10,%esp
80105859:	85 c0                	test   %eax,%eax
8010585b:	78 4a                	js     801058a7 <sys_pipe+0x67>
8010585d:	83 ec 08             	sub    $0x8,%esp
80105860:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105863:	50                   	push   %eax
80105864:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105867:	50                   	push   %eax
80105868:	e8 c3 db ff ff       	call   80103430 <pipealloc>
8010586d:	83 c4 10             	add    $0x10,%esp
80105870:	85 c0                	test   %eax,%eax
80105872:	78 33                	js     801058a7 <sys_pipe+0x67>
80105874:	8b 7d e0             	mov    -0x20(%ebp),%edi
80105877:	31 db                	xor    %ebx,%ebx
80105879:	e8 f2 e0 ff ff       	call   80103970 <myproc>
8010587e:	66 90                	xchg   %ax,%ax
80105880:	8b 74 98 2c          	mov    0x2c(%eax,%ebx,4),%esi
80105884:	85 f6                	test   %esi,%esi
80105886:	74 28                	je     801058b0 <sys_pipe+0x70>
80105888:	83 c3 01             	add    $0x1,%ebx
8010588b:	83 fb 10             	cmp    $0x10,%ebx
8010588e:	75 f0                	jne    80105880 <sys_pipe+0x40>
80105890:	83 ec 0c             	sub    $0xc,%esp
80105893:	ff 75 e0             	push   -0x20(%ebp)
80105896:	e8 55 b6 ff ff       	call   80100ef0 <fileclose>
8010589b:	58                   	pop    %eax
8010589c:	ff 75 e4             	push   -0x1c(%ebp)
8010589f:	e8 4c b6 ff ff       	call   80100ef0 <fileclose>
801058a4:	83 c4 10             	add    $0x10,%esp
801058a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058ac:	eb 53                	jmp    80105901 <sys_pipe+0xc1>
801058ae:	66 90                	xchg   %ax,%ax
801058b0:	8d 73 08             	lea    0x8(%ebx),%esi
801058b3:	89 7c b0 0c          	mov    %edi,0xc(%eax,%esi,4)
801058b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801058ba:	e8 b1 e0 ff ff       	call   80103970 <myproc>
801058bf:	31 d2                	xor    %edx,%edx
801058c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058c8:	8b 4c 90 2c          	mov    0x2c(%eax,%edx,4),%ecx
801058cc:	85 c9                	test   %ecx,%ecx
801058ce:	74 20                	je     801058f0 <sys_pipe+0xb0>
801058d0:	83 c2 01             	add    $0x1,%edx
801058d3:	83 fa 10             	cmp    $0x10,%edx
801058d6:	75 f0                	jne    801058c8 <sys_pipe+0x88>
801058d8:	e8 93 e0 ff ff       	call   80103970 <myproc>
801058dd:	c7 44 b0 0c 00 00 00 	movl   $0x0,0xc(%eax,%esi,4)
801058e4:	00 
801058e5:	eb a9                	jmp    80105890 <sys_pipe+0x50>
801058e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058ee:	66 90                	xchg   %ax,%ax
801058f0:	89 7c 90 2c          	mov    %edi,0x2c(%eax,%edx,4)
801058f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058f7:	89 18                	mov    %ebx,(%eax)
801058f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058fc:	89 50 04             	mov    %edx,0x4(%eax)
801058ff:	31 c0                	xor    %eax,%eax
80105901:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105904:	5b                   	pop    %ebx
80105905:	5e                   	pop    %esi
80105906:	5f                   	pop    %edi
80105907:	5d                   	pop    %ebp
80105908:	c3                   	ret    
80105909:	66 90                	xchg   %ax,%ax
8010590b:	66 90                	xchg   %ax,%ax
8010590d:	66 90                	xchg   %ax,%ax
8010590f:	90                   	nop

80105910 <sys_fork>:
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105910:	e9 fb e1 ff ff       	jmp    80103b10 <fork>
80105915:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010591c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105920 <sys_exit>:
}

int
sys_exit(void)
{
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
80105923:	83 ec 08             	sub    $0x8,%esp
  exit();
80105926:	e8 a5 e5 ff ff       	call   80103ed0 <exit>
  return 0;  // not reached
}
8010592b:	31 c0                	xor    %eax,%eax
8010592d:	c9                   	leave  
8010592e:	c3                   	ret    
8010592f:	90                   	nop

80105930 <sys_wait>:

int
sys_wait(void)
{
  return wait();
80105930:	e9 cb e6 ff ff       	jmp    80104000 <wait>
80105935:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010593c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105940 <sys_kill>:
}

int
sys_kill(void)
{
80105940:	55                   	push   %ebp
80105941:	89 e5                	mov    %esp,%ebp
80105943:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105946:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105949:	50                   	push   %eax
8010594a:	6a 00                	push   $0x0
8010594c:	e8 4f f2 ff ff       	call   80104ba0 <argint>
80105951:	83 c4 10             	add    $0x10,%esp
80105954:	85 c0                	test   %eax,%eax
80105956:	78 18                	js     80105970 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105958:	83 ec 0c             	sub    $0xc,%esp
8010595b:	ff 75 f4             	push   -0xc(%ebp)
8010595e:	e8 7d ea ff ff       	call   801043e0 <kill>
80105963:	83 c4 10             	add    $0x10,%esp
}
80105966:	c9                   	leave  
80105967:	c3                   	ret    
80105968:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010596f:	90                   	nop
80105970:	c9                   	leave  
    return -1;
80105971:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105976:	c3                   	ret    
80105977:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010597e:	66 90                	xchg   %ax,%ax

80105980 <sys_getpid>:

int
sys_getpid(void)
{
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
80105983:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105986:	e8 e5 df ff ff       	call   80103970 <myproc>
8010598b:	8b 40 14             	mov    0x14(%eax),%eax
}
8010598e:	c9                   	leave  
8010598f:	c3                   	ret    

80105990 <sys_sbrk>:

int
sys_sbrk(void)
{
80105990:	55                   	push   %ebp
80105991:	89 e5                	mov    %esp,%ebp
80105993:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105994:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105997:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010599a:	50                   	push   %eax
8010599b:	6a 00                	push   $0x0
8010599d:	e8 fe f1 ff ff       	call   80104ba0 <argint>
801059a2:	83 c4 10             	add    $0x10,%esp
801059a5:	85 c0                	test   %eax,%eax
801059a7:	78 27                	js     801059d0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801059a9:	e8 c2 df ff ff       	call   80103970 <myproc>
  if(growproc(n) < 0)
801059ae:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801059b1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801059b3:	ff 75 f4             	push   -0xc(%ebp)
801059b6:	e8 d5 e0 ff ff       	call   80103a90 <growproc>
801059bb:	83 c4 10             	add    $0x10,%esp
801059be:	85 c0                	test   %eax,%eax
801059c0:	78 0e                	js     801059d0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801059c2:	89 d8                	mov    %ebx,%eax
801059c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059c7:	c9                   	leave  
801059c8:	c3                   	ret    
801059c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801059d0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801059d5:	eb eb                	jmp    801059c2 <sys_sbrk+0x32>
801059d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801059de:	66 90                	xchg   %ax,%ax

801059e0 <sys_sleep>:

int
sys_sleep(void)
{
801059e0:	55                   	push   %ebp
801059e1:	89 e5                	mov    %esp,%ebp
801059e3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801059e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801059e7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801059ea:	50                   	push   %eax
801059eb:	6a 00                	push   $0x0
801059ed:	e8 ae f1 ff ff       	call   80104ba0 <argint>
801059f2:	83 c4 10             	add    $0x10,%esp
801059f5:	85 c0                	test   %eax,%eax
801059f7:	0f 88 8a 00 00 00    	js     80105a87 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801059fd:	83 ec 0c             	sub    $0xc,%esp
80105a00:	68 80 3d 11 80       	push   $0x80113d80
80105a05:	e8 16 ee ff ff       	call   80104820 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105a0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
80105a0d:	8b 1d 60 3d 11 80    	mov    0x80113d60,%ebx
  while(ticks - ticks0 < n){
80105a13:	83 c4 10             	add    $0x10,%esp
80105a16:	85 d2                	test   %edx,%edx
80105a18:	75 27                	jne    80105a41 <sys_sleep+0x61>
80105a1a:	eb 54                	jmp    80105a70 <sys_sleep+0x90>
80105a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105a20:	83 ec 08             	sub    $0x8,%esp
80105a23:	68 80 3d 11 80       	push   $0x80113d80
80105a28:	68 60 3d 11 80       	push   $0x80113d60
80105a2d:	e8 8e e8 ff ff       	call   801042c0 <sleep>
  while(ticks - ticks0 < n){
80105a32:	a1 60 3d 11 80       	mov    0x80113d60,%eax
80105a37:	83 c4 10             	add    $0x10,%esp
80105a3a:	29 d8                	sub    %ebx,%eax
80105a3c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105a3f:	73 2f                	jae    80105a70 <sys_sleep+0x90>
    if(myproc()->killed){
80105a41:	e8 2a df ff ff       	call   80103970 <myproc>
80105a46:	8b 40 28             	mov    0x28(%eax),%eax
80105a49:	85 c0                	test   %eax,%eax
80105a4b:	74 d3                	je     80105a20 <sys_sleep+0x40>
      release(&tickslock);
80105a4d:	83 ec 0c             	sub    $0xc,%esp
80105a50:	68 80 3d 11 80       	push   $0x80113d80
80105a55:	e8 66 ed ff ff       	call   801047c0 <release>
  }
  release(&tickslock);
  return 0;
}
80105a5a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return -1;
80105a5d:	83 c4 10             	add    $0x10,%esp
80105a60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a65:	c9                   	leave  
80105a66:	c3                   	ret    
80105a67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a6e:	66 90                	xchg   %ax,%ax
  release(&tickslock);
80105a70:	83 ec 0c             	sub    $0xc,%esp
80105a73:	68 80 3d 11 80       	push   $0x80113d80
80105a78:	e8 43 ed ff ff       	call   801047c0 <release>
  return 0;
80105a7d:	83 c4 10             	add    $0x10,%esp
80105a80:	31 c0                	xor    %eax,%eax
}
80105a82:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a85:	c9                   	leave  
80105a86:	c3                   	ret    
    return -1;
80105a87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a8c:	eb f4                	jmp    80105a82 <sys_sleep+0xa2>
80105a8e:	66 90                	xchg   %ax,%ax

80105a90 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	53                   	push   %ebx
80105a94:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105a97:	68 80 3d 11 80       	push   $0x80113d80
80105a9c:	e8 7f ed ff ff       	call   80104820 <acquire>
  xticks = ticks;
80105aa1:	8b 1d 60 3d 11 80    	mov    0x80113d60,%ebx
  release(&tickslock);
80105aa7:	c7 04 24 80 3d 11 80 	movl   $0x80113d80,(%esp)
80105aae:	e8 0d ed ff ff       	call   801047c0 <release>
  return xticks;
}
80105ab3:	89 d8                	mov    %ebx,%eax
80105ab5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105ab8:	c9                   	leave  
80105ab9:	c3                   	ret    
80105aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105ac0 <sys_clone>:

int
sys_clone(void)
{
80105ac0:	55                   	push   %ebp
80105ac1:	89 e5                	mov    %esp,%ebp
80105ac3:	83 ec 1c             	sub    $0x1c,%esp
  //check for alignment
  void (*fun_ptr)(void*,void*);
  void * arg1;
  void* arg2;
  void* stack;
  if (argptr(0,(void*)&fun_ptr, sizeof(void*))< 0){
80105ac6:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105ac9:	6a 04                	push   $0x4
80105acb:	50                   	push   %eax
80105acc:	6a 00                	push   $0x0
80105ace:	e8 1d f1 ff ff       	call   80104bf0 <argptr>
80105ad3:	83 c4 10             	add    $0x10,%esp
80105ad6:	85 c0                	test   %eax,%eax
80105ad8:	78 5e                	js     80105b38 <sys_clone+0x78>
    return -1;
  }
  if (argptr(0,(void*)&arg1, sizeof(void*))< 0){
80105ada:	83 ec 04             	sub    $0x4,%esp
80105add:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105ae0:	6a 04                	push   $0x4
80105ae2:	50                   	push   %eax
80105ae3:	6a 00                	push   $0x0
80105ae5:	e8 06 f1 ff ff       	call   80104bf0 <argptr>
80105aea:	83 c4 10             	add    $0x10,%esp
80105aed:	85 c0                	test   %eax,%eax
80105aef:	78 47                	js     80105b38 <sys_clone+0x78>
    return -1;
  }
  if (argptr(0,(void*)&arg2, sizeof(void*))< 0){
80105af1:	83 ec 04             	sub    $0x4,%esp
80105af4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105af7:	6a 04                	push   $0x4
80105af9:	50                   	push   %eax
80105afa:	6a 00                	push   $0x0
80105afc:	e8 ef f0 ff ff       	call   80104bf0 <argptr>
80105b01:	83 c4 10             	add    $0x10,%esp
80105b04:	85 c0                	test   %eax,%eax
80105b06:	78 30                	js     80105b38 <sys_clone+0x78>
    return -1;
  }
  if (argptr(0,(void*)&stack, sizeof(void*))< 0){
80105b08:	83 ec 04             	sub    $0x4,%esp
80105b0b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b0e:	6a 04                	push   $0x4
80105b10:	50                   	push   %eax
80105b11:	6a 00                	push   $0x0
80105b13:	e8 d8 f0 ff ff       	call   80104bf0 <argptr>
80105b18:	83 c4 10             	add    $0x10,%esp
80105b1b:	85 c0                	test   %eax,%eax
80105b1d:	78 19                	js     80105b38 <sys_clone+0x78>
    return -1;
  }
  return clone(fun_ptr, arg1, arg2, stack);
80105b1f:	ff 75 f4             	push   -0xc(%ebp)
80105b22:	ff 75 f0             	push   -0x10(%ebp)
80105b25:	ff 75 ec             	push   -0x14(%ebp)
80105b28:	ff 75 e8             	push   -0x18(%ebp)
80105b2b:	e8 00 e1 ff ff       	call   80103c30 <clone>
80105b30:	83 c4 10             	add    $0x10,%esp
}
80105b33:	c9                   	leave  
80105b34:	c3                   	ret    
80105b35:	8d 76 00             	lea    0x0(%esi),%esi
80105b38:	c9                   	leave  
    return -1;
80105b39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b3e:	c3                   	ret    
80105b3f:	90                   	nop

80105b40 <sys_join>:
int
sys_join(void)
{
80105b40:	55                   	push   %ebp
80105b41:	89 e5                	mov    %esp,%ebp
80105b43:	83 ec 14             	sub    $0x14,%esp
  return join(0);
80105b46:	6a 00                	push   $0x0
80105b48:	e8 f3 e5 ff ff       	call   80104140 <join>
  if(argptr(0, (void*)&stack, sizeof(void*)) < 0){
    return -1;
  }

  return join(stack);
80105b4d:	c9                   	leave  
80105b4e:	c3                   	ret    

80105b4f <alltraps>:
80105b4f:	1e                   	push   %ds
80105b50:	06                   	push   %es
80105b51:	0f a0                	push   %fs
80105b53:	0f a8                	push   %gs
80105b55:	60                   	pusha  
80105b56:	66 b8 10 00          	mov    $0x10,%ax
80105b5a:	8e d8                	mov    %eax,%ds
80105b5c:	8e c0                	mov    %eax,%es
80105b5e:	54                   	push   %esp
80105b5f:	e8 cc 00 00 00       	call   80105c30 <trap>
80105b64:	83 c4 04             	add    $0x4,%esp

80105b67 <trapret>:
80105b67:	61                   	popa   
80105b68:	0f a9                	pop    %gs
80105b6a:	0f a1                	pop    %fs
80105b6c:	07                   	pop    %es
80105b6d:	1f                   	pop    %ds
80105b6e:	83 c4 08             	add    $0x8,%esp
80105b71:	cf                   	iret   
80105b72:	66 90                	xchg   %ax,%ax
80105b74:	66 90                	xchg   %ax,%ax
80105b76:	66 90                	xchg   %ax,%ax
80105b78:	66 90                	xchg   %ax,%ax
80105b7a:	66 90                	xchg   %ax,%ax
80105b7c:	66 90                	xchg   %ax,%ax
80105b7e:	66 90                	xchg   %ax,%ax

80105b80 <tvinit>:
80105b80:	55                   	push   %ebp
80105b81:	31 c0                	xor    %eax,%eax
80105b83:	89 e5                	mov    %esp,%ebp
80105b85:	83 ec 08             	sub    $0x8,%esp
80105b88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b8f:	90                   	nop
80105b90:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105b97:	c7 04 c5 c2 3d 11 80 	movl   $0x8e000008,-0x7feec23e(,%eax,8)
80105b9e:	08 00 00 8e 
80105ba2:	66 89 14 c5 c0 3d 11 	mov    %dx,-0x7feec240(,%eax,8)
80105ba9:	80 
80105baa:	c1 ea 10             	shr    $0x10,%edx
80105bad:	66 89 14 c5 c6 3d 11 	mov    %dx,-0x7feec23a(,%eax,8)
80105bb4:	80 
80105bb5:	83 c0 01             	add    $0x1,%eax
80105bb8:	3d 00 01 00 00       	cmp    $0x100,%eax
80105bbd:	75 d1                	jne    80105b90 <tvinit+0x10>
80105bbf:	83 ec 08             	sub    $0x8,%esp
80105bc2:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105bc7:	c7 05 c2 3f 11 80 08 	movl   $0xef000008,0x80113fc2
80105bce:	00 00 ef 
80105bd1:	68 41 7c 10 80       	push   $0x80107c41
80105bd6:	68 80 3d 11 80       	push   $0x80113d80
80105bdb:	66 a3 c0 3f 11 80    	mov    %ax,0x80113fc0
80105be1:	c1 e8 10             	shr    $0x10,%eax
80105be4:	66 a3 c6 3f 11 80    	mov    %ax,0x80113fc6
80105bea:	e8 61 ea ff ff       	call   80104650 <initlock>
80105bef:	83 c4 10             	add    $0x10,%esp
80105bf2:	c9                   	leave  
80105bf3:	c3                   	ret    
80105bf4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bff:	90                   	nop

80105c00 <idtinit>:
80105c00:	55                   	push   %ebp
80105c01:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105c06:	89 e5                	mov    %esp,%ebp
80105c08:	83 ec 10             	sub    $0x10,%esp
80105c0b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
80105c0f:	b8 c0 3d 11 80       	mov    $0x80113dc0,%eax
80105c14:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105c18:	c1 e8 10             	shr    $0x10,%eax
80105c1b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
80105c1f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105c22:	0f 01 18             	lidtl  (%eax)
80105c25:	c9                   	leave  
80105c26:	c3                   	ret    
80105c27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c2e:	66 90                	xchg   %ax,%ax

80105c30 <trap>:
80105c30:	55                   	push   %ebp
80105c31:	89 e5                	mov    %esp,%ebp
80105c33:	57                   	push   %edi
80105c34:	56                   	push   %esi
80105c35:	53                   	push   %ebx
80105c36:	83 ec 1c             	sub    $0x1c,%esp
80105c39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105c3c:	8b 43 30             	mov    0x30(%ebx),%eax
80105c3f:	83 f8 40             	cmp    $0x40,%eax
80105c42:	0f 84 68 01 00 00    	je     80105db0 <trap+0x180>
80105c48:	83 e8 20             	sub    $0x20,%eax
80105c4b:	83 f8 1f             	cmp    $0x1f,%eax
80105c4e:	0f 87 8c 00 00 00    	ja     80105ce0 <trap+0xb0>
80105c54:	ff 24 85 e8 7c 10 80 	jmp    *-0x7fef8318(,%eax,4)
80105c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105c5f:	90                   	nop
80105c60:	e8 db c5 ff ff       	call   80102240 <ideintr>
80105c65:	e8 a6 cc ff ff       	call   80102910 <lapiceoi>
80105c6a:	e8 01 dd ff ff       	call   80103970 <myproc>
80105c6f:	85 c0                	test   %eax,%eax
80105c71:	74 1d                	je     80105c90 <trap+0x60>
80105c73:	e8 f8 dc ff ff       	call   80103970 <myproc>
80105c78:	8b 50 28             	mov    0x28(%eax),%edx
80105c7b:	85 d2                	test   %edx,%edx
80105c7d:	74 11                	je     80105c90 <trap+0x60>
80105c7f:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105c83:	83 e0 03             	and    $0x3,%eax
80105c86:	66 83 f8 03          	cmp    $0x3,%ax
80105c8a:	0f 84 e8 01 00 00    	je     80105e78 <trap+0x248>
80105c90:	e8 db dc ff ff       	call   80103970 <myproc>
80105c95:	85 c0                	test   %eax,%eax
80105c97:	74 0f                	je     80105ca8 <trap+0x78>
80105c99:	e8 d2 dc ff ff       	call   80103970 <myproc>
80105c9e:	83 78 10 04          	cmpl   $0x4,0x10(%eax)
80105ca2:	0f 84 b8 00 00 00    	je     80105d60 <trap+0x130>
80105ca8:	e8 c3 dc ff ff       	call   80103970 <myproc>
80105cad:	85 c0                	test   %eax,%eax
80105caf:	74 1d                	je     80105cce <trap+0x9e>
80105cb1:	e8 ba dc ff ff       	call   80103970 <myproc>
80105cb6:	8b 40 28             	mov    0x28(%eax),%eax
80105cb9:	85 c0                	test   %eax,%eax
80105cbb:	74 11                	je     80105cce <trap+0x9e>
80105cbd:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105cc1:	83 e0 03             	and    $0x3,%eax
80105cc4:	66 83 f8 03          	cmp    $0x3,%ax
80105cc8:	0f 84 0f 01 00 00    	je     80105ddd <trap+0x1ad>
80105cce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cd1:	5b                   	pop    %ebx
80105cd2:	5e                   	pop    %esi
80105cd3:	5f                   	pop    %edi
80105cd4:	5d                   	pop    %ebp
80105cd5:	c3                   	ret    
80105cd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105cdd:	8d 76 00             	lea    0x0(%esi),%esi
80105ce0:	e8 8b dc ff ff       	call   80103970 <myproc>
80105ce5:	8b 7b 38             	mov    0x38(%ebx),%edi
80105ce8:	85 c0                	test   %eax,%eax
80105cea:	0f 84 a2 01 00 00    	je     80105e92 <trap+0x262>
80105cf0:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105cf4:	0f 84 98 01 00 00    	je     80105e92 <trap+0x262>
80105cfa:	0f 20 d1             	mov    %cr2,%ecx
80105cfd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105d00:	e8 4b dc ff ff       	call   80103950 <cpuid>
80105d05:	8b 73 30             	mov    0x30(%ebx),%esi
80105d08:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105d0b:	8b 43 34             	mov    0x34(%ebx),%eax
80105d0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105d11:	e8 5a dc ff ff       	call   80103970 <myproc>
80105d16:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105d19:	e8 52 dc ff ff       	call   80103970 <myproc>
80105d1e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105d21:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105d24:	51                   	push   %ecx
80105d25:	57                   	push   %edi
80105d26:	52                   	push   %edx
80105d27:	ff 75 e4             	push   -0x1c(%ebp)
80105d2a:	56                   	push   %esi
80105d2b:	8b 75 e0             	mov    -0x20(%ebp),%esi
80105d2e:	83 c6 70             	add    $0x70,%esi
80105d31:	56                   	push   %esi
80105d32:	ff 70 14             	push   0x14(%eax)
80105d35:	68 a4 7c 10 80       	push   $0x80107ca4
80105d3a:	e8 61 a9 ff ff       	call   801006a0 <cprintf>
80105d3f:	83 c4 20             	add    $0x20,%esp
80105d42:	e8 29 dc ff ff       	call   80103970 <myproc>
80105d47:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
80105d4e:	e8 1d dc ff ff       	call   80103970 <myproc>
80105d53:	85 c0                	test   %eax,%eax
80105d55:	0f 85 18 ff ff ff    	jne    80105c73 <trap+0x43>
80105d5b:	e9 30 ff ff ff       	jmp    80105c90 <trap+0x60>
80105d60:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105d64:	0f 85 3e ff ff ff    	jne    80105ca8 <trap+0x78>
80105d6a:	e8 01 e5 ff ff       	call   80104270 <yield>
80105d6f:	e9 34 ff ff ff       	jmp    80105ca8 <trap+0x78>
80105d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d78:	8b 7b 38             	mov    0x38(%ebx),%edi
80105d7b:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105d7f:	e8 cc db ff ff       	call   80103950 <cpuid>
80105d84:	57                   	push   %edi
80105d85:	56                   	push   %esi
80105d86:	50                   	push   %eax
80105d87:	68 4c 7c 10 80       	push   $0x80107c4c
80105d8c:	e8 0f a9 ff ff       	call   801006a0 <cprintf>
80105d91:	e8 7a cb ff ff       	call   80102910 <lapiceoi>
80105d96:	83 c4 10             	add    $0x10,%esp
80105d99:	e8 d2 db ff ff       	call   80103970 <myproc>
80105d9e:	85 c0                	test   %eax,%eax
80105da0:	0f 85 cd fe ff ff    	jne    80105c73 <trap+0x43>
80105da6:	e9 e5 fe ff ff       	jmp    80105c90 <trap+0x60>
80105dab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105daf:	90                   	nop
80105db0:	e8 bb db ff ff       	call   80103970 <myproc>
80105db5:	8b 70 28             	mov    0x28(%eax),%esi
80105db8:	85 f6                	test   %esi,%esi
80105dba:	0f 85 c8 00 00 00    	jne    80105e88 <trap+0x258>
80105dc0:	e8 ab db ff ff       	call   80103970 <myproc>
80105dc5:	89 58 1c             	mov    %ebx,0x1c(%eax)
80105dc8:	e8 13 ef ff ff       	call   80104ce0 <syscall>
80105dcd:	e8 9e db ff ff       	call   80103970 <myproc>
80105dd2:	8b 48 28             	mov    0x28(%eax),%ecx
80105dd5:	85 c9                	test   %ecx,%ecx
80105dd7:	0f 84 f1 fe ff ff    	je     80105cce <trap+0x9e>
80105ddd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105de0:	5b                   	pop    %ebx
80105de1:	5e                   	pop    %esi
80105de2:	5f                   	pop    %edi
80105de3:	5d                   	pop    %ebp
80105de4:	e9 e7 e0 ff ff       	jmp    80103ed0 <exit>
80105de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105df0:	e8 3b 02 00 00       	call   80106030 <uartintr>
80105df5:	e8 16 cb ff ff       	call   80102910 <lapiceoi>
80105dfa:	e8 71 db ff ff       	call   80103970 <myproc>
80105dff:	85 c0                	test   %eax,%eax
80105e01:	0f 85 6c fe ff ff    	jne    80105c73 <trap+0x43>
80105e07:	e9 84 fe ff ff       	jmp    80105c90 <trap+0x60>
80105e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105e10:	e8 bb c9 ff ff       	call   801027d0 <kbdintr>
80105e15:	e8 f6 ca ff ff       	call   80102910 <lapiceoi>
80105e1a:	e8 51 db ff ff       	call   80103970 <myproc>
80105e1f:	85 c0                	test   %eax,%eax
80105e21:	0f 85 4c fe ff ff    	jne    80105c73 <trap+0x43>
80105e27:	e9 64 fe ff ff       	jmp    80105c90 <trap+0x60>
80105e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105e30:	e8 1b db ff ff       	call   80103950 <cpuid>
80105e35:	85 c0                	test   %eax,%eax
80105e37:	0f 85 28 fe ff ff    	jne    80105c65 <trap+0x35>
80105e3d:	83 ec 0c             	sub    $0xc,%esp
80105e40:	68 80 3d 11 80       	push   $0x80113d80
80105e45:	e8 d6 e9 ff ff       	call   80104820 <acquire>
80105e4a:	c7 04 24 60 3d 11 80 	movl   $0x80113d60,(%esp)
80105e51:	83 05 60 3d 11 80 01 	addl   $0x1,0x80113d60
80105e58:	e8 23 e5 ff ff       	call   80104380 <wakeup>
80105e5d:	c7 04 24 80 3d 11 80 	movl   $0x80113d80,(%esp)
80105e64:	e8 57 e9 ff ff       	call   801047c0 <release>
80105e69:	83 c4 10             	add    $0x10,%esp
80105e6c:	e9 f4 fd ff ff       	jmp    80105c65 <trap+0x35>
80105e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e78:	e8 53 e0 ff ff       	call   80103ed0 <exit>
80105e7d:	e9 0e fe ff ff       	jmp    80105c90 <trap+0x60>
80105e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105e88:	e8 43 e0 ff ff       	call   80103ed0 <exit>
80105e8d:	e9 2e ff ff ff       	jmp    80105dc0 <trap+0x190>
80105e92:	0f 20 d6             	mov    %cr2,%esi
80105e95:	e8 b6 da ff ff       	call   80103950 <cpuid>
80105e9a:	83 ec 0c             	sub    $0xc,%esp
80105e9d:	56                   	push   %esi
80105e9e:	57                   	push   %edi
80105e9f:	50                   	push   %eax
80105ea0:	ff 73 30             	push   0x30(%ebx)
80105ea3:	68 70 7c 10 80       	push   $0x80107c70
80105ea8:	e8 f3 a7 ff ff       	call   801006a0 <cprintf>
80105ead:	83 c4 14             	add    $0x14,%esp
80105eb0:	68 46 7c 10 80       	push   $0x80107c46
80105eb5:	e8 c6 a4 ff ff       	call   80100380 <panic>
80105eba:	66 90                	xchg   %ax,%ax
80105ebc:	66 90                	xchg   %ax,%ax
80105ebe:	66 90                	xchg   %ax,%ax

80105ec0 <uartgetc>:
80105ec0:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105ec5:	85 c0                	test   %eax,%eax
80105ec7:	74 17                	je     80105ee0 <uartgetc+0x20>
80105ec9:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ece:	ec                   	in     (%dx),%al
80105ecf:	a8 01                	test   $0x1,%al
80105ed1:	74 0d                	je     80105ee0 <uartgetc+0x20>
80105ed3:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ed8:	ec                   	in     (%dx),%al
80105ed9:	0f b6 c0             	movzbl %al,%eax
80105edc:	c3                   	ret    
80105edd:	8d 76 00             	lea    0x0(%esi),%esi
80105ee0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ee5:	c3                   	ret    
80105ee6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105eed:	8d 76 00             	lea    0x0(%esi),%esi

80105ef0 <uartinit>:
80105ef0:	55                   	push   %ebp
80105ef1:	31 c9                	xor    %ecx,%ecx
80105ef3:	89 c8                	mov    %ecx,%eax
80105ef5:	89 e5                	mov    %esp,%ebp
80105ef7:	57                   	push   %edi
80105ef8:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105efd:	56                   	push   %esi
80105efe:	89 fa                	mov    %edi,%edx
80105f00:	53                   	push   %ebx
80105f01:	83 ec 1c             	sub    $0x1c,%esp
80105f04:	ee                   	out    %al,(%dx)
80105f05:	be fb 03 00 00       	mov    $0x3fb,%esi
80105f0a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105f0f:	89 f2                	mov    %esi,%edx
80105f11:	ee                   	out    %al,(%dx)
80105f12:	b8 0c 00 00 00       	mov    $0xc,%eax
80105f17:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f1c:	ee                   	out    %al,(%dx)
80105f1d:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105f22:	89 c8                	mov    %ecx,%eax
80105f24:	89 da                	mov    %ebx,%edx
80105f26:	ee                   	out    %al,(%dx)
80105f27:	b8 03 00 00 00       	mov    $0x3,%eax
80105f2c:	89 f2                	mov    %esi,%edx
80105f2e:	ee                   	out    %al,(%dx)
80105f2f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105f34:	89 c8                	mov    %ecx,%eax
80105f36:	ee                   	out    %al,(%dx)
80105f37:	b8 01 00 00 00       	mov    $0x1,%eax
80105f3c:	89 da                	mov    %ebx,%edx
80105f3e:	ee                   	out    %al,(%dx)
80105f3f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105f44:	ec                   	in     (%dx),%al
80105f45:	3c ff                	cmp    $0xff,%al
80105f47:	74 78                	je     80105fc1 <uartinit+0xd1>
80105f49:	c7 05 c0 45 11 80 01 	movl   $0x1,0x801145c0
80105f50:	00 00 00 
80105f53:	89 fa                	mov    %edi,%edx
80105f55:	ec                   	in     (%dx),%al
80105f56:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f5b:	ec                   	in     (%dx),%al
80105f5c:	83 ec 08             	sub    $0x8,%esp
80105f5f:	bf 68 7d 10 80       	mov    $0x80107d68,%edi
80105f64:	be fd 03 00 00       	mov    $0x3fd,%esi
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 04                	push   $0x4
80105f6d:	e8 0e c5 ff ff       	call   80102480 <ioapicenable>
80105f72:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
80105f76:	83 c4 10             	add    $0x10,%esp
80105f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105f80:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105f85:	bb 80 00 00 00       	mov    $0x80,%ebx
80105f8a:	85 c0                	test   %eax,%eax
80105f8c:	75 14                	jne    80105fa2 <uartinit+0xb2>
80105f8e:	eb 23                	jmp    80105fb3 <uartinit+0xc3>
80105f90:	83 ec 0c             	sub    $0xc,%esp
80105f93:	6a 0a                	push   $0xa
80105f95:	e8 96 c9 ff ff       	call   80102930 <microdelay>
80105f9a:	83 c4 10             	add    $0x10,%esp
80105f9d:	83 eb 01             	sub    $0x1,%ebx
80105fa0:	74 07                	je     80105fa9 <uartinit+0xb9>
80105fa2:	89 f2                	mov    %esi,%edx
80105fa4:	ec                   	in     (%dx),%al
80105fa5:	a8 20                	test   $0x20,%al
80105fa7:	74 e7                	je     80105f90 <uartinit+0xa0>
80105fa9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
80105fad:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105fb2:	ee                   	out    %al,(%dx)
80105fb3:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80105fb7:	83 c7 01             	add    $0x1,%edi
80105fba:	88 45 e7             	mov    %al,-0x19(%ebp)
80105fbd:	84 c0                	test   %al,%al
80105fbf:	75 bf                	jne    80105f80 <uartinit+0x90>
80105fc1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105fc4:	5b                   	pop    %ebx
80105fc5:	5e                   	pop    %esi
80105fc6:	5f                   	pop    %edi
80105fc7:	5d                   	pop    %ebp
80105fc8:	c3                   	ret    
80105fc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105fd0 <uartputc>:
80105fd0:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105fd5:	85 c0                	test   %eax,%eax
80105fd7:	74 47                	je     80106020 <uartputc+0x50>
80105fd9:	55                   	push   %ebp
80105fda:	89 e5                	mov    %esp,%ebp
80105fdc:	56                   	push   %esi
80105fdd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105fe2:	53                   	push   %ebx
80105fe3:	bb 80 00 00 00       	mov    $0x80,%ebx
80105fe8:	eb 18                	jmp    80106002 <uartputc+0x32>
80105fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ff0:	83 ec 0c             	sub    $0xc,%esp
80105ff3:	6a 0a                	push   $0xa
80105ff5:	e8 36 c9 ff ff       	call   80102930 <microdelay>
80105ffa:	83 c4 10             	add    $0x10,%esp
80105ffd:	83 eb 01             	sub    $0x1,%ebx
80106000:	74 07                	je     80106009 <uartputc+0x39>
80106002:	89 f2                	mov    %esi,%edx
80106004:	ec                   	in     (%dx),%al
80106005:	a8 20                	test   $0x20,%al
80106007:	74 e7                	je     80105ff0 <uartputc+0x20>
80106009:	8b 45 08             	mov    0x8(%ebp),%eax
8010600c:	ba f8 03 00 00       	mov    $0x3f8,%edx
80106011:	ee                   	out    %al,(%dx)
80106012:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106015:	5b                   	pop    %ebx
80106016:	5e                   	pop    %esi
80106017:	5d                   	pop    %ebp
80106018:	c3                   	ret    
80106019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106020:	c3                   	ret    
80106021:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106028:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010602f:	90                   	nop

80106030 <uartintr>:
80106030:	55                   	push   %ebp
80106031:	89 e5                	mov    %esp,%ebp
80106033:	83 ec 14             	sub    $0x14,%esp
80106036:	68 c0 5e 10 80       	push   $0x80105ec0
8010603b:	e8 40 a8 ff ff       	call   80100880 <consoleintr>
80106040:	83 c4 10             	add    $0x10,%esp
80106043:	c9                   	leave  
80106044:	c3                   	ret    

80106045 <vector0>:
80106045:	6a 00                	push   $0x0
80106047:	6a 00                	push   $0x0
80106049:	e9 01 fb ff ff       	jmp    80105b4f <alltraps>

8010604e <vector1>:
8010604e:	6a 00                	push   $0x0
80106050:	6a 01                	push   $0x1
80106052:	e9 f8 fa ff ff       	jmp    80105b4f <alltraps>

80106057 <vector2>:
80106057:	6a 00                	push   $0x0
80106059:	6a 02                	push   $0x2
8010605b:	e9 ef fa ff ff       	jmp    80105b4f <alltraps>

80106060 <vector3>:
80106060:	6a 00                	push   $0x0
80106062:	6a 03                	push   $0x3
80106064:	e9 e6 fa ff ff       	jmp    80105b4f <alltraps>

80106069 <vector4>:
80106069:	6a 00                	push   $0x0
8010606b:	6a 04                	push   $0x4
8010606d:	e9 dd fa ff ff       	jmp    80105b4f <alltraps>

80106072 <vector5>:
80106072:	6a 00                	push   $0x0
80106074:	6a 05                	push   $0x5
80106076:	e9 d4 fa ff ff       	jmp    80105b4f <alltraps>

8010607b <vector6>:
8010607b:	6a 00                	push   $0x0
8010607d:	6a 06                	push   $0x6
8010607f:	e9 cb fa ff ff       	jmp    80105b4f <alltraps>

80106084 <vector7>:
80106084:	6a 00                	push   $0x0
80106086:	6a 07                	push   $0x7
80106088:	e9 c2 fa ff ff       	jmp    80105b4f <alltraps>

8010608d <vector8>:
8010608d:	6a 08                	push   $0x8
8010608f:	e9 bb fa ff ff       	jmp    80105b4f <alltraps>

80106094 <vector9>:
80106094:	6a 00                	push   $0x0
80106096:	6a 09                	push   $0x9
80106098:	e9 b2 fa ff ff       	jmp    80105b4f <alltraps>

8010609d <vector10>:
8010609d:	6a 0a                	push   $0xa
8010609f:	e9 ab fa ff ff       	jmp    80105b4f <alltraps>

801060a4 <vector11>:
801060a4:	6a 0b                	push   $0xb
801060a6:	e9 a4 fa ff ff       	jmp    80105b4f <alltraps>

801060ab <vector12>:
801060ab:	6a 0c                	push   $0xc
801060ad:	e9 9d fa ff ff       	jmp    80105b4f <alltraps>

801060b2 <vector13>:
801060b2:	6a 0d                	push   $0xd
801060b4:	e9 96 fa ff ff       	jmp    80105b4f <alltraps>

801060b9 <vector14>:
801060b9:	6a 0e                	push   $0xe
801060bb:	e9 8f fa ff ff       	jmp    80105b4f <alltraps>

801060c0 <vector15>:
801060c0:	6a 00                	push   $0x0
801060c2:	6a 0f                	push   $0xf
801060c4:	e9 86 fa ff ff       	jmp    80105b4f <alltraps>

801060c9 <vector16>:
801060c9:	6a 00                	push   $0x0
801060cb:	6a 10                	push   $0x10
801060cd:	e9 7d fa ff ff       	jmp    80105b4f <alltraps>

801060d2 <vector17>:
801060d2:	6a 11                	push   $0x11
801060d4:	e9 76 fa ff ff       	jmp    80105b4f <alltraps>

801060d9 <vector18>:
801060d9:	6a 00                	push   $0x0
801060db:	6a 12                	push   $0x12
801060dd:	e9 6d fa ff ff       	jmp    80105b4f <alltraps>

801060e2 <vector19>:
801060e2:	6a 00                	push   $0x0
801060e4:	6a 13                	push   $0x13
801060e6:	e9 64 fa ff ff       	jmp    80105b4f <alltraps>

801060eb <vector20>:
801060eb:	6a 00                	push   $0x0
801060ed:	6a 14                	push   $0x14
801060ef:	e9 5b fa ff ff       	jmp    80105b4f <alltraps>

801060f4 <vector21>:
801060f4:	6a 00                	push   $0x0
801060f6:	6a 15                	push   $0x15
801060f8:	e9 52 fa ff ff       	jmp    80105b4f <alltraps>

801060fd <vector22>:
801060fd:	6a 00                	push   $0x0
801060ff:	6a 16                	push   $0x16
80106101:	e9 49 fa ff ff       	jmp    80105b4f <alltraps>

80106106 <vector23>:
80106106:	6a 00                	push   $0x0
80106108:	6a 17                	push   $0x17
8010610a:	e9 40 fa ff ff       	jmp    80105b4f <alltraps>

8010610f <vector24>:
8010610f:	6a 00                	push   $0x0
80106111:	6a 18                	push   $0x18
80106113:	e9 37 fa ff ff       	jmp    80105b4f <alltraps>

80106118 <vector25>:
80106118:	6a 00                	push   $0x0
8010611a:	6a 19                	push   $0x19
8010611c:	e9 2e fa ff ff       	jmp    80105b4f <alltraps>

80106121 <vector26>:
80106121:	6a 00                	push   $0x0
80106123:	6a 1a                	push   $0x1a
80106125:	e9 25 fa ff ff       	jmp    80105b4f <alltraps>

8010612a <vector27>:
8010612a:	6a 00                	push   $0x0
8010612c:	6a 1b                	push   $0x1b
8010612e:	e9 1c fa ff ff       	jmp    80105b4f <alltraps>

80106133 <vector28>:
80106133:	6a 00                	push   $0x0
80106135:	6a 1c                	push   $0x1c
80106137:	e9 13 fa ff ff       	jmp    80105b4f <alltraps>

8010613c <vector29>:
8010613c:	6a 00                	push   $0x0
8010613e:	6a 1d                	push   $0x1d
80106140:	e9 0a fa ff ff       	jmp    80105b4f <alltraps>

80106145 <vector30>:
80106145:	6a 00                	push   $0x0
80106147:	6a 1e                	push   $0x1e
80106149:	e9 01 fa ff ff       	jmp    80105b4f <alltraps>

8010614e <vector31>:
8010614e:	6a 00                	push   $0x0
80106150:	6a 1f                	push   $0x1f
80106152:	e9 f8 f9 ff ff       	jmp    80105b4f <alltraps>

80106157 <vector32>:
80106157:	6a 00                	push   $0x0
80106159:	6a 20                	push   $0x20
8010615b:	e9 ef f9 ff ff       	jmp    80105b4f <alltraps>

80106160 <vector33>:
80106160:	6a 00                	push   $0x0
80106162:	6a 21                	push   $0x21
80106164:	e9 e6 f9 ff ff       	jmp    80105b4f <alltraps>

80106169 <vector34>:
80106169:	6a 00                	push   $0x0
8010616b:	6a 22                	push   $0x22
8010616d:	e9 dd f9 ff ff       	jmp    80105b4f <alltraps>

80106172 <vector35>:
80106172:	6a 00                	push   $0x0
80106174:	6a 23                	push   $0x23
80106176:	e9 d4 f9 ff ff       	jmp    80105b4f <alltraps>

8010617b <vector36>:
8010617b:	6a 00                	push   $0x0
8010617d:	6a 24                	push   $0x24
8010617f:	e9 cb f9 ff ff       	jmp    80105b4f <alltraps>

80106184 <vector37>:
80106184:	6a 00                	push   $0x0
80106186:	6a 25                	push   $0x25
80106188:	e9 c2 f9 ff ff       	jmp    80105b4f <alltraps>

8010618d <vector38>:
8010618d:	6a 00                	push   $0x0
8010618f:	6a 26                	push   $0x26
80106191:	e9 b9 f9 ff ff       	jmp    80105b4f <alltraps>

80106196 <vector39>:
80106196:	6a 00                	push   $0x0
80106198:	6a 27                	push   $0x27
8010619a:	e9 b0 f9 ff ff       	jmp    80105b4f <alltraps>

8010619f <vector40>:
8010619f:	6a 00                	push   $0x0
801061a1:	6a 28                	push   $0x28
801061a3:	e9 a7 f9 ff ff       	jmp    80105b4f <alltraps>

801061a8 <vector41>:
801061a8:	6a 00                	push   $0x0
801061aa:	6a 29                	push   $0x29
801061ac:	e9 9e f9 ff ff       	jmp    80105b4f <alltraps>

801061b1 <vector42>:
801061b1:	6a 00                	push   $0x0
801061b3:	6a 2a                	push   $0x2a
801061b5:	e9 95 f9 ff ff       	jmp    80105b4f <alltraps>

801061ba <vector43>:
801061ba:	6a 00                	push   $0x0
801061bc:	6a 2b                	push   $0x2b
801061be:	e9 8c f9 ff ff       	jmp    80105b4f <alltraps>

801061c3 <vector44>:
801061c3:	6a 00                	push   $0x0
801061c5:	6a 2c                	push   $0x2c
801061c7:	e9 83 f9 ff ff       	jmp    80105b4f <alltraps>

801061cc <vector45>:
801061cc:	6a 00                	push   $0x0
801061ce:	6a 2d                	push   $0x2d
801061d0:	e9 7a f9 ff ff       	jmp    80105b4f <alltraps>

801061d5 <vector46>:
801061d5:	6a 00                	push   $0x0
801061d7:	6a 2e                	push   $0x2e
801061d9:	e9 71 f9 ff ff       	jmp    80105b4f <alltraps>

801061de <vector47>:
801061de:	6a 00                	push   $0x0
801061e0:	6a 2f                	push   $0x2f
801061e2:	e9 68 f9 ff ff       	jmp    80105b4f <alltraps>

801061e7 <vector48>:
801061e7:	6a 00                	push   $0x0
801061e9:	6a 30                	push   $0x30
801061eb:	e9 5f f9 ff ff       	jmp    80105b4f <alltraps>

801061f0 <vector49>:
801061f0:	6a 00                	push   $0x0
801061f2:	6a 31                	push   $0x31
801061f4:	e9 56 f9 ff ff       	jmp    80105b4f <alltraps>

801061f9 <vector50>:
801061f9:	6a 00                	push   $0x0
801061fb:	6a 32                	push   $0x32
801061fd:	e9 4d f9 ff ff       	jmp    80105b4f <alltraps>

80106202 <vector51>:
80106202:	6a 00                	push   $0x0
80106204:	6a 33                	push   $0x33
80106206:	e9 44 f9 ff ff       	jmp    80105b4f <alltraps>

8010620b <vector52>:
8010620b:	6a 00                	push   $0x0
8010620d:	6a 34                	push   $0x34
8010620f:	e9 3b f9 ff ff       	jmp    80105b4f <alltraps>

80106214 <vector53>:
80106214:	6a 00                	push   $0x0
80106216:	6a 35                	push   $0x35
80106218:	e9 32 f9 ff ff       	jmp    80105b4f <alltraps>

8010621d <vector54>:
8010621d:	6a 00                	push   $0x0
8010621f:	6a 36                	push   $0x36
80106221:	e9 29 f9 ff ff       	jmp    80105b4f <alltraps>

80106226 <vector55>:
80106226:	6a 00                	push   $0x0
80106228:	6a 37                	push   $0x37
8010622a:	e9 20 f9 ff ff       	jmp    80105b4f <alltraps>

8010622f <vector56>:
8010622f:	6a 00                	push   $0x0
80106231:	6a 38                	push   $0x38
80106233:	e9 17 f9 ff ff       	jmp    80105b4f <alltraps>

80106238 <vector57>:
80106238:	6a 00                	push   $0x0
8010623a:	6a 39                	push   $0x39
8010623c:	e9 0e f9 ff ff       	jmp    80105b4f <alltraps>

80106241 <vector58>:
80106241:	6a 00                	push   $0x0
80106243:	6a 3a                	push   $0x3a
80106245:	e9 05 f9 ff ff       	jmp    80105b4f <alltraps>

8010624a <vector59>:
8010624a:	6a 00                	push   $0x0
8010624c:	6a 3b                	push   $0x3b
8010624e:	e9 fc f8 ff ff       	jmp    80105b4f <alltraps>

80106253 <vector60>:
80106253:	6a 00                	push   $0x0
80106255:	6a 3c                	push   $0x3c
80106257:	e9 f3 f8 ff ff       	jmp    80105b4f <alltraps>

8010625c <vector61>:
8010625c:	6a 00                	push   $0x0
8010625e:	6a 3d                	push   $0x3d
80106260:	e9 ea f8 ff ff       	jmp    80105b4f <alltraps>

80106265 <vector62>:
80106265:	6a 00                	push   $0x0
80106267:	6a 3e                	push   $0x3e
80106269:	e9 e1 f8 ff ff       	jmp    80105b4f <alltraps>

8010626e <vector63>:
8010626e:	6a 00                	push   $0x0
80106270:	6a 3f                	push   $0x3f
80106272:	e9 d8 f8 ff ff       	jmp    80105b4f <alltraps>

80106277 <vector64>:
80106277:	6a 00                	push   $0x0
80106279:	6a 40                	push   $0x40
8010627b:	e9 cf f8 ff ff       	jmp    80105b4f <alltraps>

80106280 <vector65>:
80106280:	6a 00                	push   $0x0
80106282:	6a 41                	push   $0x41
80106284:	e9 c6 f8 ff ff       	jmp    80105b4f <alltraps>

80106289 <vector66>:
80106289:	6a 00                	push   $0x0
8010628b:	6a 42                	push   $0x42
8010628d:	e9 bd f8 ff ff       	jmp    80105b4f <alltraps>

80106292 <vector67>:
80106292:	6a 00                	push   $0x0
80106294:	6a 43                	push   $0x43
80106296:	e9 b4 f8 ff ff       	jmp    80105b4f <alltraps>

8010629b <vector68>:
8010629b:	6a 00                	push   $0x0
8010629d:	6a 44                	push   $0x44
8010629f:	e9 ab f8 ff ff       	jmp    80105b4f <alltraps>

801062a4 <vector69>:
801062a4:	6a 00                	push   $0x0
801062a6:	6a 45                	push   $0x45
801062a8:	e9 a2 f8 ff ff       	jmp    80105b4f <alltraps>

801062ad <vector70>:
801062ad:	6a 00                	push   $0x0
801062af:	6a 46                	push   $0x46
801062b1:	e9 99 f8 ff ff       	jmp    80105b4f <alltraps>

801062b6 <vector71>:
801062b6:	6a 00                	push   $0x0
801062b8:	6a 47                	push   $0x47
801062ba:	e9 90 f8 ff ff       	jmp    80105b4f <alltraps>

801062bf <vector72>:
801062bf:	6a 00                	push   $0x0
801062c1:	6a 48                	push   $0x48
801062c3:	e9 87 f8 ff ff       	jmp    80105b4f <alltraps>

801062c8 <vector73>:
801062c8:	6a 00                	push   $0x0
801062ca:	6a 49                	push   $0x49
801062cc:	e9 7e f8 ff ff       	jmp    80105b4f <alltraps>

801062d1 <vector74>:
801062d1:	6a 00                	push   $0x0
801062d3:	6a 4a                	push   $0x4a
801062d5:	e9 75 f8 ff ff       	jmp    80105b4f <alltraps>

801062da <vector75>:
801062da:	6a 00                	push   $0x0
801062dc:	6a 4b                	push   $0x4b
801062de:	e9 6c f8 ff ff       	jmp    80105b4f <alltraps>

801062e3 <vector76>:
801062e3:	6a 00                	push   $0x0
801062e5:	6a 4c                	push   $0x4c
801062e7:	e9 63 f8 ff ff       	jmp    80105b4f <alltraps>

801062ec <vector77>:
801062ec:	6a 00                	push   $0x0
801062ee:	6a 4d                	push   $0x4d
801062f0:	e9 5a f8 ff ff       	jmp    80105b4f <alltraps>

801062f5 <vector78>:
801062f5:	6a 00                	push   $0x0
801062f7:	6a 4e                	push   $0x4e
801062f9:	e9 51 f8 ff ff       	jmp    80105b4f <alltraps>

801062fe <vector79>:
801062fe:	6a 00                	push   $0x0
80106300:	6a 4f                	push   $0x4f
80106302:	e9 48 f8 ff ff       	jmp    80105b4f <alltraps>

80106307 <vector80>:
80106307:	6a 00                	push   $0x0
80106309:	6a 50                	push   $0x50
8010630b:	e9 3f f8 ff ff       	jmp    80105b4f <alltraps>

80106310 <vector81>:
80106310:	6a 00                	push   $0x0
80106312:	6a 51                	push   $0x51
80106314:	e9 36 f8 ff ff       	jmp    80105b4f <alltraps>

80106319 <vector82>:
80106319:	6a 00                	push   $0x0
8010631b:	6a 52                	push   $0x52
8010631d:	e9 2d f8 ff ff       	jmp    80105b4f <alltraps>

80106322 <vector83>:
80106322:	6a 00                	push   $0x0
80106324:	6a 53                	push   $0x53
80106326:	e9 24 f8 ff ff       	jmp    80105b4f <alltraps>

8010632b <vector84>:
8010632b:	6a 00                	push   $0x0
8010632d:	6a 54                	push   $0x54
8010632f:	e9 1b f8 ff ff       	jmp    80105b4f <alltraps>

80106334 <vector85>:
80106334:	6a 00                	push   $0x0
80106336:	6a 55                	push   $0x55
80106338:	e9 12 f8 ff ff       	jmp    80105b4f <alltraps>

8010633d <vector86>:
8010633d:	6a 00                	push   $0x0
8010633f:	6a 56                	push   $0x56
80106341:	e9 09 f8 ff ff       	jmp    80105b4f <alltraps>

80106346 <vector87>:
80106346:	6a 00                	push   $0x0
80106348:	6a 57                	push   $0x57
8010634a:	e9 00 f8 ff ff       	jmp    80105b4f <alltraps>

8010634f <vector88>:
8010634f:	6a 00                	push   $0x0
80106351:	6a 58                	push   $0x58
80106353:	e9 f7 f7 ff ff       	jmp    80105b4f <alltraps>

80106358 <vector89>:
80106358:	6a 00                	push   $0x0
8010635a:	6a 59                	push   $0x59
8010635c:	e9 ee f7 ff ff       	jmp    80105b4f <alltraps>

80106361 <vector90>:
80106361:	6a 00                	push   $0x0
80106363:	6a 5a                	push   $0x5a
80106365:	e9 e5 f7 ff ff       	jmp    80105b4f <alltraps>

8010636a <vector91>:
8010636a:	6a 00                	push   $0x0
8010636c:	6a 5b                	push   $0x5b
8010636e:	e9 dc f7 ff ff       	jmp    80105b4f <alltraps>

80106373 <vector92>:
80106373:	6a 00                	push   $0x0
80106375:	6a 5c                	push   $0x5c
80106377:	e9 d3 f7 ff ff       	jmp    80105b4f <alltraps>

8010637c <vector93>:
8010637c:	6a 00                	push   $0x0
8010637e:	6a 5d                	push   $0x5d
80106380:	e9 ca f7 ff ff       	jmp    80105b4f <alltraps>

80106385 <vector94>:
80106385:	6a 00                	push   $0x0
80106387:	6a 5e                	push   $0x5e
80106389:	e9 c1 f7 ff ff       	jmp    80105b4f <alltraps>

8010638e <vector95>:
8010638e:	6a 00                	push   $0x0
80106390:	6a 5f                	push   $0x5f
80106392:	e9 b8 f7 ff ff       	jmp    80105b4f <alltraps>

80106397 <vector96>:
80106397:	6a 00                	push   $0x0
80106399:	6a 60                	push   $0x60
8010639b:	e9 af f7 ff ff       	jmp    80105b4f <alltraps>

801063a0 <vector97>:
801063a0:	6a 00                	push   $0x0
801063a2:	6a 61                	push   $0x61
801063a4:	e9 a6 f7 ff ff       	jmp    80105b4f <alltraps>

801063a9 <vector98>:
801063a9:	6a 00                	push   $0x0
801063ab:	6a 62                	push   $0x62
801063ad:	e9 9d f7 ff ff       	jmp    80105b4f <alltraps>

801063b2 <vector99>:
801063b2:	6a 00                	push   $0x0
801063b4:	6a 63                	push   $0x63
801063b6:	e9 94 f7 ff ff       	jmp    80105b4f <alltraps>

801063bb <vector100>:
801063bb:	6a 00                	push   $0x0
801063bd:	6a 64                	push   $0x64
801063bf:	e9 8b f7 ff ff       	jmp    80105b4f <alltraps>

801063c4 <vector101>:
801063c4:	6a 00                	push   $0x0
801063c6:	6a 65                	push   $0x65
801063c8:	e9 82 f7 ff ff       	jmp    80105b4f <alltraps>

801063cd <vector102>:
801063cd:	6a 00                	push   $0x0
801063cf:	6a 66                	push   $0x66
801063d1:	e9 79 f7 ff ff       	jmp    80105b4f <alltraps>

801063d6 <vector103>:
801063d6:	6a 00                	push   $0x0
801063d8:	6a 67                	push   $0x67
801063da:	e9 70 f7 ff ff       	jmp    80105b4f <alltraps>

801063df <vector104>:
801063df:	6a 00                	push   $0x0
801063e1:	6a 68                	push   $0x68
801063e3:	e9 67 f7 ff ff       	jmp    80105b4f <alltraps>

801063e8 <vector105>:
801063e8:	6a 00                	push   $0x0
801063ea:	6a 69                	push   $0x69
801063ec:	e9 5e f7 ff ff       	jmp    80105b4f <alltraps>

801063f1 <vector106>:
801063f1:	6a 00                	push   $0x0
801063f3:	6a 6a                	push   $0x6a
801063f5:	e9 55 f7 ff ff       	jmp    80105b4f <alltraps>

801063fa <vector107>:
801063fa:	6a 00                	push   $0x0
801063fc:	6a 6b                	push   $0x6b
801063fe:	e9 4c f7 ff ff       	jmp    80105b4f <alltraps>

80106403 <vector108>:
80106403:	6a 00                	push   $0x0
80106405:	6a 6c                	push   $0x6c
80106407:	e9 43 f7 ff ff       	jmp    80105b4f <alltraps>

8010640c <vector109>:
8010640c:	6a 00                	push   $0x0
8010640e:	6a 6d                	push   $0x6d
80106410:	e9 3a f7 ff ff       	jmp    80105b4f <alltraps>

80106415 <vector110>:
80106415:	6a 00                	push   $0x0
80106417:	6a 6e                	push   $0x6e
80106419:	e9 31 f7 ff ff       	jmp    80105b4f <alltraps>

8010641e <vector111>:
8010641e:	6a 00                	push   $0x0
80106420:	6a 6f                	push   $0x6f
80106422:	e9 28 f7 ff ff       	jmp    80105b4f <alltraps>

80106427 <vector112>:
80106427:	6a 00                	push   $0x0
80106429:	6a 70                	push   $0x70
8010642b:	e9 1f f7 ff ff       	jmp    80105b4f <alltraps>

80106430 <vector113>:
80106430:	6a 00                	push   $0x0
80106432:	6a 71                	push   $0x71
80106434:	e9 16 f7 ff ff       	jmp    80105b4f <alltraps>

80106439 <vector114>:
80106439:	6a 00                	push   $0x0
8010643b:	6a 72                	push   $0x72
8010643d:	e9 0d f7 ff ff       	jmp    80105b4f <alltraps>

80106442 <vector115>:
80106442:	6a 00                	push   $0x0
80106444:	6a 73                	push   $0x73
80106446:	e9 04 f7 ff ff       	jmp    80105b4f <alltraps>

8010644b <vector116>:
8010644b:	6a 00                	push   $0x0
8010644d:	6a 74                	push   $0x74
8010644f:	e9 fb f6 ff ff       	jmp    80105b4f <alltraps>

80106454 <vector117>:
80106454:	6a 00                	push   $0x0
80106456:	6a 75                	push   $0x75
80106458:	e9 f2 f6 ff ff       	jmp    80105b4f <alltraps>

8010645d <vector118>:
8010645d:	6a 00                	push   $0x0
8010645f:	6a 76                	push   $0x76
80106461:	e9 e9 f6 ff ff       	jmp    80105b4f <alltraps>

80106466 <vector119>:
80106466:	6a 00                	push   $0x0
80106468:	6a 77                	push   $0x77
8010646a:	e9 e0 f6 ff ff       	jmp    80105b4f <alltraps>

8010646f <vector120>:
8010646f:	6a 00                	push   $0x0
80106471:	6a 78                	push   $0x78
80106473:	e9 d7 f6 ff ff       	jmp    80105b4f <alltraps>

80106478 <vector121>:
80106478:	6a 00                	push   $0x0
8010647a:	6a 79                	push   $0x79
8010647c:	e9 ce f6 ff ff       	jmp    80105b4f <alltraps>

80106481 <vector122>:
80106481:	6a 00                	push   $0x0
80106483:	6a 7a                	push   $0x7a
80106485:	e9 c5 f6 ff ff       	jmp    80105b4f <alltraps>

8010648a <vector123>:
8010648a:	6a 00                	push   $0x0
8010648c:	6a 7b                	push   $0x7b
8010648e:	e9 bc f6 ff ff       	jmp    80105b4f <alltraps>

80106493 <vector124>:
80106493:	6a 00                	push   $0x0
80106495:	6a 7c                	push   $0x7c
80106497:	e9 b3 f6 ff ff       	jmp    80105b4f <alltraps>

8010649c <vector125>:
8010649c:	6a 00                	push   $0x0
8010649e:	6a 7d                	push   $0x7d
801064a0:	e9 aa f6 ff ff       	jmp    80105b4f <alltraps>

801064a5 <vector126>:
801064a5:	6a 00                	push   $0x0
801064a7:	6a 7e                	push   $0x7e
801064a9:	e9 a1 f6 ff ff       	jmp    80105b4f <alltraps>

801064ae <vector127>:
801064ae:	6a 00                	push   $0x0
801064b0:	6a 7f                	push   $0x7f
801064b2:	e9 98 f6 ff ff       	jmp    80105b4f <alltraps>

801064b7 <vector128>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 80 00 00 00       	push   $0x80
801064be:	e9 8c f6 ff ff       	jmp    80105b4f <alltraps>

801064c3 <vector129>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 81 00 00 00       	push   $0x81
801064ca:	e9 80 f6 ff ff       	jmp    80105b4f <alltraps>

801064cf <vector130>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 82 00 00 00       	push   $0x82
801064d6:	e9 74 f6 ff ff       	jmp    80105b4f <alltraps>

801064db <vector131>:
801064db:	6a 00                	push   $0x0
801064dd:	68 83 00 00 00       	push   $0x83
801064e2:	e9 68 f6 ff ff       	jmp    80105b4f <alltraps>

801064e7 <vector132>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 84 00 00 00       	push   $0x84
801064ee:	e9 5c f6 ff ff       	jmp    80105b4f <alltraps>

801064f3 <vector133>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 85 00 00 00       	push   $0x85
801064fa:	e9 50 f6 ff ff       	jmp    80105b4f <alltraps>

801064ff <vector134>:
801064ff:	6a 00                	push   $0x0
80106501:	68 86 00 00 00       	push   $0x86
80106506:	e9 44 f6 ff ff       	jmp    80105b4f <alltraps>

8010650b <vector135>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 87 00 00 00       	push   $0x87
80106512:	e9 38 f6 ff ff       	jmp    80105b4f <alltraps>

80106517 <vector136>:
80106517:	6a 00                	push   $0x0
80106519:	68 88 00 00 00       	push   $0x88
8010651e:	e9 2c f6 ff ff       	jmp    80105b4f <alltraps>

80106523 <vector137>:
80106523:	6a 00                	push   $0x0
80106525:	68 89 00 00 00       	push   $0x89
8010652a:	e9 20 f6 ff ff       	jmp    80105b4f <alltraps>

8010652f <vector138>:
8010652f:	6a 00                	push   $0x0
80106531:	68 8a 00 00 00       	push   $0x8a
80106536:	e9 14 f6 ff ff       	jmp    80105b4f <alltraps>

8010653b <vector139>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 8b 00 00 00       	push   $0x8b
80106542:	e9 08 f6 ff ff       	jmp    80105b4f <alltraps>

80106547 <vector140>:
80106547:	6a 00                	push   $0x0
80106549:	68 8c 00 00 00       	push   $0x8c
8010654e:	e9 fc f5 ff ff       	jmp    80105b4f <alltraps>

80106553 <vector141>:
80106553:	6a 00                	push   $0x0
80106555:	68 8d 00 00 00       	push   $0x8d
8010655a:	e9 f0 f5 ff ff       	jmp    80105b4f <alltraps>

8010655f <vector142>:
8010655f:	6a 00                	push   $0x0
80106561:	68 8e 00 00 00       	push   $0x8e
80106566:	e9 e4 f5 ff ff       	jmp    80105b4f <alltraps>

8010656b <vector143>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 8f 00 00 00       	push   $0x8f
80106572:	e9 d8 f5 ff ff       	jmp    80105b4f <alltraps>

80106577 <vector144>:
80106577:	6a 00                	push   $0x0
80106579:	68 90 00 00 00       	push   $0x90
8010657e:	e9 cc f5 ff ff       	jmp    80105b4f <alltraps>

80106583 <vector145>:
80106583:	6a 00                	push   $0x0
80106585:	68 91 00 00 00       	push   $0x91
8010658a:	e9 c0 f5 ff ff       	jmp    80105b4f <alltraps>

8010658f <vector146>:
8010658f:	6a 00                	push   $0x0
80106591:	68 92 00 00 00       	push   $0x92
80106596:	e9 b4 f5 ff ff       	jmp    80105b4f <alltraps>

8010659b <vector147>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 93 00 00 00       	push   $0x93
801065a2:	e9 a8 f5 ff ff       	jmp    80105b4f <alltraps>

801065a7 <vector148>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 94 00 00 00       	push   $0x94
801065ae:	e9 9c f5 ff ff       	jmp    80105b4f <alltraps>

801065b3 <vector149>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 95 00 00 00       	push   $0x95
801065ba:	e9 90 f5 ff ff       	jmp    80105b4f <alltraps>

801065bf <vector150>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 96 00 00 00       	push   $0x96
801065c6:	e9 84 f5 ff ff       	jmp    80105b4f <alltraps>

801065cb <vector151>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 97 00 00 00       	push   $0x97
801065d2:	e9 78 f5 ff ff       	jmp    80105b4f <alltraps>

801065d7 <vector152>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 98 00 00 00       	push   $0x98
801065de:	e9 6c f5 ff ff       	jmp    80105b4f <alltraps>

801065e3 <vector153>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 99 00 00 00       	push   $0x99
801065ea:	e9 60 f5 ff ff       	jmp    80105b4f <alltraps>

801065ef <vector154>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 9a 00 00 00       	push   $0x9a
801065f6:	e9 54 f5 ff ff       	jmp    80105b4f <alltraps>

801065fb <vector155>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 9b 00 00 00       	push   $0x9b
80106602:	e9 48 f5 ff ff       	jmp    80105b4f <alltraps>

80106607 <vector156>:
80106607:	6a 00                	push   $0x0
80106609:	68 9c 00 00 00       	push   $0x9c
8010660e:	e9 3c f5 ff ff       	jmp    80105b4f <alltraps>

80106613 <vector157>:
80106613:	6a 00                	push   $0x0
80106615:	68 9d 00 00 00       	push   $0x9d
8010661a:	e9 30 f5 ff ff       	jmp    80105b4f <alltraps>

8010661f <vector158>:
8010661f:	6a 00                	push   $0x0
80106621:	68 9e 00 00 00       	push   $0x9e
80106626:	e9 24 f5 ff ff       	jmp    80105b4f <alltraps>

8010662b <vector159>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 9f 00 00 00       	push   $0x9f
80106632:	e9 18 f5 ff ff       	jmp    80105b4f <alltraps>

80106637 <vector160>:
80106637:	6a 00                	push   $0x0
80106639:	68 a0 00 00 00       	push   $0xa0
8010663e:	e9 0c f5 ff ff       	jmp    80105b4f <alltraps>

80106643 <vector161>:
80106643:	6a 00                	push   $0x0
80106645:	68 a1 00 00 00       	push   $0xa1
8010664a:	e9 00 f5 ff ff       	jmp    80105b4f <alltraps>

8010664f <vector162>:
8010664f:	6a 00                	push   $0x0
80106651:	68 a2 00 00 00       	push   $0xa2
80106656:	e9 f4 f4 ff ff       	jmp    80105b4f <alltraps>

8010665b <vector163>:
8010665b:	6a 00                	push   $0x0
8010665d:	68 a3 00 00 00       	push   $0xa3
80106662:	e9 e8 f4 ff ff       	jmp    80105b4f <alltraps>

80106667 <vector164>:
80106667:	6a 00                	push   $0x0
80106669:	68 a4 00 00 00       	push   $0xa4
8010666e:	e9 dc f4 ff ff       	jmp    80105b4f <alltraps>

80106673 <vector165>:
80106673:	6a 00                	push   $0x0
80106675:	68 a5 00 00 00       	push   $0xa5
8010667a:	e9 d0 f4 ff ff       	jmp    80105b4f <alltraps>

8010667f <vector166>:
8010667f:	6a 00                	push   $0x0
80106681:	68 a6 00 00 00       	push   $0xa6
80106686:	e9 c4 f4 ff ff       	jmp    80105b4f <alltraps>

8010668b <vector167>:
8010668b:	6a 00                	push   $0x0
8010668d:	68 a7 00 00 00       	push   $0xa7
80106692:	e9 b8 f4 ff ff       	jmp    80105b4f <alltraps>

80106697 <vector168>:
80106697:	6a 00                	push   $0x0
80106699:	68 a8 00 00 00       	push   $0xa8
8010669e:	e9 ac f4 ff ff       	jmp    80105b4f <alltraps>

801066a3 <vector169>:
801066a3:	6a 00                	push   $0x0
801066a5:	68 a9 00 00 00       	push   $0xa9
801066aa:	e9 a0 f4 ff ff       	jmp    80105b4f <alltraps>

801066af <vector170>:
801066af:	6a 00                	push   $0x0
801066b1:	68 aa 00 00 00       	push   $0xaa
801066b6:	e9 94 f4 ff ff       	jmp    80105b4f <alltraps>

801066bb <vector171>:
801066bb:	6a 00                	push   $0x0
801066bd:	68 ab 00 00 00       	push   $0xab
801066c2:	e9 88 f4 ff ff       	jmp    80105b4f <alltraps>

801066c7 <vector172>:
801066c7:	6a 00                	push   $0x0
801066c9:	68 ac 00 00 00       	push   $0xac
801066ce:	e9 7c f4 ff ff       	jmp    80105b4f <alltraps>

801066d3 <vector173>:
801066d3:	6a 00                	push   $0x0
801066d5:	68 ad 00 00 00       	push   $0xad
801066da:	e9 70 f4 ff ff       	jmp    80105b4f <alltraps>

801066df <vector174>:
801066df:	6a 00                	push   $0x0
801066e1:	68 ae 00 00 00       	push   $0xae
801066e6:	e9 64 f4 ff ff       	jmp    80105b4f <alltraps>

801066eb <vector175>:
801066eb:	6a 00                	push   $0x0
801066ed:	68 af 00 00 00       	push   $0xaf
801066f2:	e9 58 f4 ff ff       	jmp    80105b4f <alltraps>

801066f7 <vector176>:
801066f7:	6a 00                	push   $0x0
801066f9:	68 b0 00 00 00       	push   $0xb0
801066fe:	e9 4c f4 ff ff       	jmp    80105b4f <alltraps>

80106703 <vector177>:
80106703:	6a 00                	push   $0x0
80106705:	68 b1 00 00 00       	push   $0xb1
8010670a:	e9 40 f4 ff ff       	jmp    80105b4f <alltraps>

8010670f <vector178>:
8010670f:	6a 00                	push   $0x0
80106711:	68 b2 00 00 00       	push   $0xb2
80106716:	e9 34 f4 ff ff       	jmp    80105b4f <alltraps>

8010671b <vector179>:
8010671b:	6a 00                	push   $0x0
8010671d:	68 b3 00 00 00       	push   $0xb3
80106722:	e9 28 f4 ff ff       	jmp    80105b4f <alltraps>

80106727 <vector180>:
80106727:	6a 00                	push   $0x0
80106729:	68 b4 00 00 00       	push   $0xb4
8010672e:	e9 1c f4 ff ff       	jmp    80105b4f <alltraps>

80106733 <vector181>:
80106733:	6a 00                	push   $0x0
80106735:	68 b5 00 00 00       	push   $0xb5
8010673a:	e9 10 f4 ff ff       	jmp    80105b4f <alltraps>

8010673f <vector182>:
8010673f:	6a 00                	push   $0x0
80106741:	68 b6 00 00 00       	push   $0xb6
80106746:	e9 04 f4 ff ff       	jmp    80105b4f <alltraps>

8010674b <vector183>:
8010674b:	6a 00                	push   $0x0
8010674d:	68 b7 00 00 00       	push   $0xb7
80106752:	e9 f8 f3 ff ff       	jmp    80105b4f <alltraps>

80106757 <vector184>:
80106757:	6a 00                	push   $0x0
80106759:	68 b8 00 00 00       	push   $0xb8
8010675e:	e9 ec f3 ff ff       	jmp    80105b4f <alltraps>

80106763 <vector185>:
80106763:	6a 00                	push   $0x0
80106765:	68 b9 00 00 00       	push   $0xb9
8010676a:	e9 e0 f3 ff ff       	jmp    80105b4f <alltraps>

8010676f <vector186>:
8010676f:	6a 00                	push   $0x0
80106771:	68 ba 00 00 00       	push   $0xba
80106776:	e9 d4 f3 ff ff       	jmp    80105b4f <alltraps>

8010677b <vector187>:
8010677b:	6a 00                	push   $0x0
8010677d:	68 bb 00 00 00       	push   $0xbb
80106782:	e9 c8 f3 ff ff       	jmp    80105b4f <alltraps>

80106787 <vector188>:
80106787:	6a 00                	push   $0x0
80106789:	68 bc 00 00 00       	push   $0xbc
8010678e:	e9 bc f3 ff ff       	jmp    80105b4f <alltraps>

80106793 <vector189>:
80106793:	6a 00                	push   $0x0
80106795:	68 bd 00 00 00       	push   $0xbd
8010679a:	e9 b0 f3 ff ff       	jmp    80105b4f <alltraps>

8010679f <vector190>:
8010679f:	6a 00                	push   $0x0
801067a1:	68 be 00 00 00       	push   $0xbe
801067a6:	e9 a4 f3 ff ff       	jmp    80105b4f <alltraps>

801067ab <vector191>:
801067ab:	6a 00                	push   $0x0
801067ad:	68 bf 00 00 00       	push   $0xbf
801067b2:	e9 98 f3 ff ff       	jmp    80105b4f <alltraps>

801067b7 <vector192>:
801067b7:	6a 00                	push   $0x0
801067b9:	68 c0 00 00 00       	push   $0xc0
801067be:	e9 8c f3 ff ff       	jmp    80105b4f <alltraps>

801067c3 <vector193>:
801067c3:	6a 00                	push   $0x0
801067c5:	68 c1 00 00 00       	push   $0xc1
801067ca:	e9 80 f3 ff ff       	jmp    80105b4f <alltraps>

801067cf <vector194>:
801067cf:	6a 00                	push   $0x0
801067d1:	68 c2 00 00 00       	push   $0xc2
801067d6:	e9 74 f3 ff ff       	jmp    80105b4f <alltraps>

801067db <vector195>:
801067db:	6a 00                	push   $0x0
801067dd:	68 c3 00 00 00       	push   $0xc3
801067e2:	e9 68 f3 ff ff       	jmp    80105b4f <alltraps>

801067e7 <vector196>:
801067e7:	6a 00                	push   $0x0
801067e9:	68 c4 00 00 00       	push   $0xc4
801067ee:	e9 5c f3 ff ff       	jmp    80105b4f <alltraps>

801067f3 <vector197>:
801067f3:	6a 00                	push   $0x0
801067f5:	68 c5 00 00 00       	push   $0xc5
801067fa:	e9 50 f3 ff ff       	jmp    80105b4f <alltraps>

801067ff <vector198>:
801067ff:	6a 00                	push   $0x0
80106801:	68 c6 00 00 00       	push   $0xc6
80106806:	e9 44 f3 ff ff       	jmp    80105b4f <alltraps>

8010680b <vector199>:
8010680b:	6a 00                	push   $0x0
8010680d:	68 c7 00 00 00       	push   $0xc7
80106812:	e9 38 f3 ff ff       	jmp    80105b4f <alltraps>

80106817 <vector200>:
80106817:	6a 00                	push   $0x0
80106819:	68 c8 00 00 00       	push   $0xc8
8010681e:	e9 2c f3 ff ff       	jmp    80105b4f <alltraps>

80106823 <vector201>:
80106823:	6a 00                	push   $0x0
80106825:	68 c9 00 00 00       	push   $0xc9
8010682a:	e9 20 f3 ff ff       	jmp    80105b4f <alltraps>

8010682f <vector202>:
8010682f:	6a 00                	push   $0x0
80106831:	68 ca 00 00 00       	push   $0xca
80106836:	e9 14 f3 ff ff       	jmp    80105b4f <alltraps>

8010683b <vector203>:
8010683b:	6a 00                	push   $0x0
8010683d:	68 cb 00 00 00       	push   $0xcb
80106842:	e9 08 f3 ff ff       	jmp    80105b4f <alltraps>

80106847 <vector204>:
80106847:	6a 00                	push   $0x0
80106849:	68 cc 00 00 00       	push   $0xcc
8010684e:	e9 fc f2 ff ff       	jmp    80105b4f <alltraps>

80106853 <vector205>:
80106853:	6a 00                	push   $0x0
80106855:	68 cd 00 00 00       	push   $0xcd
8010685a:	e9 f0 f2 ff ff       	jmp    80105b4f <alltraps>

8010685f <vector206>:
8010685f:	6a 00                	push   $0x0
80106861:	68 ce 00 00 00       	push   $0xce
80106866:	e9 e4 f2 ff ff       	jmp    80105b4f <alltraps>

8010686b <vector207>:
8010686b:	6a 00                	push   $0x0
8010686d:	68 cf 00 00 00       	push   $0xcf
80106872:	e9 d8 f2 ff ff       	jmp    80105b4f <alltraps>

80106877 <vector208>:
80106877:	6a 00                	push   $0x0
80106879:	68 d0 00 00 00       	push   $0xd0
8010687e:	e9 cc f2 ff ff       	jmp    80105b4f <alltraps>

80106883 <vector209>:
80106883:	6a 00                	push   $0x0
80106885:	68 d1 00 00 00       	push   $0xd1
8010688a:	e9 c0 f2 ff ff       	jmp    80105b4f <alltraps>

8010688f <vector210>:
8010688f:	6a 00                	push   $0x0
80106891:	68 d2 00 00 00       	push   $0xd2
80106896:	e9 b4 f2 ff ff       	jmp    80105b4f <alltraps>

8010689b <vector211>:
8010689b:	6a 00                	push   $0x0
8010689d:	68 d3 00 00 00       	push   $0xd3
801068a2:	e9 a8 f2 ff ff       	jmp    80105b4f <alltraps>

801068a7 <vector212>:
801068a7:	6a 00                	push   $0x0
801068a9:	68 d4 00 00 00       	push   $0xd4
801068ae:	e9 9c f2 ff ff       	jmp    80105b4f <alltraps>

801068b3 <vector213>:
801068b3:	6a 00                	push   $0x0
801068b5:	68 d5 00 00 00       	push   $0xd5
801068ba:	e9 90 f2 ff ff       	jmp    80105b4f <alltraps>

801068bf <vector214>:
801068bf:	6a 00                	push   $0x0
801068c1:	68 d6 00 00 00       	push   $0xd6
801068c6:	e9 84 f2 ff ff       	jmp    80105b4f <alltraps>

801068cb <vector215>:
801068cb:	6a 00                	push   $0x0
801068cd:	68 d7 00 00 00       	push   $0xd7
801068d2:	e9 78 f2 ff ff       	jmp    80105b4f <alltraps>

801068d7 <vector216>:
801068d7:	6a 00                	push   $0x0
801068d9:	68 d8 00 00 00       	push   $0xd8
801068de:	e9 6c f2 ff ff       	jmp    80105b4f <alltraps>

801068e3 <vector217>:
801068e3:	6a 00                	push   $0x0
801068e5:	68 d9 00 00 00       	push   $0xd9
801068ea:	e9 60 f2 ff ff       	jmp    80105b4f <alltraps>

801068ef <vector218>:
801068ef:	6a 00                	push   $0x0
801068f1:	68 da 00 00 00       	push   $0xda
801068f6:	e9 54 f2 ff ff       	jmp    80105b4f <alltraps>

801068fb <vector219>:
801068fb:	6a 00                	push   $0x0
801068fd:	68 db 00 00 00       	push   $0xdb
80106902:	e9 48 f2 ff ff       	jmp    80105b4f <alltraps>

80106907 <vector220>:
80106907:	6a 00                	push   $0x0
80106909:	68 dc 00 00 00       	push   $0xdc
8010690e:	e9 3c f2 ff ff       	jmp    80105b4f <alltraps>

80106913 <vector221>:
80106913:	6a 00                	push   $0x0
80106915:	68 dd 00 00 00       	push   $0xdd
8010691a:	e9 30 f2 ff ff       	jmp    80105b4f <alltraps>

8010691f <vector222>:
8010691f:	6a 00                	push   $0x0
80106921:	68 de 00 00 00       	push   $0xde
80106926:	e9 24 f2 ff ff       	jmp    80105b4f <alltraps>

8010692b <vector223>:
8010692b:	6a 00                	push   $0x0
8010692d:	68 df 00 00 00       	push   $0xdf
80106932:	e9 18 f2 ff ff       	jmp    80105b4f <alltraps>

80106937 <vector224>:
80106937:	6a 00                	push   $0x0
80106939:	68 e0 00 00 00       	push   $0xe0
8010693e:	e9 0c f2 ff ff       	jmp    80105b4f <alltraps>

80106943 <vector225>:
80106943:	6a 00                	push   $0x0
80106945:	68 e1 00 00 00       	push   $0xe1
8010694a:	e9 00 f2 ff ff       	jmp    80105b4f <alltraps>

8010694f <vector226>:
8010694f:	6a 00                	push   $0x0
80106951:	68 e2 00 00 00       	push   $0xe2
80106956:	e9 f4 f1 ff ff       	jmp    80105b4f <alltraps>

8010695b <vector227>:
8010695b:	6a 00                	push   $0x0
8010695d:	68 e3 00 00 00       	push   $0xe3
80106962:	e9 e8 f1 ff ff       	jmp    80105b4f <alltraps>

80106967 <vector228>:
80106967:	6a 00                	push   $0x0
80106969:	68 e4 00 00 00       	push   $0xe4
8010696e:	e9 dc f1 ff ff       	jmp    80105b4f <alltraps>

80106973 <vector229>:
80106973:	6a 00                	push   $0x0
80106975:	68 e5 00 00 00       	push   $0xe5
8010697a:	e9 d0 f1 ff ff       	jmp    80105b4f <alltraps>

8010697f <vector230>:
8010697f:	6a 00                	push   $0x0
80106981:	68 e6 00 00 00       	push   $0xe6
80106986:	e9 c4 f1 ff ff       	jmp    80105b4f <alltraps>

8010698b <vector231>:
8010698b:	6a 00                	push   $0x0
8010698d:	68 e7 00 00 00       	push   $0xe7
80106992:	e9 b8 f1 ff ff       	jmp    80105b4f <alltraps>

80106997 <vector232>:
80106997:	6a 00                	push   $0x0
80106999:	68 e8 00 00 00       	push   $0xe8
8010699e:	e9 ac f1 ff ff       	jmp    80105b4f <alltraps>

801069a3 <vector233>:
801069a3:	6a 00                	push   $0x0
801069a5:	68 e9 00 00 00       	push   $0xe9
801069aa:	e9 a0 f1 ff ff       	jmp    80105b4f <alltraps>

801069af <vector234>:
801069af:	6a 00                	push   $0x0
801069b1:	68 ea 00 00 00       	push   $0xea
801069b6:	e9 94 f1 ff ff       	jmp    80105b4f <alltraps>

801069bb <vector235>:
801069bb:	6a 00                	push   $0x0
801069bd:	68 eb 00 00 00       	push   $0xeb
801069c2:	e9 88 f1 ff ff       	jmp    80105b4f <alltraps>

801069c7 <vector236>:
801069c7:	6a 00                	push   $0x0
801069c9:	68 ec 00 00 00       	push   $0xec
801069ce:	e9 7c f1 ff ff       	jmp    80105b4f <alltraps>

801069d3 <vector237>:
801069d3:	6a 00                	push   $0x0
801069d5:	68 ed 00 00 00       	push   $0xed
801069da:	e9 70 f1 ff ff       	jmp    80105b4f <alltraps>

801069df <vector238>:
801069df:	6a 00                	push   $0x0
801069e1:	68 ee 00 00 00       	push   $0xee
801069e6:	e9 64 f1 ff ff       	jmp    80105b4f <alltraps>

801069eb <vector239>:
801069eb:	6a 00                	push   $0x0
801069ed:	68 ef 00 00 00       	push   $0xef
801069f2:	e9 58 f1 ff ff       	jmp    80105b4f <alltraps>

801069f7 <vector240>:
801069f7:	6a 00                	push   $0x0
801069f9:	68 f0 00 00 00       	push   $0xf0
801069fe:	e9 4c f1 ff ff       	jmp    80105b4f <alltraps>

80106a03 <vector241>:
80106a03:	6a 00                	push   $0x0
80106a05:	68 f1 00 00 00       	push   $0xf1
80106a0a:	e9 40 f1 ff ff       	jmp    80105b4f <alltraps>

80106a0f <vector242>:
80106a0f:	6a 00                	push   $0x0
80106a11:	68 f2 00 00 00       	push   $0xf2
80106a16:	e9 34 f1 ff ff       	jmp    80105b4f <alltraps>

80106a1b <vector243>:
80106a1b:	6a 00                	push   $0x0
80106a1d:	68 f3 00 00 00       	push   $0xf3
80106a22:	e9 28 f1 ff ff       	jmp    80105b4f <alltraps>

80106a27 <vector244>:
80106a27:	6a 00                	push   $0x0
80106a29:	68 f4 00 00 00       	push   $0xf4
80106a2e:	e9 1c f1 ff ff       	jmp    80105b4f <alltraps>

80106a33 <vector245>:
80106a33:	6a 00                	push   $0x0
80106a35:	68 f5 00 00 00       	push   $0xf5
80106a3a:	e9 10 f1 ff ff       	jmp    80105b4f <alltraps>

80106a3f <vector246>:
80106a3f:	6a 00                	push   $0x0
80106a41:	68 f6 00 00 00       	push   $0xf6
80106a46:	e9 04 f1 ff ff       	jmp    80105b4f <alltraps>

80106a4b <vector247>:
80106a4b:	6a 00                	push   $0x0
80106a4d:	68 f7 00 00 00       	push   $0xf7
80106a52:	e9 f8 f0 ff ff       	jmp    80105b4f <alltraps>

80106a57 <vector248>:
80106a57:	6a 00                	push   $0x0
80106a59:	68 f8 00 00 00       	push   $0xf8
80106a5e:	e9 ec f0 ff ff       	jmp    80105b4f <alltraps>

80106a63 <vector249>:
80106a63:	6a 00                	push   $0x0
80106a65:	68 f9 00 00 00       	push   $0xf9
80106a6a:	e9 e0 f0 ff ff       	jmp    80105b4f <alltraps>

80106a6f <vector250>:
80106a6f:	6a 00                	push   $0x0
80106a71:	68 fa 00 00 00       	push   $0xfa
80106a76:	e9 d4 f0 ff ff       	jmp    80105b4f <alltraps>

80106a7b <vector251>:
80106a7b:	6a 00                	push   $0x0
80106a7d:	68 fb 00 00 00       	push   $0xfb
80106a82:	e9 c8 f0 ff ff       	jmp    80105b4f <alltraps>

80106a87 <vector252>:
80106a87:	6a 00                	push   $0x0
80106a89:	68 fc 00 00 00       	push   $0xfc
80106a8e:	e9 bc f0 ff ff       	jmp    80105b4f <alltraps>

80106a93 <vector253>:
80106a93:	6a 00                	push   $0x0
80106a95:	68 fd 00 00 00       	push   $0xfd
80106a9a:	e9 b0 f0 ff ff       	jmp    80105b4f <alltraps>

80106a9f <vector254>:
80106a9f:	6a 00                	push   $0x0
80106aa1:	68 fe 00 00 00       	push   $0xfe
80106aa6:	e9 a4 f0 ff ff       	jmp    80105b4f <alltraps>

80106aab <vector255>:
80106aab:	6a 00                	push   $0x0
80106aad:	68 ff 00 00 00       	push   $0xff
80106ab2:	e9 98 f0 ff ff       	jmp    80105b4f <alltraps>
80106ab7:	66 90                	xchg   %ax,%ax
80106ab9:	66 90                	xchg   %ax,%ax
80106abb:	66 90                	xchg   %ax,%ax
80106abd:	66 90                	xchg   %ax,%ax
80106abf:	90                   	nop

80106ac0 <deallocuvm.part.0>:
80106ac0:	55                   	push   %ebp
80106ac1:	89 e5                	mov    %esp,%ebp
80106ac3:	57                   	push   %edi
80106ac4:	56                   	push   %esi
80106ac5:	53                   	push   %ebx
80106ac6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80106acc:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106ad2:	83 ec 1c             	sub    $0x1c,%esp
80106ad5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80106ad8:	39 d3                	cmp    %edx,%ebx
80106ada:	73 49                	jae    80106b25 <deallocuvm.part.0+0x65>
80106adc:	89 c7                	mov    %eax,%edi
80106ade:	eb 0c                	jmp    80106aec <deallocuvm.part.0+0x2c>
80106ae0:	83 c0 01             	add    $0x1,%eax
80106ae3:	c1 e0 16             	shl    $0x16,%eax
80106ae6:	89 c3                	mov    %eax,%ebx
80106ae8:	39 da                	cmp    %ebx,%edx
80106aea:	76 39                	jbe    80106b25 <deallocuvm.part.0+0x65>
80106aec:	89 d8                	mov    %ebx,%eax
80106aee:	c1 e8 16             	shr    $0x16,%eax
80106af1:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
80106af4:	f6 c1 01             	test   $0x1,%cl
80106af7:	74 e7                	je     80106ae0 <deallocuvm.part.0+0x20>
80106af9:	89 de                	mov    %ebx,%esi
80106afb:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
80106b01:	c1 ee 0a             	shr    $0xa,%esi
80106b04:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
80106b0a:	8d b4 31 00 00 00 80 	lea    -0x80000000(%ecx,%esi,1),%esi
80106b11:	85 f6                	test   %esi,%esi
80106b13:	74 cb                	je     80106ae0 <deallocuvm.part.0+0x20>
80106b15:	8b 06                	mov    (%esi),%eax
80106b17:	a8 01                	test   $0x1,%al
80106b19:	75 15                	jne    80106b30 <deallocuvm.part.0+0x70>
80106b1b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b21:	39 da                	cmp    %ebx,%edx
80106b23:	77 c7                	ja     80106aec <deallocuvm.part.0+0x2c>
80106b25:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106b28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b2b:	5b                   	pop    %ebx
80106b2c:	5e                   	pop    %esi
80106b2d:	5f                   	pop    %edi
80106b2e:	5d                   	pop    %ebp
80106b2f:	c3                   	ret    
80106b30:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b35:	74 25                	je     80106b5c <deallocuvm.part.0+0x9c>
80106b37:	83 ec 0c             	sub    $0xc,%esp
80106b3a:	05 00 00 00 80       	add    $0x80000000,%eax
80106b3f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106b42:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b48:	50                   	push   %eax
80106b49:	e8 72 b9 ff ff       	call   801024c0 <kfree>
80106b4e:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80106b54:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106b57:	83 c4 10             	add    $0x10,%esp
80106b5a:	eb 8c                	jmp    80106ae8 <deallocuvm.part.0+0x28>
80106b5c:	83 ec 0c             	sub    $0xc,%esp
80106b5f:	68 26 77 10 80       	push   $0x80107726
80106b64:	e8 17 98 ff ff       	call   80100380 <panic>
80106b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b70 <mappages>:
80106b70:	55                   	push   %ebp
80106b71:	89 e5                	mov    %esp,%ebp
80106b73:	57                   	push   %edi
80106b74:	56                   	push   %esi
80106b75:	53                   	push   %ebx
80106b76:	89 d3                	mov    %edx,%ebx
80106b78:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106b7e:	83 ec 1c             	sub    $0x1c,%esp
80106b81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106b84:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106b88:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b8d:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106b90:	8b 45 08             	mov    0x8(%ebp),%eax
80106b93:	29 d8                	sub    %ebx,%eax
80106b95:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106b98:	eb 3d                	jmp    80106bd7 <mappages+0x67>
80106b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ba0:	89 da                	mov    %ebx,%edx
80106ba2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ba7:	c1 ea 0a             	shr    $0xa,%edx
80106baa:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106bb0:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
80106bb7:	85 c0                	test   %eax,%eax
80106bb9:	74 75                	je     80106c30 <mappages+0xc0>
80106bbb:	f6 00 01             	testb  $0x1,(%eax)
80106bbe:	0f 85 86 00 00 00    	jne    80106c4a <mappages+0xda>
80106bc4:	0b 75 0c             	or     0xc(%ebp),%esi
80106bc7:	83 ce 01             	or     $0x1,%esi
80106bca:	89 30                	mov    %esi,(%eax)
80106bcc:	3b 5d dc             	cmp    -0x24(%ebp),%ebx
80106bcf:	74 6f                	je     80106c40 <mappages+0xd0>
80106bd1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106bd7:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106bda:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106bdd:	8d 34 18             	lea    (%eax,%ebx,1),%esi
80106be0:	89 d8                	mov    %ebx,%eax
80106be2:	c1 e8 16             	shr    $0x16,%eax
80106be5:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
80106be8:	8b 07                	mov    (%edi),%eax
80106bea:	a8 01                	test   $0x1,%al
80106bec:	75 b2                	jne    80106ba0 <mappages+0x30>
80106bee:	e8 8d ba ff ff       	call   80102680 <kalloc>
80106bf3:	85 c0                	test   %eax,%eax
80106bf5:	74 39                	je     80106c30 <mappages+0xc0>
80106bf7:	83 ec 04             	sub    $0x4,%esp
80106bfa:	89 45 d8             	mov    %eax,-0x28(%ebp)
80106bfd:	68 00 10 00 00       	push   $0x1000
80106c02:	6a 00                	push   $0x0
80106c04:	50                   	push   %eax
80106c05:	e8 d6 dc ff ff       	call   801048e0 <memset>
80106c0a:	8b 55 d8             	mov    -0x28(%ebp),%edx
80106c0d:	83 c4 10             	add    $0x10,%esp
80106c10:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
80106c16:	83 c8 07             	or     $0x7,%eax
80106c19:	89 07                	mov    %eax,(%edi)
80106c1b:	89 d8                	mov    %ebx,%eax
80106c1d:	c1 e8 0a             	shr    $0xa,%eax
80106c20:	25 fc 0f 00 00       	and    $0xffc,%eax
80106c25:	01 d0                	add    %edx,%eax
80106c27:	eb 92                	jmp    80106bbb <mappages+0x4b>
80106c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c30:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106c38:	5b                   	pop    %ebx
80106c39:	5e                   	pop    %esi
80106c3a:	5f                   	pop    %edi
80106c3b:	5d                   	pop    %ebp
80106c3c:	c3                   	ret    
80106c3d:	8d 76 00             	lea    0x0(%esi),%esi
80106c40:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c43:	31 c0                	xor    %eax,%eax
80106c45:	5b                   	pop    %ebx
80106c46:	5e                   	pop    %esi
80106c47:	5f                   	pop    %edi
80106c48:	5d                   	pop    %ebp
80106c49:	c3                   	ret    
80106c4a:	83 ec 0c             	sub    $0xc,%esp
80106c4d:	68 70 7d 10 80       	push   $0x80107d70
80106c52:	e8 29 97 ff ff       	call   80100380 <panic>
80106c57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c5e:	66 90                	xchg   %ax,%ax

80106c60 <seginit>:
80106c60:	55                   	push   %ebp
80106c61:	89 e5                	mov    %esp,%ebp
80106c63:	83 ec 18             	sub    $0x18,%esp
80106c66:	e8 e5 cc ff ff       	call   80103950 <cpuid>
80106c6b:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106c70:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106c76:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106c7a:	c7 80 18 18 11 80 ff 	movl   $0xffff,-0x7feee7e8(%eax)
80106c81:	ff 00 00 
80106c84:	c7 80 1c 18 11 80 00 	movl   $0xcf9a00,-0x7feee7e4(%eax)
80106c8b:	9a cf 00 
80106c8e:	c7 80 20 18 11 80 ff 	movl   $0xffff,-0x7feee7e0(%eax)
80106c95:	ff 00 00 
80106c98:	c7 80 24 18 11 80 00 	movl   $0xcf9200,-0x7feee7dc(%eax)
80106c9f:	92 cf 00 
80106ca2:	c7 80 28 18 11 80 ff 	movl   $0xffff,-0x7feee7d8(%eax)
80106ca9:	ff 00 00 
80106cac:	c7 80 2c 18 11 80 00 	movl   $0xcffa00,-0x7feee7d4(%eax)
80106cb3:	fa cf 00 
80106cb6:	c7 80 30 18 11 80 ff 	movl   $0xffff,-0x7feee7d0(%eax)
80106cbd:	ff 00 00 
80106cc0:	c7 80 34 18 11 80 00 	movl   $0xcff200,-0x7feee7cc(%eax)
80106cc7:	f2 cf 00 
80106cca:	05 10 18 11 80       	add    $0x80111810,%eax
80106ccf:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106cd3:	c1 e8 10             	shr    $0x10,%eax
80106cd6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106cda:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106cdd:	0f 01 10             	lgdtl  (%eax)
80106ce0:	c9                   	leave  
80106ce1:	c3                   	ret    
80106ce2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106cf0 <switchkvm>:
80106cf0:	a1 c4 45 11 80       	mov    0x801145c4,%eax
80106cf5:	05 00 00 00 80       	add    $0x80000000,%eax
80106cfa:	0f 22 d8             	mov    %eax,%cr3
80106cfd:	c3                   	ret    
80106cfe:	66 90                	xchg   %ax,%ax

80106d00 <switchuvm>:
80106d00:	55                   	push   %ebp
80106d01:	89 e5                	mov    %esp,%ebp
80106d03:	57                   	push   %edi
80106d04:	56                   	push   %esi
80106d05:	53                   	push   %ebx
80106d06:	83 ec 1c             	sub    $0x1c,%esp
80106d09:	8b 75 08             	mov    0x8(%ebp),%esi
80106d0c:	85 f6                	test   %esi,%esi
80106d0e:	0f 84 cb 00 00 00    	je     80106ddf <switchuvm+0xdf>
80106d14:	8b 46 08             	mov    0x8(%esi),%eax
80106d17:	85 c0                	test   %eax,%eax
80106d19:	0f 84 da 00 00 00    	je     80106df9 <switchuvm+0xf9>
80106d1f:	8b 46 04             	mov    0x4(%esi),%eax
80106d22:	85 c0                	test   %eax,%eax
80106d24:	0f 84 c2 00 00 00    	je     80106dec <switchuvm+0xec>
80106d2a:	e8 a1 d9 ff ff       	call   801046d0 <pushcli>
80106d2f:	e8 bc cb ff ff       	call   801038f0 <mycpu>
80106d34:	89 c3                	mov    %eax,%ebx
80106d36:	e8 b5 cb ff ff       	call   801038f0 <mycpu>
80106d3b:	89 c7                	mov    %eax,%edi
80106d3d:	e8 ae cb ff ff       	call   801038f0 <mycpu>
80106d42:	83 c7 08             	add    $0x8,%edi
80106d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106d48:	e8 a3 cb ff ff       	call   801038f0 <mycpu>
80106d4d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106d50:	ba 67 00 00 00       	mov    $0x67,%edx
80106d55:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106d5c:	83 c0 08             	add    $0x8,%eax
80106d5f:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106d66:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106d6b:	83 c1 08             	add    $0x8,%ecx
80106d6e:	c1 e8 18             	shr    $0x18,%eax
80106d71:	c1 e9 10             	shr    $0x10,%ecx
80106d74:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106d7a:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106d80:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106d85:	66 89 8b 9d 00 00 00 	mov    %cx,0x9d(%ebx)
80106d8c:	bb 10 00 00 00       	mov    $0x10,%ebx
80106d91:	e8 5a cb ff ff       	call   801038f0 <mycpu>
80106d96:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106d9d:	e8 4e cb ff ff       	call   801038f0 <mycpu>
80106da2:	66 89 58 10          	mov    %bx,0x10(%eax)
80106da6:	8b 5e 08             	mov    0x8(%esi),%ebx
80106da9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106daf:	e8 3c cb ff ff       	call   801038f0 <mycpu>
80106db4:	89 58 0c             	mov    %ebx,0xc(%eax)
80106db7:	e8 34 cb ff ff       	call   801038f0 <mycpu>
80106dbc:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106dc0:	b8 28 00 00 00       	mov    $0x28,%eax
80106dc5:	0f 00 d8             	ltr    %ax
80106dc8:	8b 46 04             	mov    0x4(%esi),%eax
80106dcb:	05 00 00 00 80       	add    $0x80000000,%eax
80106dd0:	0f 22 d8             	mov    %eax,%cr3
80106dd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dd6:	5b                   	pop    %ebx
80106dd7:	5e                   	pop    %esi
80106dd8:	5f                   	pop    %edi
80106dd9:	5d                   	pop    %ebp
80106dda:	e9 41 d9 ff ff       	jmp    80104720 <popcli>
80106ddf:	83 ec 0c             	sub    $0xc,%esp
80106de2:	68 76 7d 10 80       	push   $0x80107d76
80106de7:	e8 94 95 ff ff       	call   80100380 <panic>
80106dec:	83 ec 0c             	sub    $0xc,%esp
80106def:	68 a1 7d 10 80       	push   $0x80107da1
80106df4:	e8 87 95 ff ff       	call   80100380 <panic>
80106df9:	83 ec 0c             	sub    $0xc,%esp
80106dfc:	68 8c 7d 10 80       	push   $0x80107d8c
80106e01:	e8 7a 95 ff ff       	call   80100380 <panic>
80106e06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e0d:	8d 76 00             	lea    0x0(%esi),%esi

80106e10 <inituvm>:
80106e10:	55                   	push   %ebp
80106e11:	89 e5                	mov    %esp,%ebp
80106e13:	57                   	push   %edi
80106e14:	56                   	push   %esi
80106e15:	53                   	push   %ebx
80106e16:	83 ec 1c             	sub    $0x1c,%esp
80106e19:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e1c:	8b 75 10             	mov    0x10(%ebp),%esi
80106e1f:	8b 7d 08             	mov    0x8(%ebp),%edi
80106e22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106e25:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106e2b:	77 4b                	ja     80106e78 <inituvm+0x68>
80106e2d:	e8 4e b8 ff ff       	call   80102680 <kalloc>
80106e32:	83 ec 04             	sub    $0x4,%esp
80106e35:	68 00 10 00 00       	push   $0x1000
80106e3a:	89 c3                	mov    %eax,%ebx
80106e3c:	6a 00                	push   $0x0
80106e3e:	50                   	push   %eax
80106e3f:	e8 9c da ff ff       	call   801048e0 <memset>
80106e44:	58                   	pop    %eax
80106e45:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106e4b:	5a                   	pop    %edx
80106e4c:	6a 06                	push   $0x6
80106e4e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e53:	31 d2                	xor    %edx,%edx
80106e55:	50                   	push   %eax
80106e56:	89 f8                	mov    %edi,%eax
80106e58:	e8 13 fd ff ff       	call   80106b70 <mappages>
80106e5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e60:	89 75 10             	mov    %esi,0x10(%ebp)
80106e63:	83 c4 10             	add    $0x10,%esp
80106e66:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106e69:	89 45 0c             	mov    %eax,0xc(%ebp)
80106e6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e6f:	5b                   	pop    %ebx
80106e70:	5e                   	pop    %esi
80106e71:	5f                   	pop    %edi
80106e72:	5d                   	pop    %ebp
80106e73:	e9 08 db ff ff       	jmp    80104980 <memmove>
80106e78:	83 ec 0c             	sub    $0xc,%esp
80106e7b:	68 b5 7d 10 80       	push   $0x80107db5
80106e80:	e8 fb 94 ff ff       	call   80100380 <panic>
80106e85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e90 <loaduvm>:
80106e90:	55                   	push   %ebp
80106e91:	89 e5                	mov    %esp,%ebp
80106e93:	57                   	push   %edi
80106e94:	56                   	push   %esi
80106e95:	53                   	push   %ebx
80106e96:	83 ec 1c             	sub    $0x1c,%esp
80106e99:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e9c:	8b 75 18             	mov    0x18(%ebp),%esi
80106e9f:	a9 ff 0f 00 00       	test   $0xfff,%eax
80106ea4:	0f 85 bb 00 00 00    	jne    80106f65 <loaduvm+0xd5>
80106eaa:	01 f0                	add    %esi,%eax
80106eac:	89 f3                	mov    %esi,%ebx
80106eae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106eb1:	8b 45 14             	mov    0x14(%ebp),%eax
80106eb4:	01 f0                	add    %esi,%eax
80106eb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106eb9:	85 f6                	test   %esi,%esi
80106ebb:	0f 84 87 00 00 00    	je     80106f48 <loaduvm+0xb8>
80106ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ec8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106ecb:	8b 4d 08             	mov    0x8(%ebp),%ecx
80106ece:	29 d8                	sub    %ebx,%eax
80106ed0:	89 c2                	mov    %eax,%edx
80106ed2:	c1 ea 16             	shr    $0x16,%edx
80106ed5:	8b 14 91             	mov    (%ecx,%edx,4),%edx
80106ed8:	f6 c2 01             	test   $0x1,%dl
80106edb:	75 13                	jne    80106ef0 <loaduvm+0x60>
80106edd:	83 ec 0c             	sub    $0xc,%esp
80106ee0:	68 cf 7d 10 80       	push   $0x80107dcf
80106ee5:	e8 96 94 ff ff       	call   80100380 <panic>
80106eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ef0:	c1 e8 0a             	shr    $0xa,%eax
80106ef3:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106ef9:	25 fc 0f 00 00       	and    $0xffc,%eax
80106efe:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
80106f05:	85 c0                	test   %eax,%eax
80106f07:	74 d4                	je     80106edd <loaduvm+0x4d>
80106f09:	8b 00                	mov    (%eax),%eax
80106f0b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80106f0e:	bf 00 10 00 00       	mov    $0x1000,%edi
80106f13:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106f18:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106f1e:	0f 46 fb             	cmovbe %ebx,%edi
80106f21:	29 d9                	sub    %ebx,%ecx
80106f23:	05 00 00 00 80       	add    $0x80000000,%eax
80106f28:	57                   	push   %edi
80106f29:	51                   	push   %ecx
80106f2a:	50                   	push   %eax
80106f2b:	ff 75 10             	push   0x10(%ebp)
80106f2e:	e8 5d ab ff ff       	call   80101a90 <readi>
80106f33:	83 c4 10             	add    $0x10,%esp
80106f36:	39 f8                	cmp    %edi,%eax
80106f38:	75 1e                	jne    80106f58 <loaduvm+0xc8>
80106f3a:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106f40:	89 f0                	mov    %esi,%eax
80106f42:	29 d8                	sub    %ebx,%eax
80106f44:	39 c6                	cmp    %eax,%esi
80106f46:	77 80                	ja     80106ec8 <loaduvm+0x38>
80106f48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f4b:	31 c0                	xor    %eax,%eax
80106f4d:	5b                   	pop    %ebx
80106f4e:	5e                   	pop    %esi
80106f4f:	5f                   	pop    %edi
80106f50:	5d                   	pop    %ebp
80106f51:	c3                   	ret    
80106f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f60:	5b                   	pop    %ebx
80106f61:	5e                   	pop    %esi
80106f62:	5f                   	pop    %edi
80106f63:	5d                   	pop    %ebp
80106f64:	c3                   	ret    
80106f65:	83 ec 0c             	sub    $0xc,%esp
80106f68:	68 70 7e 10 80       	push   $0x80107e70
80106f6d:	e8 0e 94 ff ff       	call   80100380 <panic>
80106f72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f80 <allocuvm>:
80106f80:	55                   	push   %ebp
80106f81:	89 e5                	mov    %esp,%ebp
80106f83:	57                   	push   %edi
80106f84:	56                   	push   %esi
80106f85:	53                   	push   %ebx
80106f86:	83 ec 1c             	sub    $0x1c,%esp
80106f89:	8b 45 10             	mov    0x10(%ebp),%eax
80106f8c:	8b 7d 08             	mov    0x8(%ebp),%edi
80106f8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106f92:	85 c0                	test   %eax,%eax
80106f94:	0f 88 b6 00 00 00    	js     80107050 <allocuvm+0xd0>
80106f9a:	3b 45 0c             	cmp    0xc(%ebp),%eax
80106f9d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106fa0:	0f 82 9a 00 00 00    	jb     80107040 <allocuvm+0xc0>
80106fa6:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
80106fac:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106fb2:	39 75 10             	cmp    %esi,0x10(%ebp)
80106fb5:	77 44                	ja     80106ffb <allocuvm+0x7b>
80106fb7:	e9 87 00 00 00       	jmp    80107043 <allocuvm+0xc3>
80106fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106fc0:	83 ec 04             	sub    $0x4,%esp
80106fc3:	68 00 10 00 00       	push   $0x1000
80106fc8:	6a 00                	push   $0x0
80106fca:	50                   	push   %eax
80106fcb:	e8 10 d9 ff ff       	call   801048e0 <memset>
80106fd0:	58                   	pop    %eax
80106fd1:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106fd7:	5a                   	pop    %edx
80106fd8:	6a 06                	push   $0x6
80106fda:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106fdf:	89 f2                	mov    %esi,%edx
80106fe1:	50                   	push   %eax
80106fe2:	89 f8                	mov    %edi,%eax
80106fe4:	e8 87 fb ff ff       	call   80106b70 <mappages>
80106fe9:	83 c4 10             	add    $0x10,%esp
80106fec:	85 c0                	test   %eax,%eax
80106fee:	78 78                	js     80107068 <allocuvm+0xe8>
80106ff0:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106ff6:	39 75 10             	cmp    %esi,0x10(%ebp)
80106ff9:	76 48                	jbe    80107043 <allocuvm+0xc3>
80106ffb:	e8 80 b6 ff ff       	call   80102680 <kalloc>
80107000:	89 c3                	mov    %eax,%ebx
80107002:	85 c0                	test   %eax,%eax
80107004:	75 ba                	jne    80106fc0 <allocuvm+0x40>
80107006:	83 ec 0c             	sub    $0xc,%esp
80107009:	68 ed 7d 10 80       	push   $0x80107ded
8010700e:	e8 8d 96 ff ff       	call   801006a0 <cprintf>
80107013:	8b 45 0c             	mov    0xc(%ebp),%eax
80107016:	83 c4 10             	add    $0x10,%esp
80107019:	39 45 10             	cmp    %eax,0x10(%ebp)
8010701c:	74 32                	je     80107050 <allocuvm+0xd0>
8010701e:	8b 55 10             	mov    0x10(%ebp),%edx
80107021:	89 c1                	mov    %eax,%ecx
80107023:	89 f8                	mov    %edi,%eax
80107025:	e8 96 fa ff ff       	call   80106ac0 <deallocuvm.part.0>
8010702a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80107031:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107034:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107037:	5b                   	pop    %ebx
80107038:	5e                   	pop    %esi
80107039:	5f                   	pop    %edi
8010703a:	5d                   	pop    %ebp
8010703b:	c3                   	ret    
8010703c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107040:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107043:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107046:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107049:	5b                   	pop    %ebx
8010704a:	5e                   	pop    %esi
8010704b:	5f                   	pop    %edi
8010704c:	5d                   	pop    %ebp
8010704d:	c3                   	ret    
8010704e:	66 90                	xchg   %ax,%ax
80107050:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80107057:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010705a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010705d:	5b                   	pop    %ebx
8010705e:	5e                   	pop    %esi
8010705f:	5f                   	pop    %edi
80107060:	5d                   	pop    %ebp
80107061:	c3                   	ret    
80107062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107068:	83 ec 0c             	sub    $0xc,%esp
8010706b:	68 05 7e 10 80       	push   $0x80107e05
80107070:	e8 2b 96 ff ff       	call   801006a0 <cprintf>
80107075:	8b 45 0c             	mov    0xc(%ebp),%eax
80107078:	83 c4 10             	add    $0x10,%esp
8010707b:	39 45 10             	cmp    %eax,0x10(%ebp)
8010707e:	74 0c                	je     8010708c <allocuvm+0x10c>
80107080:	8b 55 10             	mov    0x10(%ebp),%edx
80107083:	89 c1                	mov    %eax,%ecx
80107085:	89 f8                	mov    %edi,%eax
80107087:	e8 34 fa ff ff       	call   80106ac0 <deallocuvm.part.0>
8010708c:	83 ec 0c             	sub    $0xc,%esp
8010708f:	53                   	push   %ebx
80107090:	e8 2b b4 ff ff       	call   801024c0 <kfree>
80107095:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010709c:	83 c4 10             	add    $0x10,%esp
8010709f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801070a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070a5:	5b                   	pop    %ebx
801070a6:	5e                   	pop    %esi
801070a7:	5f                   	pop    %edi
801070a8:	5d                   	pop    %ebp
801070a9:	c3                   	ret    
801070aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801070b0 <deallocuvm>:
801070b0:	55                   	push   %ebp
801070b1:	89 e5                	mov    %esp,%ebp
801070b3:	8b 55 0c             	mov    0xc(%ebp),%edx
801070b6:	8b 4d 10             	mov    0x10(%ebp),%ecx
801070b9:	8b 45 08             	mov    0x8(%ebp),%eax
801070bc:	39 d1                	cmp    %edx,%ecx
801070be:	73 10                	jae    801070d0 <deallocuvm+0x20>
801070c0:	5d                   	pop    %ebp
801070c1:	e9 fa f9 ff ff       	jmp    80106ac0 <deallocuvm.part.0>
801070c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070cd:	8d 76 00             	lea    0x0(%esi),%esi
801070d0:	89 d0                	mov    %edx,%eax
801070d2:	5d                   	pop    %ebp
801070d3:	c3                   	ret    
801070d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801070df:	90                   	nop

801070e0 <freevm>:
801070e0:	55                   	push   %ebp
801070e1:	89 e5                	mov    %esp,%ebp
801070e3:	57                   	push   %edi
801070e4:	56                   	push   %esi
801070e5:	53                   	push   %ebx
801070e6:	83 ec 0c             	sub    $0xc,%esp
801070e9:	8b 75 08             	mov    0x8(%ebp),%esi
801070ec:	85 f6                	test   %esi,%esi
801070ee:	74 59                	je     80107149 <freevm+0x69>
801070f0:	31 c9                	xor    %ecx,%ecx
801070f2:	ba 00 00 00 80       	mov    $0x80000000,%edx
801070f7:	89 f0                	mov    %esi,%eax
801070f9:	89 f3                	mov    %esi,%ebx
801070fb:	e8 c0 f9 ff ff       	call   80106ac0 <deallocuvm.part.0>
80107100:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107106:	eb 0f                	jmp    80107117 <freevm+0x37>
80107108:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010710f:	90                   	nop
80107110:	83 c3 04             	add    $0x4,%ebx
80107113:	39 df                	cmp    %ebx,%edi
80107115:	74 23                	je     8010713a <freevm+0x5a>
80107117:	8b 03                	mov    (%ebx),%eax
80107119:	a8 01                	test   $0x1,%al
8010711b:	74 f3                	je     80107110 <freevm+0x30>
8010711d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107122:	83 ec 0c             	sub    $0xc,%esp
80107125:	83 c3 04             	add    $0x4,%ebx
80107128:	05 00 00 00 80       	add    $0x80000000,%eax
8010712d:	50                   	push   %eax
8010712e:	e8 8d b3 ff ff       	call   801024c0 <kfree>
80107133:	83 c4 10             	add    $0x10,%esp
80107136:	39 df                	cmp    %ebx,%edi
80107138:	75 dd                	jne    80107117 <freevm+0x37>
8010713a:	89 75 08             	mov    %esi,0x8(%ebp)
8010713d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107140:	5b                   	pop    %ebx
80107141:	5e                   	pop    %esi
80107142:	5f                   	pop    %edi
80107143:	5d                   	pop    %ebp
80107144:	e9 77 b3 ff ff       	jmp    801024c0 <kfree>
80107149:	83 ec 0c             	sub    $0xc,%esp
8010714c:	68 21 7e 10 80       	push   $0x80107e21
80107151:	e8 2a 92 ff ff       	call   80100380 <panic>
80107156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010715d:	8d 76 00             	lea    0x0(%esi),%esi

80107160 <setupkvm>:
80107160:	55                   	push   %ebp
80107161:	89 e5                	mov    %esp,%ebp
80107163:	56                   	push   %esi
80107164:	53                   	push   %ebx
80107165:	e8 16 b5 ff ff       	call   80102680 <kalloc>
8010716a:	89 c6                	mov    %eax,%esi
8010716c:	85 c0                	test   %eax,%eax
8010716e:	74 42                	je     801071b2 <setupkvm+0x52>
80107170:	83 ec 04             	sub    $0x4,%esp
80107173:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80107178:	68 00 10 00 00       	push   $0x1000
8010717d:	6a 00                	push   $0x0
8010717f:	50                   	push   %eax
80107180:	e8 5b d7 ff ff       	call   801048e0 <memset>
80107185:	83 c4 10             	add    $0x10,%esp
80107188:	8b 43 04             	mov    0x4(%ebx),%eax
8010718b:	83 ec 08             	sub    $0x8,%esp
8010718e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80107191:	ff 73 0c             	push   0xc(%ebx)
80107194:	8b 13                	mov    (%ebx),%edx
80107196:	50                   	push   %eax
80107197:	29 c1                	sub    %eax,%ecx
80107199:	89 f0                	mov    %esi,%eax
8010719b:	e8 d0 f9 ff ff       	call   80106b70 <mappages>
801071a0:	83 c4 10             	add    $0x10,%esp
801071a3:	85 c0                	test   %eax,%eax
801071a5:	78 19                	js     801071c0 <setupkvm+0x60>
801071a7:	83 c3 10             	add    $0x10,%ebx
801071aa:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
801071b0:	75 d6                	jne    80107188 <setupkvm+0x28>
801071b2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801071b5:	89 f0                	mov    %esi,%eax
801071b7:	5b                   	pop    %ebx
801071b8:	5e                   	pop    %esi
801071b9:	5d                   	pop    %ebp
801071ba:	c3                   	ret    
801071bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801071bf:	90                   	nop
801071c0:	83 ec 0c             	sub    $0xc,%esp
801071c3:	56                   	push   %esi
801071c4:	31 f6                	xor    %esi,%esi
801071c6:	e8 15 ff ff ff       	call   801070e0 <freevm>
801071cb:	83 c4 10             	add    $0x10,%esp
801071ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
801071d1:	89 f0                	mov    %esi,%eax
801071d3:	5b                   	pop    %ebx
801071d4:	5e                   	pop    %esi
801071d5:	5d                   	pop    %ebp
801071d6:	c3                   	ret    
801071d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071de:	66 90                	xchg   %ax,%ax

801071e0 <kvmalloc>:
801071e0:	55                   	push   %ebp
801071e1:	89 e5                	mov    %esp,%ebp
801071e3:	83 ec 08             	sub    $0x8,%esp
801071e6:	e8 75 ff ff ff       	call   80107160 <setupkvm>
801071eb:	a3 c4 45 11 80       	mov    %eax,0x801145c4
801071f0:	05 00 00 00 80       	add    $0x80000000,%eax
801071f5:	0f 22 d8             	mov    %eax,%cr3
801071f8:	c9                   	leave  
801071f9:	c3                   	ret    
801071fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107200 <clearpteu>:
80107200:	55                   	push   %ebp
80107201:	89 e5                	mov    %esp,%ebp
80107203:	83 ec 08             	sub    $0x8,%esp
80107206:	8b 45 0c             	mov    0xc(%ebp),%eax
80107209:	8b 55 08             	mov    0x8(%ebp),%edx
8010720c:	89 c1                	mov    %eax,%ecx
8010720e:	c1 e9 16             	shr    $0x16,%ecx
80107211:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80107214:	f6 c2 01             	test   $0x1,%dl
80107217:	75 17                	jne    80107230 <clearpteu+0x30>
80107219:	83 ec 0c             	sub    $0xc,%esp
8010721c:	68 32 7e 10 80       	push   $0x80107e32
80107221:	e8 5a 91 ff ff       	call   80100380 <panic>
80107226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010722d:	8d 76 00             	lea    0x0(%esi),%esi
80107230:	c1 e8 0a             	shr    $0xa,%eax
80107233:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80107239:	25 fc 0f 00 00       	and    $0xffc,%eax
8010723e:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
80107245:	85 c0                	test   %eax,%eax
80107247:	74 d0                	je     80107219 <clearpteu+0x19>
80107249:	83 20 fb             	andl   $0xfffffffb,(%eax)
8010724c:	c9                   	leave  
8010724d:	c3                   	ret    
8010724e:	66 90                	xchg   %ax,%ax

80107250 <copyuvm>:
80107250:	55                   	push   %ebp
80107251:	89 e5                	mov    %esp,%ebp
80107253:	57                   	push   %edi
80107254:	56                   	push   %esi
80107255:	53                   	push   %ebx
80107256:	83 ec 1c             	sub    $0x1c,%esp
80107259:	e8 02 ff ff ff       	call   80107160 <setupkvm>
8010725e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107261:	85 c0                	test   %eax,%eax
80107263:	0f 84 bd 00 00 00    	je     80107326 <copyuvm+0xd6>
80107269:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010726c:	85 c9                	test   %ecx,%ecx
8010726e:	0f 84 b2 00 00 00    	je     80107326 <copyuvm+0xd6>
80107274:	31 f6                	xor    %esi,%esi
80107276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010727d:	8d 76 00             	lea    0x0(%esi),%esi
80107280:	8b 4d 08             	mov    0x8(%ebp),%ecx
80107283:	89 f0                	mov    %esi,%eax
80107285:	c1 e8 16             	shr    $0x16,%eax
80107288:	8b 04 81             	mov    (%ecx,%eax,4),%eax
8010728b:	a8 01                	test   $0x1,%al
8010728d:	75 11                	jne    801072a0 <copyuvm+0x50>
8010728f:	83 ec 0c             	sub    $0xc,%esp
80107292:	68 3c 7e 10 80       	push   $0x80107e3c
80107297:	e8 e4 90 ff ff       	call   80100380 <panic>
8010729c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801072a0:	89 f2                	mov    %esi,%edx
801072a2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801072a7:	c1 ea 0a             	shr    $0xa,%edx
801072aa:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801072b0:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
801072b7:	85 c0                	test   %eax,%eax
801072b9:	74 d4                	je     8010728f <copyuvm+0x3f>
801072bb:	8b 00                	mov    (%eax),%eax
801072bd:	a8 01                	test   $0x1,%al
801072bf:	0f 84 9f 00 00 00    	je     80107364 <copyuvm+0x114>
801072c5:	89 c7                	mov    %eax,%edi
801072c7:	25 ff 0f 00 00       	and    $0xfff,%eax
801072cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801072cf:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
801072d5:	e8 a6 b3 ff ff       	call   80102680 <kalloc>
801072da:	89 c3                	mov    %eax,%ebx
801072dc:	85 c0                	test   %eax,%eax
801072de:	74 64                	je     80107344 <copyuvm+0xf4>
801072e0:	83 ec 04             	sub    $0x4,%esp
801072e3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
801072e9:	68 00 10 00 00       	push   $0x1000
801072ee:	57                   	push   %edi
801072ef:	50                   	push   %eax
801072f0:	e8 8b d6 ff ff       	call   80104980 <memmove>
801072f5:	58                   	pop    %eax
801072f6:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801072fc:	5a                   	pop    %edx
801072fd:	ff 75 e4             	push   -0x1c(%ebp)
80107300:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107305:	89 f2                	mov    %esi,%edx
80107307:	50                   	push   %eax
80107308:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010730b:	e8 60 f8 ff ff       	call   80106b70 <mappages>
80107310:	83 c4 10             	add    $0x10,%esp
80107313:	85 c0                	test   %eax,%eax
80107315:	78 21                	js     80107338 <copyuvm+0xe8>
80107317:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010731d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107320:	0f 87 5a ff ff ff    	ja     80107280 <copyuvm+0x30>
80107326:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107329:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010732c:	5b                   	pop    %ebx
8010732d:	5e                   	pop    %esi
8010732e:	5f                   	pop    %edi
8010732f:	5d                   	pop    %ebp
80107330:	c3                   	ret    
80107331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107338:	83 ec 0c             	sub    $0xc,%esp
8010733b:	53                   	push   %ebx
8010733c:	e8 7f b1 ff ff       	call   801024c0 <kfree>
80107341:	83 c4 10             	add    $0x10,%esp
80107344:	83 ec 0c             	sub    $0xc,%esp
80107347:	ff 75 e0             	push   -0x20(%ebp)
8010734a:	e8 91 fd ff ff       	call   801070e0 <freevm>
8010734f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80107356:	83 c4 10             	add    $0x10,%esp
80107359:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010735c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010735f:	5b                   	pop    %ebx
80107360:	5e                   	pop    %esi
80107361:	5f                   	pop    %edi
80107362:	5d                   	pop    %ebp
80107363:	c3                   	ret    
80107364:	83 ec 0c             	sub    $0xc,%esp
80107367:	68 56 7e 10 80       	push   $0x80107e56
8010736c:	e8 0f 90 ff ff       	call   80100380 <panic>
80107371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010737f:	90                   	nop

80107380 <uva2ka>:
80107380:	55                   	push   %ebp
80107381:	89 e5                	mov    %esp,%ebp
80107383:	8b 45 0c             	mov    0xc(%ebp),%eax
80107386:	8b 55 08             	mov    0x8(%ebp),%edx
80107389:	89 c1                	mov    %eax,%ecx
8010738b:	c1 e9 16             	shr    $0x16,%ecx
8010738e:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80107391:	f6 c2 01             	test   $0x1,%dl
80107394:	0f 84 00 01 00 00    	je     8010749a <uva2ka.cold>
8010739a:	c1 e8 0c             	shr    $0xc,%eax
8010739d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801073a3:	5d                   	pop    %ebp
801073a4:	25 ff 03 00 00       	and    $0x3ff,%eax
801073a9:	8b 84 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%eax
801073b0:	89 c2                	mov    %eax,%edx
801073b2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801073b7:	83 e2 05             	and    $0x5,%edx
801073ba:	05 00 00 00 80       	add    $0x80000000,%eax
801073bf:	83 fa 05             	cmp    $0x5,%edx
801073c2:	ba 00 00 00 00       	mov    $0x0,%edx
801073c7:	0f 45 c2             	cmovne %edx,%eax
801073ca:	c3                   	ret    
801073cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801073cf:	90                   	nop

801073d0 <copyout>:
801073d0:	55                   	push   %ebp
801073d1:	89 e5                	mov    %esp,%ebp
801073d3:	57                   	push   %edi
801073d4:	56                   	push   %esi
801073d5:	53                   	push   %ebx
801073d6:	83 ec 0c             	sub    $0xc,%esp
801073d9:	8b 75 14             	mov    0x14(%ebp),%esi
801073dc:	8b 45 0c             	mov    0xc(%ebp),%eax
801073df:	8b 55 10             	mov    0x10(%ebp),%edx
801073e2:	85 f6                	test   %esi,%esi
801073e4:	75 51                	jne    80107437 <copyout+0x67>
801073e6:	e9 a5 00 00 00       	jmp    80107490 <copyout+0xc0>
801073eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801073ef:	90                   	nop
801073f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801073f6:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
801073fc:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
80107402:	74 75                	je     80107479 <copyout+0xa9>
80107404:	89 fb                	mov    %edi,%ebx
80107406:	89 55 10             	mov    %edx,0x10(%ebp)
80107409:	29 c3                	sub    %eax,%ebx
8010740b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107411:	39 f3                	cmp    %esi,%ebx
80107413:	0f 47 de             	cmova  %esi,%ebx
80107416:	29 f8                	sub    %edi,%eax
80107418:	83 ec 04             	sub    $0x4,%esp
8010741b:	01 c1                	add    %eax,%ecx
8010741d:	53                   	push   %ebx
8010741e:	52                   	push   %edx
8010741f:	51                   	push   %ecx
80107420:	e8 5b d5 ff ff       	call   80104980 <memmove>
80107425:	8b 55 10             	mov    0x10(%ebp),%edx
80107428:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
8010742e:	83 c4 10             	add    $0x10,%esp
80107431:	01 da                	add    %ebx,%edx
80107433:	29 de                	sub    %ebx,%esi
80107435:	74 59                	je     80107490 <copyout+0xc0>
80107437:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010743a:	89 c1                	mov    %eax,%ecx
8010743c:	89 c7                	mov    %eax,%edi
8010743e:	c1 e9 16             	shr    $0x16,%ecx
80107441:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80107447:	8b 0c 8b             	mov    (%ebx,%ecx,4),%ecx
8010744a:	f6 c1 01             	test   $0x1,%cl
8010744d:	0f 84 4e 00 00 00    	je     801074a1 <copyout.cold>
80107453:	89 fb                	mov    %edi,%ebx
80107455:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
8010745b:	c1 eb 0c             	shr    $0xc,%ebx
8010745e:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
80107464:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
8010746b:	89 d9                	mov    %ebx,%ecx
8010746d:	83 e1 05             	and    $0x5,%ecx
80107470:	83 f9 05             	cmp    $0x5,%ecx
80107473:	0f 84 77 ff ff ff    	je     801073f0 <copyout+0x20>
80107479:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010747c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107481:	5b                   	pop    %ebx
80107482:	5e                   	pop    %esi
80107483:	5f                   	pop    %edi
80107484:	5d                   	pop    %ebp
80107485:	c3                   	ret    
80107486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010748d:	8d 76 00             	lea    0x0(%esi),%esi
80107490:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107493:	31 c0                	xor    %eax,%eax
80107495:	5b                   	pop    %ebx
80107496:	5e                   	pop    %esi
80107497:	5f                   	pop    %edi
80107498:	5d                   	pop    %ebp
80107499:	c3                   	ret    

8010749a <uva2ka.cold>:
8010749a:	a1 00 00 00 00       	mov    0x0,%eax
8010749f:	0f 0b                	ud2    

801074a1 <copyout.cold>:
801074a1:	a1 00 00 00 00       	mov    0x0,%eax
801074a6:	0f 0b                	ud2    
