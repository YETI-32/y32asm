#subruledef register
{
	r0 => 0x0
	r1 => 0x1
	r2 => 0x2
	r3 => 0x3
	r4 => 0x4
	r5 => 0x5
	r6 => 0x6
	r7 => 0x7
	r8 => 0x8
	r9 => 0x9
	r10 => 0xA
	r11 => 0xB
	r12 => 0xC
	rbs => 0xD
	rdp => 0xE
	rsp => 0xF
}

#subruledef ifcond
{
	  s    => 0b0001
	  c    => 0b0010
	  sc   => 0b0011
	  z    => 0b0100
	  zs   => 0b0101
	  zc   => 0b0110
	  zcs  => 0b0111
	  ns   => 0b1001
	  nc   => 0b1010
	  nsc  => 0b1011
	  nz   => 0b1100
	  nzs  => 0b1101
	  nzc  => 0b1110
	  nzcs => 0b1111
}

#ruledef 
{
	nop => 0b00000000

	ldv {d: register}, {s: register} => 0b00000010 @ d @ s
	ldv {d: register}, {imm: i32}    => 0b00100010 @ 0x0 @ d @ imm

	pushd {s: register} => 0b00000011 @ 0x0 @ s
	pushd {imm: i32}    => 0b00100011 @ imm

	popd {d: register} => 0b00000100

	pushr {s: register} => 0b00000101 @ 0x0 @ s
	pushr {imm: i32}    => 0b00100101 @ imm

	getf {d: register} => 0b00000111 @ 0x0 @ d

	setf {s: register} => 0b00001000 @ 0x0 @ s

	setz => 0b00001001

	setc => 0b00001010

	sets => 0b00001011

	clz => 0b00001100

	clc => 0b00001101

	cls => 0b00001110

	add {d: register}, {s: register} => 0b01000000 @ d @ s
	add {d: register}, {imm: i32}    => 0b01100000 @ 0x0 @ d @ imm

	sub {d: register}, {s: register} => 0b01000001 @ d @ s
	sub {d: register}, {imm: i32}    => 0b01100001 @ 0x0 @ d @ imm

	mul {d: register}, {s: register} => 0b01000010 @ d @ s
	mul {d: register}, {imm: i32}    => 0b01100010 @ 0x0 @ d @ imm

	smul {d: register}, {s: register} => 0b01000011 @ d @ s
	smul {d: register}, {imm: i32}    => 0b01100011 @ 0x0 @ d @ imm

	div {d: register}, {s: register} => 0b01000100 @ d @ s
	div {d: register}, {imm: i32}    => 0b01100100 @ 0x0 @ d @ imm

	sdiv {d: register}, {s: register} => 0b01000101 @ d @ s
	sdiv {d: register}, {imm: i32}    => 0b01100101 @ 0x0 @ d @ imm

	mod {d: register}, {s: register} => 0b01000110 @ d @ s
	mod {d: register}, {imm: i32}    => 0b01100110 @ 0x0 @ d @ imm

	smod {d: register}, {s: register} => 0b01000111 @ d @ s
	smod {d: register}, {imm: i32}    => 0b01100111 @ 0x0 @ d @ imm

	and {d: register}, {s: register} => 0b01001000 @ d @ s
	and {d: register}, {imm: i32}    => 0b01101000 @ 0x0 @ d @ imm

	or {d: register}, {s: register} => 0b01001001 @ d @ s
	or {d: register}, {imm: i32}    => 0b01101001 @ 0x0 @ d @ imm

	xor {d: register}, {s: register} => 0b01001010 @ d @ s
	xor {d: register}, {imm: i32}    => 0b01101010 @ 0x0 @ d @ imm

	not {r: register} => 0b01001011 @ 0x0 @ r

	shl {d: register}, {s: register} => 0b01001100 @ d @ s
	shl {d: register}, {imm: i32}    => 0b01101100 @ 0x0 @ d @ imm

	shr {d: register}, {s: register} => 0b01001101 @ d @ s
	shr {d: register}, {imm: i32}    => 0b01101101 @ 0x0 @ d @ imm

	inc {d: register} => 0b01001110 @ 0x0 @ d

	dec {d: register} => 0b01001111 @ 0x0 @ d

	cmp {d: register}, {s: register} => 0b01001000 @ d @ s
	cmp {d: register}, {imm: i32}    => 0b01101000 @ 0x0 @ d @ imm

	scmp {d: register}, {s: register} => 0b01001001 @ d @ s
	scmp {d: register}, {imm: i32}    => 0b01101001 @ 0x0 @ d @ imm

	; Memory instructions use this format for their opcode: `10I0OSSB`, where:
	; - I = See above
	; - O = Operation, 1 = write, 0 = read
	; - S = Size, 0 = 8-bit, 1 = 16-bit, 2 = 32-bit
	; - B = If 1, then the value of the rbs register is added to the address

	rd.8 {d: register}, {s: register} => 0b10000000 @ d @ s
	rd.8 {d: register}, {imm: i32}    => 0b10100000 @ 0x0 @ d @ imm

	rd.16 {d: register}, {s: register} => 0b10000010 @ d @ s
	rd.16 {d: register}, {imm: i32}    => 0b10100010 @ 0x0 @ d @ imm

	rd.32 {d: register}, {s: register} => 0b10000100 @ d @ s
	rd.32 {d: register}, {imm: i32}    => 0b10100100 @ 0x0 @ d @ imm

	rdb.8 {d: register}, {s: register} => 0b10000001 @ d @ s
	rdb.8 {d: register}, {imm: i32}    => 0b10100001 @ 0x0 @ d @ imm

	rdb.16 {d: register}, {s: register} => 0b10000011 @ d @ s
	rdb.16 {d: register}, {imm: i32}    => 0b10100011 @ 0x0 @ d @ imm

	rdb.32 {d: register}, {s: register} => 0b10000101 @ d @ s
	rdb.32 {d: register}, {imm: i32}    => 0b10100101 @ 0x0 @ d @ imm

	wr.8 {d: register}, {s: register} => 0b10001000 @ d @ s
	wr.8 {d: register}, {imm: i32}    => 0b10101000 @ 0x0 @ d @ imm

	wr.16 {d: register}, {s: register} => 0b10001010 @ d @ s
	wr.16 {d: register}, {imm: i32}    => 0b10101010 @ 0x0 @ d @ imm

	wr.32 {d: register}, {s: register} => 0b10001100 @ d @ s
	wr.32 {d: register}, {imm: i32}    => 0b10101100 @ 0x0 @ d @ imm

	wrb.8 {d: register}, {s: register} => 0b10001001 @ d @ s
	wrb.8 {d: register}, {imm: i32}    => 0b10101001 @ 0x0 @ d @ imm

	wrb.16 {d: register}, {s: register} => 0b10001011 @ d @ s
	wrb.16 {d: register}, {imm: i32}    => 0b10101011 @ 0x0 @ d @ imm

	wrb.32 {d: register}, {s: register} => 0b10001101 @ d @ s
	wrb.32 {d: register}, {imm: i32}    => 0b10101101 @ 0x0 @ d @ imm

	jmp {imm: i32} => 0b11000000 @ imm

	jmpb {imm: i32} => 0b11000001 @ imm

	if{f: ifcond} => 0b1110 @ ifcond

	call {imm: i32} => 0b11010000 @ imm

	callb {imm: i32} => 0b11010001 @ imm

	ret => 0b11010010

	int {interrupt: u8} => 0b11010011 @ interrupt

	hlt => 0b11010100
}


#bankdef code
{
	#bits 32
}

#bank code
