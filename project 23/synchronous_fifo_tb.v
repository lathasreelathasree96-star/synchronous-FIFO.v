`timescale 1ns/1ps

module synchronous_fifo_tb;

    reg clk;
    reg reset;
    reg wr_en;
    reg rd_en;
    reg [7:0] din;

    wire [7:0] dout;
    wire full;
    wire empty;

    // Instantiate FIFO
    synchronous_fifo #(
        .DATA_WIDTH(8),
        .DEPTH(8)
    ) uut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk   = 0;
        reset = 1;
        wr_en = 0;
        rd_en = 0;
        din   = 0;

        // Reset
        #20;
        reset = 0;

        // Write data
        #10;
        wr_en = 1;
        din = 8'hA1;

        #10;
        din = 8'hB2;

        #10;
        din = 8'hC3;

        #10;
        din = 8'hD4;

        #10;
        wr_en = 0;

        // Read data
        #20;
        rd_en = 1;

        #10;
        rd_en = 0;

        #20;
        rd_en = 1;

        #10;
        rd_en = 0;

        #20;
        rd_en = 1;

        #10;
        rd_en = 0;

        #20;
        rd_en = 1;

        #10;
        rd_en = 0;

        #20;

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor(
            "Time=%0t | WR_EN=%b | RD_EN=%b | DIN=%h | DOUT=%h | FULL=%b | EMPTY=%b",
            $time, wr_en, rd_en, din, dout, full, empty
        );
    end

endmodule