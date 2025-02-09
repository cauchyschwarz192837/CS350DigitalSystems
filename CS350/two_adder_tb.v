module two_adder_tb;

wire[1:0] A, B;
wire Cin;
wire[1:0] S;
wire Cout;

two_adder adder(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));
integer i;
assign {Cin, A, B} = i[4:0];
initial begin
	for (i = 0; i < 32; i = i + 1) begin
		#20;
		$display("A:%b, B:%b, Cin:%b => S:%b, Cout:%b", A, B, Cin, S, Cout);
	end
$finish;
end
endmodule
