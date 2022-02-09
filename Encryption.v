module Encryption(key,plainText,cipherText);
    input [15:0] key;
    input [15:0] plainText;
    output [15:0] cipherText;
	
    wire [15:0] k1,k2,p1;
    wire [3:0] a,b,c,d,a_out,b_out,c_out,d_out,
                a1,b1,c1,d1,a1_out,b1_out,c1_out,d1_out;
	
    // Generate Round Keys
    KeySchedule keys(key,k1,k2);
	
    // Add Round Key
    assign {a,b,c,d} = plainText ^ key;

    // Substitute Nibbles
    SBoxEncrypt box1(a,a_out);
    SBoxEncrypt box2(b,b_out);
    SBoxEncrypt box3(c,c_out);
    SBoxEncrypt box4(d,d_out);

    // Shift Rows and Mix Columns
    assign p1 = {
        (a_out[3] ^ d_out[1]), (a_out[2] ^ d_out[3] ^ d_out[0]), (a_out[1] ^ d_out[3] ^ d_out[2]), (a_out[0] ^ d_out[2]),
        (a_out[1] ^ d_out[3]), (a_out[3] ^ a_out[0] ^ d_out[2]), (a_out[3] ^ a_out[2] ^ d_out[1]), (a_out[2] ^ d_out[0]),
        (c_out[3] ^ b_out[1]), (c_out[2] ^ b_out[3] ^ b_out[0]), (c_out[1] ^ b_out[3] ^ b_out[2]), (c_out[0] ^ b_out[2]),
        (c_out[1] ^ b_out[3]), (c_out[3] ^ c_out[0] ^ b_out[2]), (c_out[3] ^ c_out[2] ^ b_out[1]), (c_out[2] ^ b_out[0])
    };
                         
    // Add Round Key
    assign {a1,b1,c1,d1} = p1 ^ k1;
    
    // Substitute Nibbles
    SBoxEncrypt box5(a1,a1_out);
    SBoxEncrypt box6(b1,b1_out);
    SBoxEncrypt box7(c1,c1_out);
    SBoxEncrypt box8(d1,d1_out);
    
    // Shift Rows and Add Round Key
    assign cipherText = {a1_out,d1_out,c1_out,b1_out} ^ k2;

endmodule

