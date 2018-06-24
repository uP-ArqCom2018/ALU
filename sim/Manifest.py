action = "simulation"
sim_tool = "ghdl"
sim_top = "ALU_tb"

sim_post_cmd = "ghdl -r ALU_tb --stop-time=50000000000us --vcd=ALU_tb.vcd; gtkwave ALU_tb.vcd"

modules = {
  "local" : [ "../test" ],
}
