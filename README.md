# Verilog Digital Design Repository

## Overview

A collection of **Verilog HDL implementations and practice problems** focused on strengthening fundamentals in **Digital Logic Design, FPGA development, and VLSI concepts**. This repository contains solutions to common digital design problems along with structured modules for combinational and sequential circuits.

## Author

**Arghya Roy**
B.Tech – Electronics & Communication (VLSI)
Focus areas: Digital Design, Embedded Systems, IoT

## Repository Structure

```
Verilog-Projects/
│
├── combinational/
│   ├── mux
│   ├── decoder
│   ├── encoder
│   ├── adder
│   └── comparator
│
├── sequential/
│   ├── flipflops
│   ├── counters
│   └── shift_registers
│
├── hdlbits_solutions/
└── testbenches/
```

## Topics Covered

* Verilog HDL fundamentals
* Combinational logic circuits
* Sequential logic design
* Multiplexers and decoders
* Adders and arithmetic circuits
* Flip-flops and counters
* Basic FSM design

## Tools

ModelSim • Vivado • Quartus • Icarus Verilog

## Running Simulations

Example using Icarus Verilog:

```
iverilog design.v testbench.v
vvp a.out
```

## Future Work

* FPGA implementations
* Communication modules (UART, SPI, I2C)
* Small processor design

---

This repository is maintained for learning, experimentation, and documenting progress in digital hardware design.
