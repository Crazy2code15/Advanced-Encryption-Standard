// Test Module

module tb();
    reg [15:0] key;
    reg [15:0] inputText;
    reg enable;
    reg operation;
    wire [15:0] outputText;
    
    AES a1(key,inputText,enable,operation,outputText);

    initial begin
        inputText = 16'b0000_0111_0011_1000;
        key = 16'b1010_0111_0011_1011;
        enable = 1;
        operation = 1;
        $display ("inputText            outputText");
        $monitor ("%b     %b", inputText, outputText);
    end
endmodule
