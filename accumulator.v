
`timescale 1ns/1ps
module accumulator_17bit (
    input         clk,
    input         reset,
    input         enable,
    input  [16:0] in,
    output reg [16:0] acc
);
    wire [16:0] sum;
    wire        cout;

    cla_17 u_add (
        .A   (acc),
        .B   (in),
        .Cin (1'b0),
        .Sum (sum),
        .Cout(cout)
    );

    always @(posedge clk) begin
        if (reset)
            acc <= 17'd0;
        else if (enable)
            acc <= sum;
    end
endmodule
