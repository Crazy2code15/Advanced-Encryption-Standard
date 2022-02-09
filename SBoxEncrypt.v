module SBoxEncrypt(s0_in,s0_out);
    input [3:0] s0_in;
    output [3:0] s0_out;

    reg [3:0] s0_out;
    
    always@(s0_in)
    begin
        case(s0_in)
            4'b0000: s0_out = 4'h9;
            4'b0001: s0_out = 4'h4;
            4'b0010: s0_out = 4'hA;
            4'b0011: s0_out = 4'hB;
            4'b0100: s0_out = 4'hD;
            4'b0101: s0_out = 4'h1;
            4'b0110: s0_out = 4'h8;
            4'b0111: s0_out = 4'h5;
            4'b1000: s0_out = 4'h6;
            4'b1001: s0_out = 4'h2;
            4'b1010: s0_out = 4'h0;
            4'b1011: s0_out = 4'h3;
            4'b1100: s0_out = 4'hC;
            4'b1101: s0_out = 4'hE;
            4'b1110: s0_out = 4'hF;
            4'b1111: s0_out = 4'h7;
        endcase
    end
endmodule

