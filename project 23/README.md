# Synchronous FIFO using Verilog

## 📌 Overview

This project implements a **Synchronous FIFO (First-In First-Out)** memory using Verilog HDL.

FIFO is a memory structure in which the first data written into the memory is the first data to be read.

This design uses a single clock for both read and write operations.

## ⚙️ Features

* 8-bit data width
* 8-word FIFO depth
* Single clock operation
* Write and read enable controls
* Full and Empty status flags
* Synchronous read and write operations
* Active-high reset

## 🧠 Working Principle

The FIFO contains:

* Memory array
* Write pointer
* Read pointer
* Data counter
* Full flag
* Empty flag

### Write Operation

When `wr_en = 1` and the FIFO is not full, input data is stored in the FIFO memory and the write pointer moves to the next location.

### Read Operation

When `rd_en = 1` and the FIFO is not empty, data is read from the FIFO memory and the read pointer moves to the next location.

### FIFO Order

If the following data is written:

```text
A1 → B2 → C3 → D4
```

The data is read in the same order:

```text
A1 → B2 → C3 → D4
```

This is the basic **First-In First-Out** principle.

## 🔌 Input and Output Signals

| Signal  | Direction | Description             |
| ------- | --------- | ----------------------- |
| `clk`   | Input     | System clock            |
| `reset` | Input     | Active-high reset       |
| `wr_en` | Input     | Write enable            |
| `rd_en` | Input     | Read enable             |
| `din`   | Input     | 8-bit input data        |
| `dout`  | Output    | 8-bit output data       |
| `full`  | Output    | Indicates FIFO is full  |
| `empty` | Output    | Indicates FIFO is empty |

## 📂 Project Structure

```text
Synchronous-FIFO/
├── README.md
├── synchronous_fifo.v
└── synchronous_fifo_tb.v
```

## 🧪 Testbench

The testbench performs the following operations.

### Write

The following four values are written into the FIFO:

```text
A1
B2
C3
D4
```

### Read

The values are then read from the FIFO.

Expected read sequence:

```text
A1
B2
C3
D4
```

## 📊 Expected Output

```text
Time     WR_EN   RD_EN   DIN    DOUT   FULL   EMPTY
----------------------------------------------------
...        1       0      A1      -      0       0
...        1       0      B2      -      0       0
...        1       0      C3      -      0       0
...        1       0      D4      -      0       0

Read Operation:

...        0       1      --      A1      0       0
...        0       1      --      B2      0       0
...        0       1      --      C3      0       0
...        0       1      --      D4      0       1
```

## 📈 Expected Waveform

During the simulation, observe these signals:

```text
CLK     : _|-|_|-|_|-|_|-|_|-|_

WR_EN   : ____|‾‾‾‾‾‾‾‾|________

RD_EN   : ________________|‾|_|‾|_|‾|_|‾|_

DIN     : ____A1___B2___C3___D4________

DOUT    : _____________________A1___B2___C3___D4

EMPTY   : ‾‾‾‾‾‾__________________________‾‾‾‾

FULL    : ________________________________
```

## 🛠️ Tools Used

* Verilog HDL
* Xilinx Vivado
* ModelSim
* Icarus Verilog
* GTKWave

## 🎯 Applications

Synchronous FIFOs are commonly used in:

* Data buffering
* FPGA designs
* Processor interfaces
* UART communication
* Data streaming
* Digital communication systems
* Memory controllers
* Hardware pipelines

## 📚 Conclusion

The Synchronous FIFO project demonstrates the implementation of a First-In First-Out memory using Verilog HDL.

The design successfully stores and retrieves data while providing `full` and `empty` status flags to prevent invalid write and read operations.
