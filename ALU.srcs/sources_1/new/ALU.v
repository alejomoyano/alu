module ALU #(
    parameter SIZE_OP = 6,
    parameter SIZE_BUS = 8
)(
    input [SIZE_BUS - 1:0]  i_input,
    input                   i_a_btn, // boton primer operando
    input                   i_b_bnt, // boton segundo operando
    input                   i_op_btn,  // boton operacion
    input                   i_ready, // boton mostrar resultado
    output                  o_display // salida los leds
);

reg res;
reg [SIZE_BUS - 1:0] A, B;
reg [SIZE_OP - 1:0] OP;

assign o_display = res;

always @(*)
begin
// podriamos agregar que no se pueda presionar un boton si otro esta presionado...
    if(i_a_btn) 
        A = i_input;
    if(i_b_bnt)
        B = i_input;
    if(i_op_btn)
        OP = i_input[SIZE_OP - 1:0];
    if(i_ready)
        case(OP) 
            // ADD
            6'b100000   :   res = A + B;
            // SUB   
            6'b100010   :   res = A - B;
            // AND
            6'b100100   :   res = A & B;
            // OR
            6'b100101   :   res = A | B;
            // XOR
            6'b100110   :   res = A ^ B;
            // SRA
            6'b000011   :   res = A >>> B;
            // SRL
            6'b000010   :   res = A >> B;
            // NOR
            6'b000111   :   res = ~(A | B);
            // si no se envia nada
            default     :   res = {SIZE_BUS{1'b0}};
        endcase
    end
endmodule
