#!/bin/bash

reset

rm -rf xcelium.d INCA* *.log *.key .simvis* waves* *.shm

xrun -sv -64BIT \
     -debug_opts verisium_pp \
     -log xrun.log \
     -f file_list.f \
     -input xlm_waves.tcl \
     +tcl+run_batch.tcl \
