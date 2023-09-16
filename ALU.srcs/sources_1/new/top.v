module top #(
    parameter SIZE_OP = 6,
    parameter SIZE_BUS = 8
)(
    input   [SIZE_BUS - 1:0]    i_input;
    input                       i_a_btn, i_b_bnt, i_op_btn, i_clk;
    input   [SIZE_BUS - 1:0]    o_display;
)
reg     [SIZE_BUS - 1:0]    A, B;
reg     [SIZE_OP - 1:0]     OP;

localparam SIZE_OP = 6;
localparam SIZE_BUS = 8;

always @(*) begin
    if(i_a_btn)
        A = i_input;
    if(i_b_bnt)
        B = i_input;
    if(i_op_btn)
        OP = i_input[SIZE_OP - 1:0];
end


ALU (
    .SIZE_OP(SIZE_OP)
    .SIZE_BUS(SIZE_BUS)
)
(
    .i_a(A),
    .i_b(B),
    .i_op(OP),
    .i_clk(i_clk)
    .o_display(o_display)
);
endmodule