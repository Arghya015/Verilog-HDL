// =================================================================
// 1. SUB-MODULE: INSTRUCTION DECODER
// =================================================================
module decoder_register_mode(
    input  wire [7:0] instruction,
    output reg  [2:0] opcode,
    output reg  [1:0] r_dest,
    output reg  [1:0] r_src,
    output reg        alu_en
);
    always @(*) begin
        opcode = instruction[7:5];
        r_dest = instruction[4:3];
        r_src  = instruction[2:1];
        
        // ALU turns on for everything except NOP (3'b000)
        if (opcode == 3'b000) begin
            alu_en = 1'b0;
        end else begin
            alu_en = 1'b1;
        end
    end
endmodule

// =================================================================
// 2. SUB-MODULE: ARITHMETIC LOGIC UNIT (ALU - Updated with NAND/NOR)
// =================================================================
module alu(
    input  wire        alu_en,   
    input  wire [2:0]  opcode,   
    input  wire [7:0]  a,        
    input  wire [7:0]  b,        
    output reg  [7:0]  result    
);
    always @(*) begin
        if (alu_en) begin
            case (opcode)
                3'b001:  result = a + b;        // ADD
                3'b010:  result = a - b;        // SUB
                3'b011:  result = a & b;        // Bitwise AND
                3'b100:  result = a | b;        // Bitwise OR
                3'b101:  result = a ^ b;        // Bitwise XOR
                3'b110:  result = ~(a & b);     // Bitwise NAND (Inverted AND)
                3'b111:  result = ~(a | b);     // Bitwise NOR (Inverted OR)
                default: result = 8'h00;
            endcase
        end else begin
            result = 8'h00;
        end
    end
endmodule

// =================================================================
// 3. MAIN TOP-LEVEL MODULE
// =================================================================
module mini_cpu_top(
    input  wire [7:0] instruction_in, // Connected to Slide Switches SW7 to SW0
    
    output wire [1:0] out_r_dest,     // Connected to LEDs LD11 and LD10
    output wire [1:0] out_r_src,      // Connected to LEDs LD9 and LD8
    output wire [7:0] alu_result      // Connected to LEDs LD7 to LD0
);

    reg [7:0] reg_data_A;
    reg [7:0] reg_data_B;

    wire       ctrl_alu_en;
    wire [2:0] ctrl_opcode;
    wire [1:0] w_r_dest;
    wire [1:0] w_r_src;

    assign out_r_dest = w_r_dest;
    assign out_r_src  = w_r_src;

    decoder_register_mode DECODER_INST (
        .instruction(instruction_in),
        .opcode(ctrl_opcode),
        .alu_en(ctrl_alu_en),
        .r_dest(w_r_dest),
        .r_src(w_r_src)
    );

    always @(*) begin
        // Simulated Register Content: R0=5, R1=10, R2=20, R3=30
        case (w_r_dest)
            2'b00: reg_data_A = 8'd5;   // R0
            2'b01: reg_data_A = 8'd10;  // R1
            2'b10: reg_data_A = 8'd20;  // R2
            2'b11: reg_data_A = 8'd30;  // R3
        endcase

        case (w_r_src)
            2'b00: reg_data_B = 8'd5;   // R0
            2'b01: reg_data_B = 8'd10;  // R1
            2'b10: reg_data_B = 8'd20;  // R2
            2'b11: reg_data_B = 8'd30;  // R3
        endcase
    end

    alu ALU_INST (
        .alu_en(ctrl_alu_en),
        .opcode(ctrl_opcode),
        .a(reg_data_A),
        .b(reg_data_B),
        .result(alu_result)
    );

endmodule
