module alert2leds(    
     input AL3_in, AL2_in, AL1_in, AL0_in, //bits de entrada, do MSB ao LSB					            
     output led3_out, led2_out, led1_out, led0_out 
);

	wire NotAL3, NotAL2, NotAL0, XorAL2_AL1;
	
	not (NotAL3, AL3_in);
	not (NotAL2, AL2_in);
	not (NotAL0, AL0_in);

	xor (XorAL2_AL1, AL2_in, AL1_in);
	
	and(led0_out, NotAL2, AL0_in);	
	and(led1_out, NotAL0, XorAL2_AL1); 
	or(led2_out, AL2_in, AL3_in); 
	and(led3_out, 1'b0, 1'b0); //nenhum alerta acende o led3
endmodule