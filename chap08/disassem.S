
fib:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .text:

0000000000401020 <_start>:
  401020:	f3 0f 1e fa          	endbr64 
  401024:	31 ed                	xor    %ebp,%ebp
  401026:	49 89 d1             	mov    %rdx,%r9
  401029:	5e                   	pop    %rsi
  40102a:	48 89 e2             	mov    %rsp,%rdx
  40102d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401031:	50                   	push   %rax
  401032:	54                   	push   %rsp
  401033:	49 c7 c0 10 12 40 00 	mov    $0x401210,%r8
  40103a:	48 c7 c1 a0 11 40 00 	mov    $0x4011a0,%rcx
  401041:	48 c7 c7 80 11 40 00 	mov    $0x401180,%rdi
  401048:	ff 15 a2 2f 00 00    	callq  *0x2fa2(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40104e:	f4                   	hlt    
  40104f:	90                   	nop

0000000000401050 <_dl_relocate_static_pie>:
  401050:	f3 0f 1e fa          	endbr64 
  401054:	c3                   	retq   
  401055:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40105c:	00 00 00 
  40105f:	90                   	nop

0000000000401060 <deregister_tm_clones>:
  401060:	b8 28 40 40 00       	mov    $0x404028,%eax
  401065:	48 3d 28 40 40 00    	cmp    $0x404028,%rax
  40106b:	74 13                	je     401080 <deregister_tm_clones+0x20>
  40106d:	b8 00 00 00 00       	mov    $0x0,%eax
  401072:	48 85 c0             	test   %rax,%rax
  401075:	74 09                	je     401080 <deregister_tm_clones+0x20>
  401077:	bf 28 40 40 00       	mov    $0x404028,%edi
  40107c:	ff e0                	jmpq   *%rax
  40107e:	66 90                	xchg   %ax,%ax
  401080:	c3                   	retq   
  401081:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401088:	00 00 00 00 
  40108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401090 <register_tm_clones>:
  401090:	be 28 40 40 00       	mov    $0x404028,%esi
  401095:	48 81 ee 28 40 40 00 	sub    $0x404028,%rsi
  40109c:	48 89 f0             	mov    %rsi,%rax
  40109f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4010a3:	48 c1 f8 03          	sar    $0x3,%rax
  4010a7:	48 01 c6             	add    %rax,%rsi
  4010aa:	48 d1 fe             	sar    %rsi
  4010ad:	74 11                	je     4010c0 <register_tm_clones+0x30>
  4010af:	b8 00 00 00 00       	mov    $0x0,%eax
  4010b4:	48 85 c0             	test   %rax,%rax
  4010b7:	74 07                	je     4010c0 <register_tm_clones+0x30>
  4010b9:	bf 28 40 40 00       	mov    $0x404028,%edi
  4010be:	ff e0                	jmpq   *%rax
  4010c0:	c3                   	retq   
  4010c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010c8:	00 00 00 00 
  4010cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004010d0 <__do_global_dtors_aux>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	80 3d 4d 2f 00 00 00 	cmpb   $0x0,0x2f4d(%rip)        # 404028 <__TMC_END__>
  4010db:	75 13                	jne    4010f0 <__do_global_dtors_aux+0x20>
  4010dd:	55                   	push   %rbp
  4010de:	48 89 e5             	mov    %rsp,%rbp
  4010e1:	e8 7a ff ff ff       	callq  401060 <deregister_tm_clones>
  4010e6:	c6 05 3b 2f 00 00 01 	movb   $0x1,0x2f3b(%rip)        # 404028 <__TMC_END__>
  4010ed:	5d                   	pop    %rbp
  4010ee:	c3                   	retq   
  4010ef:	90                   	nop
  4010f0:	c3                   	retq   
  4010f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010f8:	00 00 00 00 
  4010fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401100 <frame_dummy>:
  401100:	f3 0f 1e fa          	endbr64 
  401104:	eb 8a                	jmp    401090 <register_tm_clones>
  401106:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40110d:	00 00 00 

0000000000401110 <fib>:
#include <stdint.h>

int64_t fib(int64_t n) {
  401110:	55                   	push   %rbp
  401111:	48 89 e5             	mov    %rsp,%rbp
  401114:	48 83 ec 20          	sub    $0x20,%rsp
  401118:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    if (n < 2)
  40111c:	48 83 7d f0 02       	cmpq   $0x2,-0x10(%rbp)
  401121:	0f 8d 0d 00 00 00    	jge    401134 <fib+0x24>
	    return n;
  401127:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40112b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40112f:	e9 34 00 00 00       	jmpq   401168 <fib+0x58>
    return (fib(n-1) + fib(n-2));
  401134:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401138:	48 2d 01 00 00 00    	sub    $0x1,%rax
  40113e:	48 89 c7             	mov    %rax,%rdi
  401141:	e8 ca ff ff ff       	callq  401110 <fib>
  401146:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  40114a:	48 81 e9 02 00 00 00 	sub    $0x2,%rcx
  401151:	48 89 cf             	mov    %rcx,%rdi
  401154:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  401158:	e8 b3 ff ff ff       	callq  401110 <fib>
  40115d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  401161:	48 01 c1             	add    %rax,%rcx
  401164:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
}
  401168:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40116c:	48 83 c4 20          	add    $0x20,%rsp
  401170:	5d                   	pop    %rbp
  401171:	c3                   	retq   
  401172:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401179:	00 00 00 
  40117c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401180 <main>:

int main()
{
  401180:	55                   	push   %rbp
  401181:	48 89 e5             	mov    %rsp,%rbp
  401184:	48 83 ec 10          	sub    $0x10,%rsp
  401188:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
	return fib(10);
  40118f:	bf 0a 00 00 00       	mov    $0xa,%edi
  401194:	e8 77 ff ff ff       	callq  401110 <fib>
  401199:	48 83 c4 10          	add    $0x10,%rsp
  40119d:	5d                   	pop    %rbp
  40119e:	c3                   	retq   
  40119f:	90                   	nop

00000000004011a0 <__libc_csu_init>:
  4011a0:	f3 0f 1e fa          	endbr64 
  4011a4:	41 57                	push   %r15
  4011a6:	4c 8d 3d a3 2c 00 00 	lea    0x2ca3(%rip),%r15        # 403e50 <__frame_dummy_init_array_entry>
  4011ad:	41 56                	push   %r14
  4011af:	49 89 d6             	mov    %rdx,%r14
  4011b2:	41 55                	push   %r13
  4011b4:	49 89 f5             	mov    %rsi,%r13
  4011b7:	41 54                	push   %r12
  4011b9:	41 89 fc             	mov    %edi,%r12d
  4011bc:	55                   	push   %rbp
  4011bd:	48 8d 2d 94 2c 00 00 	lea    0x2c94(%rip),%rbp        # 403e58 <__do_global_dtors_aux_fini_array_entry>
  4011c4:	53                   	push   %rbx
  4011c5:	4c 29 fd             	sub    %r15,%rbp
  4011c8:	48 83 ec 08          	sub    $0x8,%rsp
  4011cc:	e8 2f fe ff ff       	callq  401000 <_init>
  4011d1:	48 c1 fd 03          	sar    $0x3,%rbp
  4011d5:	74 1f                	je     4011f6 <__libc_csu_init+0x56>
  4011d7:	31 db                	xor    %ebx,%ebx
  4011d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4011e0:	4c 89 f2             	mov    %r14,%rdx
  4011e3:	4c 89 ee             	mov    %r13,%rsi
  4011e6:	44 89 e7             	mov    %r12d,%edi
  4011e9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  4011ed:	48 83 c3 01          	add    $0x1,%rbx
  4011f1:	48 39 dd             	cmp    %rbx,%rbp
  4011f4:	75 ea                	jne    4011e0 <__libc_csu_init+0x40>
  4011f6:	48 83 c4 08          	add    $0x8,%rsp
  4011fa:	5b                   	pop    %rbx
  4011fb:	5d                   	pop    %rbp
  4011fc:	41 5c                	pop    %r12
  4011fe:	41 5d                	pop    %r13
  401200:	41 5e                	pop    %r14
  401202:	41 5f                	pop    %r15
  401204:	c3                   	retq   
  401205:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40120c:	00 00 00 00 

0000000000401210 <__libc_csu_fini>:
  401210:	f3 0f 1e fa          	endbr64 
  401214:	c3                   	retq   

Disassembly of section .fini:

0000000000401218 <_fini>:
  401218:	f3 0f 1e fa          	endbr64 
  40121c:	48 83 ec 08          	sub    $0x8,%rsp
  401220:	48 83 c4 08          	add    $0x8,%rsp
  401224:	c3                   	retq   
