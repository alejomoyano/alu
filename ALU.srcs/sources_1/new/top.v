module top #(
    parameter SIZE_OP = 6,
    parameter SIZE_BUS = 8
)(
    input   [SIZE_BUS - 1:0]    i_input,
    input                       i_a_btn, i_b_btn, i_op_btn, i_clk,
    output   [SIZE_BUS - 1:0]    o_display,
    output                       o_zero, o_carry
);
reg     [SIZE_BUS - 1:0]    A, B;
reg     [SIZE_OP - 1:0]     OP;

always @(*) begin
    if(i_a_btn)
        A = i_input;
    if(i_b_btn)
        B = i_input;
    if(i_op_btn)
        OP = i_input[SIZE_OP - 1:0];
end


ALU #(
    .SIZE_OP(SIZE_OP),
    .SIZE_BUS(SIZE_BUS)
) u_alu
(
    .i_a(A),
    .i_b(B),
    .i_op(OP),
    .i_clk(i_clk),
    .o_display(o_display),
    .o_carry(o_carry),
    .o_zero(o_zero)
);
endmodule