module full_adder_nand(S, Cout, A, B, Cin);
input A, B, Cin;
output S, Cout;
wire w1, w2, w3, w4, w5, w6, w7;

nand midNand(w1, A, B);
nand topNand(w2, w1, A);
nand bottomNand(w3, w1, B);

nand thirdlevNand(w4, w2, w3);
nand fourthlevNand(w5, Cin, w4);

nand fiveTopNand(w6, w4, w5);
nand fiveMidNand(w7, Cin, w5);


nand(S, w6, w7);
nand(Cout, w5, w1);
endmodule