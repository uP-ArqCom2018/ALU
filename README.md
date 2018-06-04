# ALU

La unidad aritmético-lógica de este datapath, también conocida como ALU, es un circuito digital que calcula operaciones aritméticas y operaciones lógicas, entre los valores de dos registros de entrada (Registro A y B).

El esquema de la ALU esta compuesto por 3 entradas y 2 salidas: 
##### Entradas:

|Nombre| Detalle|Cant. Bits|
|------|--------|----------|
|__A_i__| Registro A Proveniente de la memoria de registros| 64 bits |
|__B_i__| Registro B. Proveniente de la memoria de registros o del dato inmediato| 64 bits
|__ALU_op_i__| Operacion de la ALU. Proveniente de la Unidad de Control| 4 bits

##### Salidas:

|Nombre| Detalle|Cant. Bits|
|------|--------|----------|
|__SAL_o__ |Resultado de la ALU| 64 bits
|__ZERO_o__| Flag Zero. Igual a 1 si ultima operacion tiene resultado cero| 1 bit



### Operaciones: 
Una unidad de control controla a la ALU, al enviarle 4 bits especificos que le indican la operacion a realizar.
Las operaciones que realiza la ALU se especifican en la siguiente tabla:
#
|Operacion|ALU_op|Descripcion|
|---------|------|-----------|
|ADD      |0000  |A+B        |
|SUB|0001 |A-B|
|NOT|0010 |???|
|AND|0011 |A and B|
|OR |0100 |A or B |
|XOR|0101 |A xor B |
|SRL|0110 |Desplapazamiento logico a la derecha|
|SLL|0111 |Desplazamiento logico a la izquierda|
|SRA|0111 |Desplaza el registro N bits a la derecha rellenando con el bit de signo correspondiente|


