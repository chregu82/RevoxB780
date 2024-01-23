#ifndef PET_TOKEN_HH
#define PET_TOKEN_HH

#include <cstdio>
#include "string.hh"

namespace PeT {
/*
  bindigit	:= 0|1.
  digit		:= 0|1..|9.
  hexdigit	:= digit|a..f.
  alpha		:= a|b..z|A|B..Z.
  alphanum	:= alpha|digit.

  postfix	:= b|w|a|p. b(byte), w(word), a(address), p(port)
  decimal	:= digit{digit}[postfix].
  hexadecimal	:= '$'hexdigit{hexdigit}[postfix].
  binary	:= '%'bindigit{bindigits}[postfix].
  constant	:= decimal|hexadecimal|binary.

  identifier	:= (alpha|'_'){alphanum|'_'}.

  label	:= identifier':'.

  operators: + - * / == < > <= >= != , && || ^ & | = ( ) 
  
 */
  class Token {
  public:
    enum Types { Operator, Identifier, Label, Number, String, WhiteSpace, EndOfLine/*line oriented syntax*/, EndOfFile };    
    Types type;
    PeT::String name;
    int length, pos, line, column, start_of_line;
    struct {
      enum Types { None, Port, Byte, Address, Word };
      Types type;
      bool constant;
      bool has_sign;
      //      bool is_unsigned;
      unsigned long value_unsigned;
      long value_signed;
    } number;
    struct {
      PeT::String letters;
    } string;
  };
  
  class File {
    const char *name;
    unsigned char *buffer;
    int length;
    int pos, line, column;
    int start_of_line;
  public:
    Token token;
    File();
    ~File();
    void Read(const char *name_);
    void NextToken();
    bool IsLineEnd();
    void ToLineEnd();
    bool IsWhiteSpace();
    void ToWhiteSpaceEnd();
    bool IsFileEnd();
    void PrintError(Token& token, const char *string);
    void PrintError(const char *string);
  };
}
#endif
