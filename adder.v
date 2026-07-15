`timescale 1ns/1ps
module cla_17 (
    input  [16:0] A,
    input  [16:0] B,
    input         Cin,
    output [16:0] Sum,
    output        Cout
);
    wire [16:0] P, G;
    wire [17:0] C;

    assign C[0] = Cin;
    assign P = A ^ B;
    assign G = A & B;

    genvar i;
    generate
        for (i = 0; i < 17; i = i + 1) begin
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    assign Sum  = P ^ C[16:0];
    assign Cout = C[17];
endmodule
