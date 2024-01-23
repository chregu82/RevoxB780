#include "token.hh"
#include <cctype>

namespace PeT {

  #define TAB_SIZE 8

  inline int hex2value(char ascii)
  {
    if (isdigit(ascii)) return ascii-'0';
    return tolower(ascii)-'a'+10;
  }
  
  File::File() { buffer=NULL; }
  File::~File()
  {
    if (buffer) { delete[] buffer;buffer=NULL; }
  }
  void File::Read(const char *name_)
  {
    name=name_;
    FILE *file;
    file=fopen(name_, "rb");
    if (file==NULL) throw "FILEOPEN";
    fseek(file, 0, SEEK_END);
    length=ftell(file);
    fseek(file, 0, SEEK_SET);
    buffer= new unsigned char[length];
    fread(buffer, 1, length, file);
    fclose(file);
    
    pos=0;
    line=0;
    column=0;
    start_of_line=0;
    token.length=0;
  }
  
  void File::PrintError(Token& token_, const char *string)
  {
    printf("%s: %s at line:%d column:%d\n", name, string, token_.line, token_.column);
    for (int i=token_.start_of_line; i<length && buffer[i]!='\r' && buffer[i]!='\n'; i++) {
      printf("%c", buffer[i]);
    }
    printf("\n");
    for (int i=0; i<token_.column; i++) {
      printf(" ");
    }
    printf("^\n");
  }
  
  void File::PrintError(const char *string)
  {
    printf("%s: %s at line:%d column:%d\n", name, string, line, column);
    for (int i=start_of_line; i<length && buffer[i]!='\r' && buffer[i]!='\n'; i++) {
      printf("%c", buffer[i]);
    }
    printf("\n");
    for (int i=0; i<column; i++) {
      printf(" ");
    }
    printf("^\n");
  }

  bool File::IsFileEnd() { return pos>=length; }
  bool File::IsLineEnd()
  {
    return !IsFileEnd() && (buffer[pos]=='\r' ||  buffer[pos]=='\n');
  }
  
  void File::ToLineEnd()
  {
    while (!IsFileEnd() && buffer[pos]!='\r' && buffer[pos]!='\n') { pos++;token.length++;column++; }
    if (!IsFileEnd()) {
      token.type=Token::EndOfLine;
      pos++;token.length++;
      column=0;line++;
      if (pos<length) {
	if ( buffer[pos-1]=='\r' && buffer[pos]=='\n' || buffer[pos-1]=='\n' && buffer[pos]=='\r') {
	  pos++; token.length++;
	}
      }
      start_of_line=pos;
    }
  }
  
  bool File::IsWhiteSpace()
  {
    return (pos<length && (buffer[pos]==' ' || buffer[pos]=='\x9' || buffer[pos]==';'))
      || (pos+1<length && buffer[pos]=='/' && buffer[pos+1]=='*');
  }
  
  void File::ToWhiteSpaceEnd()
  {
    for (;;) {
      if (pos+1<length && buffer[pos]=='/' && buffer[pos+1]=='*') {
	token.length+=2;column+=2;pos+=2;
	while (pos+1<length && buffer[pos]!='*' && buffer[pos+1]!='/') { 
	  if (IsLineEnd()) { 
	    ToLineEnd();
	  } else {
	    token.length++;column++;pos++;
	  }
	}
	if (pos+2>=length) { PrintError(token, "comment: fileend");break; }
	// probably adding an nesting comment
      } else if (pos<length && buffer[pos]==';') {
	ToLineEnd();
      } else if (pos<length && (buffer[pos]==' ' || buffer[pos]=='\x9')) {
	if (buffer[pos]=='\x9') { column=((column+TAB_SIZE)/TAB_SIZE)*TAB_SIZE; }
	else column++;
	token.length++;pos++;
      } else
	return;
    }
  }
  
