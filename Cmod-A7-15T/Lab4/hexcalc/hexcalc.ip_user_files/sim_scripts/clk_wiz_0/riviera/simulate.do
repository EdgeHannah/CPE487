onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+clk_wiz_0 -L xil_defaultlib -L secureip -O5 xil_defaultlib.clk_wiz_0

do {wave.do}

view wave
view structure

do {clk_wiz_0.udo}

run -all

endsim

quit -force
