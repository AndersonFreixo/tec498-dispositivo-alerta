module ff_test();
	wire q_out;
	reg trigg;
	reg res;
	integer i;
	
	jk_ff ff(
		. clk(trigg),	
		. q(q_out),
		. reset(res),
		. j(1'b1),
		. k(1'b1)
);

    initial begin
        trigg = 0;
        res = 1;
    	#100 
    	res = 0;
    	for (i = 0; i < 10; i = i + 1) begin
         	#100
         	trigg <= !trigg;
         	#100
    		$write("q: %1b, trigg: %1b\n", q_out, trigg);
    	end
    end 
         
endmodule
