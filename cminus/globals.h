/* MAXRESERVED = the number of reserved words */
#define MAXRESERVED 27

typedef enum
/* book-keeping tokens */
{
    /* reserved words */
    IF = 1,
    ELSE,
    INT,
    RETURN,
    VOID,
    WHILE,
    /* special symbols */
    PLUS,
    MINUS,
    TIMES,
    OVER,
    LT,
    LTE,
    GT,
    GTE,
    E, // equal
    EE, // equal equal (comparison)
    NE, // not equal
    SEMICOLON,
    COMMA,
    LPAREN,
    RPAREN,
    LBRACK,
    RBRACK,
    LCURL,
    RCURL,
    /* multicharacter tokens */
    ID,
    NUM,
    /* other */
    COMMENT, 
    WHITESPACE, 
    NEWLINE, 
    /* invalid */
    ERROR,
} TokenType;

// /* lookup table of reserved words */
const struct
{
    TokenType tok;
    char *str;
} reservedWords[MAXRESERVED] = 
{
    {IF,"IF"},
    {ELSE,"ELSE"},
    {INT,"INT"},
    {RETURN,"RETURN"},
    {VOID,"VOID"},
    {WHILE,"WHILE"},
    {PLUS,"PLUS"},
    {MINUS,"MINUS"},
    {TIMES,"TIMES"},
    {OVER,"OVER"},
    {LT,"LT"},
    {LTE,"LTE"},
    {GT,"GT"},
    {GTE,"GTE"},
    {E,"E"},
    {EE,"EE"},
    {NE,"NE"},
    {SEMICOLON,"SEMICOLON"},
    {COMMA,"COMMA"},
    {LPAREN,"LPAREN"},
    {RPAREN,"RPAREN"},
    {LBRACK,"LBRACK"},
    {RBRACK,"RBRACK"},
    {LCURL,"LCURL"},
    {RCURL,"RCURL"},
    {ID,"ID"},
    {NUM,"NUM"},
};