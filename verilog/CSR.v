//RISC-V CSR

module csr_file (clk, write, wrAddr_CSR, wrVal_CSR, rdAddr_CSR, rdVal_CSR);
	input clk;
	input write;
	input [11:0] wrAddr_CSR;
	input [31:0] wrVal_CSR;
	input [11:0] rdAddr_CSR;
	output [31:0] rdVal_CSR;

	reg[31:0] csr_file [0:2**12];

	assign rdVal_CSR = ((wrAddr_CSR==rdAddr_CSR) & write) ? wrVal_CSR : csr_file[rdAddr_CSR];

	always @(posedge clk) begin
		if (write) begin
			csr_file[wrAddr_CSR] <= wrVal_CSR;
		end
	end
endmodule
