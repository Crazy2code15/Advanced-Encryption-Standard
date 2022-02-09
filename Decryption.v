module Decryption(key,cipherText,plainText);
    input [15:0] key;
    input [15:0] cipherText;
    output [15:0] plainText;
	
    wire [15:0] k1,k2;
    wire [3:0] a,b,c,d,a_out,b_out,c_out,d_out,
                a1,b1,c1,d1,a2,b2,c2,d2,a1_out,b1_out,c1_out,d1_out;
	
    // Generate Round Keys
    KeySchedule keys(key,k1,k2);
	
    // Add Round Key
    assign {a,b,c,d} = cipherText ^ k2;
	
    // Inverse Shift Rows and Substitute Nibbles
    SBoxDecrypt box1(a,a_out);
    SBoxDecrypt box2(d,b_out);
    SBoxDecrypt box3(c,c_out);
    SBoxDecrypt box4(b,d_out);
    
    // Add Round Key
    assign {a1_out,b1_out,c1_out,d1_out} = {a_out,b_out,c_out,d_out} ^ k1;
    
    // Inverse Mix Columns and Shift Rows
    assign {a1,b1,c1,d1} = {
        (a1_out[0] ^ b1_out[2]), (a1_out[3] ^ b1_out[1]), (a1_out[2] ^ b1_out[3] ^ b1_out[0]), (a1_out[1] ^ a1_out[0] ^ b1_out[3]),
        (c1_out[2] ^ d1_out[0]), (c1_out[1] ^ d1_out[3]), (c1_out[3] ^ c1_out[0] ^ d1_out[2]), (c1_out[3] ^ d1_out[1] ^ d1_out[0]),
        (c1_out[0] ^ d1_out[2]), (c1_out[3] ^ d1_out[1]), (c1_out[2] ^ d1_out[3] ^ d1_out[0]), (c1_out[1] ^ c1_out[0] ^ d1_out[3]),
        (a1_out[2] ^ b1_out[0]), (a1_out[1] ^ b1_out[3]), (a1_out[3] ^ a1_out[0] ^ b1_out[2]), (a1_out[3] ^ b1_out[1] ^ b1_out[0])
    };
    // Inverse {{1,0,0,0,0,0,1,0},{0,1,0,0,1,0,0,1},{0,0,1,0,1,1,0,0},{0,0,0,1,0,1,0,0},{0,0,1,0,1,0,0,0},{1,0,0,1,0,1,0,0},{1,1,0,0,0,0,1,0},{0,1,0,0,0,0,0,1}}
    
    // Inverse Substitute Nibbles
    SBoxDecrypt box5(a1,a2);
    SBoxDecrypt box6(b1,b2);
    SBoxDecrypt box7(c1,c2);
    SBoxDecrypt box8(d1,d2);
    
    // Add Round Key
    assign plainText = {a2,b2,c2,d2} ^ key;
    
endmodule

