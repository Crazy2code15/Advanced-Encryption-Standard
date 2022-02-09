// AES USING VERILOG

module AES(key,inputText,enable,operation,outputText);
    input [15:0] key;
    input [15:0] inputText;
    input enable;      
    input operation;
    output [15:0] outputText;
	
    wire [15:0] encryptedText,decryptedText,result;

    Encryption e(key,inputText,encryptedText);
    Decryption d(key,inputText,decryptedText);
	
    MUX_16Bit_2x1 mux1(decryptedText,encryptedText,operation,result);
    MUX_16Bit_2x1 mux2(result,inputText,enable,outputText);
    
endmodule

