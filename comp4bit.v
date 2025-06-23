`timescale 1ns / 1ps

//1-BIT EQUALITY MODULE
module eq1(
input i0,i1,
output eq
);
wire p0,p1; //signal port declaration
//Logic for equality a==b
assign p0=~i0&~i1;
assign p1=i0&i1;
assign eq=p0|p1;  
endmodule

//1-BIT GREATER THAN MODULE
module gt1(
input i0,i1,
output gt
);
wire p0,p1; //signal port declaration
//Logic for greater than  a>b
assign gt=i0&~i1;
endmodule

//4-BIT COMPARATOR by INSTANTIATE METHOD
module comp4bit(
input [3:0] a,
input [3:0] b,
output agtb, //a>b
output aeqb, //a==b
output altb //a<b
);
wire e3,e2,e1,e0;  //equality wire
wire g3,g2,g1,g0;  //greater than wire
//instantiate eq1 for each bit
eq1 eq3(.i0(a[3]), .i1(b[3]), .eq(e3));
eq1 eq2(.i0(a[2]), .i1(b[2]), .eq(e2));
eq1 eq1_inst(.i0(a[1]), .i1(b[1]), .eq(e1));
eq1 eq0(.i0(a[0]), .i1(b[0]), .eq(e0));

//instantiate gt1 for each bit
gt1 gt3(.i0(a[3]), .i1(b[3]), .gt(g3));
gt1 gt2(.i0(a[2]), .i1(b[2]), .gt(g2));
gt1 gt1_inst(.i0(a[1]), .i1(b[1]), .gt(g1));
gt1 gt0(.i0(a[0]), .i1(b[0]), .gt(g0));

//logic for quality
assign aeqb=e3&e2&e1&e0;
//logic for greater than
assign agtb=g3|(e3&g2)|(e3&e2&g1)|(e3&e2&e1&g0);
//logic for lower than
assign altb=~(agtb|aeqb);
endmodule
