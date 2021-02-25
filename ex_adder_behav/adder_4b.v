//--------------------------------------------------------------------
//
// Verilog for Digital Design
// Frank Vahid and Roman Lysecky
// Copyright (C) 2007
// 
// Chapter 4 - Datapath Components
//
//--------------------------------------------------------------------

`timescale 1 ns/1 ns

module adder_4b(A, B, Ci, S, Co);
    
   input [3:0] A, B;
   input Ci;
   output [3:0] S;
   reg [3:0] S;
   output Co;
   reg Co;
   
   reg [4:0] A5, B5, S5;
   
   always @(A, B, Ci) begin
      A5 = {1'b0, A}; 
      B5 = {1'b0, B};
      S5 = A5 + B5 + Ci;
      S  = S5[3:0];
      Co = S5[4]; 
   end
endmodule
