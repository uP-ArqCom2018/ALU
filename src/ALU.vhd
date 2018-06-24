library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ALU is

    generic (N : integer :=64);
		  
    port (
        A_i      : in  std_logic_vector(N - 1 downto 0);
        B_i      : in  std_logic_vector(N - 1 downto 0);
        SAL_o    : out std_logic_vector(N - 1 downto 0);
	    ALUop_i  : in  std_logic_vector(3 downto 0);
	    Zero_o   : out std_logic
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
          
	SIGNAL senial_aux_sal : std_logic_vector(N-1 downto 0);
	SIGNAL senial_aux_SRA : std_logic_vector(N-1 downto 0); -- Señal auxiliar para realizar el desplazamiento circular
	
	
	begin

--    OPCODE     <= ALUop_i;
--	ZERO_o     <=senial_z_o ;
--	SAL_o      <= senial_sal_o(N-1 downto 0);
--	CARRY_o    <= senial_sal_o(N); 
--	senial_a_i <='0' & A_i;
--	senial_b_i <='0' & B_i;
--	senial2_a_i<=A_i;
--	senial2_b_i<=A_i;

-- Se analiza el flag Z

-- SAL_o <= senial_aux_sal;

 -- Zero_o <= '1' when senial_aux_sal = std_logic_vector(unsigned(0),N) else 
-- Zero_o <= '0'; 

process(A_i, B_i, ALUop_i)
	VARIABLE aux1 : std_logic;  -- variable para SRA
	VARIABLE aux2 : integer := to_integer(unsigned(B_i));  -- variable para SRA
	VARIABLE i : integer := 0;  -- variable indice para SRA
	
		begin

		case ALUop_i is
		
					when "0000" =>
						SAL_o <= std_logic_vector((unsigned(A_i) + unsigned(B_i)));

					when "0001" =>
						SAL_o <= std_logic_vector((unsigned(A_i) - unsigned(B_i)));
					
					when "0010" =>
						SAL_o <= not A_i;

					when "0011" =>
						SAL_o <= A_i and B_i;

					when "0100" =>
						SAL_o <= A_i or B_i;
					
			   		when "0101" =>
						SAL_o <= A_i xor B_i;
						
					when "0110" =>
						SAL_o <= std_logic_vector(shift_right(unsigned(A_i), to_integer(unsigned(B_i))));	
					
					when "0111" =>
						SAL_o <= std_logic_vector(shift_left(unsigned(A_i), to_integer(unsigned(B_i))));		
								
					when "1000" =>
						for a in 1 to aux2 loop
							aux1 := A_i(i); 
							senial_aux_SRA <= std_logic_vector(shift_right(unsigned(A_i), 1));
							senial_aux_SRA(63) <= aux1;
							i := i+1;
							if i = 64 then
								i := 0;
							end if;							
						end loop;
						SAL_o <= senial_aux_SRA;

					when others =>
						SAL_o <= std_logic_vector(to_unsigned(0,N));		
		end case;
		
end process;
 

 
	end implementacion;














