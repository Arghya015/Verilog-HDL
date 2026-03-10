module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    assign out_assign=(sel_b2==1 & sel_b1 ==1)?b:a;
    
    always @(*)begin
        if(sel_b2==1 & sel_b1 ==1) begin
            out_always=b;
        end
        else begin
           out_always=a;
        end
    end
endmodule
