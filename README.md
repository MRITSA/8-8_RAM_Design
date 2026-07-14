# 8-8_RAM_Design
# Overview
This project implements an 8×8 Synchronous Random Access Memory (RAM) using Verilog HDL. The RAM consists of 8 memory locations, each capable of storing 8 bits of data, providing a total storage capacity of 64 bits.

The design supports:
- Synchronous Write Operation
- Synchronous Read Operation
- Asynchronous Reset
- Testbench Verification
- Waveform Analysis using GTKWave

This project was developed to understand memory modeling, sequential logic, synthesizable Verilog coding, and verification techniques used in RTL Design.

# Features

- 8 memory locations
- 8-bit data width
- 3-bit address bus
- Write Enable (WE)
- Clock-driven read and write operations
- Asynchronous reset to clear all memory locations
- Fully synthesizable RTL
- GTKWave compatible waveform generation


# Block Diagram

                    +------------------------+
                    |        8×8 RAM         |
                    |                        |
      clk --------->|                        |
      reset ------->|                        |
      we ---------->|                        |
      addr[2:0] --->|                        |
      din[7:0] ---->|                        |
                    |                        |
                    |        Memory          |
                    |       8 × 8 bits       |
                    |                        |
                    |                        |
      dout[7:0] <---|                        |
                    +------------------------+

#Memory Organization

Each memory location stores one byte (8 bits).

| Address | Memory Location |
|----------|-----------------|
| 000 | mem[0] |
| 001 | mem[1] |
| 010 | mem[2] |
| 011 | mem[3] |
| 100 | mem[4] |
| 101 | mem[5] |
| 110 | mem[6] |
| 111 | mem[7] |

Total Memory Capacity:

8 Locations × 8 Bits = 64 Bits

# Inputs and Outputs

| Signal | Width | Description |
|----------|------|-------------|
| clk | 1 | System Clock |
| reset | 1 | Asynchronous Reset |
| we | 1 | Write Enable |
| addr | 3 | Memory Address |
| din | 8 | Data Input |
| dout | 8 | Data Output |

# Working Principle

# Write Operation

When Write Enable (WE) is HIGH, the input data is stored into the selected memory location on the rising edge of the clock.

WE = 1
posedge clk
mem[address] ← din

### Read Operation

When Write Enable (WE) is LOW, the RAM outputs the data stored at the selected memory location on the rising edge of the clock.

WE = 0
posedge clk

dout ← mem[address]

# Reset Operation

When reset is asserted HIGH:

- All memory locations are cleared.
- Output data is reset to zero.

reset = 1

mem[0] = 0
mem[1] = 0
...
mem[7] = 0

dout = 0

# RTL Architecture

The design consists of:

- Memory Array
- Address Decoder
- Write Logic
- Read Logic
- Reset Logic

Internally, the memory is modeled using:
reg [7:0] mem [0:7];

# Simulation

The design is verified using:

- Icarus Verilog
- GTKWave

# Compile
iverilog -o ram ram_8x8.v ram_8x8_tb.v
Run
vvp ram
# Open Waveform

gtkwave ram.vcd

# Example Operation

# Write

| Address | Data |
|----------|------|
| 101 | 10101010 |

Memory after write:

| Address | Data |
|----------|------|
| 101 | 10101010 |

# Read

Input:

WE = 0
ADDR = 101

Output:

DOUT = 10101010

# Learning Outcomes

This project demonstrates the following RTL concepts:

- Memory Modeling in Verilog
- Synchronous Design
- Register Arrays
- Sequential Logic
- Clocked Read/Write Operations
- Reset Logic
- Testbench Development
- Waveform Debugging
- Synthesizable RTL Coding

# Applications

- Register Files
- FIFO Memories
- Cache Memory
- Embedded Memory Blocks
- Processor Datapaths
- Digital Signal Processing Systems
B.Tech | Electronics & Communication Engineering

Interested in RTL Design, Digital VLSI, ASIC Design, and Open-Source EDA Tools.
