#define STMT_NO_ARGS 257
#define STMT_ONE_ARG 258
#define STMT_TWO_ARGS 259
#define MIMETYPE 260
#define STRING 261
#define INTEGER 262
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {
    char *	sval;
    int		ival;
    struct ccommand * cval;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
