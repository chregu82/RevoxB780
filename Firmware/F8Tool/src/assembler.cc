#include "assembler.hh"
#include "f8.hh"
#include "scope.hh"
#include <cstring>

namespace PeT {
  Assembler::Assembler()
  {
  }
  
  Assembler::~Assembler() 
  {
  }
  
  Token* Assembler::PeekToken()
  {
    return token;
  }

  void Assembler::NextToken()
  {
    file->NextToken();
  }

  bool Assembler::GetIdentifier(Token& token_)
  {
    if (token->type==Token::Identifier) {
      token_=*token;
      file->NextToken();
      return true;
    }
    return false;
  }
  bool Assembler::GetLabel(Token& token_)
  {
    if (token->type==Token::Label) {
      token_=*token;
      file->NextToken();
      return true;
    }
    return false;
  }
  bool Assembler::GetOperator(Token& token_)
  {
    if (token->type==Token::Operator) {
      token_=*token;
      file->NextToken();
      return true;
    }
    return false;
  }
  bool Assembler::GetWhiteSpace()
  {
    if (token->type==Token::WhiteSpace) {
      file->NextToken();
      return true;
    }
    return false;
  }
  bool Assembler::GetEndOfLine()
  {
    if (token->type==Token::EndOfLine) {
      file->NextToken();
      return true;
    }
    return false;
  }
  bool Assembler::GetNumber(Token& token_)
  {
    if (token->type==Token::Number) {
      token_=*token;
      file->NextToken();
      // might be an expression
      return true;
    }
    if (token->type==Token::Operator) {
      if (token->name.cmp("(")==0) {
      } else if (token->name.cmp("+")==0) {
	file->NextToken();
	if (token->type==Token::Number) {
	  token->number.has_sign=true;
	  token_=*token;
	  file->NextToken();
	  return true;
	}
	file->PrintError("unary +: number/operator expected");
	return false;
      } else if (token->name.cmp("-")==0) {
	file->NextToken();
	if (token->type==Token::Number) {
	  token->number.has_sign=true;
	  token->number.value_signed=-token->number.value_unsigned;
	  token_=*token;
	  file->NextToken();
	  return true;
	}
	file->PrintError("unary -: number/operator expected");
	return false;
      }
    }
    return false;
  }

  void Assembler::PrintError(const char *string, int line, int column)
  {
    printf("%s at line:%d column:%d\n", string, line, column);
  }
  
  void Assembler::Assemble(F8& f8, Scope & scope, const char *filename, AssembleInstruction instruction)
  {
    File f;
    token=&f.token;
    file=&f;
    f.Read(filename);  
    f.NextToken();
    unsigned short addr=0;

    GetWhiteSpace();
    for (;;) {
      Token t, l;
      Token *p, *label;
      if (f.IsFileEnd()) return;
      
      label=PeekToken();
      if (label->type==Token::Label) {
	GetLabel(l);
	if (scope.Get(l.name)!=NULL) {
	  PrintError(String("symbol ")+l.name+" already defined", l.line, l.column);
	  return;
	}
	if (GetEndOfLine()) {
	  scope.Add(new SymbolAddress(l.name, addr));
	  continue;
	}
      } else label=NULL;
      GetWhiteSpace();
      p=PeekToken();
      if (p==NULL) return;
      if (p->type==Token::EndOfLine) { GetEndOfLine();continue; }
      if (p->type!=Token::Identifier) {
	PrintError("identifier expected", p->line, p->column);
	return;
      }
      if (p->name.casecmp("db")==0) {
	if (label) scope.Add(new SymbolAddress(l.name, addr));
	NextToken();
	Array<unsigned char> a=Array<unsigned char>();
	for (;;) {
	  GetWhiteSpace();
	  if (!GetNumber(t)) {
	    PrintError("number expected", token->line, token->column);
	    return ;
	  }
	  if (t.number.value_unsigned>=0x100 ) {
	    PrintError("number in byte range expected", t.line, t.column);
	    return ;
	  }
	  a.Add(t.number.value_unsigned);
	  if (GetEndOfLine()) break;
	  GetWhiteSpace();
	  if (!GetOperator(t)) {
	    PrintError("operator expected", token->line, token->column);
	    return ;
	  }
	  if (t.name.cmp(",")!=0 ) {
	    PrintError("operator , expected", t.line, t.column);
	    return ;
	  }
	}
	Opcode *o=new Databytes(addr, a.base(), a.length() );
	f8.segment.Add(o);
	addr+=o->GetSize();
      } else if (p->name.casecmp("dw")==0) {
	if (label) scope.Add(new SymbolAddress(l.name, addr));
	NextToken();
      } else if (p->name.casecmp("dl")==0) {
	if (label) scope.Add(new SymbolAddress(l.name, addr));
	NextToken();
      } else if (p->name.casecmp("dq")==0) {
	if (label) scope.Add(new SymbolAddress(l.name, addr));
	NextToken();
      } else if (p->name.casecmp("org")==0) {
	if (label) scope.Add(new SymbolAddress(l.name, addr));
	NextToken();
	GetWhiteSpace();	
	if (!GetNumber(t)) {
	  PrintError("number expected", token->line, token->column);
	  return ;
	}
	if (t.number.has_sign) {
	  PrintError("unsigned number expected", t.line, t.column);
	  return ;
	}
	if (t.number.value_unsigned>=0x10000 ) {
	  PrintError("number in address/word range expected", t.line, t.column);
	  return ;
	}
	addr=t.number.value_unsigned;
	if (!GetEndOfLine()) {
	  PrintError("end of line expected", token->line, token->column);
	  break;
	}
      } else if (p->name.casecmp("equ")==0) {
	if (!label) {
	  PrintError("no label before equ", token->line, token->column);
	  return ;
	}
	NextToken();
	GetWhiteSpace();	
	if (!GetNumber(t)) {
	  PrintError("number expected", token->line, token->column);
	  return ;
	}
	if (t.number.has_sign) {
	  PrintError("unsigned number expected", t.line, t.column);
	  return ;
	}
	if (t.number.value_unsigned>=0x10000 ) {
	  PrintError("number in address/word range expected", t.line, t.column);
	  return ;
	}
	scope.Add(new SymbolAddress(l.name, t.number.value_unsigned));
	if (!GetEndOfLine()) {
	  PrintError("end of line expected", token->line, token->column);
	  break;
	}
      } else {	
	if (label) scope.Add(new SymbolAddress(l.name, addr));
	Opcode *o=instruction(*this, scope, addr);
	if (o!=NULL) {
	  f8.segment.Add(o);
	  addr+=o->GetSize();
	} else {
	  return ;
	}
      }
    }
  }
}
