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

"//".*			{}
"LD"			{return 13;}
"STO"			{return 26;}
\n 				{return -1;}			//acho interressante fazer isso para colocar no bison
"DEC"			{return 16;}
"INC"			{return 17;}
"PUSH"			{return 18;}
"POP"			{return 20;}
"MUL"			{return 21;}
"DIV"			{return 22;}
"SUB"			{return 23;}
"ADD"			{return 2; }
"JMP"			{return 24;}
"JZ"			{return 99;}
"JNZ"			{return 25;}
"JE"			{return 1;}
"JNE"			{return 3; }
"AND"			{return 4; }
"OR"			{return 5; }
"XOR"			{return 6; }
"NOT"			{return 7; }
[R][1-8]		{return 8;}
"["				{return 9;}
"]"				{return 10;}
"CALL"			{return 11;}
"RET"			{return 12;}
"PRINT"			{return 200;}
".data"			{BEGIN(DATA);}
[A-Z][a-z]*		{return  14;}
"0x"[0-9]		{return   46;}
":"				{return 15;}
<DATA>["]			{BEGIN(STRING);}
<DATA>[a-z]+		{return 33;}
<DATA>"="			{return 34;}
<DATA>[+-]?[0-9]+	{return 35;}
<DATA>".code"		{BEGIN(INITIAL);}
<DATA>.				{return 404;}
<STRING>["]				{BEGIN(DATA);}
<STRING>[a-zA-Z0-9_ ]+	{return 88;}
<STRING>"%d"			{return 89;}
<STRING>"%s"			{return 90;}
<STRING>.				{return 405;}
.				{return 406;}