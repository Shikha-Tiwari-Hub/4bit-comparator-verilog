`timescale 1ns / 1ps

module comp4bit_tb;
reg [3:0] a,b;
wire agtb,aeqb,altb;

comp4bit uut(
.a(a),.b(b),.agtb(agtb),.aeqb(aeqb),.altb(altb)
);
initial begin
  // Initialize waveform dumping (optional)
        $dumpfile("comp4bit_waves.vcd");
        $dumpvars(0, comp4bit_tb);
        
        // Print header
        $display("Time\ta\tb\ta>b\ta==b\ta<b");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", 
                $time, a, b, agtb, aeqb, altb);
a=4'b0000;b=4'b0000; #10;
a=4'b0010;b=4'b0001; #10;
a=4'b0100;b=4'b1000; #10;
a=4'b1111;b=4'b1111; #10;
a=4'b0001;b=4'b0010; #10;
a=4'b1100;b=4'b1011; #10;
$finish;
end
endmodule
