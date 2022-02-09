module MUX_2x1(I0,I1,S0,Result);
    input I0,I1,S0;
    output Result;
    and(w1,I0,S0);
    and(w2,I1,~S0);
    or(Result,w1,w2);
endmodule
 
module MUX_16Bit_2x1(IO,I1,SO,Result);
    input [15:0] IO,I1;
    input SO;
    output [15:0] Result;
    MUX_2x1 b0(IO[0],I1[0],SO,Result[0]);
    MUX_2x1 b1(IO[1],I1[1],SO,Result[1]);
    MUX_2x1 b2(IO[2],I1[2],SO,Result[2]);
    MUX_2x1 b3(IO[3],I1[3],SO,Result[3]);
    MUX_2x1 b4(IO[4],I1[4],SO,Result[4]);
    MUX_2x1 b5(IO[5],I1[5],SO,Result[5]);
    MUX_2x1 b6(IO[6],I1[6],SO,Result[6]);
    MUX_2x1 b7(IO[7],I1[7],SO,Result[7]);
    MUX_2x1 b8(IO[8],I1[8],SO,Result[8]);
    MUX_2x1 b9(IO[9],I1[9],SO,Result[9]);
    MUX_2x1 b10(IO[10],I1[10],SO,Result[10]);
    MUX_2x1 b11(IO[11],I1[11],SO,Result[11]);
    MUX_2x1 b12(IO[12],I1[12],SO,Result[12]);
    MUX_2x1 b13(IO[13],I1[13],SO,Result[13]);
    MUX_2x1 b14(IO[14],I1[14],SO,Result[14]);
    MUX_2x1 b15(IO[15],I1[15],SO,Result[15]);
endmodule

