# factorial

## Introduction

This project is simple project about digital design use Verilog hardware description language.

## About the project

```
.
├── hdl/
│   ├── datapath.v
│   ├── controller.v
│   ├── facto.sv
│   ├── some sub module
├── doc/
│   ├── images/
│   │   ├── datapath.png
│   │   ├── fsm.png
├── sim/
│   ├── src/
│   │   ├── reverse_tb.sv
│   ├── work/
│   │   ├── file_list.f
│   │   ├── run_batch_tcl
│   │   ├── vm_vm_run.sh
│   │   ├── xlm_waves.tcl
├── inc/
├── README.md


```

### Algorithms

The Factorial of N is result of multiplication from 1 to N.

### INOUT signals

| TT  | Port    | Direction | Width | Meaning                           |
| --- | ------- | --------- | ----- | --------------------------------- |
| 1   | X       | in        | 8 bit | Input signal                      |
| 2   | fi_out  | out       | 8 bit | Output signal                     |
| 3   | rst_n   | in        | 1 bit | Reset signal, active at low level |
| 4   | clk     | in        | 1 bit | Clock pulse                       |
| 5   | Done    | out       | 1 bit | Complete signal                   |
| 6   | start_i | in        | 1 bit | Begin signal                      |

### Datapath

![](doc/images/datapath.png)

### FSM

![](doc/images/fsm.png)

### Verification

I used random the input (X) and assert property to ensure that the result is correct.
