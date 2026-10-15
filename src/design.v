// ---------- Basic logic gates ----------
module basic_gates (
    input  a,
    input  b,
    output y_and,
    output y_or,
    output y_not_a,
    output y_nand,
    output y_nor,
    output y_xor,
    output y_xnor
);
    assign y_and   = a & b;
    assign y_or    = a | b;
    assign y_not_a = ~a;
    assign y_nand  = ~(a & b);
    assign y_nor   = ~(a | b);
    assign y_xor   = a ^ b;
    assign y_xnor  = ~(a ^ b);
endmodule

// ---------- Half adder ----------
module half_adder (
    input  a,
    input  b,
    output sum,
    output carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule

// ---------- Full adder (two half adders + OR) ----------
module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    wire s1, c1, c2;

    half_adder ha1 (.a(a),  .b(b),   .sum(s1),  .carry(c1));
    half_adder ha2 (.a(s1), .b(cin), .sum(sum), .carry(c2));

    assign cout = c1 | c2;
endmodule