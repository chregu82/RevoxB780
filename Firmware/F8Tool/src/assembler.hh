#ifndef PET_ASSEMBLER_HH
#define PET_ASSEMBLER_HH

#include <cstdio>
#include "token.hh"
#include "types.h"
#include "array.hh"

namespace PeT {
  class Memory;
  class Assembler;
  class F8;
  class Opcode;
  class Scope;
  typedef Opcode*(*AssembleInstruction)(Assembler& input, Scope& scope, unsigned short addr);

  /*
    expressionstrich	:= expressionklammer[+|-]expressionklammer
    expressionmult	:= expressionklammer[*|/]expressionklammer
    expressionklammer	:= (expressionklammer)|expressionstrich
    number	:= constant|expression1.
    
    .include
    .undef
    .define
    .if
    .elif
    .else
    .error
    .warning
    .endif
    
    org number
    
    name = number
    
  */
  class Assembler {
  private:
  protected:
    Token *token;
  public:
    File *file;
    Assembler();
    virtual ~Assembler();
    
    virtual Token* PeekToken();
    virtual void NextToken();
    virtual bool GetIdentifier(Token& token);
    virtual bool GetLabel(Token& token);
    virtual bool GetOperator(Token& token);
    virtual bool GetWhiteSpace();
    virtual bool GetEndOfLine();
    virtual bool GetNumber(Token& token);
    void PrintError(const char *string, int line, int column);
    
    virtual void Assemble(F8& f8, Scope& scope, const char*filename, AssembleInstruction instruction);
  };
}

#endif
