flex: lex/scanner.flex
	flex lex/scanner.flex && make scanner

scanner: lex.yy.c
	gcc -I . lex.yy.c -ll -o cminus_scanner.out
