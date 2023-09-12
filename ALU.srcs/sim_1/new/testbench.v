`timescale 1ns / 1ps

module testbench;

localparam SIZE = 8;

reg [SIZE - 1:0] i_input;
reg i_a_btn, i_b_bnt, i_op_btn, i_ready;
wire [SIZE - 1:0] o_display;

//instanciado del modulo alu
ALU(
    .i_input(i_input),
    .i_a_btn(i_a_btn),
    .i_b_bnt(i_b_bnt),
    .i_op_btn(i_op_btn),
    .i_ready(i_ready),
    .o_display(o_display)
);

initial begin
    // ingresamos el primer operando
    #5 i_input = 32;
    #5 i_a_btn = 1;
    #5 i_a_btn = 0;
    // ingresamos el segundo operando
    #5 i_input = 2;
    #5 i_a_btn = 1;
    #5 i_a_btn = 0;
    // ingresamos la operacion
    #5 i_input = 6'b100000;
    #5 i_op_btn = 1;
    #5 i_op_btn = 0;
    // opreamos
    #5 i_op_btn = 1;
    #5 i_op_btn = 0;
    
// ADD  6'b100000
// SUB  6'b100010
// AND  6'b100100
// OR   6'b100101
// XOR  6'b100110
// SRA  6'b000011
// SRL  6'b000010
// NOR  6'b000111

    $finish;
end

    
endmodule
