`timescale 1ns / 1ps

module mini_cpu_top_tb();

    reg  [7:0] tb_instruction_in;
    wire [1:0] tb_out_r_dest;
    wire [1:0] tb_out_r_src;
    wire [7:0] tb_alu_result;

    mini_cpu_top UUT (
        .instruction_in(tb_instruction_in),
        .out_r_dest(tb_out_r_dest),
        .out_r_src(tb_out_r_src),
        .alu_result(tb_alu_result)
    );

    initial begin
        $display("Time\t SW_Instruction \t Operation \t Dest \t Src \t ALU_Result");
        
        // --- Opcode 110: NAND (R1 NAND R2) ---
        // R1 = 10 (00001010), R2 = 20 (00010100)
        // 10 AND 20 = 00000000 -> Inverted (NAND) = 11111111 (255)
        tb_instruction_in = 8'b110_01_10_0; 
        #20;
        $display("%0t\t %b\t NAND\t\t R%d\t R%d\t %d (Hex: %h)", $time, tb_instruction_in, tb_out_r_dest, tb_out_r_src, tb_alu_result, tb_alu_result);

        // --- Opcode 111: NOR  (R1 NOR R2) ---
        // R1 = 10 (00001010), R2 = 20 (00010100)
        // 10 OR 20  = 00011110 -> Inverted (NOR)  = 11100001 (225)
        tb_instruction_in = 8'b111_01_10_0;
        #20;
        $display("%0t\t %b\t NOR\t\t R%d\t R%d\t %d (Hex: %h)", $time, tb_instruction_in, tb_out_r_dest, tb_out_r_src, tb_alu_result, tb_alu_result);

        $finish;
    end

endmodule
