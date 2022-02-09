module KeySchedule(key,k1,k2);
    input [15:0] key;
    output [15:0] k1,k2;
    
    wire [7:0] w2,w3,w4,w5;
    wire [3:0] w1a,w1b,w3a,w3b;
    
    SBoxEncrypt box1(key[7:4],w1a);
    SBoxEncrypt box2(key[3:0],w1b);
    SBoxEncrypt box3(w3[7:4],w3a);
    SBoxEncrypt box4(w3[3:0],w3b);
    
    assign w2 = key[15:8] ^ {w1b,w1a} ^ 8'b10000000;
    assign w3 = key[7:0] ^ w2;
    assign w4 = w2 ^ {w3b,w3a} ^ 8'b00110000;
    assign w5 = w3 ^ w4;

    assign k1 = {w2,w3};
    assign k2 = {w4,w5};

endmodule

