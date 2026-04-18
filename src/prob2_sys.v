module prob2_sys(    
    input f_in, t_in, p_in, l_in, m1_in, m0_in,	
	 input reset, //reset global dos contadores
    output d0a_out, d0b_out, d0c_out, d0d_out, d0e_out, d0f_out, d0g_out, led3, led2, led1, led0,
);

wire d0a, d0b, d0c, d0d, d0e, d0f, d0g; //fios da saida para o display do problema 1
wire f_limit, t_limit, p_limit, l_limit global_limit; //indicam overflow dos contadores
wire [4:0] f_count, [4:0] t_count, [4:0] p_count, [4:0] l_count; //valor dos contadores
wire not_limit; 		//se = 1, nao aconteceu overflow
or (global_limit, f_limit, t_limit, p_limit, l_limit); //1 se o limite de qualquer contador for 1

not(not_limit, global_limit); //Pra ser usado no mecanismo de trava.
 
/*O display do problema 1 deve ser apagado
quando algum contador atinge o limite. 
Cada segmento 'apaga' quando recebe 1,
entao, usando OR, quando o limite tiver sido
atingido, todos os segmentos apagam.*/

or (d0a_out, d0a, global_limit); 
or (d0b_out, d0b, global_limit); 
or (d0c_out, d0c, global_limit); 
or (d0d_out, d0d, global_limit); 
or (d0e_out, d0e, global_limit); 
or (d0f_out, d0f, global_limit); 
or (d0g_out, d0g, global_limit); 

//Instanciacao de todo o circuito do problema 1
main prob1_sys (
	. f_in (f_in),
	. t_in (t_in),
	. p_in (p_in),
	. l_in (l_in),
	. m1_in (f_in),
	. m0_in (f_in),	
	.a (d0a), 
	.b (d0b), 
	.c (d0c), 
	.d (d0d), 
	.e (d0e), 
	.f (d0f), 
	.g (d0g), 
	.led3 (led3), 
	.led2 (led3), 
	.led1 (led3), 
	.led0 (led3) 				
);

//Contadores para cada sensor
count5bit f_counter(
	. trigger (f_in),
	. reset (reset),
	. count (f_count),
	. limit (f_limit)
);

count5bit t_counter(
	. trigger (t_in),
	. reset (reset),
	. count (t_count),
	. limit (t_limit)
);

count5bit p_counter(
	. trigger (p_in),
	. reset (reset),
	. count (p_count),
	. limit (p_limit)
);

count5bit l_counter(
	. trigger (l_in),
	. reset (reset),
	. count (l_count),
	. limit (l_limit)
);

endmodule