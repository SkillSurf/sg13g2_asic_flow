#!/bin/bash

# =====================================================
# Author: Simon Dorrer
# Last Modified: 05.12.2024
# Description: This .sh file cleans all generated files from run_all.sh.
# =====================================================

set -e -x

cd $(dirname "$0")

# counter_board
name=$1

VERILOG=${VERILOG:-verilog/rtl}
ORFS=${ORFS:-orfs}
XSPICE=${XSPICE:-xspice}
PYTHON=${PYTHON:-python/plot_simulations/data}
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Clean vhdl2verilog
cd "$VERILOG"
rm -rf build
rm -f *.o
cd "$SCRIPT_DIR"

# Clean ORFS
cd "$ORFS"/flow
rm -rf ./logs/ihp-sg13g2/"$name"_board
rm -rf ./objects/ihp-sg13g2/"$name"_board
rm -rf ./reports/ihp-sg13g2/"$name"_board
rm -rf ./results/ihp-sg13g2/"$name"_board
cd "$SCRIPT_DIR"

# Clean Xspice (remove all sub-directories of the xspice folder)
# cd "$XSPICE"
# rm -r -- */
# cd "$SCRIPT_DIR"

# Clean Ngspice simulation data for Python
cd "$PYTHON"
rm -f *.txt
cd "$SCRIPT_DIR"

# Finish
echo "------ The cleaning was successful! ------"