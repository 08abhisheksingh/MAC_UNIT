`timescale 1ns/1ps
module mac_unit (
    input         clk,
    input         rst,
    input         start,
    input  [3:0]  a,
    input  [3:0]  b,
    output [16:0] mac_out,
    output        done
);
    wire [7:0]  product;
    wire        mul_done;
    wire [16:0] product_ext = {9'b0, product};

    // generate a clean one-cycle reset pulse for MUL on start
    reg mul_rst;
    always @(posedge clk) begin
        if (rst)
            mul_rst <= 1;
        else
            mul_rst <= start;   // reset MUL only on the start cycle
    end

    MUL u_mul (
        .clock  (clk),
        .reset  (mul_rst),
        .a      (a),
        .b      (b),
        .product(product),
        .done   (mul_done)
    );

    accumulator_17bit u_acc (
        .clk   (clk),
        .reset (rst),
        .enable(mul_done),
        .in    (product_ext),
        .acc   (mac_out)
    );

    assign done = mul_done;
endmodule
