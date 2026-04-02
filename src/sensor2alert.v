module sensor2alert(    
    input F_in, T_in, P_in, L_in, 					//sensores
    output AL3_out, AL2_out, AL1_out, AL0_out   //bits de saida, do MSB ao LSB
);

wire NotL, NotT, NotP, NotF;
wire FNotT, FP, TP;
wire FNotTNotL, FTNotP,NotFTNotL, NotTNotPL, FPL, NotFPL, FTL;
wire NotFTNotPL;

not (NotL, L_in);
not (NotT, T_in);
not (NotP, P_in);
not (NotF, F_in);

and(FNotT, F_in, NotT);
and(FP, F_in, P_in);
and(TP, T_in, P_in);

and(FTL, F_in, T_in, L_in);
and(FTNotP, F_in, T_in, NotP);
and(FNotTNotL, FNotT, NotL);
and(NotFTNotL, NotF, T_in, NotL);
and(NotFPL, NotF, P_in, L_in);
and(FPL, FP, L_in);
and(NotTNotPL, NotT, NotP, L_in);

and(NotFTNotPL, NotF, T_in, NotP, L_in);

or (AL3_out, FTNotP, 1'b0);   			           //AL3 bit 3
or (AL2_out, FNotT, FP, NotFTNotPL);              //AL2 bit 2
or (AL1_out, TP, NotTNotPL, NotFTNotL, FPL);      //AL1 bit 1
or (AL0_out, NotFTNotL, NotFPL, FNotTNotL, TP);    //AL0 bit 0

endmodule
