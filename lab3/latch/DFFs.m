svsim work.dffs
view structure
view signals
add wave sim:/dffs/*
force -freeze -repeat 100ns D 0 0, 1 30ns
force -freeze -repeat 20ns clock 0 0, 1 10ns
force -freeze -repeat 105ns reset 1 10ns, 0 45ns, 1 105ns
force -freeze -repeat 110ns enable 0 0, 1 65ns
run 240ns