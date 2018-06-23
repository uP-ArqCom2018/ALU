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
        CARRY_o  : out std_logic;
		  ALUop_i	     : in  unsigned(3 downto 0);
		  ZERO_o      : out std_logic
		  );
end component;

-- Defino Seniales de Interconexion.


	signal a_s   :  std_logic_vector(63 downto 0);
	signal b_s   :  std_logic_vector(63 downto 0);
	signal s_s   :  std_logic_vector(63 downto 0);
	signal co_s   :  std_logic;
	signal op_s	 :	unsigned(3 downto 0);
   signal z_o_s : std_logic;
begin

-- Se instaancia la alu
alu1: ALU port map (
		A_i     => a_s, 
		B_i     => b_s,
		SAL_o   => s_s,
		CARRY_o => co_s,
		ALUop_i => op_S,
		ZERO_o  => z_o_s
		);
		
 process
	begin
----------------SUMA---------------------------------------------	
	op_s <= "0000"; -- SUMA
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 254 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;

	
	wait for 20 ns;
---------------RESTA----------------------------------------------
	op_s <= "0001"; -- RESTA
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 254 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;

	wait for 20 ns;
----------------NOT--------------------------------------------------
	op_s <= "0010"; -- not
	for j in 0 to 254 loop
	b_s<=std_logic_vector(to_unsigned(j,64));
	wait for 20 ns;
	end loop;	
	
	wait for 20 ns;
---------------AND--------------------------------------------------
	op_s <= "0011"; -- AND
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 254 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;
		
	wait for 20 ns;
----------------OR-------------------------------------------------
	op_s <= "0100"; -- OR
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 254 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;
	
	
    wait for 20 ns;
----------------XOR-------------------------------------------------
	op_s <= "0101"; -- XOR
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 254 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;
	wait for 20 ns;
	
----------------SRL-------------------------------------------------
	op_s <= "0110"; -- SLL
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 63 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;
	wait for 20 ns;
----------------SLL-------------------------------------------------
	op_s <= "0111"; -- SLL
	for i in 0 to 254 loop
		a_s<=std_logic_vector(to_unsigned(i,64));
			for j in 0 to 63 loop
			b_s<=std_logic_vector(to_unsigned(j,64));
			wait for 20 ns;
			end loop;
	    wait for 20 ns;
	end loop;
	wait for 20 ns;
--------------ZEROS--------------------------------------------------	
	op_s <= "1000"; -- ZEROS
	wait for 20 ns;
	
	wait;
	end process;

	end architecture alu_arch_tb;
	