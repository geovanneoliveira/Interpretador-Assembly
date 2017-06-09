%option noyywrap nodefault
%x STRING
%%

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
"MOD"			{return KW_MOD;}
"["				{return KW_ABRE_COCHETES;}
"]"				{return KW_FECHA_COCHETES;}
"="				{return OP_IGUAL;}
".code"			{return KW_CODE;}
".data"			{return KW_DATA;}
"CALL"			{return KW_CALL;}
"RET"			{return KW_RET;}
"PRINT"			{return KW_PRINT;}
":"				{return KW_COLO;}
[R][1-8]		{return KW_REG;}
[A-Z][a-z]*		{return KW_LABEL ;}
"0x"[0-9]		{return KW_ENDRECO;}
[+-]?[0-9]+		{return KW_NUMBER;}
[a-z][a-z]*		{return KW_VARIAVEL;}
\"				{BEGIN(STRING); 	//duvida: ta certo isso?}
<STRING>["]				{BEGIN(INITIAL);}
<STRING>[a-zA-Z0-9_ ]+	{return KW_STR;}
<STRING>.				{return 405;}
.				{return 406;}

%%
