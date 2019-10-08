////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: ddsc.v
// /___/   /\     Timestamp: Mon Sep 30 18:37:12 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog "C:/Users/Ying Yu/Desktop/Mojo_v3/panasonic/ipcore_dir/tmp/_cg/ddsc.ngc" "C:/Users/Ying Yu/Desktop/Mojo_v3/panasonic/ipcore_dir/tmp/_cg/ddsc.v" 
// Device	: 6slx9tqg144-3
// Input file	: C:/Users/Ying Yu/Desktop/Mojo_v3/panasonic/ipcore_dir/tmp/_cg/ddsc.ngc
// Output file	: C:/Users/Ying Yu/Desktop/Mojo_v3/panasonic/ipcore_dir/tmp/_cg/ddsc.v
// # of Modules	: 1
// Design Name	: ddsc
// Xilinx        : C:\Xilinx\14.6\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ddsc (
  clk, sclr, pinc_in, poff_in, cosine, phase_out
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input sclr;
  input [31 : 0] pinc_in;
  input [31 : 0] poff_in;
  output [9 : 0] cosine;
  output [31 : 0] phase_out;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire \blk00000044/sig00000168 ;
  wire \blk00000044/sig00000167 ;
  wire \blk00000044/sig00000166 ;
  wire \blk00000044/sig00000165 ;
  wire \blk00000044/sig00000164 ;
  wire \blk00000044/sig00000163 ;
  wire \blk00000044/sig00000162 ;
  wire \blk00000044/sig00000161 ;
  wire \blk00000044/sig00000160 ;
  wire \blk00000044/sig0000015f ;
  wire \blk00000044/sig0000015e ;
  wire \blk00000044/sig0000015d ;
  wire \blk00000044/sig0000015c ;
  wire \blk00000044/sig0000015b ;
  wire \blk00000044/sig0000015a ;
  wire \blk00000044/sig00000159 ;
  wire \blk00000044/sig00000158 ;
  wire \blk00000044/sig00000157 ;
  wire \blk00000044/sig00000156 ;
  wire \blk00000044/sig00000155 ;
  wire \blk00000044/sig00000154 ;
  wire \blk00000044/sig00000153 ;
  wire \blk00000044/sig00000152 ;
  wire \blk00000044/sig00000151 ;
  wire \blk00000044/sig00000150 ;
  wire \blk00000044/sig0000014f ;
  wire \blk00000044/sig0000014e ;
  wire \blk00000044/sig0000014d ;
  wire \blk00000044/sig0000014c ;
  wire \blk00000044/sig0000014b ;
  wire \blk00000044/sig0000014a ;
  wire \blk00000044/sig00000149 ;
  wire \blk00000044/sig00000148 ;
  wire \blk00000044/sig00000147 ;
  wire \blk00000044/sig00000146 ;
  wire \blk00000044/sig00000145 ;
  wire \blk00000044/sig00000144 ;
  wire \blk00000044/sig00000143 ;
  wire \blk00000044/sig00000142 ;
  wire \blk00000044/sig00000141 ;
  wire \blk00000044/sig00000140 ;
  wire \blk00000044/sig0000013f ;
  wire \blk00000044/sig0000013e ;
  wire \blk00000044/sig0000013d ;
  wire \blk00000044/sig0000013c ;
  wire \blk00000044/sig0000013b ;
  wire \blk00000044/sig0000013a ;
  wire \blk00000044/sig00000139 ;
  wire \blk00000044/sig00000138 ;
  wire \blk00000044/sig00000137 ;
  wire \blk00000044/sig00000136 ;
  wire \blk00000044/sig00000135 ;
  wire \blk00000044/sig00000134 ;
  wire \blk00000044/sig00000133 ;
  wire \blk00000044/sig00000132 ;
  wire \blk00000044/sig00000131 ;
  wire \blk00000044/sig00000130 ;
  wire \blk00000044/sig0000012f ;
  wire \blk00000044/sig0000012e ;
  wire \blk00000044/sig0000012d ;
  wire \blk00000044/sig0000012c ;
  wire \blk00000044/sig0000012b ;
  wire \blk00000044/sig0000012a ;
  wire \blk000000a5/sig00000209 ;
  wire \blk000000a5/sig00000208 ;
  wire \blk000000a5/sig00000207 ;
  wire \blk000000a5/sig00000206 ;
  wire \blk000000a5/sig00000205 ;
  wire \blk000000a5/sig00000204 ;
  wire \blk000000a5/sig00000203 ;
  wire \blk000000a5/sig00000202 ;
  wire \blk000000a5/sig00000201 ;
  wire \blk000000a5/sig00000200 ;
  wire \blk000000a5/sig000001ff ;
  wire \blk000000a5/sig000001fe ;
  wire \blk000000a5/sig000001fd ;
  wire \blk000000a5/sig000001fc ;
  wire \blk000000a5/sig000001fb ;
  wire \blk000000a5/sig000001fa ;
  wire \blk000000a5/sig000001f9 ;
  wire \blk000000a5/sig000001f8 ;
  wire \blk000000a5/sig000001f7 ;
  wire \blk000000a5/sig000001f6 ;
  wire \blk000000a5/sig000001f5 ;
  wire \blk000000a5/sig000001f4 ;
  wire \blk000000a5/sig000001f3 ;
  wire \blk000000a5/sig000001f2 ;
  wire \blk000000a5/sig000001f1 ;
  wire \blk000000a5/sig000001f0 ;
  wire \blk000000a5/sig000001ef ;
  wire \blk000000a5/sig000001ee ;
  wire \blk000000a5/sig000001ed ;
  wire \blk000000a5/sig000001ec ;
  wire \blk000000a5/sig000001eb ;
  wire \blk000000a5/sig000001ea ;
  wire \blk000000a5/sig000001e9 ;
  wire \blk000000a5/sig000001e8 ;
  wire \blk000000a5/sig000001e7 ;
  wire \blk000000a5/sig000001e6 ;
  wire \blk000000a5/sig000001e5 ;
  wire \blk000000a5/sig000001e4 ;
  wire \blk000000a5/sig000001e3 ;
  wire \blk000000a5/sig000001e2 ;
  wire \blk000000a5/sig000001e1 ;
  wire \blk000000a5/sig000001e0 ;
  wire \blk000000a5/sig000001df ;
  wire \blk000000a5/sig000001de ;
  wire \blk000000a5/sig000001dd ;
  wire \blk000000a5/sig000001dc ;
  wire \blk000000a5/sig000001db ;
  wire \blk000000a5/sig000001da ;
  wire \blk000000a5/sig000001d9 ;
  wire \blk000000a5/sig000001d8 ;
  wire \blk000000a5/sig000001d7 ;
  wire \blk000000a5/sig000001d6 ;
  wire \blk000000a5/sig000001d5 ;
  wire \blk000000a5/sig000001d4 ;
  wire \blk000000a5/sig000001d3 ;
  wire \blk000000a5/sig000001d2 ;
  wire \blk000000a5/sig000001d1 ;
  wire \blk000000a5/sig000001d0 ;
  wire \blk000000a5/sig000001cf ;
  wire \blk000000a5/sig000001ce ;
  wire \blk000000a5/sig000001cd ;
  wire \blk000000a5/sig000001cc ;
  wire \blk000000a5/sig000001cb ;
  wire \NLW_blk00000169_DIPA<3>_UNCONNECTED ;
  wire \NLW_blk00000169_DIPA<2>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<31>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<30>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<29>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<28>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<27>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<26>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<25>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<24>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<23>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<22>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<21>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<20>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<19>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<18>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<17>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<16>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<15>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<14>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<13>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<12>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<11>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<10>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<9>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<8>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<7>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<6>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<5>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<4>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<3>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<2>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<1>_UNCONNECTED ;
  wire \NLW_blk00000169_DOA<0>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRA<3>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRA<2>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRA<1>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRA<0>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRB<3>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRB<2>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRB<1>_UNCONNECTED ;
  wire \NLW_blk00000169_ADDRB<0>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<31>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<30>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<29>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<28>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<27>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<26>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<25>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<24>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<23>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<22>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<21>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<20>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<19>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<18>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<17>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<16>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<15>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<14>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<13>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<12>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<11>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<10>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<9>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<8>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<7>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<6>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<5>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<4>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<3>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<2>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<1>_UNCONNECTED ;
  wire \NLW_blk00000169_DIB<0>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPA<3>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPA<2>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPA<1>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPA<0>_UNCONNECTED ;
  wire \NLW_blk00000169_DIPB<3>_UNCONNECTED ;
  wire \NLW_blk00000169_DIPB<2>_UNCONNECTED ;
  wire \NLW_blk00000169_DIPB<1>_UNCONNECTED ;
  wire \NLW_blk00000169_DIPB<0>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPB<3>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPB<2>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPB<1>_UNCONNECTED ;
  wire \NLW_blk00000169_DOPB<0>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<31>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<30>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<29>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<28>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<27>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<26>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<25>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<24>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<23>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<22>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<21>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<20>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<19>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<18>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<17>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<16>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<15>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<14>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<13>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<12>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<11>_UNCONNECTED ;
  wire \NLW_blk00000169_DOB<10>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<31>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<30>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<29>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<28>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<27>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<26>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<25>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<24>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<23>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<22>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<21>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<20>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<19>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<18>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<17>_UNCONNECTED ;
  wire \NLW_blk00000169_DIA<16>_UNCONNECTED ;
  wire [31 : 0] \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 ;
  assign
    phase_out[31] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [31],
    phase_out[30] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [30],
    phase_out[29] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [29],
    phase_out[28] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [28],
    phase_out[27] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [27],
    phase_out[26] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [26],
    phase_out[25] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [25],
    phase_out[24] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [24],
    phase_out[23] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [23],
    phase_out[22] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [22],
    phase_out[21] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [21],
    phase_out[20] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [20],
    phase_out[19] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [19],
    phase_out[18] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [18],
    phase_out[17] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [17],
    phase_out[16] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [16],
    phase_out[15] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [15],
    phase_out[14] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [14],
    phase_out[13] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [13],
    phase_out[12] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [12],
    phase_out[11] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [11],
    phase_out[10] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [10],
    phase_out[9] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [9],
    phase_out[8] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [8],
    phase_out[7] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [7],
    phase_out[6] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [6],
    phase_out[5] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [5],
    phase_out[4] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [4],
    phase_out[3] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [3],
    phase_out[2] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [2],
    phase_out[1] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [1],
    phase_out[0] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [0];
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .D(poff_in[31]),
    .Q(sig00000086)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .D(poff_in[30]),
    .Q(sig00000085)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .D(poff_in[29]),
    .Q(sig00000084)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .D(poff_in[28]),
    .Q(sig00000083)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .D(poff_in[27]),
    .Q(sig00000082)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .D(poff_in[26]),
    .Q(sig00000081)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .D(poff_in[25]),
    .Q(sig00000080)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .D(poff_in[24]),
    .Q(sig0000007f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .D(poff_in[23]),
    .Q(sig0000007e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(clk),
    .D(poff_in[22]),
    .Q(sig0000007d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .D(poff_in[21]),
    .Q(sig0000007c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .D(poff_in[20]),
    .Q(sig0000007b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000f (
    .C(clk),
    .D(poff_in[19]),
    .Q(sig0000007a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000010 (
    .C(clk),
    .D(poff_in[18]),
    .Q(sig00000079)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000011 (
    .C(clk),
    .D(poff_in[17]),
    .Q(sig00000078)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000012 (
    .C(clk),
    .D(poff_in[16]),
    .Q(sig00000077)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000013 (
    .C(clk),
    .D(poff_in[15]),
    .Q(sig00000076)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000014 (
    .C(clk),
    .D(poff_in[14]),
    .Q(sig00000075)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000015 (
    .C(clk),
    .D(poff_in[13]),
    .Q(sig00000074)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000016 (
    .C(clk),
    .D(poff_in[12]),
    .Q(sig00000073)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000017 (
    .C(clk),
    .D(poff_in[11]),
    .Q(sig00000072)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000018 (
    .C(clk),
    .D(poff_in[10]),
    .Q(sig00000071)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000019 (
    .C(clk),
    .D(poff_in[9]),
    .Q(sig00000070)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001a (
    .C(clk),
    .D(poff_in[8]),
    .Q(sig0000006f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001b (
    .C(clk),
    .D(poff_in[7]),
    .Q(sig0000006e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001c (
    .C(clk),
    .D(poff_in[6]),
    .Q(sig0000006d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001d (
    .C(clk),
    .D(poff_in[5]),
    .Q(sig0000006c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001e (
    .C(clk),
    .D(poff_in[4]),
    .Q(sig0000006b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001f (
    .C(clk),
    .D(poff_in[3]),
    .Q(sig0000006a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000020 (
    .C(clk),
    .D(poff_in[2]),
    .Q(sig00000069)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000021 (
    .C(clk),
    .D(poff_in[1]),
    .Q(sig00000068)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000022 (
    .C(clk),
    .D(poff_in[0]),
    .Q(sig00000067)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000023 (
    .C(clk),
    .D(sig00000007),
    .R(sclr),
    .Q(sig000000a7)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .D(sig00000008),
    .R(sclr),
    .Q(sig000000a6)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(clk),
    .D(sig00000009),
    .R(sclr),
    .Q(sig000000a5)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(clk),
    .D(sig0000000a),
    .R(sclr),
    .Q(sig000000a4)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(clk),
    .D(sig0000000b),
    .R(sclr),
    .Q(sig000000a3)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(clk),
    .D(sig0000000c),
    .R(sclr),
    .Q(sig000000a2)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000029 (
    .C(clk),
    .D(sig0000000d),
    .R(sclr),
    .Q(sig000000a1)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002a (
    .C(clk),
    .D(sig0000000e),
    .R(sclr),
    .Q(sig000000a0)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002b (
    .C(clk),
    .D(sig0000000f),
    .R(sclr),
    .Q(sig0000009f)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002c (
    .C(clk),
    .D(sig00000010),
    .R(sclr),
    .Q(sig0000009e)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(clk),
    .D(sig00000011),
    .R(sclr),
    .Q(sig0000009d)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002e (
    .C(clk),
    .D(sig00000012),
    .R(sclr),
    .Q(sig0000009c)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002f (
    .C(clk),
    .D(sig00000013),
    .R(sclr),
    .Q(sig0000009b)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000030 (
    .C(clk),
    .D(sig00000014),
    .R(sclr),
    .Q(sig0000009a)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000031 (
    .C(clk),
    .D(sig00000015),
    .R(sclr),
    .Q(sig00000099)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(clk),
    .D(sig00000016),
    .R(sclr),
    .Q(sig00000098)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(clk),
    .D(sig00000017),
    .R(sclr),
    .Q(sig00000097)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(clk),
    .D(sig00000018),
    .R(sclr),
    .Q(sig00000096)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(clk),
    .D(sig00000019),
    .R(sclr),
    .Q(sig00000095)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(clk),
    .D(sig0000001a),
    .R(sclr),
    .Q(sig00000094)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(clk),
    .D(sig0000001b),
    .R(sclr),
    .Q(sig00000093)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(clk),
    .D(sig0000001c),
    .R(sclr),
    .Q(sig00000092)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(clk),
    .D(sig0000001d),
    .R(sclr),
    .Q(sig00000091)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(clk),
    .D(sig0000001e),
    .R(sclr),
    .Q(sig00000090)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .D(sig0000001f),
    .R(sclr),
    .Q(sig0000008f)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .D(sig00000020),
    .R(sclr),
    .Q(sig0000008e)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .D(sig00000021),
    .R(sclr),
    .Q(sig0000008d)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .D(sig00000022),
    .R(sclr),
    .Q(sig0000008c)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .D(sig00000023),
    .R(sclr),
    .Q(sig0000008b)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .D(sig00000024),
    .R(sclr),
    .Q(sig0000008a)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .D(sig00000025),
    .R(sclr),
    .Q(sig00000089)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .D(sig00000026),
    .R(sclr),
    .Q(sig00000088)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .D(sig00000027),
    .R(sclr),
    .Q(sig00000087)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000106 (
    .C(clk),
    .D(sig00000048),
    .Q(sig000000a8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000107 (
    .C(clk),
    .D(sig00000047),
    .Q(sig00000003)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000108 (
    .C(clk),
    .D(sig00000046),
    .Q(sig00000004)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000109 (
    .C(clk),
    .D(sig00000045),
    .Q(sig00000066)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010a (
    .C(clk),
    .D(sig00000044),
    .Q(sig00000065)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010b (
    .C(clk),
    .D(sig00000043),
    .Q(sig00000064)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010c (
    .C(clk),
    .D(sig00000042),
    .Q(sig00000063)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010d (
    .C(clk),
    .D(sig00000041),
    .Q(sig00000062)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010e (
    .C(clk),
    .D(sig00000040),
    .Q(sig00000061)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010f (
    .C(clk),
    .D(sig0000003f),
    .Q(sig00000060)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000110 (
    .C(clk),
    .D(sig0000003e),
    .Q(sig0000005f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000111 (
    .C(clk),
    .D(sig0000003d),
    .Q(sig0000005e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000112 (
    .C(clk),
    .D(sig0000003c),
    .Q(sig0000005d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000113 (
    .C(clk),
    .D(sig0000003b),
    .Q(sig0000005c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000114 (
    .C(clk),
    .D(sig0000003a),
    .Q(sig0000005b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000115 (
    .C(clk),
    .D(sig00000039),
    .Q(sig0000005a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000116 (
    .C(clk),
    .D(sig00000038),
    .Q(sig00000059)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000117 (
    .C(clk),
    .D(sig00000037),
    .Q(sig00000058)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000118 (
    .C(clk),
    .D(sig00000036),
    .Q(sig00000057)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000119 (
    .C(clk),
    .D(sig00000035),
    .Q(sig00000056)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011a (
    .C(clk),
    .D(sig00000034),
    .Q(sig00000055)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011b (
    .C(clk),
    .D(sig00000033),
    .Q(sig00000054)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011c (
    .C(clk),
    .D(sig00000032),
    .Q(sig00000053)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011d (
    .C(clk),
    .D(sig00000031),
    .Q(sig00000052)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011e (
    .C(clk),
    .D(sig00000030),
    .Q(sig00000051)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011f (
    .C(clk),
    .D(sig0000002f),
    .Q(sig00000050)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000120 (
    .C(clk),
    .D(sig0000002e),
    .Q(sig0000004f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000121 (
    .C(clk),
    .D(sig0000002d),
    .Q(sig0000004e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000122 (
    .C(clk),
    .D(sig0000002c),
    .Q(sig0000004d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000123 (
    .C(clk),
    .D(sig0000002b),
    .Q(sig0000004c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000124 (
    .C(clk),
    .D(sig0000002a),
    .Q(sig0000004b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000125 (
    .C(clk),
    .D(sig00000029),
    .Q(sig0000004a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000126 (
    .C(clk),
    .D(sig00000028),
    .Q(sig00000049)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000127 (
    .C(clk),
    .D(sig000000c8),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [31])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000128 (
    .C(clk),
    .D(sig000000c7),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [30])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000129 (
    .C(clk),
    .D(sig000000c6),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [29])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012a (
    .C(clk),
    .D(sig000000c5),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012b (
    .C(clk),
    .D(sig000000c4),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012c (
    .C(clk),
    .D(sig000000c3),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012d (
    .C(clk),
    .D(sig000000c2),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012e (
    .C(clk),
    .D(sig000000c1),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012f (
    .C(clk),
    .D(sig000000c0),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000130 (
    .C(clk),
    .D(sig000000bf),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000131 (
    .C(clk),
    .D(sig000000be),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000132 (
    .C(clk),
    .D(sig000000bd),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000133 (
    .C(clk),
    .D(sig000000bc),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000134 (
    .C(clk),
    .D(sig000000bb),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000135 (
    .C(clk),
    .D(sig000000ba),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000136 (
    .C(clk),
    .D(sig000000b9),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000137 (
    .C(clk),
    .D(sig000000b8),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000138 (
    .C(clk),
    .D(sig000000b7),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000139 (
    .C(clk),
    .D(sig000000b6),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013a (
    .C(clk),
    .D(sig000000b5),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013b (
    .C(clk),
    .D(sig000000b4),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013c (
    .C(clk),
    .D(sig000000b3),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013d (
    .C(clk),
    .D(sig000000b2),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013e (
    .C(clk),
    .D(sig000000b1),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013f (
    .C(clk),
    .D(sig000000b0),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000140 (
    .C(clk),
    .D(sig000000af),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000141 (
    .C(clk),
    .D(sig000000ae),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000142 (
    .C(clk),
    .D(sig000000ad),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000143 (
    .C(clk),
    .D(sig000000ac),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000144 (
    .C(clk),
    .D(sig000000ab),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000145 (
    .C(clk),
    .D(sig000000aa),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000146 (
    .C(clk),
    .D(sig000000a9),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000147 (
    .C(clk),
    .D(sig00000003),
    .Q(sig000000c8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000148 (
    .C(clk),
    .D(sig00000004),
    .Q(sig000000c7)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000149 (
    .C(clk),
    .D(sig00000066),
    .Q(sig000000c6)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014a (
    .C(clk),
    .D(sig00000065),
    .Q(sig000000c5)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014b (
    .C(clk),
    .D(sig00000064),
    .Q(sig000000c4)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014c (
    .C(clk),
    .D(sig00000063),
    .Q(sig000000c3)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014d (
    .C(clk),
    .D(sig00000062),
    .Q(sig000000c2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014e (
    .C(clk),
    .D(sig00000061),
    .Q(sig000000c1)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014f (
    .C(clk),
    .D(sig00000060),
    .Q(sig000000c0)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000150 (
    .C(clk),
    .D(sig0000005f),
    .Q(sig000000bf)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000151 (
    .C(clk),
    .D(sig0000005e),
    .Q(sig000000be)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000152 (
    .C(clk),
    .D(sig0000005d),
    .Q(sig000000bd)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000153 (
    .C(clk),
    .D(sig0000005c),
    .Q(sig000000bc)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000154 (
    .C(clk),
    .D(sig0000005b),
    .Q(sig000000bb)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000155 (
    .C(clk),
    .D(sig0000005a),
    .Q(sig000000ba)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000156 (
    .C(clk),
    .D(sig00000059),
    .Q(sig000000b9)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000157 (
    .C(clk),
    .D(sig00000058),
    .Q(sig000000b8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000158 (
    .C(clk),
    .D(sig00000057),
    .Q(sig000000b7)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000159 (
    .C(clk),
    .D(sig00000056),
    .Q(sig000000b6)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015a (
    .C(clk),
    .D(sig00000055),
    .Q(sig000000b5)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015b (
    .C(clk),
    .D(sig00000054),
    .Q(sig000000b4)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015c (
    .C(clk),
    .D(sig00000053),
    .Q(sig000000b3)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015d (
    .C(clk),
    .D(sig00000052),
    .Q(sig000000b2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015e (
    .C(clk),
    .D(sig00000051),
    .Q(sig000000b1)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015f (
    .C(clk),
    .D(sig00000050),
    .Q(sig000000b0)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000160 (
    .C(clk),
    .D(sig0000004f),
    .Q(sig000000af)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000161 (
    .C(clk),
    .D(sig0000004e),
    .Q(sig000000ae)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000162 (
    .C(clk),
    .D(sig0000004d),
    .Q(sig000000ad)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000163 (
    .C(clk),
    .D(sig0000004c),
    .Q(sig000000ac)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000164 (
    .C(clk),
    .D(sig0000004b),
    .Q(sig000000ab)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000165 (
    .C(clk),
    .D(sig0000004a),
    .Q(sig000000aa)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000166 (
    .C(clk),
    .D(sig00000049),
    .Q(sig000000a9)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000167 (
    .I0(sig00000003),
    .I1(sig00000004),
    .O(sig00000005)
  );
  INV   blk00000168 (
    .I(sig00000004),
    .O(sig00000006)
  );
  RAMB16BWER #(
    .INIT_00 ( 256'h0030002D002A002700240021001E001B001700140011000E000B000800050002 ),
    .INIT_01 ( 256'h0062005F005C005900560053004F004C0049004600430040003D003A00370034 ),
    .INIT_02 ( 256'h00930090008D008A008700830080007D007A007700740071006E006B00680065 ),
    .INIT_03 ( 256'h00C200BF00BC00B900B600B300B000AD00AA00A700A400A1009E009C00990096 ),
    .INIT_04 ( 256'h00EF00EC00E900E700E400E100DE00DB00D900D600D300D000CD00CA00C700C5 ),
    .INIT_05 ( 256'h011A0117011501120110010D010A01080105010200FF00FD00FA00F700F500F2 ),
    .INIT_06 ( 256'h01420140013D013B0139013601340131012F012C0129012701240122011F011D ),
    .INIT_07 ( 256'h0168016501630161015F015C015A0158015501530151014E014C014A01470145 ),
    .INIT_08 ( 256'h01890187018501830181017F017D017B01790177017501720170016E016C016A ),
    .INIT_09 ( 256'h01A701A501A401A201A0019E019C019B01990197019501930191018F018D018B ),
    .INIT_0A ( 256'h01C101C001BE01BD01BB01B901B801B601B501B301B101B001AE01AC01AB01A9 ),
    .INIT_0B ( 256'h01D701D501D401D301D201D001CF01CE01CC01CB01CA01C801C701C501C401C3 ),
    .INIT_0C ( 256'h01E801E701E601E501E401E301E201E101E001DF01DD01DC01DB01DA01D901D8 ),
    .INIT_0D ( 256'h01F401F301F301F201F101F101F001EF01EE01EE01ED01EC01EB01EA01E901E8 ),
    .INIT_0E ( 256'h01FB01FB01FB01FA01FA01FA01F901F901F801F801F701F701F601F601F501F5 ),
    .INIT_0F ( 256'h01FE01FE01FE01FE01FE01FE01FE01FD01FD01FD01FD01FD01FD01FC01FC01FC ),
    .INIT_10 ( 256'h01FC01FC01FC01FD01FD01FD01FD01FD01FD01FE01FE01FE01FE01FE01FE01FE ),
    .INIT_11 ( 256'h01F501F501F601F601F701F701F801F801F901F901FA01FA01FA01FB01FB01FB ),
    .INIT_12 ( 256'h01E801E901EA01EB01EC01ED01EE01EE01EF01F001F101F101F201F301F301F4 ),
    .INIT_13 ( 256'h01D801D901DA01DB01DC01DD01DF01E001E101E201E301E401E501E601E701E8 ),
    .INIT_14 ( 256'h01C301C401C501C701C801CA01CB01CC01CE01CF01D001D201D301D401D501D7 ),
    .INIT_15 ( 256'h01A901AB01AC01AE01B001B101B301B501B601B801B901BB01BD01BE01C001C1 ),
    .INIT_16 ( 256'h018B018D018F01910193019501970199019B019C019E01A001A201A401A501A7 ),
    .INIT_17 ( 256'h016A016C016E01700172017501770179017B017D017F01810183018501870189 ),
    .INIT_18 ( 256'h01450147014A014C014E0151015301550158015A015C015F0161016301650168 ),
    .INIT_19 ( 256'h011D011F0122012401270129012C012F0131013401360139013B013D01400142 ),
    .INIT_1A ( 256'h00F200F500F700FA00FD00FF010201050108010A010D0110011201150117011A ),
    .INIT_1B ( 256'h00C500C700CA00CD00D000D300D600D900DB00DE00E100E400E700E900EC00EF ),
    .INIT_1C ( 256'h00960099009C009E00A100A400A700AA00AD00B000B300B600B900BC00BF00C2 ),
    .INIT_1D ( 256'h00650068006B006E007100740077007A007D008000830087008A008D00900093 ),
    .INIT_1E ( 256'h00340037003A003D0040004300460049004C004F005300560059005C005F0062 ),
    .INIT_1F ( 256'h000200050008000B000E001100140017001B001E002100240027002A002D0030 ),
    .INIT_20 ( 256'h03D003D303D603D903DC03DF03E203E503E903EC03EF03F203F503F803FB03FE ),
    .INIT_21 ( 256'h039E03A103A403A703AA03AD03B103B403B703BA03BD03C003C303C603C903CC ),
    .INIT_22 ( 256'h036D0370037303760379037D0380038303860389038C038F039203950398039B ),
    .INIT_23 ( 256'h033E034103440347034A034D0350035303560359035C035F036203640367036A ),
    .INIT_24 ( 256'h0311031403170319031C031F032203250327032A032D0330033303360339033B ),
    .INIT_25 ( 256'h02E602E902EB02EE02F002F302F602F802FB02FE0301030303060309030B030E ),
    .INIT_26 ( 256'h02BE02C002C302C502C702CA02CC02CF02D102D402D702D902DC02DE02E102E3 ),
    .INIT_27 ( 256'h0298029B029D029F02A102A402A602A802AB02AD02AF02B202B402B602B902BB ),
    .INIT_28 ( 256'h02770279027B027D027F02810283028502870289028B028E0290029202940296 ),
    .INIT_29 ( 256'h0259025B025C025E026002620264026502670269026B026D026F027102730275 ),
    .INIT_2A ( 256'h023F024002420243024502470248024A024B024D024F02500252025402550257 ),
    .INIT_2B ( 256'h0229022B022C022D022E02300231023202340235023602380239023B023C023D ),
    .INIT_2C ( 256'h02180219021A021B021C021D021E021F02200221022302240225022602270228 ),
    .INIT_2D ( 256'h020C020D020D020E020F020F0210021102120212021302140215021602170218 ),
    .INIT_2E ( 256'h020502050205020602060206020702070208020802090209020A020A020B020B ),
    .INIT_2F ( 256'h0202020202020202020202020202020302030203020302030203020402040204 ),
    .INIT_30 ( 256'h0204020402040203020302030203020302030202020202020202020202020202 ),
    .INIT_31 ( 256'h020B020B020A020A020902090208020802070207020602060206020502050205 ),
    .INIT_32 ( 256'h0218021702160215021402130212021202110210020F020F020E020D020D020C ),
    .INIT_33 ( 256'h02280227022602250224022302210220021F021E021D021C021B021A02190218 ),
    .INIT_34 ( 256'h023D023C023B02390238023602350234023202310230022E022D022C022B0229 ),
    .INIT_35 ( 256'h02570255025402520250024F024D024B024A024802470245024302420240023F ),
    .INIT_36 ( 256'h027502730271026F026D026B026902670265026402620260025E025C025B0259 ),
    .INIT_37 ( 256'h0296029402920290028E028B02890287028502830281027F027D027B02790277 ),
    .INIT_38 ( 256'h02BB02B902B602B402B202AF02AD02AB02A802A602A402A1029F029D029B0298 ),
    .INIT_39 ( 256'h02E302E102DE02DC02D902D702D402D102CF02CC02CA02C702C502C302C002BE ),
    .INIT_3A ( 256'h030E030B030903060303030102FE02FB02F802F602F302F002EE02EB02E902E6 ),
    .INIT_3B ( 256'h033B0339033603330330032D032A032703250322031F031C0319031703140311 ),
    .INIT_3C ( 256'h036A036703640362035F035C0359035603530350034D034A034703440341033E ),
    .INIT_3D ( 256'h039B039803950392038F038C0389038603830380037D0379037603730370036D ),
    .INIT_3E ( 256'h03CC03C903C603C303C003BD03BA03B703B403B103AD03AA03A703A403A1039E ),
    .INIT_3F ( 256'h03FE03FB03F803F503F203EF03EC03E903E503E203DF03DC03D903D603D303D0 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 18 ),
    .DATA_WIDTH_B ( 18 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_RSTRAM_A ( "TRUE" ),
    .EN_RSTRAM_B ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .RSTTYPE ( "SYNC" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .INIT_FILE ( "NONE" ))
  blk00000169 (
    .REGCEA(sig00000001),
    .CLKA(clk),
    .ENB(sig00000001),
    .RSTB(sig00000002),
    .CLKB(clk),
    .REGCEB(sig00000001),
    .RSTA(sig00000002),
    .ENA(sig00000001),
    .DIPA({\NLW_blk00000169_DIPA<3>_UNCONNECTED , \NLW_blk00000169_DIPA<2>_UNCONNECTED , sig00000002, sig00000002}),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DOA({\NLW_blk00000169_DOA<31>_UNCONNECTED , \NLW_blk00000169_DOA<30>_UNCONNECTED , \NLW_blk00000169_DOA<29>_UNCONNECTED , 
\NLW_blk00000169_DOA<28>_UNCONNECTED , \NLW_blk00000169_DOA<27>_UNCONNECTED , \NLW_blk00000169_DOA<26>_UNCONNECTED , 
\NLW_blk00000169_DOA<25>_UNCONNECTED , \NLW_blk00000169_DOA<24>_UNCONNECTED , \NLW_blk00000169_DOA<23>_UNCONNECTED , 
\NLW_blk00000169_DOA<22>_UNCONNECTED , \NLW_blk00000169_DOA<21>_UNCONNECTED , \NLW_blk00000169_DOA<20>_UNCONNECTED , 
\NLW_blk00000169_DOA<19>_UNCONNECTED , \NLW_blk00000169_DOA<18>_UNCONNECTED , \NLW_blk00000169_DOA<17>_UNCONNECTED , 
\NLW_blk00000169_DOA<16>_UNCONNECTED , \NLW_blk00000169_DOA<15>_UNCONNECTED , \NLW_blk00000169_DOA<14>_UNCONNECTED , 
\NLW_blk00000169_DOA<13>_UNCONNECTED , \NLW_blk00000169_DOA<12>_UNCONNECTED , \NLW_blk00000169_DOA<11>_UNCONNECTED , 
\NLW_blk00000169_DOA<10>_UNCONNECTED , \NLW_blk00000169_DOA<9>_UNCONNECTED , \NLW_blk00000169_DOA<8>_UNCONNECTED , 
\NLW_blk00000169_DOA<7>_UNCONNECTED , \NLW_blk00000169_DOA<6>_UNCONNECTED , \NLW_blk00000169_DOA<5>_UNCONNECTED , \NLW_blk00000169_DOA<4>_UNCONNECTED 
, \NLW_blk00000169_DOA<3>_UNCONNECTED , \NLW_blk00000169_DOA<2>_UNCONNECTED , \NLW_blk00000169_DOA<1>_UNCONNECTED , 
\NLW_blk00000169_DOA<0>_UNCONNECTED }),
    .ADDRA({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
\NLW_blk00000169_ADDRA<3>_UNCONNECTED , \NLW_blk00000169_ADDRA<2>_UNCONNECTED , \NLW_blk00000169_ADDRA<1>_UNCONNECTED , 
\NLW_blk00000169_ADDRA<0>_UNCONNECTED }),
    .ADDRB({sig00000005, sig00000006, sig00000066, sig00000065, sig00000064, sig00000063, sig00000062, sig00000061, sig00000060, sig0000005f, 
\NLW_blk00000169_ADDRB<3>_UNCONNECTED , \NLW_blk00000169_ADDRB<2>_UNCONNECTED , \NLW_blk00000169_ADDRB<1>_UNCONNECTED , 
\NLW_blk00000169_ADDRB<0>_UNCONNECTED }),
    .DIB({\NLW_blk00000169_DIB<31>_UNCONNECTED , \NLW_blk00000169_DIB<30>_UNCONNECTED , \NLW_blk00000169_DIB<29>_UNCONNECTED , 
\NLW_blk00000169_DIB<28>_UNCONNECTED , \NLW_blk00000169_DIB<27>_UNCONNECTED , \NLW_blk00000169_DIB<26>_UNCONNECTED , 
\NLW_blk00000169_DIB<25>_UNCONNECTED , \NLW_blk00000169_DIB<24>_UNCONNECTED , \NLW_blk00000169_DIB<23>_UNCONNECTED , 
\NLW_blk00000169_DIB<22>_UNCONNECTED , \NLW_blk00000169_DIB<21>_UNCONNECTED , \NLW_blk00000169_DIB<20>_UNCONNECTED , 
\NLW_blk00000169_DIB<19>_UNCONNECTED , \NLW_blk00000169_DIB<18>_UNCONNECTED , \NLW_blk00000169_DIB<17>_UNCONNECTED , 
\NLW_blk00000169_DIB<16>_UNCONNECTED , \NLW_blk00000169_DIB<15>_UNCONNECTED , \NLW_blk00000169_DIB<14>_UNCONNECTED , 
\NLW_blk00000169_DIB<13>_UNCONNECTED , \NLW_blk00000169_DIB<12>_UNCONNECTED , \NLW_blk00000169_DIB<11>_UNCONNECTED , 
\NLW_blk00000169_DIB<10>_UNCONNECTED , \NLW_blk00000169_DIB<9>_UNCONNECTED , \NLW_blk00000169_DIB<8>_UNCONNECTED , 
\NLW_blk00000169_DIB<7>_UNCONNECTED , \NLW_blk00000169_DIB<6>_UNCONNECTED , \NLW_blk00000169_DIB<5>_UNCONNECTED , \NLW_blk00000169_DIB<4>_UNCONNECTED 
, \NLW_blk00000169_DIB<3>_UNCONNECTED , \NLW_blk00000169_DIB<2>_UNCONNECTED , \NLW_blk00000169_DIB<1>_UNCONNECTED , 
\NLW_blk00000169_DIB<0>_UNCONNECTED }),
    .DOPA({\NLW_blk00000169_DOPA<3>_UNCONNECTED , \NLW_blk00000169_DOPA<2>_UNCONNECTED , \NLW_blk00000169_DOPA<1>_UNCONNECTED , 
\NLW_blk00000169_DOPA<0>_UNCONNECTED }),
    .DIPB({\NLW_blk00000169_DIPB<3>_UNCONNECTED , \NLW_blk00000169_DIPB<2>_UNCONNECTED , \NLW_blk00000169_DIPB<1>_UNCONNECTED , 
\NLW_blk00000169_DIPB<0>_UNCONNECTED }),
    .DOPB({\NLW_blk00000169_DOPB<3>_UNCONNECTED , \NLW_blk00000169_DOPB<2>_UNCONNECTED , \NLW_blk00000169_DOPB<1>_UNCONNECTED , 
\NLW_blk00000169_DOPB<0>_UNCONNECTED }),
    .DOB({\NLW_blk00000169_DOB<31>_UNCONNECTED , \NLW_blk00000169_DOB<30>_UNCONNECTED , \NLW_blk00000169_DOB<29>_UNCONNECTED , 
\NLW_blk00000169_DOB<28>_UNCONNECTED , \NLW_blk00000169_DOB<27>_UNCONNECTED , \NLW_blk00000169_DOB<26>_UNCONNECTED , 
\NLW_blk00000169_DOB<25>_UNCONNECTED , \NLW_blk00000169_DOB<24>_UNCONNECTED , \NLW_blk00000169_DOB<23>_UNCONNECTED , 
\NLW_blk00000169_DOB<22>_UNCONNECTED , \NLW_blk00000169_DOB<21>_UNCONNECTED , \NLW_blk00000169_DOB<20>_UNCONNECTED , 
\NLW_blk00000169_DOB<19>_UNCONNECTED , \NLW_blk00000169_DOB<18>_UNCONNECTED , \NLW_blk00000169_DOB<17>_UNCONNECTED , 
\NLW_blk00000169_DOB<16>_UNCONNECTED , \NLW_blk00000169_DOB<15>_UNCONNECTED , \NLW_blk00000169_DOB<14>_UNCONNECTED , 
\NLW_blk00000169_DOB<13>_UNCONNECTED , \NLW_blk00000169_DOB<12>_UNCONNECTED , \NLW_blk00000169_DOB<11>_UNCONNECTED , 
\NLW_blk00000169_DOB<10>_UNCONNECTED , cosine[9], cosine[8], cosine[7], cosine[6], cosine[5], cosine[4], cosine[3], cosine[2], cosine[1], cosine[0]}),
    .WEB({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIA({\NLW_blk00000169_DIA<31>_UNCONNECTED , \NLW_blk00000169_DIA<30>_UNCONNECTED , \NLW_blk00000169_DIA<29>_UNCONNECTED , 
\NLW_blk00000169_DIA<28>_UNCONNECTED , \NLW_blk00000169_DIA<27>_UNCONNECTED , \NLW_blk00000169_DIA<26>_UNCONNECTED , 
\NLW_blk00000169_DIA<25>_UNCONNECTED , \NLW_blk00000169_DIA<24>_UNCONNECTED , \NLW_blk00000169_DIA<23>_UNCONNECTED , 
\NLW_blk00000169_DIA<22>_UNCONNECTED , \NLW_blk00000169_DIA<21>_UNCONNECTED , \NLW_blk00000169_DIA<20>_UNCONNECTED , 
\NLW_blk00000169_DIA<19>_UNCONNECTED , \NLW_blk00000169_DIA<18>_UNCONNECTED , \NLW_blk00000169_DIA<17>_UNCONNECTED , 
\NLW_blk00000169_DIA<16>_UNCONNECTED , sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  XORCY   \blk00000044/blk000000a4  (
    .CI(\blk00000044/sig00000167 ),
    .LI(\blk00000044/sig00000168 ),
    .O(sig00000008)
  );
  MUXCY   \blk00000044/blk000000a3  (
    .CI(\blk00000044/sig00000167 ),
    .DI(sig000000a6),
    .S(\blk00000044/sig00000168 ),
    .O(sig00000007)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk000000a2  (
    .I0(sig000000a6),
    .I1(pinc_in[31]),
    .O(\blk00000044/sig00000168 )
  );
  XORCY   \blk00000044/blk000000a1  (
    .CI(\blk00000044/sig00000165 ),
    .LI(\blk00000044/sig00000166 ),
    .O(sig00000009)
  );
  MUXCY   \blk00000044/blk000000a0  (
    .CI(\blk00000044/sig00000165 ),
    .DI(sig000000a5),
    .S(\blk00000044/sig00000166 ),
    .O(\blk00000044/sig00000167 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000009f  (
    .I0(sig000000a5),
    .I1(pinc_in[30]),
    .O(\blk00000044/sig00000166 )
  );
  XORCY   \blk00000044/blk0000009e  (
    .CI(\blk00000044/sig00000163 ),
    .LI(\blk00000044/sig00000164 ),
    .O(sig0000000a)
  );
  MUXCY   \blk00000044/blk0000009d  (
    .CI(\blk00000044/sig00000163 ),
    .DI(sig000000a4),
    .S(\blk00000044/sig00000164 ),
    .O(\blk00000044/sig00000165 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000009c  (
    .I0(sig000000a4),
    .I1(pinc_in[29]),
    .O(\blk00000044/sig00000164 )
  );
  XORCY   \blk00000044/blk0000009b  (
    .CI(\blk00000044/sig00000161 ),
    .LI(\blk00000044/sig00000162 ),
    .O(sig0000000b)
  );
  MUXCY   \blk00000044/blk0000009a  (
    .CI(\blk00000044/sig00000161 ),
    .DI(sig000000a3),
    .S(\blk00000044/sig00000162 ),
    .O(\blk00000044/sig00000163 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000099  (
    .I0(sig000000a3),
    .I1(pinc_in[28]),
    .O(\blk00000044/sig00000162 )
  );
  XORCY   \blk00000044/blk00000098  (
    .CI(\blk00000044/sig0000015f ),
    .LI(\blk00000044/sig00000160 ),
    .O(sig0000000c)
  );
  MUXCY   \blk00000044/blk00000097  (
    .CI(\blk00000044/sig0000015f ),
    .DI(sig000000a2),
    .S(\blk00000044/sig00000160 ),
    .O(\blk00000044/sig00000161 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000096  (
    .I0(pinc_in[27]),
    .I1(sig000000a2),
    .O(\blk00000044/sig00000160 )
  );
  XORCY   \blk00000044/blk00000095  (
    .CI(\blk00000044/sig0000015d ),
    .LI(\blk00000044/sig0000015e ),
    .O(sig0000000d)
  );
  MUXCY   \blk00000044/blk00000094  (
    .CI(\blk00000044/sig0000015d ),
    .DI(sig000000a1),
    .S(\blk00000044/sig0000015e ),
    .O(\blk00000044/sig0000015f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000093  (
    .I0(pinc_in[26]),
    .I1(sig000000a1),
    .O(\blk00000044/sig0000015e )
  );
  XORCY   \blk00000044/blk00000092  (
    .CI(\blk00000044/sig0000015b ),
    .LI(\blk00000044/sig0000015c ),
    .O(sig0000000e)
  );
  MUXCY   \blk00000044/blk00000091  (
    .CI(\blk00000044/sig0000015b ),
    .DI(sig000000a0),
    .S(\blk00000044/sig0000015c ),
    .O(\blk00000044/sig0000015d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000090  (
    .I0(pinc_in[25]),
    .I1(sig000000a0),
    .O(\blk00000044/sig0000015c )
  );
  XORCY   \blk00000044/blk0000008f  (
    .CI(\blk00000044/sig00000159 ),
    .LI(\blk00000044/sig0000015a ),
    .O(sig0000000f)
  );
  MUXCY   \blk00000044/blk0000008e  (
    .CI(\blk00000044/sig00000159 ),
    .DI(sig0000009f),
    .S(\blk00000044/sig0000015a ),
    .O(\blk00000044/sig0000015b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000008d  (
    .I0(pinc_in[24]),
    .I1(sig0000009f),
    .O(\blk00000044/sig0000015a )
  );
  XORCY   \blk00000044/blk0000008c  (
    .CI(\blk00000044/sig00000157 ),
    .LI(\blk00000044/sig00000158 ),
    .O(sig00000010)
  );
  MUXCY   \blk00000044/blk0000008b  (
    .CI(\blk00000044/sig00000157 ),
    .DI(sig0000009e),
    .S(\blk00000044/sig00000158 ),
    .O(\blk00000044/sig00000159 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000008a  (
    .I0(pinc_in[23]),
    .I1(sig0000009e),
    .O(\blk00000044/sig00000158 )
  );
  XORCY   \blk00000044/blk00000089  (
    .CI(\blk00000044/sig00000155 ),
    .LI(\blk00000044/sig00000156 ),
    .O(sig00000011)
  );
  MUXCY   \blk00000044/blk00000088  (
    .CI(\blk00000044/sig00000155 ),
    .DI(sig0000009d),
    .S(\blk00000044/sig00000156 ),
    .O(\blk00000044/sig00000157 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000087  (
    .I0(pinc_in[22]),
    .I1(sig0000009d),
    .O(\blk00000044/sig00000156 )
  );
  XORCY   \blk00000044/blk00000086  (
    .CI(\blk00000044/sig00000153 ),
    .LI(\blk00000044/sig00000154 ),
    .O(sig00000012)
  );
  MUXCY   \blk00000044/blk00000085  (
    .CI(\blk00000044/sig00000153 ),
    .DI(sig0000009c),
    .S(\blk00000044/sig00000154 ),
    .O(\blk00000044/sig00000155 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000084  (
    .I0(pinc_in[21]),
    .I1(sig0000009c),
    .O(\blk00000044/sig00000154 )
  );
  XORCY   \blk00000044/blk00000083  (
    .CI(\blk00000044/sig00000151 ),
    .LI(\blk00000044/sig00000152 ),
    .O(sig00000013)
  );
  MUXCY   \blk00000044/blk00000082  (
    .CI(\blk00000044/sig00000151 ),
    .DI(sig0000009b),
    .S(\blk00000044/sig00000152 ),
    .O(\blk00000044/sig00000153 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000081  (
    .I0(pinc_in[20]),
    .I1(sig0000009b),
    .O(\blk00000044/sig00000152 )
  );
  XORCY   \blk00000044/blk00000080  (
    .CI(\blk00000044/sig0000014f ),
    .LI(\blk00000044/sig00000150 ),
    .O(sig00000014)
  );
  MUXCY   \blk00000044/blk0000007f  (
    .CI(\blk00000044/sig0000014f ),
    .DI(sig0000009a),
    .S(\blk00000044/sig00000150 ),
    .O(\blk00000044/sig00000151 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000007e  (
    .I0(pinc_in[19]),
    .I1(sig0000009a),
    .O(\blk00000044/sig00000150 )
  );
  XORCY   \blk00000044/blk0000007d  (
    .CI(\blk00000044/sig0000014d ),
    .LI(\blk00000044/sig0000014e ),
    .O(sig00000015)
  );
  MUXCY   \blk00000044/blk0000007c  (
    .CI(\blk00000044/sig0000014d ),
    .DI(sig00000099),
    .S(\blk00000044/sig0000014e ),
    .O(\blk00000044/sig0000014f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000007b  (
    .I0(pinc_in[18]),
    .I1(sig00000099),
    .O(\blk00000044/sig0000014e )
  );
  XORCY   \blk00000044/blk0000007a  (
    .CI(\blk00000044/sig0000014b ),
    .LI(\blk00000044/sig0000014c ),
    .O(sig00000016)
  );
  MUXCY   \blk00000044/blk00000079  (
    .CI(\blk00000044/sig0000014b ),
    .DI(sig00000098),
    .S(\blk00000044/sig0000014c ),
    .O(\blk00000044/sig0000014d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000078  (
    .I0(pinc_in[17]),
    .I1(sig00000098),
    .O(\blk00000044/sig0000014c )
  );
  XORCY   \blk00000044/blk00000077  (
    .CI(\blk00000044/sig00000149 ),
    .LI(\blk00000044/sig0000014a ),
    .O(sig00000017)
  );
  MUXCY   \blk00000044/blk00000076  (
    .CI(\blk00000044/sig00000149 ),
    .DI(sig00000097),
    .S(\blk00000044/sig0000014a ),
    .O(\blk00000044/sig0000014b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000075  (
    .I0(pinc_in[16]),
    .I1(sig00000097),
    .O(\blk00000044/sig0000014a )
  );
  XORCY   \blk00000044/blk00000074  (
    .CI(\blk00000044/sig00000147 ),
    .LI(\blk00000044/sig00000148 ),
    .O(sig00000018)
  );
  MUXCY   \blk00000044/blk00000073  (
    .CI(\blk00000044/sig00000147 ),
    .DI(sig00000096),
    .S(\blk00000044/sig00000148 ),
    .O(\blk00000044/sig00000149 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000072  (
    .I0(pinc_in[15]),
    .I1(sig00000096),
    .O(\blk00000044/sig00000148 )
  );
  XORCY   \blk00000044/blk00000071  (
    .CI(\blk00000044/sig00000145 ),
    .LI(\blk00000044/sig00000146 ),
    .O(sig00000019)
  );
  MUXCY   \blk00000044/blk00000070  (
    .CI(\blk00000044/sig00000145 ),
    .DI(sig00000095),
    .S(\blk00000044/sig00000146 ),
    .O(\blk00000044/sig00000147 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000006f  (
    .I0(pinc_in[14]),
    .I1(sig00000095),
    .O(\blk00000044/sig00000146 )
  );
  XORCY   \blk00000044/blk0000006e  (
    .CI(\blk00000044/sig00000143 ),
    .LI(\blk00000044/sig00000144 ),
    .O(sig0000001a)
  );
  MUXCY   \blk00000044/blk0000006d  (
    .CI(\blk00000044/sig00000143 ),
    .DI(sig00000094),
    .S(\blk00000044/sig00000144 ),
    .O(\blk00000044/sig00000145 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000006c  (
    .I0(pinc_in[13]),
    .I1(sig00000094),
    .O(\blk00000044/sig00000144 )
  );
  XORCY   \blk00000044/blk0000006b  (
    .CI(\blk00000044/sig00000141 ),
    .LI(\blk00000044/sig00000142 ),
    .O(sig0000001b)
  );
  MUXCY   \blk00000044/blk0000006a  (
    .CI(\blk00000044/sig00000141 ),
    .DI(sig00000093),
    .S(\blk00000044/sig00000142 ),
    .O(\blk00000044/sig00000143 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000069  (
    .I0(pinc_in[12]),
    .I1(sig00000093),
    .O(\blk00000044/sig00000142 )
  );
  XORCY   \blk00000044/blk00000068  (
    .CI(\blk00000044/sig0000013f ),
    .LI(\blk00000044/sig00000140 ),
    .O(sig0000001c)
  );
  MUXCY   \blk00000044/blk00000067  (
    .CI(\blk00000044/sig0000013f ),
    .DI(sig00000092),
    .S(\blk00000044/sig00000140 ),
    .O(\blk00000044/sig00000141 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000066  (
    .I0(pinc_in[11]),
    .I1(sig00000092),
    .O(\blk00000044/sig00000140 )
  );
  XORCY   \blk00000044/blk00000065  (
    .CI(\blk00000044/sig0000013d ),
    .LI(\blk00000044/sig0000013e ),
    .O(sig0000001d)
  );
  MUXCY   \blk00000044/blk00000064  (
    .CI(\blk00000044/sig0000013d ),
    .DI(sig00000091),
    .S(\blk00000044/sig0000013e ),
    .O(\blk00000044/sig0000013f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000063  (
    .I0(pinc_in[10]),
    .I1(sig00000091),
    .O(\blk00000044/sig0000013e )
  );
  XORCY   \blk00000044/blk00000062  (
    .CI(\blk00000044/sig0000013b ),
    .LI(\blk00000044/sig0000013c ),
    .O(sig0000001e)
  );
  MUXCY   \blk00000044/blk00000061  (
    .CI(\blk00000044/sig0000013b ),
    .DI(sig00000090),
    .S(\blk00000044/sig0000013c ),
    .O(\blk00000044/sig0000013d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000060  (
    .I0(pinc_in[9]),
    .I1(sig00000090),
    .O(\blk00000044/sig0000013c )
  );
  XORCY   \blk00000044/blk0000005f  (
    .CI(\blk00000044/sig00000139 ),
    .LI(\blk00000044/sig0000013a ),
    .O(sig0000001f)
  );
  MUXCY   \blk00000044/blk0000005e  (
    .CI(\blk00000044/sig00000139 ),
    .DI(sig0000008f),
    .S(\blk00000044/sig0000013a ),
    .O(\blk00000044/sig0000013b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000005d  (
    .I0(pinc_in[8]),
    .I1(sig0000008f),
    .O(\blk00000044/sig0000013a )
  );
  XORCY   \blk00000044/blk0000005c  (
    .CI(\blk00000044/sig00000137 ),
    .LI(\blk00000044/sig00000138 ),
    .O(sig00000020)
  );
  MUXCY   \blk00000044/blk0000005b  (
    .CI(\blk00000044/sig00000137 ),
    .DI(sig0000008e),
    .S(\blk00000044/sig00000138 ),
    .O(\blk00000044/sig00000139 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000005a  (
    .I0(pinc_in[7]),
    .I1(sig0000008e),
    .O(\blk00000044/sig00000138 )
  );
  XORCY   \blk00000044/blk00000059  (
    .CI(\blk00000044/sig00000135 ),
    .LI(\blk00000044/sig00000136 ),
    .O(sig00000021)
  );
  MUXCY   \blk00000044/blk00000058  (
    .CI(\blk00000044/sig00000135 ),
    .DI(sig0000008d),
    .S(\blk00000044/sig00000136 ),
    .O(\blk00000044/sig00000137 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000057  (
    .I0(pinc_in[6]),
    .I1(sig0000008d),
    .O(\blk00000044/sig00000136 )
  );
  XORCY   \blk00000044/blk00000056  (
    .CI(\blk00000044/sig00000133 ),
    .LI(\blk00000044/sig00000134 ),
    .O(sig00000022)
  );
  MUXCY   \blk00000044/blk00000055  (
    .CI(\blk00000044/sig00000133 ),
    .DI(sig0000008c),
    .S(\blk00000044/sig00000134 ),
    .O(\blk00000044/sig00000135 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000054  (
    .I0(pinc_in[5]),
    .I1(sig0000008c),
    .O(\blk00000044/sig00000134 )
  );
  XORCY   \blk00000044/blk00000053  (
    .CI(\blk00000044/sig00000131 ),
    .LI(\blk00000044/sig00000132 ),
    .O(sig00000023)
  );
  MUXCY   \blk00000044/blk00000052  (
    .CI(\blk00000044/sig00000131 ),
    .DI(sig0000008b),
    .S(\blk00000044/sig00000132 ),
    .O(\blk00000044/sig00000133 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000051  (
    .I0(pinc_in[4]),
    .I1(sig0000008b),
    .O(\blk00000044/sig00000132 )
  );
  XORCY   \blk00000044/blk00000050  (
    .CI(\blk00000044/sig0000012f ),
    .LI(\blk00000044/sig00000130 ),
    .O(sig00000024)
  );
  MUXCY   \blk00000044/blk0000004f  (
    .CI(\blk00000044/sig0000012f ),
    .DI(sig0000008a),
    .S(\blk00000044/sig00000130 ),
    .O(\blk00000044/sig00000131 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000004e  (
    .I0(pinc_in[3]),
    .I1(sig0000008a),
    .O(\blk00000044/sig00000130 )
  );
  XORCY   \blk00000044/blk0000004d  (
    .CI(\blk00000044/sig0000012d ),
    .LI(\blk00000044/sig0000012e ),
    .O(sig00000025)
  );
  MUXCY   \blk00000044/blk0000004c  (
    .CI(\blk00000044/sig0000012d ),
    .DI(sig00000089),
    .S(\blk00000044/sig0000012e ),
    .O(\blk00000044/sig0000012f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000004b  (
    .I0(pinc_in[2]),
    .I1(sig00000089),
    .O(\blk00000044/sig0000012e )
  );
  XORCY   \blk00000044/blk0000004a  (
    .CI(\blk00000044/sig0000012b ),
    .LI(\blk00000044/sig0000012c ),
    .O(sig00000026)
  );
  MUXCY   \blk00000044/blk00000049  (
    .CI(\blk00000044/sig0000012b ),
    .DI(sig00000088),
    .S(\blk00000044/sig0000012c ),
    .O(\blk00000044/sig0000012d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000048  (
    .I0(pinc_in[1]),
    .I1(sig00000088),
    .O(\blk00000044/sig0000012c )
  );
  XORCY   \blk00000044/blk00000047  (
    .CI(sig00000002),
    .LI(\blk00000044/sig0000012a ),
    .O(sig00000027)
  );
  MUXCY   \blk00000044/blk00000046  (
    .CI(sig00000002),
    .DI(sig00000087),
    .S(\blk00000044/sig0000012a ),
    .O(\blk00000044/sig0000012b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000045  (
    .I0(pinc_in[0]),
    .I1(sig00000087),
    .O(\blk00000044/sig0000012a )
  );
  XORCY   \blk000000a5/blk00000105  (
    .CI(\blk000000a5/sig00000208 ),
    .LI(\blk000000a5/sig00000209 ),
    .O(sig00000047)
  );
  MUXCY   \blk000000a5/blk00000104  (
    .CI(\blk000000a5/sig00000208 ),
    .DI(sig000000a6),
    .S(\blk000000a5/sig00000209 ),
    .O(sig00000048)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk00000103  (
    .I0(sig000000a6),
    .I1(sig00000086),
    .O(\blk000000a5/sig00000209 )
  );
  XORCY   \blk000000a5/blk00000102  (
    .CI(\blk000000a5/sig00000206 ),
    .LI(\blk000000a5/sig00000207 ),
    .O(sig00000046)
  );
  MUXCY   \blk000000a5/blk00000101  (
    .CI(\blk000000a5/sig00000206 ),
    .DI(sig000000a5),
    .S(\blk000000a5/sig00000207 ),
    .O(\blk000000a5/sig00000208 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk00000100  (
    .I0(sig000000a5),
    .I1(sig00000085),
    .O(\blk000000a5/sig00000207 )
  );
  XORCY   \blk000000a5/blk000000ff  (
    .CI(\blk000000a5/sig00000204 ),
    .LI(\blk000000a5/sig00000205 ),
    .O(sig00000045)
  );
  MUXCY   \blk000000a5/blk000000fe  (
    .CI(\blk000000a5/sig00000204 ),
    .DI(sig000000a4),
    .S(\blk000000a5/sig00000205 ),
    .O(\blk000000a5/sig00000206 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000fd  (
    .I0(sig000000a4),
    .I1(sig00000084),
    .O(\blk000000a5/sig00000205 )
  );
  XORCY   \blk000000a5/blk000000fc  (
    .CI(\blk000000a5/sig00000202 ),
    .LI(\blk000000a5/sig00000203 ),
    .O(sig00000044)
  );
  MUXCY   \blk000000a5/blk000000fb  (
    .CI(\blk000000a5/sig00000202 ),
    .DI(sig000000a3),
    .S(\blk000000a5/sig00000203 ),
    .O(\blk000000a5/sig00000204 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000fa  (
    .I0(sig000000a3),
    .I1(sig00000083),
    .O(\blk000000a5/sig00000203 )
  );
  XORCY   \blk000000a5/blk000000f9  (
    .CI(\blk000000a5/sig00000200 ),
    .LI(\blk000000a5/sig00000201 ),
    .O(sig00000043)
  );
  MUXCY   \blk000000a5/blk000000f8  (
    .CI(\blk000000a5/sig00000200 ),
    .DI(sig000000a2),
    .S(\blk000000a5/sig00000201 ),
    .O(\blk000000a5/sig00000202 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000f7  (
    .I0(sig00000082),
    .I1(sig000000a2),
    .O(\blk000000a5/sig00000201 )
  );
  XORCY   \blk000000a5/blk000000f6  (
    .CI(\blk000000a5/sig000001fe ),
    .LI(\blk000000a5/sig000001ff ),
    .O(sig00000042)
  );
  MUXCY   \blk000000a5/blk000000f5  (
    .CI(\blk000000a5/sig000001fe ),
    .DI(sig000000a1),
    .S(\blk000000a5/sig000001ff ),
    .O(\blk000000a5/sig00000200 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000f4  (
    .I0(sig00000081),
    .I1(sig000000a1),
    .O(\blk000000a5/sig000001ff )
  );
  XORCY   \blk000000a5/blk000000f3  (
    .CI(\blk000000a5/sig000001fc ),
    .LI(\blk000000a5/sig000001fd ),
    .O(sig00000041)
  );
  MUXCY   \blk000000a5/blk000000f2  (
    .CI(\blk000000a5/sig000001fc ),
    .DI(sig000000a0),
    .S(\blk000000a5/sig000001fd ),
    .O(\blk000000a5/sig000001fe )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000f1  (
    .I0(sig00000080),
    .I1(sig000000a0),
    .O(\blk000000a5/sig000001fd )
  );
  XORCY   \blk000000a5/blk000000f0  (
    .CI(\blk000000a5/sig000001fa ),
    .LI(\blk000000a5/sig000001fb ),
    .O(sig00000040)
  );
  MUXCY   \blk000000a5/blk000000ef  (
    .CI(\blk000000a5/sig000001fa ),
    .DI(sig0000009f),
    .S(\blk000000a5/sig000001fb ),
    .O(\blk000000a5/sig000001fc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000ee  (
    .I0(sig0000007f),
    .I1(sig0000009f),
    .O(\blk000000a5/sig000001fb )
  );
  XORCY   \blk000000a5/blk000000ed  (
    .CI(\blk000000a5/sig000001f8 ),
    .LI(\blk000000a5/sig000001f9 ),
    .O(sig0000003f)
  );
  MUXCY   \blk000000a5/blk000000ec  (
    .CI(\blk000000a5/sig000001f8 ),
    .DI(sig0000009e),
    .S(\blk000000a5/sig000001f9 ),
    .O(\blk000000a5/sig000001fa )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000eb  (
    .I0(sig0000007e),
    .I1(sig0000009e),
    .O(\blk000000a5/sig000001f9 )
  );
  XORCY   \blk000000a5/blk000000ea  (
    .CI(\blk000000a5/sig000001f6 ),
    .LI(\blk000000a5/sig000001f7 ),
    .O(sig0000003e)
  );
  MUXCY   \blk000000a5/blk000000e9  (
    .CI(\blk000000a5/sig000001f6 ),
    .DI(sig0000009d),
    .S(\blk000000a5/sig000001f7 ),
    .O(\blk000000a5/sig000001f8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000e8  (
    .I0(sig0000007d),
    .I1(sig0000009d),
    .O(\blk000000a5/sig000001f7 )
  );
  XORCY   \blk000000a5/blk000000e7  (
    .CI(\blk000000a5/sig000001f4 ),
    .LI(\blk000000a5/sig000001f5 ),
    .O(sig0000003d)
  );
  MUXCY   \blk000000a5/blk000000e6  (
    .CI(\blk000000a5/sig000001f4 ),
    .DI(sig0000009c),
    .S(\blk000000a5/sig000001f5 ),
    .O(\blk000000a5/sig000001f6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000e5  (
    .I0(sig0000007c),
    .I1(sig0000009c),
    .O(\blk000000a5/sig000001f5 )
  );
  XORCY   \blk000000a5/blk000000e4  (
    .CI(\blk000000a5/sig000001f2 ),
    .LI(\blk000000a5/sig000001f3 ),
    .O(sig0000003c)
  );
  MUXCY   \blk000000a5/blk000000e3  (
    .CI(\blk000000a5/sig000001f2 ),
    .DI(sig0000009b),
    .S(\blk000000a5/sig000001f3 ),
    .O(\blk000000a5/sig000001f4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000e2  (
    .I0(sig0000007b),
    .I1(sig0000009b),
    .O(\blk000000a5/sig000001f3 )
  );
  XORCY   \blk000000a5/blk000000e1  (
    .CI(\blk000000a5/sig000001f0 ),
    .LI(\blk000000a5/sig000001f1 ),
    .O(sig0000003b)
  );
  MUXCY   \blk000000a5/blk000000e0  (
    .CI(\blk000000a5/sig000001f0 ),
    .DI(sig0000009a),
    .S(\blk000000a5/sig000001f1 ),
    .O(\blk000000a5/sig000001f2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000df  (
    .I0(sig0000007a),
    .I1(sig0000009a),
    .O(\blk000000a5/sig000001f1 )
  );
  XORCY   \blk000000a5/blk000000de  (
    .CI(\blk000000a5/sig000001ee ),
    .LI(\blk000000a5/sig000001ef ),
    .O(sig0000003a)
  );
  MUXCY   \blk000000a5/blk000000dd  (
    .CI(\blk000000a5/sig000001ee ),
    .DI(sig00000099),
    .S(\blk000000a5/sig000001ef ),
    .O(\blk000000a5/sig000001f0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000dc  (
    .I0(sig00000079),
    .I1(sig00000099),
    .O(\blk000000a5/sig000001ef )
  );
  XORCY   \blk000000a5/blk000000db  (
    .CI(\blk000000a5/sig000001ec ),
    .LI(\blk000000a5/sig000001ed ),
    .O(sig00000039)
  );
  MUXCY   \blk000000a5/blk000000da  (
    .CI(\blk000000a5/sig000001ec ),
    .DI(sig00000098),
    .S(\blk000000a5/sig000001ed ),
    .O(\blk000000a5/sig000001ee )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d9  (
    .I0(sig00000078),
    .I1(sig00000098),
    .O(\blk000000a5/sig000001ed )
  );
  XORCY   \blk000000a5/blk000000d8  (
    .CI(\blk000000a5/sig000001ea ),
    .LI(\blk000000a5/sig000001eb ),
    .O(sig00000038)
  );
  MUXCY   \blk000000a5/blk000000d7  (
    .CI(\blk000000a5/sig000001ea ),
    .DI(sig00000097),
    .S(\blk000000a5/sig000001eb ),
    .O(\blk000000a5/sig000001ec )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d6  (
    .I0(sig00000077),
    .I1(sig00000097),
    .O(\blk000000a5/sig000001eb )
  );
  XORCY   \blk000000a5/blk000000d5  (
    .CI(\blk000000a5/sig000001e8 ),
    .LI(\blk000000a5/sig000001e9 ),
    .O(sig00000037)
  );
  MUXCY   \blk000000a5/blk000000d4  (
    .CI(\blk000000a5/sig000001e8 ),
    .DI(sig00000096),
    .S(\blk000000a5/sig000001e9 ),
    .O(\blk000000a5/sig000001ea )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d3  (
    .I0(sig00000076),
    .I1(sig00000096),
    .O(\blk000000a5/sig000001e9 )
  );
  XORCY   \blk000000a5/blk000000d2  (
    .CI(\blk000000a5/sig000001e6 ),
    .LI(\blk000000a5/sig000001e7 ),
    .O(sig00000036)
  );
  MUXCY   \blk000000a5/blk000000d1  (
    .CI(\blk000000a5/sig000001e6 ),
    .DI(sig00000095),
    .S(\blk000000a5/sig000001e7 ),
    .O(\blk000000a5/sig000001e8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d0  (
    .I0(sig00000075),
    .I1(sig00000095),
    .O(\blk000000a5/sig000001e7 )
  );
  XORCY   \blk000000a5/blk000000cf  (
    .CI(\blk000000a5/sig000001e4 ),
    .LI(\blk000000a5/sig000001e5 ),
    .O(sig00000035)
  );
  MUXCY   \blk000000a5/blk000000ce  (
    .CI(\blk000000a5/sig000001e4 ),
    .DI(sig00000094),
    .S(\blk000000a5/sig000001e5 ),
    .O(\blk000000a5/sig000001e6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000cd  (
    .I0(sig00000074),
    .I1(sig00000094),
    .O(\blk000000a5/sig000001e5 )
  );
  XORCY   \blk000000a5/blk000000cc  (
    .CI(\blk000000a5/sig000001e2 ),
    .LI(\blk000000a5/sig000001e3 ),
    .O(sig00000034)
  );
  MUXCY   \blk000000a5/blk000000cb  (
    .CI(\blk000000a5/sig000001e2 ),
    .DI(sig00000093),
    .S(\blk000000a5/sig000001e3 ),
    .O(\blk000000a5/sig000001e4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000ca  (
    .I0(sig00000073),
    .I1(sig00000093),
    .O(\blk000000a5/sig000001e3 )
  );
  XORCY   \blk000000a5/blk000000c9  (
    .CI(\blk000000a5/sig000001e0 ),
    .LI(\blk000000a5/sig000001e1 ),
    .O(sig00000033)
  );
  MUXCY   \blk000000a5/blk000000c8  (
    .CI(\blk000000a5/sig000001e0 ),
    .DI(sig00000092),
    .S(\blk000000a5/sig000001e1 ),
    .O(\blk000000a5/sig000001e2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000c7  (
    .I0(sig00000072),
    .I1(sig00000092),
    .O(\blk000000a5/sig000001e1 )
  );
  XORCY   \blk000000a5/blk000000c6  (
    .CI(\blk000000a5/sig000001de ),
    .LI(\blk000000a5/sig000001df ),
    .O(sig00000032)
  );
  MUXCY   \blk000000a5/blk000000c5  (
    .CI(\blk000000a5/sig000001de ),
    .DI(sig00000091),
    .S(\blk000000a5/sig000001df ),
    .O(\blk000000a5/sig000001e0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000c4  (
    .I0(sig00000071),
    .I1(sig00000091),
    .O(\blk000000a5/sig000001df )
  );
  XORCY   \blk000000a5/blk000000c3  (
    .CI(\blk000000a5/sig000001dc ),
    .LI(\blk000000a5/sig000001dd ),
    .O(sig00000031)
  );
  MUXCY   \blk000000a5/blk000000c2  (
    .CI(\blk000000a5/sig000001dc ),
    .DI(sig00000090),
    .S(\blk000000a5/sig000001dd ),
    .O(\blk000000a5/sig000001de )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000c1  (
    .I0(sig00000070),
    .I1(sig00000090),
    .O(\blk000000a5/sig000001dd )
  );
  XORCY   \blk000000a5/blk000000c0  (
    .CI(\blk000000a5/sig000001da ),
    .LI(\blk000000a5/sig000001db ),
    .O(sig00000030)
  );
  MUXCY   \blk000000a5/blk000000bf  (
    .CI(\blk000000a5/sig000001da ),
    .DI(sig0000008f),
    .S(\blk000000a5/sig000001db ),
    .O(\blk000000a5/sig000001dc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000be  (
    .I0(sig0000006f),
    .I1(sig0000008f),
    .O(\blk000000a5/sig000001db )
  );
  XORCY   \blk000000a5/blk000000bd  (
    .CI(\blk000000a5/sig000001d8 ),
    .LI(\blk000000a5/sig000001d9 ),
    .O(sig0000002f)
  );
  MUXCY   \blk000000a5/blk000000bc  (
    .CI(\blk000000a5/sig000001d8 ),
    .DI(sig0000008e),
    .S(\blk000000a5/sig000001d9 ),
    .O(\blk000000a5/sig000001da )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000bb  (
    .I0(sig0000006e),
    .I1(sig0000008e),
    .O(\blk000000a5/sig000001d9 )
  );
  XORCY   \blk000000a5/blk000000ba  (
    .CI(\blk000000a5/sig000001d6 ),
    .LI(\blk000000a5/sig000001d7 ),
    .O(sig0000002e)
  );
  MUXCY   \blk000000a5/blk000000b9  (
    .CI(\blk000000a5/sig000001d6 ),
    .DI(sig0000008d),
    .S(\blk000000a5/sig000001d7 ),
    .O(\blk000000a5/sig000001d8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000b8  (
    .I0(sig0000006d),
    .I1(sig0000008d),
    .O(\blk000000a5/sig000001d7 )
  );
  XORCY   \blk000000a5/blk000000b7  (
    .CI(\blk000000a5/sig000001d4 ),
    .LI(\blk000000a5/sig000001d5 ),
    .O(sig0000002d)
  );
  MUXCY   \blk000000a5/blk000000b6  (
    .CI(\blk000000a5/sig000001d4 ),
    .DI(sig0000008c),
    .S(\blk000000a5/sig000001d5 ),
    .O(\blk000000a5/sig000001d6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000b5  (
    .I0(sig0000006c),
    .I1(sig0000008c),
    .O(\blk000000a5/sig000001d5 )
  );
  XORCY   \blk000000a5/blk000000b4  (
    .CI(\blk000000a5/sig000001d2 ),
    .LI(\blk000000a5/sig000001d3 ),
    .O(sig0000002c)
  );
  MUXCY   \blk000000a5/blk000000b3  (
    .CI(\blk000000a5/sig000001d2 ),
    .DI(sig0000008b),
    .S(\blk000000a5/sig000001d3 ),
    .O(\blk000000a5/sig000001d4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000b2  (
    .I0(sig0000006b),
    .I1(sig0000008b),
    .O(\blk000000a5/sig000001d3 )
  );
  XORCY   \blk000000a5/blk000000b1  (
    .CI(\blk000000a5/sig000001d0 ),
    .LI(\blk000000a5/sig000001d1 ),
    .O(sig0000002b)
  );
  MUXCY   \blk000000a5/blk000000b0  (
    .CI(\blk000000a5/sig000001d0 ),
    .DI(sig0000008a),
    .S(\blk000000a5/sig000001d1 ),
    .O(\blk000000a5/sig000001d2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000af  (
    .I0(sig0000006a),
    .I1(sig0000008a),
    .O(\blk000000a5/sig000001d1 )
  );
  XORCY   \blk000000a5/blk000000ae  (
    .CI(\blk000000a5/sig000001ce ),
    .LI(\blk000000a5/sig000001cf ),
    .O(sig0000002a)
  );
  MUXCY   \blk000000a5/blk000000ad  (
    .CI(\blk000000a5/sig000001ce ),
    .DI(sig00000089),
    .S(\blk000000a5/sig000001cf ),
    .O(\blk000000a5/sig000001d0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000ac  (
    .I0(sig00000069),
    .I1(sig00000089),
    .O(\blk000000a5/sig000001cf )
  );
  XORCY   \blk000000a5/blk000000ab  (
    .CI(\blk000000a5/sig000001cc ),
    .LI(\blk000000a5/sig000001cd ),
    .O(sig00000029)
  );
  MUXCY   \blk000000a5/blk000000aa  (
    .CI(\blk000000a5/sig000001cc ),
    .DI(sig00000088),
    .S(\blk000000a5/sig000001cd ),
    .O(\blk000000a5/sig000001ce )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000a9  (
    .I0(sig00000068),
    .I1(sig00000088),
    .O(\blk000000a5/sig000001cd )
  );
  XORCY   \blk000000a5/blk000000a8  (
    .CI(sig00000002),
    .LI(\blk000000a5/sig000001cb ),
    .O(sig00000028)
  );
  MUXCY   \blk000000a5/blk000000a7  (
    .CI(sig00000002),
    .DI(sig00000087),
    .S(\blk000000a5/sig000001cb ),
    .O(\blk000000a5/sig000001cc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000a6  (
    .I0(sig00000067),
    .I1(sig00000087),
    .O(\blk000000a5/sig000001cb )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
