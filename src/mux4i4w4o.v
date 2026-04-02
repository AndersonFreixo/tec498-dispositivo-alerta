module mux4i4w4o(    
    input s0, s1,
    input led3_0, led2_0, led1_0, led0_0,
	 input led3_1, led2_1, led1_1, led0_1,
	 input led3_2, led2_2, led1_2, led0_2,
	 input led3_3, led2_3, led1_3, led0_3,
    output led3_out, led2_out, led1_out, led0_out  
);

mux4i1o muxLed0 (
	. i0(led0_0),
	. i1(led0_1),
	. i2(led0_2),
	. i3(led0_3),
	. s1(s1),
	. s0(s0),
	. out(led0_out)
);

mux4i1o muxLed1 (
	. i0(led1_0),
	. i1(led1_1),
	. i2(led1_2),
	. i3(led1_3),
	. s1(s1),
	. s0(s0),
	. out(led1_out)
);

mux4i1o muxLed2 (
	. i0(led2_0),
	. i1(led2_1),
	. i2(led2_2),
	. i3(led2_3),
	. s1(s1),
	. s0(s0),
	. out(led2_out)
);

mux4i1o muxLed3 (
	. i0(led3_0),
	. i1(led3_1),
	. i2(led3_2),
	. i3(led3_3),
	. s1(s1),
	. s0(s0),
	. out(led3_out)
);

endmodule