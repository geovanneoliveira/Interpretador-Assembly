%token KW_ADD
%token KW_SUB
%token KW_MUL
%token KW_DIV
%token KW_REG
%token KW_BARRAN
%token KW_COLON
%token KW_PUSH
%token KW_POP
%token KW_JNZ
%token KW_JZ
%token KW_JE
%token KW_JNE
%token KW_ABRE_COLCHETES
%token KW_FECHA_COLCHETES
%token KW_LD
%token KW_STO
%token KW_DEC
%token KW_INC
%token KW_JMP
%token KW_AND
%token KW_OR
%token KW_XOR
%token KW_NOT
%token KW_CALL
%token KW_RET
%token KW_PRINT
%token KW_NUMBER
%token KW_VARIAVEL 
%token OP_IGUAL
%token KW_STR
%token KW_DATA
%token KW_CODE
%token KW_MOD

File: 
  DataSection CodeSection 
  ;

DataSection:
	Assigments
	;
Assignments:
	Assignments
	| Assignments Assignment
	;
Assignment:
	KW_VARIAVEL OP_IGUAL KW_NUMBER KW_BARRAN
	| KW_VARIAVEL OP_IGUAL KW_STR KW_BARRAN
	;
CodeSection:
	KW_CODE Linhas
	;
Linhas: Linha
	| Linha Linhas
	;
Linha: 	Instrucao KW_BARRAN
	| 	KW_LABEL KW_COLON Intrucao KW_BARRAN
	;

Instrucao: 	Soma 
			| Subtracao 
			| Multiplicacao 
			| Divisao 
			| Push 
			| Pop 
			| Incrementar 
			| Decremmentar
			| Jump_zero 
			| Jump_not_zero 
			| Jump_equals 
			| Jump_not_equals 
			| And 
			| Or 
			| Load
			| Call
			| RET
			| Sto
			
	;


Soma: KW_ADD Source Source KW_REG;

Subtracao: KW_SUB Source Source KW_REG;

Multiplicacao: KW_MUL Source Source KW_REG; 

Divisao: KW_DIV Source Source KW_REG;

Push: KW_PUSH KW_REG;

Pop: KW_POP KW_REG;

Incrementar: KW_INC KW_REG;

Decremmentar: KW_DEC KW_REG;

Jump_zero: KW_JZ KW_REG KW_ABRE_COLCHETES KW_LABEL KW_FECHA_COLCHETES;

Jump_not_zero: KW_JNZ KW_REG KW_ABRE_COLCHETES KW_LABEL KW_FECHA_COLCHETES;

Jump_equals: KW_JE KW_REG KW_REG KW_ABRE_COLCHETES KW_LABEL KW_FECHA_COLCHETES;

Jump_not_equals: KW_JNE KW_REG KW_REG KW_ABRE_COLCHETES KW_LABEL KW_FECHA_COLCHETES; 

And: KW_AND Source Source KW_REG;

Or: KW_OR Source Source KW_REG;

Load: KW_LD KW_REG KW_REG
	| KW_LD KW_REG KW_ABRE_COLCHETES KW_NUMBER KW_FECHA_COLCHETES
	| KW_LD KW_REG KW_ABRE_COLCHETES KW_VARIAVEL KW_FECHA_COLCHETES
	| KW_LD KW_REG KW_ENDRECO
	;

Sto: KW_STO KW_REG KW_ENDRECO;

Call: KW_CALL KW_ABRE_COLCHETES KW_LABEL KW_FECHA_COLCHETES;

Source:
	KW_REG
	| KW_NUMBER
	;
