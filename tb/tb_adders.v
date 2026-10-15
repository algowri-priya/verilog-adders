`timescale 1ns/1ps

module tb_adders;
    reg a, b, cin;

    wire g_and, g_or, g_not, g_nand, g_nor, g_xor, g_xnor;
    wire ha_sum, ha_carry;
    wire fa_sum, fa_cout;

    basic_gates g1 (.a(a), .b(b),
                    .y_and(g_and), .y_or(g_or), .y_not_a(g_not),
                    .y_nand(g_nand), .y_nor(g_nor),
                    .y_xor(g_xor), .y_xnor(g_xnor));

    half_adder ha (.a(a), .b(b), .sum(ha_sum), .carry(ha_carry));

    full_adder fa (.a(a), .b(b), .cin(cin), .sum(fa_sum), .cout(fa_cout));

    integer i;

    initial begin
        $display("A B Cin | AND OR NAND NOR XOR XNOR | HA_sum HA_c | FA_sum FA_cout");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #10;
            $display("%b %b  %b  |  %b   %b   %b    %b   %b   %b  |   %b      %b   |   %b      %b",
                     a, b, cin, g_and, g_or, g_nand, g_nor, g_xor, g_xnor,
                     ha_sum, ha_carry, fa_sum, fa_cout);
        end

        #10;
        $finish;
    end
endmodule