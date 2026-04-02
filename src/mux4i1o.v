module mux4i1o(    
    input i0, i1, i2, i3, s1, s0, 					            
    output  out  
);

wire out0, out1, out2, out3;
wire Nots1, Nots0;

not (Nots1, s1);
not (Nots0, s0);

and (out0, i0, Nots1, Nots0);
and (out1, i1, Nots1, s0);
and (out2, i2, s1, Nots0);
and (out3, i3, s1, s0);
 
or (out, out0, out1, out2, out3);  
endmodule