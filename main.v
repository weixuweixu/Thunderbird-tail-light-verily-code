module main(clka, clkb, restart, brake, left, right, l0, l1, l2, r0, r1, r2, error);

input clka, clkb, restart, brake, left, right;
output l0, l1, l2, r0, r1, r2, error;

reg l0, l1, l2, r0, r1, r2, error;

//internal signals & variables
parameter SIZE = 3;
parameter IDLE = 3'b000, BRAKE = 3'b001, LEFT = 3'b010, RIGHT = 3'b011, L_B = 3'b100, R_B= 3'b101, ERROR = 3'b110;
reg [2:0] L_LAMP, R_LAMP;

reg [SIZE-1:0] state;
wire [SIZE-1:0] temp_state;
reg [SIZE-1:0] next_state;

reg [SIZE-1:0] mod;

always @(*)
begin: MOD
	if(left==1'b1 && right==1'b1 && brake==1'b0) begin
				mod = ERROR;
	end else if(brake==1'b0 && left==1'b1 && right==1'b0) begin
				mod = LEFT;
	end else if(brake==1'b0 && right==1'b1 && left==1'b0) begin
				mod = RIGHT;
	end else if(brake==1'b1 && right==1'b0 && left==1'b0) begin
				mod = BRAKE;
	end else if(brake==1'b1 && left==1'b1 &&right==1'b0) begin
				mod = L_B;
	end else if(brake==1'b1 && left==1'b0 &&right==1'b1) begin
				mod = R_B;
	end else begin
				mod = IDLE;
	end
end

//temp_state function
assign temp_state = state_f(state, mod);
function [SIZE-1:0] state_f;
input [SIZE-1:0] state;
input [SIZE-1:0] mod;
	case(state)
		IDLE: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		BRAKE: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		LEFT: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		RIGHT: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		L_B: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		R_B: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		ERROR: begin
			case(mod)
				ERROR: state_f = ERROR;
				LEFT: state_f = LEFT;
				RIGHT: state_f = RIGHT;
				BRAKE: state_f = BRAKE;
				L_B: state_f = L_B;
				R_B: state_f = R_B;
				IDLE: state_f = IDLE;
			endcase
			end
		default: state_f = IDLE;
	endcase
endfunction


//state assign logic
always @ (posedge clka)
begin: FSM
	if(restart==1'b1) begin
		next_state<=IDLE;
	end else begin
		next_state<=temp_state;
	end
end


//output logic
always @ (posedge clkb)
begin: OUTPUT_LOGIC
	case(next_state)
		IDLE: begin
	         	L_LAMP = 3'b000;
                R_LAMP = 3'b000;
			l0=0; l1=0; l2=0; r0=0; r1=0; r2=0; error=0;
			state = next_state;
			end
		BRAKE: begin			
			l0=1; l1=1; l2=1; r0=1; r1=1; r2=1; error=0;
			state = next_state;
			end
		LEFT: begin
			
			if (L_LAMP == 3'b000) begin
				l0=0; l1=0; l2=0; r0=0; r1=0; r2=0; error=0;
				L_LAMP =3'b001;
			end else if(L_LAMP == 3'b001) begin
				l0=1; l1=0; l2=0; r0=0; r1=0; r2=0; error=0;
				L_LAMP = 3'b011;
			end else if(L_LAMP == 3'b011) begin
				l0=1; l1=1; l2=0; r0=0; r1=0; r2=0; error=0;
				L_LAMP = 3'b111;
			end else if(L_LAMP == 3'b111) begin
				l0=1; l1=1; l2=1; r0=0; r1=0; r2=0; error=0;
				L_LAMP = 3'b000;			
			end
			    state = next_state;				
			end
		RIGHT: begin
			
			if (R_LAMP == 3'b000) begin
				l0=0; l1=0; l2=0; r0=0; r1=0; r2=0; error=0;
				R_LAMP =3'b100;
			end else if(R_LAMP == 3'b100) begin
				l0=0; l1=0; l2=0; r0=1; r1=0; r2=0; error=0;
				R_LAMP = 3'b110;
			end else if(R_LAMP == 3'b110) begin
				l0=0; l1=0; l2=0; r0=1; r1=1; r2=0; error=0;
				R_LAMP = 3'b111;
			end else if(R_LAMP == 3'b111) begin
				l0=0; l1=0; l2=0; r0=1; r1=1; r2=1; error=0;
				R_LAMP = 3'b000;
			end
			state = next_state;
			end
		L_B: begin
			if (L_LAMP == 3'b000) begin
				l0=0; l1=0; l2=0; r0=1; r1=1; r2=1; error=0;
				L_LAMP =3'b001;
			end else if(L_LAMP == 3'b001) begin
				l0=1; l1=0; l2=0; r0=1; r1=1; r2=1; error=0;
				L_LAMP = 3'b011;
			end else if(L_LAMP == 3'b011) begin
				l0=1; l1=1; l2=0; r0=1; r1=1; r2=1; error=0;
				L_LAMP = 3'b111;
			end else if(L_LAMP == 3'b111) begin
				l0=1; l1=1; l2=1; r0=1; r1=1; r2=1; error=0;
				L_LAMP = 3'b000;
			end
			state = next_state;
			end
		R_B: begin
			
			if (R_LAMP == 3'b000) begin
				l0=1; l1=1; l2=1; r0=0; r1=0; r2=0; error=0;
				R_LAMP =3'b100;
			end else if(R_LAMP == 3'b100) begin
				l0=1; l1=1; l2=1; r0=1; r1=0; r2=0; error=0;
				R_LAMP = 3'b110;
			end else if(R_LAMP == 3'b110) begin
				l0=1; l1=1; l2=1; r0=1; r1=1; r2=0; error=0;
				R_LAMP = 3'b111;
			end else if(R_LAMP == 3'b111) begin
				l0=1; l1=1; l2=1; r0=1; r1=1; r2=1; error=0;
				R_LAMP = 3'b000;
			end
			state = next_state;
			end
		ERROR: begin			
			l0=0; l1=0; l2=0; r0=0; r1=0; r2=0; error=1;
			state = next_state;
			end
		default: begin           
            l0=0; l1=0; l2=0; r0=0; r1=0; r2=0; error=0;
            state = next_state;
            end
	endcase
end
		
endmodule










