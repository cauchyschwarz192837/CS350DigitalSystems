module comp_8_tb;
  wire  EQ1, GT1;
  wire  [7:0] A, B;
  wire EQ0, GT0;

  comp_8 testcomp_8(.EQ1(EQ1), .GT1(GT1),.A(A), .B(B),.EQ0(EQ0), .GT0(GT0));

  integer i;
  assign {EQ1, GT1, A, B} = i[17:0];
  initial begin
    for (i = 0; i < 2**18; i = i + 1) begin
      #1;

      if (!EQ1 && GT1) begin // greater than
        if (EQ0 == 1 || GT0 == 0) begin
            $display("error");
        end
      end

      if (!EQ1 && !GT1) begin
        if (EQ0 == 1 || GT0 == 1) begin
            $display("error");
        end
      end

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
