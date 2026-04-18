`define result(n1, n0, lt, gt, eq) \
		$write("N1=%d (%5b), N0=%d (%5b). LT:%1b, GT:%1b, EQ:%1b\n", n1, n1, n0, n0, lt, gt, eq)\	

module comparator_test();
	reg [4:0] n1;
	reg [4:0] n0;
	wire gt, lt, eq;

	comp5bits comparator(
		.num1(n1[4:0]),
		.num0(n0[4:0]),	
		.gt_out(gt),
		.lt_out(lt),
		.eq_out(eq)	    
	);
	
    initial begin
    	#1000
    	n1 = 21;
    	n0 = 6;
    	#100
    	`result(n1, n0, lt, gt, eq); 
        #1000
    	n1 = 1;
    	n0 = 15;
    	#1000
    	`result(n1, n0, lt, gt, eq); 

    	n1 = 3;
    	n0 = 3;
    	#100
    	`result(n1, n0, lt, gt, eq); 
    	
    	n1 = 25;
    	n0 = 24;
    	#100
    	`result(n1, n0, lt, gt, eq); 
        
    	n1 = 22;
    	n0 = 23;
    	#100
    	`result(n1, n0, lt, gt, eq); 	

    	n1 = 10;
    	n0 = 10;
    	#100
    	`result(n1, n0, lt, gt, eq);     	

    	n1 = 0;
    	n0 = 0;
    	#100
    	`result(n1, n0, lt, gt, eq); 
    	
    	n1 = 1;
    	n0 = 0;
    	#100
    	`result(n1, n0, lt, gt, eq);  
    	   	
    	n1 = 0;
    	n0 = 1;
    	#100
    	`result(n1, n0, lt, gt, eq); 
    end 
         
endmodule
