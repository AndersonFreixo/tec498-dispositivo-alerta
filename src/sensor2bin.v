module sensor2bin(    
    input F, T, P, L, 					            
    output a_out, b_out, c_out, d_out, e_out, f_out, g_out 
);

wire NotF, NotT, NotP, NotL;
wire FT, FNotT, NotFNotT, NotFT, NotFL;
wire NotPL, NotPNotL, PL;
wire FTP, TPL, FTNotL, FPL, NotFPL, NotFNotTNotP, NotTPL, NotTPNotL, TPNotL;
wire NotFTNotPL, NotFNotTNotPL, NotFTNotPNotL, FNotTPL, FTNotPL;
wire NotTNotPL, NotFTNotP, NotFNotTP, NotFNotTL, NotFTPL, FTNotPNotL, NotFNotTPNotL, FNotTPNotL;

//1 entrada
not (NotF, F);
not (NotT, T);
not (NotP, P);
not (NotL, L);

//2 entradas
and (FT, F, T);
and (FNotT, F, NotT);
and (NotFT, NotF, T);
and (NotFL, NotF, L);
and (NotFNotT, NotF, NotT);
and (NotPL, NotP, L);
and (NotPNotL, NotP, NotL);

//3 entradas
and (FTP, FT, P); 
and (FPL, F, P, L);
and (TPL, T, P, L);
and (FTNotL, F, T, NotL);
and (TPNotL, T, P, NotL);
and (NotFPL, NotF, P, L);
and (NotFTNotP, NotFT, NotP);
and (NotFNotTNotP, NotF, NotT, NotP);
and (NotFNotTP, NotFNotT, P); 
and (NotFNotTL, NotFNotT, L);
and (NotTPL, NotT, P, L);
and (NotTPNotL, NotT, P, NotL);
and (NotTNotPL, NotT, NotP, L);

//4 entradas
and (FTNotPL, F, T, NotP, L);            //  F &  T & -P &  L
and (FNotTPL, F, NotT, P, L);            //  F & -T &  P &  L  
and (NotFTNotPL,    NotFT,    NotPL);    // -F &  T & -P &  L
and (NotFTNotPNotL, NotFT,    NotPNotL); // -F &  T & -P & -L
and (NotFNotTNotPL, NotFNotT, NotPL);    // -F & -T & -P &  L
and (NotFNotTPNotL, NotFNotTP, NotL);    // -F & -T &  P & -L
and (NotFTPL, NotFT, P, L);
and (FTNotPNotL, FT, NotPNotL);
and (FNotTPNotL, FNotT, P, NotL);

or (a_out, NotFNotTNotPL, NotFTNotPNotL, FNotTPL, FTNotPL); 			
or (b_out, NotFTNotPL,    FTNotL,        FPL,     TPNotL); 
or (c_out, FTP,           FTNotL,        NotFNotTPNotL);
or (d_out, NotFTNotPNotL, NotTNotPL,     TPL,       FNotTPNotL);
or (e_out, NotFTNotP, NotFL, NotTNotPL); 			
or (f_out, NotFNotTP, NotFNotTL, NotFPL, FTNotPL); 
or (g_out, NotFNotTNotP, NotFTPL, FTNotPNotL);

endmodule