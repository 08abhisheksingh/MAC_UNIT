`timescale 1ns/1ps

module mac_tb;

    reg        clk, rst, start;
    reg  [3:0] a, b;
    wire [16:0] mac_out;
    wire        done;

    mac_unit uut (
        .clk    (clk),
        .rst    (rst),
        .start  (start),
        .a      (a),
        .b      (b),
        .mac_out(mac_out),
        .done   (done)
    );

    always #5 clk = ~clk;

    task do_mac;
        input [3:0] ia, ib;
        begin
            a = ia;
            b = ib;
            start = 1;
            @(posedge clk); #1;
            start = 0;
            @(posedge done); #1;
            $display("a=%0d b=%0d product=%0d acc=%0d",
                     ia, ib, ia*ib, mac_out);
        end
    endtask

    initial begin
        // Generate waveform
        $dumpfile("mac_wave.vcd");
        $dumpvars(0, mac_tb);

        clk = 0;
        rst = 1;
        start = 0;
        a = 0;
        b = 0;

        repeat(3) @(posedge clk); #1;
        rst = 0;

        // 1 × 1 = 1
        do_mac(4'd1,4'd1);
        repeat(2) @(posedge clk);

        // 1 × 0 = 0
        do_mac(4'd1,4'd0);
        repeat(2) @(posedge clk);

        // 1 × 1 = 1
        do_mac(4'd1,4'd1);
        repeat(2) @(posedge clk);

        // 3 × 2 = 6
        do_mac(4'd3,4'd2);
        repeat(2) @(posedge clk);

        $display("Final acc = %0d (expected 8)", mac_out);
        $finish;
    end

    initial begin
        #5000;
        $display("TIMEOUT");
        $finish;
    end

endmodule
