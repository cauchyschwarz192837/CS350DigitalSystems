module full_adder(S, Cout, A, B, Cin);
input A, B, Cin;
output S, Cout;
wire w1, w2, w3;

xor Sresult(S, A, B, Cin);
and And1(w1, A, B);
and And2(w2, A, Cin);
and And3(w3, B, Cin);
or(Cout, w1, w2, w3);
endmodule
