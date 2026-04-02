module main(    
    input f_in, t_in, p_in, l_in, m1_in, m0_in, 					            
    output  a, b, c, d, e, f, g, led3, led2, led1, led0 
);

wire al3, al2, al1, al0;                             //fios com codigo de alerta
wire al_a, al_b, al_c, al_d, al_e, al_f, al_g;       //fios com codigo de alerta p display 7 segmentos
wire hex_a, hex_b, hex_c, hex_d, hex_e, hex_f, hex_g;//fios com codigo hexa p display 7 segmentos
wire al_led0, al_led1, al_led2, al_led3;             //fios dos leds de alerta

sensor2alert conversorAlerta (
	.F_in(f_in),
	.T_in(t_in),
	.P_in(p_in),
	.L_in(l_in),
	.AL3_out(al3),
	.AL2_out(al2),
	.AL1_out(al1),
	.AL0_out(al0)
);

alert2leds codificadorAlertaLeds(
	.AL3_in(al3),
	.AL2_in(al2),
	.AL1_in(al1),
	.AL0_in(al0),	
	.led3_out(al_led3), 
	.led2_out(al_led2), 
	.led1_out(al_led1), 
	.led0_out(al_led0)  
);

alert2disp codificadorAlertaDisplay (
	.AL3_in(al3),
	.AL2_in(al2),
	.AL1_in(al1),
	.AL0_in(al0),
	.a_out(al_a),
	.b_out(al_b),
	.c_out(al_c),
	.d_out(al_d),
	.e_out(al_e),
	.f_out(al_f),
	.g_out(al_g)
);

sensor2bin codificadorHexDisplay(
	.F(f_in),
	.T(t_in),
	.P(p_in),
	.L(l_in),
	.a_out(hex_a),
	.b_out(hex_b),
	.c_out(hex_c),
	.d_out(hex_d),
	.e_out(hex_e),
	.f_out(hex_f),
	.g_out(hex_g)
);

/*Multiplexador dos sinais dos leds*/
mux4i4w4o o_pequeno_mux(
   . s1(m1_in),  //chaves seletoras
	. s0(m0_in),	

	. led3_0(al_led3),   
	. led2_0(al_led2), 
	. led1_0(al_led1), 
	. led0_0(al_led0),	
	
	. led3_1(f_in),  
	. led2_1(t_in), 
	. led1_1(p_in), 
	. led0_1(l_in),
	
	. led3_2(1'b1),  
	. led2_2(1'b1), 
	. led1_2(1'b1), 
	. led0_2(1'b1),
	
	. led3_3(1'b0),  
	. led2_3(1'b1), 
	. led1_3(1'b0), 
	. led0_3(1'b0),
	
	. led3_out(led3), 
	. led2_out(led2), 
	. led1_out(led1), 
	. led0_out(led0)  
	
);



/*Multiplexador dos sinais do display*/
mux4i7w7o O_GRANDE_MUX(
   .s1(m1_in),  //chaves seletoras
	.s0(m0_in),
	
	.a0(al_a), //entradas de display do alerta
	.b0(al_b),
	.c0(al_c),
	.d0(al_d),
	.e0(al_e),
	.f0(al_f),
	.g0(al_g),
	
	.a1(hex_a), //entradas de display hexadecimal
	.b1(hex_b),
	.c1(hex_c),
	.d1(hex_d),
	.e1(hex_e),
	.f1(hex_f),
	.g1(hex_g),
	
	.a2(1'b0), //entrada fixa M
	.b2(1'b1),
	.c2(1'b0),
	.d2(1'b1),
	.e2(1'b0),
	.f2(1'b1),
	.g2(1'b0),
	
	.a3(1'b0), //entrada fixa F
	.b3(1'b1),
	.c3(1'b1),
	.d3(1'b1),
	.e3(1'b0),
	.f3(1'b0),
	.g3(1'b0),

	.a_out(a),  //saida p/ o display
	.b_out(b),
	.c_out(c),
	.d_out(d),
	.e_out(e),
	.f_out(f),
	.g_out(g)
);

endmodule
