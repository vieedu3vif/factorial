# factorial

## Introduction

This project is simple project about digital design use Verilog hardware description language.

## About the project

```
.
├── src/
|   ├──datapath.v
|   ├──controller.v
|   ├──some sub module
|
├── images/
|   ├──FSM.png
|   ├──datapath.png
|
├── testbench/
|   ├──reverse_tb.v
├── README.md

```

### Algorithms

The Factorial of N is result of multiplication from 1 to N.

### INOUT signals

| TT  | Port    | Direction | Width | Meaning                            |
| --- | ------- | --------- | ----- | ---------------------------------- |
| 1   | X       | in        | 8 bit | Input signal                       |
| 2   | fi_out  | out       | 8 bit | Output signal                      |
| 3   | RST     | in        | 1 bit | Reset signal, active at high level |
| 4   | CLK     | in        | 1 bit | Clock pulse                        |
| 5   | Done    | out       | 1 bit | Complete signal                    |
| 6   | start_i | in        | 1 bit | Begin signal                       |

### Datapath

![](/images/datapath.png)

### FSM

![](/images/fsm.png)

```

```
