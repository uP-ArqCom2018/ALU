library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ALU is

    generic (N : integer :=64);
		  
    port (
        A_i      : in  std_logic_vector(N - 1 downto 0);
        B_i      : in  std_logic_vector(N - 1 downto 0);
        SAL_o    : out std_logic_vector(N - 1 downto 0);
		  CARRY_o  : out std_logic;
		  ALUop_i  : in  unsigned(3 downto 0);
		  zERO_o   : out std_logic
          );
end entity;

architecture implementacion of ALU is

	--constantes de opcode:
	CONSTANT ADD    : unsigned(3 downto 0) := "0000";
	CONSTANT SUB    : unsigned(3 downto 0) := "0001";
	CONSTANT NOT_IN : unsigned(3 downto 0) := "0010";
	CONSTANT AND_IN : unsigned(3 downto 0) := "0011";
	CONSTANT OR_IN  : unsigned(3 downto 0) := "0100";
	CONSTANT XOR_IN : unsigned(3 downto 0) := "0101";
	CONSTANT SRL_IN : unsigned(3 downto 0) := "0110";
	CONSTANT SLL_IN : unsigned(3 downto 0) := "0111";
	CONSTANT SRA_IN : unsigned(3 downto 0) := "1000";   

	--señales temporales:

	
	Signal senial_a_i   	 :std_logic_vector(N downto 0);
	signal senial_b_i     :std_logic_vector(N downto 0);
	signal senial_sal_o   :std_logic_vector(N downto 0);
	Signal OPCODE         :unsigned(3 downto 0);
   signal senial_z_o     :std_logic; 
	-- señales para corrimientos 
	Signal senial2_a_i    :std_logic_vector(N-1 downto 0);
	signal senial2_b_i    :std_logic_vector(N-1 downto 0);
	
	begin

   OPCODE     <= ALUop_i;
	ZERO_o     <=senial_z_o ;
 	SAL_o      <= senial_sal_o(N-1 downto 0);
	CARRY_o    <= senial_sal_o(N); 
	senial_a_i <='0' & A_i;
	senial_b_i <='0' & B_i;
	senial2_a_i<=A_i;
	senial2_b_i<=A_i;
	
process(senial_a_i,senial_b_i,OPCODE,senial_sal_o,senial2_a_i,senial2_b_i)
		begin


		
		case OPCODE is
		
					when ADD =>
						senial_sal_o <= std_logic_vector((unsigned(senial_a_i) + unsigned(senial_b_i)));
						
						if to_integer(unsigned(senial_sal_o))= 0 then
							senial_z_o <= '1';
						else
							senial_z_o <= '0';
						end if;
					when SUB =>
						senial_sal_o <= std_logic_vector((unsigned(senial_a_i) - unsigned(senial_b_i)));
						
						if to_integer(unsigned(senial_sal_o))= 0 then
							senial_z_o <= '1';
						else
							senial_z_o <= '0';
						end if;
					when NOT_IN =>
						senial_sal_o <= NOT senial_a_i;
						if to_integer(unsigned(senial_sal_o))= 0 then
							senial_z_o <= '1';
						else
							senial_z_o <= '0';
						end if;
					when AND_IN =>
						senial_sal_o <= senial_a_i AND senial_b_i;
						if to_integer(unsigned(senial_sal_o))= 0 then
							senial_z_o <= '1';
						else
							senial_z_o <= '0';
						end if;						
					when OR_IN =>
						senial_sal_o <= senial_a_i OR senial_b_i;
						if to_integer(unsigned(senial_sal_o))= 0 then
							senial_z_o <= '1';
						else
							senial_z_o <= '0';
						end if;						
			   	when XOR_IN =>
						senial_sal_o <= senial_a_i XOR senial_b_i;
						if to_integer(unsigned(senial_sal_o))= 0 then
							senial_z_o <= '1';
						else
							senial_z_o <= '0';
						end if;						
					when SRL_IN =>
						senial_sal_o <= '0' & std_logic_vector(shift_right(unsigned(senial2_a_i), to_integer(unsigned(senial2_b_i))));	
						
						senial_z_o <= '0';
					when SLL_IN =>
						senial_sal_o <= '0' & std_logic_vector(shift_left(unsigned(senial2_a_i), to_integer(unsigned(senial2_b_i))));	
						
						senial_z_o <= '0';
--					when SRA_IN =>
--						senial_sal_o <= shift_right(senial_a_i, to_integer(unsigned(senial_b_i))));
					when others =>
						senial_sal_o <= (others => '0');
		end case;
		
end process;
 

 
	end implementacion;














