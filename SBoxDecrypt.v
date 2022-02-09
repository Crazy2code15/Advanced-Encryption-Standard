module SBoxDecrypt(s1_in,s1_out);
    input [3:0] s1_in;
    output [3:0] s1_out;

    reg [3:0] s1_out;

    always@(s1_in)
    begin
        case(s1_in)
            4'b0000: s1_out = 4'hA;
            4'b0001: s1_out = 4'h5;
            4'b0010: s1_out = 4'h9;
            4'b0011: s1_out = 4'hB;
            4'b0100: s1_out = 4'h1;
            4'b0101: s1_out = 4'h7;
            4'b0110: s1_out = 4'h8;
            4'b0111: s1_out = 4'hF;
            4'b1000: s1_out = 4'h6;
            4'b1001: s1_out = 4'h0;
            4'b1010: s1_out = 4'h2;
            4'b1011: s1_out = 4'h3;
            4'b1100: s1_out = 4'hC;
            4'b1101: s1_out = 4'h4;
            4'b1110: s1_out = 4'hD;
            4'b1111: s1_out = 4'hE;
        endcase
    end
endmodule

