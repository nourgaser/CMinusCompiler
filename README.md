# Compiler Design Project (CS-352, Spring 2022, MUST University)
## Terminology & Prerequisites:

- Reference book: [Compiler Construction: Principles and Practice](https://www.amazon.com/Compiler-Construction-Principles-Kenneth-Louden/dp/0534939724), by Kenneth C. Louden.

- [The Tiny Machine](https://www.amazon.com/Compiler-Construction-Principles-Kenneth-Louden/dp/0534939724): a simulator in C for the Tiny Machine; a program that executes custom assembly [*.tm](tm/sample.tm) file. Its source code is provided in the book's appendix C.

- The Tiny programming language: a very simple programming language ([keywords and rules](docs/img/tiny_rules.png) specified at p.22 of the book).

- Tiny Compiler: a Tiny->TM compiler. Its [source code](tiny) is provided in the book's appendix B.

- The C- (C minus) programming language: a simple programming language that is a subset of the C programming language. Its [structure, grammar, and rules](docs/img/cminus_grammar.png) are specified at appendix A of the book. 


## Project Goal

This project's main task is to implement the first two phases of a compiler that compiles C- source code into TM assembly which can be excuted on the TM Machine.


- Phase I: scanner (lexical analyzer).

- Phase II: parser (syntax analyzer).


## Implementation
The scanner is implemented by specifying C-'s tokens using regex for LEX to generate the scanner in C.<br>
The parser is implemented by specifying C-'s grammar using the BNF notation for YACC to generate the parser in C.

## Team Members
| Name        | ID           |
| ------------- |:-------------:|
| [Nour Gaser](https://github.com/nourgaser)      | 89553      |
| [Ahmed Gomaa](https://github.com/ahmedgomaa)      | ID HERE      |
| [Ahmed Khaled Kira](https://github.com/ahm3dkira)      | 89671      |

## Credits
- The source code for the TM Machine, and Tiny Compiler can be found in Louden's book, and at [ejacky's repo: tiny](https://github.com/ejacky/tiny) as well. 
