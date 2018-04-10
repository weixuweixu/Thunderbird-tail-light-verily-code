# Thunderbird-tail-light-verilog-code
Two phase clock format: clka, clkb
Function:
RESTART: Resets the PLA to the idle state where no lamps are illuminated,
BRAKE: All six lamps are on while this signal is high. If LEFT or RIGHT are also high, then keep one side of car’s lights steady, but sequence the other side as described under LEFT and RIGHT below.
RIGHT: After RIGHT goes high, the following sequence will occur: step1 step2 step3 step4
000 --> 100 --> 110 --> 111 --> 000 (right-turn tail light cycle)
LEFT: Similar behavior to RIGHT. step1 step2 step3 step4
000 --> 001 --> 011 --> 111 --> 000 (left-turn tail light cycle)
