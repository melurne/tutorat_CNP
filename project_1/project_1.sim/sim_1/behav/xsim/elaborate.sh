#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Fri Sep 24 17:08:04 CEST 2021
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 0c88e15b6b33438199f0275c7ef9affd --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot FourBitAdder_behav xil_defaultlib.FourBitAdder -log elaborate.log"
xelab -wto 0c88e15b6b33438199f0275c7ef9affd --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot FourBitAdder_behav xil_defaultlib.FourBitAdder -log elaborate.log

