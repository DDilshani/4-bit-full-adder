module Adder(a,b,cIn,s,cOut);
	input [3:0] a, b;
	output [3:0] s;
	input cIn; 
	output cOut;
	wire cOut1, cOut2, cOut3;

	FullAdder fa0(a[0],b[0],cIn,s[0],cOut1);
	FullAdder fa1(a[1],b[1],cOut1,s[1],cOut2);
	FullAdder fa2(a[2],b[2],cOut2,s[2],cOut3);
	FullAdder fa3(a[3],b[3],cOut3,s[3],cOut);

endmodule


module FullAdder(a,b,cIn,s,cOut);
	input a,b,cIn; 
	output s,cOut;
	assign {cOut,s} = a + b + cIn;
endmodule


module testbench;
	reg [3:0] a, b;
	wire [3:0] s;
	wire cOut;
	reg [3:0] i,j;

	Adder myFullAdder(a,b,1'b0,s,cOut);
	initial 
	begin
		a <= 4'b0000;
		b <= 4'b0000;

		$dumpfile("adder.vcd"); 
		$dumpvars(0, myFullAdder);
     
		for(i=0; i<15; i=i+1) 
		begin
			#5 $display(" a(0000)   b(0000)   s(0000)  cOut\n");

			for(j=0; j<15; j=j+1) 
			begin
				a <= i;
 				b <= j;
				#5 $display("%2d(%b)  %2d(%b)  %2d(%b)   %b", i, i, j, j, s, s, cOut);
	  		end
			#5 $display("\n");
  		end
		#10 $finish;
	end
endmodule
