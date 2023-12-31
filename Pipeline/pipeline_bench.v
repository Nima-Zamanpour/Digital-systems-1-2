
`timescale 1ns/1ns
module Pipeline_bench();


    wire [31:0] inst_adr, inst, data_adr, data_in, data_out;
    wire mem_read_to_data_mem, mem_write_to_data_mem;
    reg clk, rst;
    
    Pipeline pipeline(clk, rst, inst_adr, inst, data_adr, data_out, data_in, mem_write_to_data_mem, mem_read_to_data_mem);

    data_mem Data_memory(data_adr, data_out, mem_read_to_data_mem, mem_write_to_data_mem, clk, data_in);

    inst_mem Inst_memory (inst_adr, inst);    
   

    initial
    begin
        rst     = 1'b1;
        clk     = 1'b0;
        #20 rst = 1'b0;
        #10000 $stop;
    end
    
    always
    begin
        #8 clk = ~clk;
    end

endmodule