  void File::NextToken() 
  {
    int i;
    bool toolong;
    if (pos<length) {
      token.pos=pos;
      token.line=line;
      token.column=column;
      token.start_of_line=start_of_line;
      token.length=0;
      switch(buffer[pos]) {
      case '$':
	token.type=Token::Number;
	token.length++;column++;pos++;
	token.number.has_sign=false;
	token.number.value_unsigned=0;
	for (i=0;pos<length &&isxdigit(buffer[pos]);i++) {
	  token.number.value_unsigned*=0x10;
	  token.number.value_unsigned+=hex2value(buffer[pos]);
	  token.length++;column++;pos++;
	}
	token.number.value_signed=token.number.value_unsigned;
	if (i>8) PrintError(token, "Number too long");
	break;
      case '%':
	token.type=Token::Number;
	token.length++;column++;pos++;
	token.number.has_sign=false;
	token.number.value_unsigned=0;
	for (i=0;pos<length && (buffer[pos]=='0'||buffer[pos]=='1');i++) {
	  token.number.value_unsigned*=2;
	  token.number.value_unsigned+=buffer[pos]-'0';
	  token.length++;column++;pos++;
	}
	token.number.value_signed=token.number.value_unsigned;
	if (i>32) PrintError(token, "Number too long");
	break;
      case '0': 
	toolong=false;
	token.type=Token::Number;
	token.length++;column++;pos++;
	token.number.has_sign=false;
	token.number.value_unsigned=0;
	while (pos<length && buffer[pos]>='0'&&buffer[pos]<='7') {
	  if (token.number.value_signed>signed(0xffffffff/8)) toolong=true;
	  token.number.value_unsigned*=8;
	  token.number.value_unsigned+=buffer[pos]-'0';
	  token.length++;column++;pos++;
	}
	token.number.value_signed=token.number.value_unsigned;
	if (toolong) PrintError(token, "number too long");
	break;
      case '=': case '&': case '|':
	token.type=Token::Operator;
	token.name=String((char*)buffer+pos, 1);
	token.length++;column++;pos++;
	if (pos<length && buffer[pos]==buffer[pos-1]) {
	  token.name+=String((char*)buffer+pos, 1);
	  token.length++;column++;pos++;
	}
	break;
      case '<': case '>':
	token.type=Token::Operator;
	token.name=String((char*)buffer+pos, 1);
	token.length++;column++;pos++;
	if (pos<length && (buffer[pos]==buffer[pos-1]||buffer[pos]=='=') ) {
	  token.name+=String((char*)buffer+pos, 1);
	  token.length++;column++;pos++;
	}
	break;
      case '!': 
	token.type=Token::Operator;
	token.name=String((char*)buffer+pos, 1);
	token.length++;column++;pos++;
	if (pos<length && buffer[pos]=='=') {
	  token.name+=String((char*)buffer+pos, 1);
	  token.length++;column++;pos++;
	}
	break;
      case '^': case '*': case ',': case '+': case '-': case '~': case '(': case ')':
	token.type=Token::Operator;
	token.name=String((char*)buffer+pos, 1);
	token.length++;column++;pos++;
	break;
      case '\'':
	token.type=Token::Number;
	token.length++;column++;
	if (pos<length) break;
	if (buffer[pos]=='\\') {
	  token.length++;column++;
	  if (pos>=length || tolower(buffer[pos+token.length])!='x') { PrintError("character constant: x expected after \\");break; }
	  token.number.value_signed=token.number.value_unsigned=buffer[pos];
	} else if (isprint(buffer[pos])) {
	  token.number.value_signed=token.number.value_unsigned=buffer[pos];
	  token.length++;column++;pos++;
	  if (pos>=length || buffer[pos]!='\\') { PrintError("character constant: closing \' expected");break; }
	  token.length++;column++;pos++;
	} else
	  PrintError("character constant: unprintable char");
	break;
      case '\"':
	token.type=Token::String;
	token.length++;column++;pos++;
	token.string.letters=String();
	for (;;) {
	  if (pos>length) { PrintError(token, "string constant: fileend "); break; }
	  if (buffer[pos]=='\r' || buffer[pos]=='\r') { PrintError(token, "string constant: illegal sign");break; }
	  if (buffer[pos]=='\"') {
	    token.length++;column++;pos++;
	    break;
	  }
	  if (buffer[pos]=='\\') {
	    token.length++;column++;pos++;
	    if (pos>=length) { PrintError(token, "string constant special sign: fileend");break; }
	    switch (buffer[pos]) {
	    case 'r':
	      token.string.letters+="\x0d";
	      token.length++;column++;pos++;
	      break;
	    case 'n':
	      token.string.letters+="\x0a";
	      token.length++;column++;pos++;
	      break;
	    case 'x':
	      {
		token.length++;column++;pos++;
		if (pos>=length) { PrintError(token, "string constant special sign in hex: fileend");return; }
		if (!isxdigit(buffer[pos])) { PrintError(token, "string constant special sign in hex: fileend");return; }
		char s[2]="1";
		s[0]=hex2value(buffer[pos]);
		token.length++;column++;pos++;
		if (pos<length && isxdigit(buffer[pos])) {
		  s[0]*=0x10;
		  s[0]+=hex2value(buffer[pos]);
		  token.length++;column++;pos++;
		}
		token.string.letters+=s;
	      }
	      break;
	    default:
	      PrintError(token, "string constant special sign: unknown");
	      return;
	    }
	  } else {
	    token.string.letters+=String((char*)buffer+pos, 1);
	    token.length++;column++;pos++;
	  }
	}
	break;
      default:
	if (isdigit(buffer[pos])) {
	  toolong=false;
	  token.type=Token::Number;
	  token.number.has_sign=false;
	  token.number.value_unsigned=0;
	  while (pos<length && isdigit(buffer[pos])) {
	    if (token.number.value_signed>signed(0xffffffff/10)) toolong=true;
	    token.number.value_unsigned*=10;
	    token.number.value_unsigned+=buffer[pos]-'0';
	    token.length++;column++;pos++;
	  }
	  token.number.value_signed=token.number.value_unsigned;
	  if (toolong) PrintError(token, "number too long");
	} else if (isalpha(buffer[pos]) || buffer[pos]=='_') {
	  token.type=Token::Identifier;
	  token.length++;column++;pos++;
	  while (pos<length && isalnum(buffer[pos]) || buffer[pos]=='_') {
	    token.length++;column++;pos++;
	  }
	  token.name=String((char*)buffer+pos-token.length,token.length);
	  if (pos<length && buffer[pos]==':') {
	    token.type=Token::Label;
	    token.length++;column++;pos++;
	  }
	} else if (IsLineEnd()) {
	  ToLineEnd();
	} else if (IsWhiteSpace()) {
	  token.type=Token::WhiteSpace;
	  ToWhiteSpaceEnd();
	  if (IsLineEnd()) {
	    ToLineEnd();
	  }
	} else if (buffer[pos]=='/') {
	  token.length++;column++;pos++;
	  token.name="/";
	  token.type=Token::Operator;
	} else
	  PrintError("unknown sign");
      }
    } else {
      token.type=Token::EndOfFile;
    }
  }
}

