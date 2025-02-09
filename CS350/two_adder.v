module two_adder(S, Cout, A, B, Cin);
input [1:0] A, B;
input Cin;
output [1:0] S;
output Cout;
wire C0;

full_adder num1(S[0], C0, A[0], B[0], Cin);
full_adder num2(S[1], Cout, A[1], B[1], C0);

endmodule


