yosys -q -p "synth_ice40 -blif steper_enc_v0.1.blif" steper_enc_v0.1.v
arachne-pnr  -p steper_enc_v0.1.pcf steper_enc_v0.1.blif  -o steper_enc_v0.1.txt
icepack steper_enc_v0.1.txt steper_enc_v0.1.bin
iceprog steper_enc_v0.1.bin

