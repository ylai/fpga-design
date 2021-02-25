/* CYCU FGPA Design 
 * 
 * Module Name:tb_adder_4b
 * 
 * 
 * Rev.       :v1.0
 * Date       :2021-2-25
 * Programmer :Yu-kuen Lai
 * 
 * Notes      :A simple 4-bit adder testbench for demo
 * 
 * for-loop, $display and other examples
 * try to move around the #10 delay and observe the $display results 
 * */

`timescale 1 ns/1 ns

module Testbench();
    
   reg [3:0] A_s, B_s;
   reg Ci_s;
   wire [3:0] S_s;
   wire Co_s;
   integer i,j;//for loop demo

   adder_4b my_adder(A_s, B_s, Ci_s, S_s, Co_s);
   
   initial 
     begin
	//shall print %t with scaled in ns (-9), with 2 precision digits, and would print the " ns" string
        $timeformat(-9, 2, " ns", 20);
    	$dumpfile("adder.vcd"); 
    	$dumpvars;
      
 	//$monitor("Time=%t, A= %d, B = %d, A+B=%d,Carry_in=%d, Carry_out=%d",$time,A_s,B_s,S_s,Ci_s,Co_s);
	A_s = 4'b0011; 
	B_s = 4'b0001;
	Ci_s = 0;
	#10;
	$display("Time=%t, A= %d, B = %d, A+B=%d, Carry_in=%d, Carry_out=%d",$time,A_s,B_s,S_s,Ci_s,Co_s);
             
	A_s = 4'b1100; 
	B_s = 4'b0011;
	Ci_s = 1;
	#10;
	$display("Time=%t, A= %d, B = %d, A+B=%d, Carry_in=%d, Carry_out=%d",$time,A_s,B_s,S_s,Ci_s,Co_s);
      
	A_s = 4'd5; // Equivalent to 4'b0101
	B_s = 4'd2; // Equivalent to 4'b0010
	#10;
	$display("Time=%t, A= %d, B = %d, A+B=%d, Carry_in=%d, Carry_out=%d",$time,A_s,B_s,S_s,Ci_s,Co_s);
      
	A_s = 4'd9; 
	B_s = 4'd8; 
	#10;
	$display("Time=%t, A= %d, B = %d, A+B=%d, Carry_in=%d, Carry_out=%d",$time,A_s,B_s,S_s,Ci_s,Co_s);
      	
	// Good testbench needs more vectors
	//please put more test vectors by using for-loop
	/*
      	for (i = 0; i < 16; i = i + 1) begin
	 for (j = 0; j < 16; j = j + 1) begin
	  #10 $display(" A= %d, B = %d, A+B=%d, Carry=%d",i,j,S_s,Co_s);
	 end
      	end
    	*/  
 
	#200 $finish;
     end
endmodule
    
