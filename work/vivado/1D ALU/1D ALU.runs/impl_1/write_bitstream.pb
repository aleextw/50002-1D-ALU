
r
Command: %s
53*	vivadotcl2A
-write_bitstream -force au_top_0.bit -bin_file2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2Z
 "D
sixteen_bit_alu/mlt/p0	sixteen_bit_alu/mlt/p02default:default2default:default2d
 "N
sixteen_bit_alu/mlt/p0/A[29:0]sixteen_bit_alu/mlt/p0/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2Z
 "D
sixteen_bit_alu/mlt/p0	sixteen_bit_alu/mlt/p02default:default2default:default2d
 "N
sixteen_bit_alu/mlt/p0/B[17:0]sixteen_bit_alu/mlt/p0/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
?PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2Z
 "D
sixteen_bit_alu/mlt/p0	sixteen_bit_alu/mlt/p02default:default2default:default2d
 "N
sixteen_bit_alu/mlt/p0/P[47:0]sixteen_bit_alu/mlt/p0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2Z
 "D
sixteen_bit_alu/mlt/p0	sixteen_bit_alu/mlt/p02default:default2default:default2d
 "N
sixteen_bit_alu/mlt/p0/P[47:0]sixteen_bit_alu/mlt/p0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2D
 ".
btn_cnd/clkbtn_cnd/clk2default:default2default:default2`
 "J
btn_cnd/M_ctr_q[27]_i_2/Obtn_cnd/M_ctr_q[27]_i_2/O2default:default2default:default2\
 "F
btn_cnd/M_ctr_q[27]_i_2	btn_cnd/M_ctr_q[27]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2H
 "2
sel/a_dff_clksel/a_dff_clk2default:default2default:default2\
 "F
sel/M_a_dff_q[15]_i_1/Osel/M_a_dff_q[15]_i_1/O2default:default2default:default2X
 "B
sel/M_a_dff_q[15]_i_1	sel/M_a_dff_q[15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2P
 ":
sel/alufn_dff_clksel/alufn_dff_clk2default:default2default:default2b
 "L
sel/M_alufn_dff_q[5]_i_1/Osel/M_alufn_dff_q[5]_i_1/O2default:default2default:default2^
 "H
sel/M_alufn_dff_q[5]_i_1	sel/M_alufn_dff_q[5]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2H
 "2
sel/b_dff_clksel/b_dff_clk2default:default2default:default2\
 "F
sel/M_b_dff_q[15]_i_1/Osel/M_b_dff_q[15]_i_1/O2default:default2default:default2X
 "B
sel/M_b_dff_q[15]_i_1	sel/M_b_dff_q[15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?

?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 28 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2\
 "F
btn_cnd/M_ctr_q[27]_i_2	btn_cnd/M_ctr_q[27]_i_22default:default2default:default2?
 "<
sel/M_ctr_q_reg[0]	sel/M_ctr_q_reg[0]2default:default">
sel/M_ctr_q_reg[10]	sel/M_ctr_q_reg[10]2default:default">
sel/M_ctr_q_reg[11]	sel/M_ctr_q_reg[11]2default:default">
sel/M_ctr_q_reg[12]	sel/M_ctr_q_reg[12]2default:default">
sel/M_ctr_q_reg[13]	sel/M_ctr_q_reg[13]2default:default">
sel/M_ctr_q_reg[14]	sel/M_ctr_q_reg[14]2default:default">
sel/M_ctr_q_reg[15]	sel/M_ctr_q_reg[15]2default:default">
sel/M_ctr_q_reg[16]	sel/M_ctr_q_reg[16]2default:default">
sel/M_ctr_q_reg[17]	sel/M_ctr_q_reg[17]2default:default">
sel/M_ctr_q_reg[18]	sel/M_ctr_q_reg[18]2default:default">
sel/M_ctr_q_reg[19]	sel/M_ctr_q_reg[19]2default:default"<
sel/M_ctr_q_reg[1]	sel/M_ctr_q_reg[1]2default:default">
sel/M_ctr_q_reg[20]	sel/M_ctr_q_reg[20]2default:default">
sel/M_ctr_q_reg[21]	sel/M_ctr_q_reg[21]2default:default":
sel/M_ctr_q_reg[22]	sel/M_ctr_q_reg[22]2default:..."/
(the first 15 of 28 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?

?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 16 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2X
 "B
sel/M_a_dff_q[15]_i_1	sel/M_a_dff_q[15]_i_12default:default2default:default2?
 "8
M_a_dff_q_reg[0]	M_a_dff_q_reg[0]2default:default":
M_a_dff_q_reg[10]	M_a_dff_q_reg[10]2default:default":
M_a_dff_q_reg[11]	M_a_dff_q_reg[11]2default:default":
M_a_dff_q_reg[12]	M_a_dff_q_reg[12]2default:default":
M_a_dff_q_reg[13]	M_a_dff_q_reg[13]2default:default":
M_a_dff_q_reg[14]	M_a_dff_q_reg[14]2default:default":
M_a_dff_q_reg[15]	M_a_dff_q_reg[15]2default:default"8
M_a_dff_q_reg[1]	M_a_dff_q_reg[1]2default:default"8
M_a_dff_q_reg[2]	M_a_dff_q_reg[2]2default:default"8
M_a_dff_q_reg[3]	M_a_dff_q_reg[3]2default:default"8
M_a_dff_q_reg[4]	M_a_dff_q_reg[4]2default:default"8
M_a_dff_q_reg[5]	M_a_dff_q_reg[5]2default:default"8
M_a_dff_q_reg[6]	M_a_dff_q_reg[6]2default:default"8
M_a_dff_q_reg[7]	M_a_dff_q_reg[7]2default:default"4
M_a_dff_q_reg[8]	M_a_dff_q_reg[8]2default:..."/
(the first 15 of 16 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 5 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2^
 "H
sel/M_alufn_dff_q[5]_i_1	sel/M_alufn_dff_q[5]_i_12default:default2default:default2?
 "@
M_alufn_dff_q_reg[0]	M_alufn_dff_q_reg[0]2default:default"@
M_alufn_dff_q_reg[1]	M_alufn_dff_q_reg[1]2default:default"@
M_alufn_dff_q_reg[2]	M_alufn_dff_q_reg[2]2default:default"@
M_alufn_dff_q_reg[4]	M_alufn_dff_q_reg[4]2default:default"@
M_alufn_dff_q_reg[5]	M_alufn_dff_q_reg[5]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?

?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 16 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2X
 "B
sel/M_b_dff_q[15]_i_1	sel/M_b_dff_q[15]_i_12default:default2default:default2?
 "8
M_b_dff_q_reg[0]	M_b_dff_q_reg[0]2default:default":
M_b_dff_q_reg[10]	M_b_dff_q_reg[10]2default:default":
M_b_dff_q_reg[11]	M_b_dff_q_reg[11]2default:default":
M_b_dff_q_reg[12]	M_b_dff_q_reg[12]2default:default":
M_b_dff_q_reg[13]	M_b_dff_q_reg[13]2default:default":
M_b_dff_q_reg[14]	M_b_dff_q_reg[14]2default:default":
M_b_dff_q_reg[15]	M_b_dff_q_reg[15]2default:default"8
M_b_dff_q_reg[1]	M_b_dff_q_reg[1]2default:default"8
M_b_dff_q_reg[2]	M_b_dff_q_reg[2]2default:default"8
M_b_dff_q_reg[3]	M_b_dff_q_reg[3]2default:default"8
M_b_dff_q_reg[4]	M_b_dff_q_reg[4]2default:default"8
M_b_dff_q_reg[5]	M_b_dff_q_reg[5]2default:default"8
M_b_dff_q_reg[6]	M_b_dff_q_reg[6]2default:default"8
M_b_dff_q_reg[7]	M_b_dff_q_reg[7]2default:default"4
M_b_dff_q_reg[8]	M_b_dff_q_reg[8]2default:..."/
(the first 15 of 16 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 12 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
f
%Bitstream compression saved %s bits.
26*	bitstream2
131470082default:defaultZ40-26h px? 
_
Writing bitstream %s...
11*	bitstream2"
./au_top_0.bit2default:defaultZ40-11h px? 
_
Writing bitstream %s...
11*	bitstream2"
./au_top_0.bin2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1022default:default2
162default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:122default:default2
00:00:172default:default2
1887.0392default:default2
428.3012default:defaultZ17-268h px? 


End Record