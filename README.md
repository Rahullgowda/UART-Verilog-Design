# UART Verilog Design

## Overview
This project implements a UART (Universal Asynchronous Receiver Transmitter) in Verilog.

## Modules
- Baud Rate Generator
- UART Transmitter (TX)
- UART Receiver (RX)
- Top Module
- Testbench

## Features
- 8-bit data transmission
- Start and Stop bits
- Loopback verification (TX → RX)
- Simulation verified

## Simulation Result
- Input: 8'b10110010 (0xB2)
- Output: 8'b10110010
- Status: Successful transmission and reception

## Tools Used
- Verilog HDL
- Vivado Simulator
