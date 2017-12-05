###################################################################

# Created by write_sdc on Mon Dec  4 21:56:43 2017

###################################################################
set sdc_version 2.0

set_units -time ps -resistance kOhm -capacitance fF -power mW -voltage V       \
-current mA
set_driving_cell -lib_cell inv_1 [get_ports clk]
set_driving_cell -lib_cell inv_1 [get_ports reset]
set_driving_cell -lib_cell inv_1 [get_ports done]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[15]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[14]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[13]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[12]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[11]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[10]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[9]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[8]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[7]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[6]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[5]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[4]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[3]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[2]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[1]}]
set_driving_cell -lib_cell inv_1 [get_ports {sig_in[0]}]
set_load -pin_load 57.462 [get_ports sig_ready]
set_load -pin_load 57.462 [get_ports {sig_out[15]}]
set_load -pin_load 57.462 [get_ports {sig_out[14]}]
set_load -pin_load 57.462 [get_ports {sig_out[13]}]
set_load -pin_load 57.462 [get_ports {sig_out[12]}]
set_load -pin_load 57.462 [get_ports {sig_out[11]}]
set_load -pin_load 57.462 [get_ports {sig_out[10]}]
set_load -pin_load 57.462 [get_ports {sig_out[9]}]
set_load -pin_load 57.462 [get_ports {sig_out[8]}]
set_load -pin_load 57.462 [get_ports {sig_out[7]}]
set_load -pin_load 57.462 [get_ports {sig_out[6]}]
set_load -pin_load 57.462 [get_ports {sig_out[5]}]
set_load -pin_load 57.462 [get_ports {sig_out[4]}]
set_load -pin_load 57.462 [get_ports {sig_out[3]}]
set_load -pin_load 57.462 [get_ports {sig_out[2]}]
set_load -pin_load 57.462 [get_ports {sig_out[1]}]
set_load -pin_load 57.462 [get_ports {sig_out[0]}]
create_clock [get_ports clk]  -period 50000  -waveform {0 25000}
