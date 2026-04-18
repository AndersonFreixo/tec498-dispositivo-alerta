module count5bit(    
    input trigger, reset, 	
    output [4:0] count,
    output limit  
);

jk_ff ff4 (
	. j (1'b1),
	. k (1'b1),
	. reset(reset),	
	. clk(count[3]),	
	. q(count[4])
);

jk_ff ff3 (
	. j (1'b1),
	. k (1'b1),
	. clk(count[2]),	
	. reset(reset),	
	. q(count[3])
);

jk_ff ff2 (
	. j (1'b1),
	. k (1'b1),
	. clk(count[1]),
	. reset(reset),	
	. q(count[2])
);

jk_ff ff1 (
	. j (1'b1),
	. k (1'b1),
	. clk(count[0]),	
	. reset(reset),	
	. q(count[1])
);


jk_ff ff0 (
	. j (1'b1),
	. k (1'b1),
	. clk(trigger),	
	. reset(reset),	
	. q(count[0])
);

and(limit, count[4], count[2], count[0]);

endmodule