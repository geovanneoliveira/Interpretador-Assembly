%{

// ta faltando como nos vamos tratar os labels pois não encotrei um logica ainda pq as variaveis não são fortementes tipadas, acho melhor nos tratarmos no bison. EX:
/* .data
	a = 5
	b = 13
	.code
	LD R3 [a]
	LD R1 [b]
*/
	
%}

%option noyywrap nodefault
%x DATA
%x STRING
%%

".code"			{}
"//".*			{}
"LD"			{return KW_LD;}
"STO"			{return KW_STO;}
\n 				{return KW_BARRAN;}			//acho interressante fazer isso para colocar no bison
"DEC"			{return KW_DEC;}
"INC"			{return KW_INC;}
"PUSH"			{return KW_PUSH;}
"POP"			{return KW_POP;}
"MUL"			{return KW_MUL;}
"DIV"			{return KW_DIV;}
"SUB"			{return KW_SUB;}
"ADD"			{return KW_ADD; }
"JMP"			{return KW_JMP;}
"JZ"			{return KW_JZ;}
"JNZ"			{return KW_JNZ;}
"JE"			{return KW_JE;}
"JNE"			{return KW_JNE; }
"AND"			{return KW_AND; }
"OR"			{return KW_OR; }
"XOR"			{return KW_XOR; }
"NOT"			{return KW_NOT; }
[R][1-8]		{return KW_REG;}
"["				{return KW_ABRE_CONCHETES;}
"]"				{return KW_FECHA_CONCHETES;}
"CALL"			{return KW_CALL;}
"RET"			{return KW_RET;}
"PRINT"			{return KW_PRINT;}
[A-Z][a-z]*		{return KW_LABEL ;}
"0x"[0-9]		{return KW_ENDRECO;}
":"				{return KW_COLO;}
[+-]?[0-9]+		{return KW_NUMBER;}
".data"			{BEGIN(DATA);}
<DATA>["]			{BEGIN(STRING);}
<DATA>[a-z]+		{return KW_VARIAVEL;}
<DATA>"="			{return OP_IGUAL;}
<DATA>[+-]?[0-9]+	{return KW_NUMBER;}
<DATA>".code"		{BEGIN(INITIAL);}
<DATA>.				{return 404;}
<STRING>["]				{BEGIN(DATA);}
<STRING>[a-zA-Z0-9_ ]+	{return 88;}
<STRING>"%d"			{return 89;}
<STRING>"%s"			{return 90;}
<STRING>.				{return 405;}
.				{return 406;}