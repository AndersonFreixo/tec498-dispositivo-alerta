`define print_display(ftpl, m1m0, a, b, c, d, e, f, g, l3, l2, l1, l0) \
		$write("in=%4b mode=%2b\n", ftpl, m1m0);\		
		$write("abcdefg: %1b %1b %1b %1b %1b %1b %1b\n", a,b,c,d,e,f,g);\	
		$write("leds(3-2-1-0): %1b-%1b-%1b-%1b\n", l3,l2,l1,l0);\
		if (!a)\
		$write(" __\n");\
		else\
		$write(" \n");\
		if (!f)\
		$write("|  ");\
		else\
		$write("   ");\
		if (!b)\
		$write("|\n");\
		else\
		$write("\n");\
		if (!g)\
		$write(" --\n");\
		else\
		$write("\n");\
		if (!e)\
		$write("|  ");\
		else\
		$write("   ");\
		if (!c)\
		$write("|\n");\
		else\
		$write("\n");\
		if (!d)\
		$write(" --\n");\
		else\
		$write("\n");\  

module main_testbench();
	reg [3:0] ftpl;
	reg [1:0] m1m0;
	wire a, b, c, d, e, f, g, l3, l2, l1, l0;
	integer i;
	main main_circuit(
		.f_in(ftpl[3]),
		.t_in(ftpl[2]),	
		.p_in(ftpl[1]),
		.l_in(ftpl[0]),
		.m1_in(m1m0[1]),
		.m0_in(m1m0[0]),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.led3(l3),
		.led2(l2),
		.led1(l1),
		.led0(l0)		    
	);
	
    initial begin
        $write("MODO NORMAL\n"); 
        m1m0[1:0] = 2'b00;
        for (i = 0; i < 16; i = i + 1) begin
    	ftpl[3:0] = i;
        #10000   
    	`print_display(ftpl, m1m0, a, b, c, d, e, f, g, l3, l2, l1, l0);
		end   
    
        $write("MODO DIAGNOSTICO\n"); 
        m1m0[1:0] = 2'b01;
        for (i = 0; i < 16; i = i + 1) begin
    		ftpl[3:0] = i;
        #10000   
    	`print_display(ftpl, m1m0, a, b, c, d, e, f, g, l3, l2, l1, l0);
		end    

    end 
         
endmodule
