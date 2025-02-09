module comp_2_tb;
  wire  EQ1, GT1;
  wire  [1:0] A, B;
  wire EQ0, GT0;

  comp_2 testcomp_2(.EQ1(EQ1), .GT1(GT1),.A(A), .B(B),.EQ0(EQ0), .GT0(GT0));

  integer i;
  assign {EQ1, GT1, A, B} = i[5:0];
  initial begin
    for (i = 0; i < 64; i = i + 1) begin
      #1;

      if (EQ1 && !GT1) begin
        if ((A > B) && (!(EQ0 == 0 && GT0 == 1))) begin
          $display("A=%b, B=%b => expected EQ0=0, GT0=1", A, B);
        end
        if ((A < B) && (!(EQ0 == 0 && GT0 == 0))) begin
          $display("A=%b, B=%b => expected EQ0=0, GT0=0", A, B);
        end
        if ((A == B) && (!(EQ0 == 1 && GT0 == 0))) begin
          $display("A=%b, B=%b => expected EQ0=1, GT0=0", A, B);
        end
      end
    end
    $finish;
  end

endmodule

