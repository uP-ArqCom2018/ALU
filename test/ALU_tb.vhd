library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity ALU_tb is
end ALU_tb;

architecture alu_arch_tb of ALU_tb is

-- Defino el componente
component ALU is
    generic (N : integer :=64);
    port (
		  A_i   : in  std_logic_vector(N - 1 downto 0);
          B_i   : in  std_logic_vector(N - 1 downto 0);
          SAL_o    : out std_logic_vector(N - 1 downto 0);
		  ALUop_i	     : in  unsigned(3 downto 0);
		  Zero_o      : out std_logic
		  );
end component;

signal :  A_i   : in  std_logic_vector(N - 1 downto 0);
signal :  B_i   : in  std_logic_vector(N - 1 downto 0);
          SAL_o    : out std_logic_vector(N - 1 downto 0);
		  ALUop_i	     : in  unsigned(3 downto 0);
		  Zero_o      : out std_logic

begin

-- Se instancia la alu
alu1: ALU port map (
		A_i     => a_s, 
		B_i     => b_s,
		SAL_o   => s_s,
		ALUop_i => op_S,
		ZERO_o  => z_o_s
		);
		
stimul_proc: process
	VARIABLE aux1 : integer := 0;
	-- VARIABLE aux, aux3 : integer := 0;
	VARIABLE error1 : BOOLEAN := false;	
	begin
	
	
	-- Suma --
	A_i <= std_logic_vector(unsigned(5),N);
	B_i <= std_logic_vector(unsigned(5),N);
	ALUop_i <= "0000";
	
	aux1 := 5+5;
	
	wait for 5 ns;
	
	if std_logic_vector(unsigned(aux1),N) /= SAL_o then -- se controla que el valor 
    	 assert false
    	 report "ERROR EN LA SUMA";
    	 error1 := true;
  	end if;
  	
  	
  		-- Resta --
	ALUop_i <= "0001";
	
	aux1 := 5-5;
					
	wait for 5 ns;
	
	if std_logic_vector(unsigned(aux1),N) /= SAL_o then -- se controla que el valor 
    	 assert false
    	 report "ERROR EN LA RESTA";
    	 error1 := true;
  	end if;
  	
  		-- NOT --
	ALUop_i <= "0010";
	
	wait for 5 ns;
	
	if not A_i /= SAL_o then -- se controla que el valor 
    	 assert false
    	 report "ERROR EN LA NEGACION";
    	 error1 := true;
  	end if;
  	
  		-- AND --
	ALUop_i <= "0011";
	
	wait for 5 ns;
	
	if (A_i and B_i) /= SAL_o then -- se controla que el valor 
    	 assert false
    	 report "ERROR EN AND";
    	 error1 := true;
  	end if;
  	
  	  		-- OR --
	ALUop_i <= "0100";
	
	wait for 5 ns;
	
	if (A_i or B_i) /= SAL_o then -- se controla que el valor 
    	 assert false
    	 report "ERROR EN OR";
    	 error1 := true;
  	end if;
  	
  	  	  		-- XOR --
	ALUop_i <= "0101";
	
	wait for 5 ns;
	
	if (A_i xor B_i) /= SAL_o then -- se controla que el valor 
    	 assert false
    	 report "ERROR EN XOR";
    	 error1 := true;
  	end if;
  	
  	  	  	  		-- SRL --
	ALUop_i <= "0110";
	
	wait for 5 ns;
 

  	  	  	  		-- SLL --
	ALUop_i <= "0111";
	
	wait for 5 ns;  
	
	  	  	  	 -- SRA --
	ALUop_i <= "1000";
	
	wait for 5 ns; 

	wait;
	end process;

end architecture alu_arch_tb;
	