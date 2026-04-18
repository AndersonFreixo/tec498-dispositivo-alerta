module jk_ff(clk,j,k,reset,q);
input clk,reset,j,k;
output reg q;

always @(posedge reset or negedge clk) begin
    if(reset)
        q <= 0;
    else begin
        case({j,k}) 
            2'b00:
                q <= q;
            2'b01:
                q <= 0;
            2'b10:
                q <= 1;
            2'b11:
                q <= !q;
        endcase
    end
end
                
endmodule