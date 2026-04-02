module alert2disp(    
    input AL3_in, AL2_in, AL1_in, AL0_in, //bits de entrada, do MSB ao LSB
    output a_out, b_out, c_out, d_out, e_out, f_out, g_out 
	);
	//Leds do display
	//    A
	//  F   B
	//    G
	//  E   C
	//    D
	 
	//AL  3210	a	b	c	d	e	f	g
	//------------------------------
	//N	0000	0	0	0	1	0	0	1
	//L	0001	1	1	1	0	0	0	1
	//I	0010	1	0	0	1	1	1	1
	//T	0011	0	0	1	0	1	0	1
	//H	0100	1	0	0	1	0	0	0
	//G	0101	0	1	0	0	0	0	1
	//C	0110	0	1	1	0	0	0	1
	//A	0111	0	0	0	1	0	0	0
	//F	1000	0	1	1	1	0	0	0
	//     ...  x  x  x  x  x  x  x
	//    1111  x  x  x  x  x  x  x  
   wire NotAL3, NotAL2, NotAL1, NotAL0;
	wire IsF, IsA, IsC, IsG, IsH, IsT, IsI, IsL, IsN;
		
	not (NotAL3, AL3_in);
	not (NotAL2, AL2_in);
	not (NotAL1, AL1_in);
	not (NotAL0, AL0_in);
	//Detecta codigo de alerta
	and (IsN, NotAL3, NotAL2, NotAL1, NotAL0);
	and (IsL, NotAL3, NotAL2, NotAL1, AL0_in);
	and (IsI, NotAL3, NotAL2, AL1_in, NotAL0);
	and (IsT, NotAL3, NotAL2, AL1_in, AL0_in);
	and (IsH, NotAL3, AL2_in, NotAL1, NotAL0);
	and (IsG, NotAL3, AL2_in, NotAL1, AL0_in);
	and (IsC, NotAL3, AL2_in, AL1_in, NotAL0);
	and (IsA, NotAL3, AL2_in, AL1_in, AL0_in);
	and (IsF, AL3_in, NotAL2, NotAL1, NotAL0); 
	
	or (a_out, IsL, IsI, IsH); 			
	or (b_out, IsL, IsG, IsC, IsF); 
	or (c_out, IsL, IsT, IsC, IsF);
	or (d_out, IsN, IsI, IsH, IsA, IsF);
	or (e_out, IsI, IsT); 			
	or (f_out, IsI); 
	or (g_out, IsN, IsL, IsT, IsI, IsG, IsC);
	
endmodule