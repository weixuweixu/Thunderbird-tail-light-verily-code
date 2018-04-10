module main_testbench();

reg in_clka, in_clkb, in_restart, in_brake, in_left, in_right;
wire out_l0, out_l1, out_l2, out_r0, out_r1, out_r2, out_error;

main top1(.clka(in_clka), 
			.clkb(in_clkb), 
			.restart(in_restart), 
			.brake(in_brake), 
			.left(in_left), 
			.right(in_right), 
			.l0(out_l0), 
			.l1(out_l1), 
			.l2(out_l2), 
			.r0(out_r0), 
			.r1(out_r1), 
			.r2(out_r2), 
			.error(out_error)
			);

initial
begin

//in_restart(1)
in_restart=1; in_brake=0; in_left=0; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

//idle(1)
in_restart=1; in_brake=0; in_left=0; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

//in_left(8)
in_restart=0; in_brake=0; in_left=1; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//in_left & break(4)
in_restart=0; in_brake=1; in_left=1; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//idle(1)
in_restart=1; in_brake=0; in_left=0; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//in_right(8)
in_restart=0; in_brake=0; in_left=0; in_right=1;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//in_right & break(4)
in_restart=0; in_brake=1; in_left=0; in_right=1;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//break(3)
in_restart=0; in_brake=1; in_left=0; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//in_left & in_right(2)
in_restart=0; in_brake=0; in_left=1; in_right=1;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


//idle(1)
in_restart=1; in_brake=0; in_left=0; in_right=0;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1

//in_left & in_right(1)
in_restart=0; in_brake=0; in_left=1; in_right=1;

in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 1; 
in_clkb = 0;
#1
in_clka = 0; 
in_clkb = 0; 
#1
in_clka = 0; 
in_clkb = 1; 
#1


$dumpfile ("turn_testbench.vcd"); 
$dumpvars; 
$display ("in_clka, \t in_clkb, \t in_restart, \t in_brake, \t in_left, \t in_right, \t out_l0, \t out_l1, \t out_l2, \t out_r0, \t out_r1, \t out_r2, \t out_error");


$stop;
end

endmodule





