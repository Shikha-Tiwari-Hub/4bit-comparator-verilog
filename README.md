# 4bit-comparator-verilog
This project implements a 4-bit comparator using Verilog Hardware Description Language (HDL).
The comparator takes two 4-bit inputs (A and B) and outputs whether A is greater than, equal to, or less than B.

## Features
-Compares two 4-bit binary numbers: A and B
-output:
-Time    a   b   a>b a==b a<b
-0       0   0   0   1    0
-10      2   1   1   0    0
-20      4   8   0   0    1
-30      15  15  0   1    0
-40      1   2   0   0    1
50      12  11  1   0    0
-Includes testbench for simulation and waveform verification

## Tools Used
-**Language**: Verilog HDL
-**Simulation Tool**: Xilinx Vivado
- **Waveform Viewer**: Vivado Simulation 
