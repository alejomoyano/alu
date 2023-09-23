`timescale 1ns / 1ps

module testbench;

localparam SIZE_OP = 6;
localparam SIZE_BUS = 8;

reg     [SIZE_BUS - 1:0]    i_input;
reg                         i_a_btn, i_b_btn, i_op_btn, i_clk;
wire    [SIZE_BUS - 1:0]    o_display;
wire                        o_zero, o_carry;

localparam ADD  = 6'b100000;
localparam SUB  = 6'b100010;
localparam AND  = 6'b100100;
localparam OR   = 6'b100101;
localparam XOR  = 6'b100110;
localparam SRA  = 6'b000011;
localparam SRL  = 6'b000010;
localparam NOR  = 6'b000111;

top # (
    .SIZE_OP(SIZE_OP),
    .SIZE_BUS(SIZE_BUS)
) u_top
(
    .i_input(i_input),
    .i_a_btn(i_a_btn),
    .i_b_btn(i_b_btn),
    .i_op_btn(i_op_btn),
    .i_clk(i_clk),
    .o_display(o_display),
    .o_zero(o_zero),
    .o_carry(o_carry)
);

initial begin
    // ingresamos el primer operando
    #5 i_input = 32;
    #5 i_a_btn = 1;
    #5 i_a_btn = 0;
    // ingresamos el segundo operando
    #5 i_input = 2;
    #5 i_b_btn = 1;
    #5 i_b_btn = 0;
    // ingresamos la operacion
    #5 i_input = ADD;
    #5 i_op_btn = 1;
    #5 i_op_btn = 0;
    $finish;
end

always @(*) begin
    #1
    i_clk = ~i_clk;
end

    
endmodule
