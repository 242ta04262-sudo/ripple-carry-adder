`timescale 1ns/1ps

module ripple_carry_adder_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;

    wire [3:0] Sum;
    wire       Cout;

    ripple_carry_adder #(.N(4)) DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, ripple_carry_adder_tb);

        $display("Time\tA\tB\tCin\tCout\tSum");
        $display("--------------------------------------");

        A = 4'b0000; B = 4'b0000; Cin = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        A = 4'b0001; B = 4'b0010; Cin = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        A = 4'b0101; B = 4'b0011; Cin = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        A = 4'b1111; B = 4'b0001; Cin = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        A = 4'b1010; B = 4'b0101; Cin = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        A = 4'b1111; B = 4'b1111; Cin = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        A = 4'b1111; B = 4'b1111; Cin = 1'b1;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, A, B, Cin, Cout, Sum);

        #10;
        $finish;

    end

endmodule