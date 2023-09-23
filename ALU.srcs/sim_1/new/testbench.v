`timescale 1ns / 1ps

module testbench;

localparam SIZE_OP = 6;
localparam SIZE_BUS = 8;

reg     [SIZE_BUS - 1:0]    i_input;
reg                         i_a_btn, i_b_btn, i_op_btn, i_clk = 0;
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
    i_input = 8'h05; //Primer operando: 05
    #5 
    i_a_btn = 1;
    #5 
    i_a_btn = 0;
    #5 
    i_input = 8'h07; //Segundo operando: 07
    #5 
    i_b_btn = 1;
    #5 
    i_b_btn = 0;
    #5 
    i_input = ADD; //Suma. Valor esperado: 0C
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #5 
    i_input = SUB; //Resta. Valor esperado: FE ; Carry = 1
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #5 
    i_input = AND; //Valor esperado: 05
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #5 
    i_input = OR; //Valor esperado: 07
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #5 
    i_input = XOR; //Valor esperado: 02
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #5 
    i_input = NOR; //Valor esperado: FE
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    
    //OPERACIONES SHIFT
    i_input = -8'h0F; //Primer operando: F1
    #5 
    i_a_btn = 1;
    #5 
    i_a_btn = 0;
    #5 
    i_input = 8'h02; //Segundo operando: 02
    #5 
    i_b_btn = 1;
    #5 
    i_b_btn = 0;
    #5 
    i_input = SRA; //Valor esperado: FC
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #5 
    i_input = SRL; //Valor esperado: 3C
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    
    
    //PRUEBA CERO
    i_input = -8'h05; //Primer operando: FB
    #5 
    i_a_btn = 1;
    #5 
    i_a_btn = 0;
    #5 
    i_input = 8'h05; //Segundo operando: 05
    #5 
    i_b_btn = 1;
    #5 
    i_b_btn = 0;
    #5 
    i_input = ADD; //Suma. Valor esperado: 0
    #5 
    i_op_btn = 1;
    #5 
    i_op_btn = 0;
    #10
    $finish;
end

always begin
    #1
    i_clk = ~i_clk;
end

    
endmodule
