`timescale 1ns/1ps
module MUL (
    input         clock,
    input         reset,
    input  [3:0]  a,
    input  [3:0]  b,
    output reg [7:0] product,
    output reg    done
);
    reg [7:0] temp_product;
    reg [3:0] multiplier;
    reg [7:0] multiplicand;
    reg [2:0] count;

    always @(posedge clock) begin
        if (reset) begin
            temp_product <= 8'b0;
            multiplier   <= b;
            multiplicand <= {4'b0000, a};
            count        <= 3'd4;
            product      <= 8'b0;
            done         <= 0;
        end
        else if (count > 0) begin
            if (multiplier[0])
                temp_product <= temp_product + multiplicand;
            multiplier   <= multiplier >> 1;
            multiplicand <= multiplicand << 1;
            count        <= count - 1;

            if (count == 1) begin
                if (multiplier[0])
                    product <= temp_product + multiplicand;
                else
                    product <= temp_product;
                done <= 1;
            end
            else begin
                done <= 0;
            end
        end
        else begin
            done <= 0;
        end
    end
endmodule
