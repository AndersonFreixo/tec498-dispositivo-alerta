module counter_test();
	wire [4:0] count;
	reg trigg;
	reg reset;
	integer i;
	
	count5bit t5counter(
		.trigger(trigg),
		.count(count),
		.reset(reset)   	
	);

    initial begin
        trigg = 0;
        reset = 1;
    	#100 
    	reset = 0;
    	#100 
    	$write("Estado inicial - trigger: %1b %5b\n", trigg, count); 
    	
    	for (i = 0; i < 64; i = i + 1) begin
         	#100
         	trigg = ~trigg;
    		$write("trigger: %1b %5b (%d)\n", trigg, count, count[4:0]); 
    	end
    end 
         
endmodule
