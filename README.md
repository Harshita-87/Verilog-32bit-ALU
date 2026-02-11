---
# 4-bit ALU in Verilog

## Overview
RTL design and verification of a 4-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL.
The design performs basic arithmetic and logical operations and generates standard status flags.

---
## Supported Operations

| ALUcontrol | Operation |
| ---------- | --------- |
| 00         | AND       |
| 01         | OR        |
| 10         | ADD       |
| 11         | SUB       |

---
## Design Features

* 4-bit combinational ALU
* Synthesizable Verilog RTL
* Carry captured using concatenation
* Signed overflow detection logic
* Status flags generated:

  * Carry (C)
  * Overflow (V)
  * Negative (N)
  * Zero (Z)
---
## Verification

* Custom Verilog testbench
* Multiple functional test cases
* Waveform-based validation
* Simulated using Xilinx Vivado
---
## Repository Structure
```
4bit-ALU/
│── src/ALU.v
│── tb/ALU_tb.v
└── README.md
```
## Tools Used

* Verilog HDL
* Xilinx Vivado
