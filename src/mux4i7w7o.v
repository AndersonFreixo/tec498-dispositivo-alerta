module mux4i7w7o(    
    input s0, s1,
    input a0, b0, c0, d0, e0, f0, g0,
	 input a1, b1, c1, d1, e1, f1, g1,
	 input a2, b2, c2, d2, e2, f2, g2,
	 input a3, b3, c3, d3, e3, f3, g3,
    output a_out, b_out, c_out, d_out, e_out, f_out, g_out  
);

mux4i1o muxA(
	.i0(a0),
	.i1(a1),
	.i2(a2),
	.i3(a3),
	.s1(s1),
	.s0(s0),
	.out(a_out)
);

mux4i1o muxB(
	.i0(b0),
	.i1(b1),
	.i2(b2),
	.i3(b3),
	.s1(s1),
	.s0(s0),
	.out(b_out)
);

mux4i1o muxC(
	.i0(c0),
	.i1(c1),
	.i2(c2),
	.i3(c3),
	.s1(s1),
	.s0(s0),
	.out(c_out)
);

mux4i1o muxD(
	.i0(d0),
	.i1(d1),
	.i2(d2),
	.i3(d3),
	.s1(s1),
	.s0(s0),
	.out(d_out)
);

mux4i1o muxE(
	.i0(e0),
	.i1(e1),
	.i2(e2),
	.i3(e3),
	.s1(s1),
	.s0(s0),
	.out(e_out)
);

mux4i1o muxF(
	.i0(f0),
	.i1(f1),
	.i2(f2),
	.i3(f3),
	.s1(s1),
	.s0(s0),
	.out(f_out)
);

mux4i1o muxG(
	.i0(g0),
	.i1(g1),
	.i2(g2),
	.i3(g3),
	.s1(s1),
	.s0(s0),
	.out(g_out)
);

endmodule