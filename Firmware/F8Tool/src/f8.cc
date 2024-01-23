#include "f8.hh"
#include "memory.hh"
#include "assembler.hh"
#include "disassembler.hh"
#include <cstdio>
#include <cstring>
#include "types.h"
#include "string.hh"
#include "scope.hh"
#include <typeinfo>
#include "instruction.hh"

namespace PeT {
  
  enum Sizes { SizeNone, SizeIS, SizeBit, SizeByte, SizeWord };
  
  enum Wordregs {
    WordregNone,
    P0, P, DC, H, K, Q
  };
  
  struct {
    const char *name;
    struct {
      bool yes;
      unsigned char address;
    } scractpad;
  } wordregs[]={
    {},
    { "P0" }, // PC0
    { "P" },  // PC1
    { "DC" },
    { "H", { true, 10 } },
    { "K", { true, 12 } },
    { "Q", { true, 14 } },
  };
  
  enum ArgumentType { 
    ArgumentNone, 
    ArgumentBytereg, ArgumentWordReg, ArgumentRelative, ArgumentImmediate
  };
  
  enum Byteregs {
    ByteregNone,
    A, IS, W, J, KU, KL, QU, QL
  };
  
  struct {
    const char *name;
    struct {
      bool yes;
      unsigned char address;
    } scractpad;
  } byteregs[]={
    {},
    { "A" },
    { "IS" },
    { "W" },
    { "J", { true, 9 } },
    { "KU", { true, 12 } },
    { "KL", { true, 13 } },
    { "QU", { true, 14 } },
    { "QL", { true, 15 } },
  };
  
  enum AddressingModes {
    AddressingModeImplicite,
    AddressingModeIncludedImmediate3,
    AddressingModeIncludedImmediate4,
    AddressingModeIncludedScratchpad4,
    AddressingModeIncludedByteregScratchpad4,
    AddressingModeIncludedScratchpad4Bytereg,
    AddressingModeConstant,
    AddressingModeByteregBytereg,
    AddressingModeWordregWordreg,
    AddressingModeImmediate,
    AddressingModeImmediateWord,
    AddressingModePort,
    AddressingModeAbsolute,
    AddressingModeRelative,
    AddressingModeIncluded3Relative,
    AddressingModeIncluded4Relative
  };

  struct {
    int size;
  } addressing_modes[]={
    1, //AddressingModeImplicite,
    1, //AddressingModeIncludedImmediate3,
    1, //AddressingModeIncludedImmediate4,
    1, //AddressingModeIncludedScratchpad4,
    1, //AddressingModeIncludedByteregScratchpad4,
    1, //AddressingModeIncludedScratchpad4Bytereg,
    1, //AddressingModeConstant,
    1, //AddressingModeByteregBytereg,
    1, //AddressingModeWordregWordreg,
    2, //AddressingModeImmediate,
    3, //AddressingModeImmediateWord,
    2, //AddressingModePort,
    3, //AddressingModeAbsolute,
    2, //AddressingModeRelative,
    2, //AddressingModeIncluded3Relative,
    2  //AddressingModeIncluded4Relative
  };
  
  bool PrintScratchPad(int value, String& string)
  {
    if (value<0xc) { string="$"+String::Hex(value); return true; }
    else if (value==0xc) { string="(IS)"; return true; }
    else if (value==0xd) { string="(IS)+"; return true; }
    else if (value==0xe) { string="(IS)-"; return true; }
    return false;
  }
  
  struct Instruction {
    const char *mnemonic;
    unsigned char opcode;
    Sizes size;
    AddressingModes addressing_mode;
    struct {
      Byteregs dest, source;
    } byteregs;
    struct {
      Wordregs dest, source;
    } wordregs;
    unsigned constant;
  } instructions[]={
    { "LR",	0x00, SizeByte, AddressingModeByteregBytereg, { A, KU } },
    { "LR",	0x01, SizeByte, AddressingModeByteregBytereg, { A, KL } },
    { "LR",	0x02, SizeByte, AddressingModeByteregBytereg, { A, QU } },
    { "LR",	0x03, SizeByte, AddressingModeByteregBytereg, { A, QL } },
    { "LR",	0x04, SizeByte, AddressingModeByteregBytereg, { KU, A } },
    { "LR",	0x05, SizeByte, AddressingModeByteregBytereg, { KL, A } },
    { "LR",	0x06, SizeByte, AddressingModeByteregBytereg, { QU, A } },
    { "LR",	0x07, SizeByte, AddressingModeByteregBytereg, { QL, A } },
    { "LR",	0x08, SizeWord, AddressingModeWordregWordreg, {}, { K, P } },
    { "LR",	0x09, SizeWord, AddressingModeWordregWordreg, {}, { P, K } },
    { "LR",	0x0a, SizeByte, AddressingModeByteregBytereg, { A, IS } },
    { "LR",	0x0b, SizeByte, AddressingModeByteregBytereg, { IS, A } },
    { "PK",	0x0c, SizeWord, AddressingModeImplicite },
    { "LR",	0x0d, SizeWord, AddressingModeWordregWordreg, {}, { P0, Q } },
    { "LR",	0x0e, SizeWord, AddressingModeWordregWordreg, {}, { Q, DC } },
    { "LR",	0x0f, SizeWord, AddressingModeWordregWordreg, {}, { DC, Q } },
    { "LR",	0x10, SizeWord, AddressingModeWordregWordreg, {}, { DC, H } },
    { "LR",	0x11, SizeWord, AddressingModeWordregWordreg, {}, { H, DC } },
    { "SR",	0x12, SizeByte, AddressingModeConstant, {}, {}, 1 },
    { "SL",	0x13, SizeByte, AddressingModeConstant, {}, {}, 1 },
    { "SR",	0x14, SizeByte, AddressingModeConstant, {}, {}, 4 },
    { "SL",	0x15, SizeByte, AddressingModeConstant, {}, {}, 4 },
    { "LM",	0x16, SizeByte, AddressingModeImplicite },
    { "ST",	0x17, SizeByte, AddressingModeImplicite },
    { "COM",	0x18, SizeByte, AddressingModeImplicite },
    { "LNK",	0x19, SizeByte, AddressingModeImplicite },
    { "DI",	0x1a, SizeBit, AddressingModeImplicite },
    { "EI",	0x1b, SizeBit, AddressingModeImplicite },
    { "POP",	0x1c, SizeWord, AddressingModeImplicite },
    { "LR",	0x1d, SizeByte, AddressingModeByteregBytereg, { W, J } },
    { "LR",	0x1e, SizeByte, AddressingModeByteregBytereg, { J, W } },
    { "INC",	0x1f, SizeByte, AddressingModeImplicite },
    { "LI",	0x20, SizeByte, AddressingModeImmediate },
    { "NI",	0x21, SizeByte, AddressingModeImmediate },
    { "OI",	0x22, SizeByte, AddressingModeImmediate },
    { "XI",	0x23, SizeByte, AddressingModeImmediate },
    { "AI",	0x24, SizeByte, AddressingModeImmediate },
    { "CI",	0x25, SizeByte, AddressingModeImmediate },
    { "IN",	0x26, SizeByte, AddressingModePort },
    { "OUT",	0x27, SizeByte, AddressingModePort },
    { "PI",	0x28, SizeWord, AddressingModeAbsolute },
    { "JMP",	0x29, SizeWord, AddressingModeAbsolute },
    { "DCI",	0x2a, SizeWord, AddressingModeImmediateWord },
    { "NOP",	0x2b, SizeNone, AddressingModeImplicite },
    { "XDC",	0x2c, SizeWord, AddressingModeImplicite },
    { "DS",	0x30, SizeByte, AddressingModeIncludedScratchpad4 },
    { "LR",	0x40, SizeByte, AddressingModeIncludedByteregScratchpad4, { A } },
    { "LR",	0x50, SizeByte, AddressingModeIncludedScratchpad4Bytereg, { ByteregNone, A } },
    { "LISU",	0x60, SizeIS, AddressingModeIncludedImmediate3 },
    { "LISL",	0x68, SizeIS, AddressingModeIncludedImmediate3 },
    { "LIS",	0x70, SizeIS, AddressingModeIncludedImmediate4 },
    { "BT",	0x80, SizeByte, AddressingModeIncluded3Relative },
    { "AM",	0x88, SizeByte, AddressingModeImplicite },
    { "AMD",	0x89, SizeByte, AddressingModeImplicite },
    { "NM",	0x8a, SizeByte, AddressingModeImplicite },
    { "OM",	0x8b, SizeByte, AddressingModeImplicite },
    { "XM",	0x8c, SizeByte, AddressingModeImplicite },
    { "CM",	0x8d, SizeByte, AddressingModeImplicite },
    { "ADC",	0x8e, SizeByte, AddressingModeImplicite },
    { "BR7",	0x8f, SizeByte, AddressingModeRelative },
    { "BF",	0x90, SizeByte, AddressingModeIncluded4Relative },
    { "INS",	0xa0, SizeByte, AddressingModeConstant, {}, {}, 0 },
    { "INS",	0xa1, SizeByte, AddressingModeConstant, {}, {}, 1 },
    { "INS",	0xa4, SizeByte, AddressingModeConstant, {}, {}, 4 },
    { "INS",	0xa5, SizeByte, AddressingModeConstant, {}, {}, 5 },
    { "INS",	0xa6, SizeByte, AddressingModeConstant, {}, {}, 6 },
    { "INS",	0xa7, SizeByte, AddressingModeConstant, {}, {}, 7 },
    { "INS",	0xa8, SizeByte, AddressingModeConstant, {}, {}, 8 },
    { "INS",	0xa9, SizeByte, AddressingModeConstant, {}, {}, 9 },
    { "INS",	0xaa, SizeByte, AddressingModeConstant, {}, {}, 10 },
    { "INS",	0xab, SizeByte, AddressingModeConstant, {}, {}, 11 },
    { "INS",	0xac, SizeByte, AddressingModeConstant, {}, {}, 12 },
    { "INS",	0xad, SizeByte, AddressingModeConstant, {}, {}, 13 },
    { "INS",	0xae, SizeByte, AddressingModeConstant, {}, {}, 14 },
    { "INS",	0xaf, SizeByte, AddressingModeConstant, {}, {}, 15 },
    { "OUTS",	0xb0, SizeByte, AddressingModeConstant, {}, {}, 0 },
    { "OUTS",	0xb1, SizeByte, AddressingModeConstant, {}, {}, 1 },
    { "OUTS",	0xb4, SizeByte, AddressingModeConstant, {}, {}, 4 },
    { "OUTS",	0xb5, SizeByte, AddressingModeConstant, {}, {}, 5 },
    { "OUTS",	0xb6, SizeByte, AddressingModeConstant, {}, {}, 6 },
    { "OUTS",	0xb7, SizeByte, AddressingModeConstant, {}, {}, 7 },
    { "OUTS",	0xb8, SizeByte, AddressingModeConstant, {}, {}, 8 },
    { "OUTS",	0xb9, SizeByte, AddressingModeConstant, {}, {}, 9 },
    { "OUTS",	0xba, SizeByte, AddressingModeConstant, {}, {}, 10 },
    { "OUTS",	0xbb, SizeByte, AddressingModeConstant, {}, {}, 11 },
    { "OUTS",	0xbc, SizeByte, AddressingModeConstant, {}, {}, 12 },
    { "OUTS",	0xbd, SizeByte, AddressingModeConstant, {}, {}, 13 },
    { "OUTS",	0xbe, SizeByte, AddressingModeConstant, {}, {}, 14 },
    { "OUTS",	0xbf, SizeByte, AddressingModeConstant, {}, {}, 15 },
    { "AS",	0xc0, SizeByte, AddressingModeIncludedScratchpad4 },
    { "ASD",	0xd0, SizeByte, AddressingModeIncludedScratchpad4 },
    { "XS",	0xe0, SizeByte, AddressingModeIncludedScratchpad4 },
    { "NS",	0xf0, SizeByte, AddressingModeIncludedScratchpad4 },
  };
  
  class F8Opcode: public Opcode {
  protected:
    unsigned short address;
    Instruction *instruction;
  public:
    F8Opcode(unsigned short address_, Instruction *instruction_) { address=address_;instruction=instruction_;}
    ~F8Opcode() {}
    int GetAddress() { return address; }
    int GetSize() { return addressing_modes[instruction->addressing_mode].size; }
    void Bin(const Scope& ass, Memory& memory) { memory.Set(address, instruction->opcode); }
    void Text(const Scope& dis, String& string) { 
      string=instruction->mnemonic;
      string.left(5);
      switch (instruction->addressing_mode) {
      case AddressingModeConstant:
	string+=String::Decimal(instruction->constant);
	break;
      case AddressingModeByteregBytereg:
	string+=String(byteregs[instruction->byteregs.dest].name)+","+byteregs[instruction->byteregs.source].name;
	break;
      case AddressingModeWordregWordreg:
	string+=String(wordregs[instruction->wordregs.dest].name)+","+wordregs[instruction->wordregs.source].name;
	break;
      default: ;
      }
    }
  };

  class F8OpcodeIncluded: public F8Opcode {
  protected:
    int included;
  public:
    F8OpcodeIncluded(unsigned short address_, Instruction *instruction_, int included_)
      :F8Opcode(address_, instruction_), included(included_) {}
    ~F8OpcodeIncluded() {}
    int GetAddress() { return address; }
    void Bin(const Scope& ass, Memory& memory) { memory.Set(address, instruction->opcode|included); }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      switch (instruction->addressing_mode) {
      case AddressingModeIncludedImmediate3:
	string+=String::Decimal(included);
	break;
      case AddressingModeIncludedImmediate4:
	string+="$"+String::Hex(included);
	break;
      default: ;
      }
    }
  };

  class F8OpcodeScratchPad: public F8Opcode {
  protected:
    int scratchpad;
  public:
    F8OpcodeScratchPad(unsigned short address_, Instruction *instruction_, int scratchpad_) 
      :F8Opcode(address_, instruction_), scratchpad(scratchpad_) {}
    ~F8OpcodeScratchPad() {}
    int GetAddress() { return address; }
    void Bin(const Scope& ass, Memory& memory) { memory.Set(address, instruction->opcode|scratchpad); }
    void Text(const Scope& dis, String& string) {
      String t;
      F8Opcode::Text(dis, string);
      PrintScratchPad(scratchpad, t);
      switch (instruction->addressing_mode) {
      case AddressingModeIncludedScratchpad4:
	PrintScratchPad(scratchpad, t);
	string+=t;
	break;
      case AddressingModeIncludedByteregScratchpad4:
	string+=String(byteregs[instruction->byteregs.dest].name)+","+t;
	break;
      case AddressingModeIncludedScratchpad4Bytereg:
	string+=t+","+byteregs[instruction->byteregs.source].name;
	break;
      default: ;
      }
    }
  };

  class F8OpcodeImmediate: public F8Opcode {
  protected:
    unsigned char immediate;
  public:
    F8OpcodeImmediate(unsigned short address_, Instruction *instruction_, unsigned char immediate_)
      :F8Opcode(address_, instruction_), immediate(immediate_) {}
    ~F8OpcodeImmediate() {}
    void Bin(const Scope& ass, Memory& memory) { memory.Set(address, instruction->opcode); memory.Set(address+1, immediate); }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      string+="$"+String::Hex(immediate).right(2,'0');
    }
  };

  class F8OpcodeImmediateWord: public F8Opcode {
  protected:
    unsigned short immediate;
  public:
    F8OpcodeImmediateWord(unsigned short address_, Instruction *instruction_, unsigned short immediate_)
      :F8Opcode(address_, instruction_), immediate(immediate_) {}
    ~F8OpcodeImmediateWord() {}
    void Bin(const Scope& ass, Memory& memory) { 
      memory.Set(address, instruction->opcode); memory.SetWord(address+1, immediate); 
    }
    bool ReferencesAddress(unsigned short& ref) { ref=immediate; return true; }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      SymbolAddress *s=dis.GetAddress(immediate);
      if (s) string+=s->name;
      else string+="$"+String::Hex(immediate).right(4,'0');
    }
  };

  class F8OpcodeImmediateWordAss: public F8Opcode {
  protected:
    Assembler &ass;
    int line, column;
    String label;
  public:
    F8OpcodeImmediateWordAss(Assembler& ass_, unsigned short address_, Instruction *instruction_, int line_, int column_, String label_)
      :F8Opcode(address_, instruction_), ass(ass_), line(line_), column(column_), label(label_) {}
    ~F8OpcodeImmediateWordAss() {}
    void Bin(const Scope& scope, Memory& memory) { 
      memory.Set(address, instruction->opcode); 
      Symbol *s=scope.Get(label);
      if (s==0) ass.PrintError("Symbol "+label+" not found", line, column);
      if (typeid(*s) == typeid(SymbolAddress) ) {
	memory.SetWord(address+1, dynamic_cast<SymbolAddress*>(s)->address);
      } else {
	ass.PrintError("Symbol "+label+" not of type address", line, column);
      }
    }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      string+=label;
    }
  };

  class F8OpcodeImmediatePort: public F8OpcodeImmediate {
  public:
    F8OpcodeImmediatePort(unsigned short address_, Instruction *instruction_, unsigned char immediate_)
      :F8OpcodeImmediate(address_, instruction_, immediate_) {}
    ~F8OpcodeImmediatePort() {}
    bool ReferencesPort(unsigned char& port) { port=immediate; return true; }
  };

  class F8OpcodeRelative: public F8OpcodeImmediate {
  public:
    F8OpcodeRelative(unsigned short address_, Instruction *instruction_, unsigned char immediate_)
      :F8OpcodeImmediate(address_, instruction_, immediate_) {}
    ~F8OpcodeRelative() {}
    bool ReferencesAddress(unsigned short& ref) { ref=address+1+(signed char)immediate; return true; }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      unsigned short word=address+1+(signed char)immediate;
      SymbolAddress *p=dis.GetAddress(word);
      if (p) string+=p->name;
      else string+=String::Decimal((signed char)immediate);
    }
  };

  class F8OpcodeRelativeAss: public F8OpcodeImmediateWordAss {
  public:
    F8OpcodeRelativeAss(Assembler& ass_, unsigned short address_, Instruction *instruction_, int line_, int column_, String label_)
      :F8OpcodeImmediateWordAss(ass_, address_, instruction_, line_, column_, label_) {}
    ~F8OpcodeRelativeAss() {}
    void Bin(const Scope& scope, Memory& memory) { 
      memory.Set(address, instruction->opcode); 
      Symbol *s=scope.Get(label);
      if (s==0) ass.PrintError("Symbol "+label+" not found", line, column);
      if (typeid(*s) == typeid(SymbolAddress) ) {
	short d=dynamic_cast<SymbolAddress*>(s)->address;
	if (d-address>128 || d-address<-127)
	  ass.PrintError("Symbol "+label+" out of range "+String::Decimal(d-address-1), line, column);
	else
	  memory.Set(address+1, d-address-1);
      } else {
	ass.PrintError("Symbol "+label+" not of type address", line, column);
      }
    }
  };

  class F8OpcodeIncludedRelative: public F8OpcodeRelative {
  protected:
    int included;
  public:
    F8OpcodeIncludedRelative(unsigned short address_, Instruction *instruction_, int included_, unsigned char immediate_)
      :F8OpcodeRelative(address_, instruction_, immediate_), included(included_) {}
    ~F8OpcodeIncludedRelative() {}
    void Bin(const Scope& ass, Memory& memory) { memory.Set(address, instruction->opcode|included); memory.SetWord(address+1, immediate); }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      unsigned short word=address+1+(signed char)immediate;
      SymbolAddress *p=dis.GetAddress(word);
      switch (instruction->addressing_mode) {
      case AddressingModeIncluded3Relative:
	string+=String::Decimal(included)+",";	
	if (p) string+=p->name;
	else string+=String::Decimal((signed char)immediate);
	break;
      case AddressingModeIncluded4Relative:
	string+="$"+String::Hex(included)+",";
	if (p) string+=p->name;
	else string+=+String::Decimal((signed char)immediate);
	break;
      default: ;
      }
    }
  };

  class F8OpcodeIncludedRelativeAss: public F8OpcodeRelativeAss {
  protected:
    int included;
  public:
    F8OpcodeIncludedRelativeAss(Assembler& ass_, unsigned short address_, Instruction *instruction_, int line_, int column_, int included_, String label_)
      :F8OpcodeRelativeAss(ass_, address_, instruction_, line_, column_, label_), included(included_) {}
    ~F8OpcodeIncludedRelativeAss() {}
    void Bin(const Scope& scope, Memory& memory) { 
      memory.Set(address, instruction->opcode|included); 
      Symbol *s=scope.Get(label);
      if (s==0) ass.PrintError("Symbol "+label+" not found", line, column);
      if (typeid(*s) == typeid(SymbolAddress) ) {
	unsigned short d=dynamic_cast<SymbolAddress*>(s)->address;
	if (d>address && d-address>128
	    || d<address && address-d>127)
	  ass.PrintError("Symbol "+label+" not of type address", line, column);
	else
	  memory.Set(address+1, d-address-1);
      } else {
	ass.PrintError("Symbol "+label+" not of type address", line, column);
      }
    }
    void Text(const Scope& dis, String& string) {
      F8Opcode::Text(dis, string);
      switch (instruction->addressing_mode) {
      case AddressingModeIncluded3Relative:
	string+=String::Decimal(included)+","+label;	
	break;
      case AddressingModeIncluded4Relative:
	string+="$"+String::Hex(included)+","+label;
	break;
      default: ;
      }
    }
  };

  class F8OpcodeAbsolute: public F8OpcodeImmediateWord {
  public:
    F8OpcodeAbsolute(unsigned short address_, Instruction *instruction_, unsigned short immediate_)
      :F8OpcodeImmediateWord(address_, instruction_, immediate_) {}
    ~F8OpcodeAbsolute() {}
  };

  class F8OpcodeAbsoluteAss: public F8OpcodeImmediateWordAss {
  public:
    F8OpcodeAbsoluteAss(Assembler& ass_, unsigned short address_, Instruction *instruction_, int line_, int column_, String label_)
      :F8OpcodeImmediateWordAss(ass_, address_, instruction_, line_, column_, label_) {}
    ~F8OpcodeAbsoluteAss() {}
    void Bin(const Scope& scope, Memory& memory) {
      memory.Set(address, instruction->opcode); 
      Symbol *s=scope.Get(label);
      if (s==0) ass.PrintError("Symbol "+label+" not found", line, column);
      if (typeid(*s) == typeid(SymbolAddress) ) {
	memory.SetWord(address+1, dynamic_cast<SymbolAddress*>(s)->address);
      } else {
	ass.PrintError("Symbol "+label+" not of type address", line, column);
      }
    }
  };

  Opcode* F8::DisassembleInstruction(Scope& dis, Memory& memory, unsigned short addr)
  {
    unsigned char first=memory.Get(addr);
    for (size_t i=0; i<LENOF(instructions); i++) {
      unsigned char second;
      unsigned short word;
      int scratchpad;
      switch (instructions[i].addressing_mode) {
      case AddressingModeImplicite:
	if (instructions[i].opcode!=first) break;
	return new F8Opcode(addr, instructions+i);
      case AddressingModeIncludedImmediate3:
	if (instructions[i].opcode!=(first&~7)) break;
	return new F8OpcodeIncluded(addr, instructions+i, first&7);
      case AddressingModeIncludedImmediate4:
	if (instructions[i].opcode!=(first&~0xf)) break;
	return new F8OpcodeIncluded(addr, instructions+i, first&0xf);
      case AddressingModeIncludedScratchpad4:
	if (instructions[i].opcode!=(first&~0xf)) break;
	scratchpad=first&0xf;
	if (scratchpad==0xf) return new Databyte(addr, first);
	return new F8OpcodeScratchPad(addr, instructions+i, scratchpad);
      case AddressingModeIncludedByteregScratchpad4:
	if (instructions[i].opcode!=(first&~0xf)) break;
	scratchpad=first&0xf;
	if (scratchpad==0xf) return new Databyte(addr, first);
	return new F8OpcodeScratchPad(addr, instructions+i, scratchpad);
      case AddressingModeIncludedScratchpad4Bytereg:
	if (instructions[i].opcode!=(first&~0xf)) break;
	scratchpad=first&0xf;
	if (scratchpad==0xf) return new Databyte(addr, first);
	return new F8OpcodeScratchPad(addr, instructions+i, scratchpad);
      case AddressingModeConstant:
	if (instructions[i].opcode!=first) break;
	return new F8Opcode(addr, instructions+i);
      case AddressingModeByteregBytereg:
	if (instructions[i].opcode!=first) break;
	return new F8Opcode(addr, instructions+i);
      case AddressingModeWordregWordreg:
	if (instructions[i].opcode!=first) break;
	return new F8Opcode(addr, instructions+i);
      case AddressingModeImmediate:
	if (instructions[i].opcode!=first) break;
	second=memory.Get(addr+1);
	return new F8OpcodeImmediate(addr, instructions+i, second);
      case AddressingModeImmediateWord:
	if (instructions[i].opcode!=first) break;
	word=memory.GetWord(addr+1);
	return new F8OpcodeImmediateWord(addr, instructions+i, word);
      case AddressingModePort:
	if (instructions[i].opcode!=first) break;
	second=memory.Get(addr+1);
	return new F8OpcodeImmediatePort(addr, instructions+i, second);
      case AddressingModeAbsolute:
	if (instructions[i].opcode!=first) break;
	word=memory.GetWord(addr+1);
	return new F8OpcodeAbsolute(addr, instructions+i, word);
      case AddressingModeRelative:
	if (instructions[i].opcode!=first) break;
	second=memory.Get(addr+1);
	return new F8OpcodeRelative(addr, instructions+i, second);
      case AddressingModeIncluded3Relative:
	if (instructions[i].opcode!=(first&~7)) break;
	second=memory.Get(addr+1);
	return new F8OpcodeIncludedRelative(addr, instructions+i, first&7, second);
      case AddressingModeIncluded4Relative:
	if (instructions[i].opcode!=(first&~0xf)) break;
	second=memory.Get(addr+1);
	return new F8OpcodeIncludedRelative(addr, instructions+i, first&0xf, second);
      }
    }
    return new Databyte(addr, first);
  }

#if 0  
  static int SearchByteregs(const char *name)
  {
    for (size_t i=0; i<LENOF(byteregs); i++) {
      if (strcasecmp(name, byteregs[i].name)==0) return i;
    }
    return ByteregNone;
  }
  
  static int SearchWordegs(const char *name)
  {
    for (size_t i=0; i<LENOF(wordregs); i++) {
      if (strcasecmp(name, wordregs[i].name)==0) return i;
    }
    return WordregNone;
  }
#endif  
  bool ParseScratchPad(int& scratch, Assembler& input)
  {
    Token dest;
    if (input.GetNumber(dest)) {
      if (dest.number.has_sign) {
	input.file->PrintError(dest, "scratchpad: unsigned number expected");
	return false;
      }
      if (dest.number.value_unsigned>0xc ) {
	input.file->PrintError(dest, "scratchpad: unsigned number smaller 12 expected");
	return false;
      }
      scratch=dest.number.value_unsigned;
      return true;
    }
    if (!input.GetOperator(dest)) {
      input.file->PrintError("scratchpad: unsigned number or operator expected");
      return false;
    }
    if ( strncmp("(",dest.name, dest.length)!=0) {
      input.file->PrintError("scratchpad: operator (");
      return false;
    }
    input.GetWhiteSpace();
    if (!input.GetIdentifier(dest)) {
      input.file->PrintError("scratchpad: identifier expected");
      return false;
    }
    if ( strncasecmp(dest.name, byteregs[IS].name, dest.length)!=0 ) {
      input.file->PrintError("scratchpad: register IS expected");
      return false;
    }
    input.GetWhiteSpace();
    if (!input.GetOperator(dest)) {
      input.file->PrintError("scratchpad: operator expected");
      return false;
    }
    if ( strncmp(")",dest.name, dest.length)!=0) {
      input.file->PrintError("scratchpad: operator )");
      return false;
    }
    scratch=12;
    input.GetWhiteSpace();
    Token *peek=input.PeekToken();
    if (peek->type==Token::Operator) {
      if (peek->name.cmp("+")==0 ) {
	input.NextToken();
	scratch=13;
      } else if (peek->name.cmp("-")==0) {
	input.NextToken();
	scratch=14;
      }
    }
    return true;
  }
  
  Opcode *F8::AssembleInstruction(Assembler& input, Scope& scope, unsigned short addr)
  {
    //    Opcode *o;
    Token operation, dest, source, end;
    int scratch;
    if (!input.GetIdentifier(operation)) {
      input.file->PrintError("identifier expected");
      return false;
    }
    for (size_t i=0; i<LENOF(instructions); i++) {
      if (operation.name.casecmp(instructions[i].mnemonic)!=0) continue;
      switch (instructions[i].addressing_mode) {
      case AddressingModeImplicite:
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8Opcode(addr, instructions+i);
      case AddressingModeIncludedImmediate3:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>7 ) {
	  input.file->PrintError(dest, "unsigned number smaller 8 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeIncluded(addr, instructions+i, dest.number.value_unsigned);
      case AddressingModeIncludedImmediate4:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0xf ) {
	  input.file->PrintError(dest, "unsigned number smaller 16 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeIncluded(addr, instructions+i, dest.number.value_unsigned);
      case AddressingModeIncludedScratchpad4:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!ParseScratchPad(scratch, input)) return NULL;
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeScratchPad(addr, instructions+i, scratch);
      case AddressingModeIncludedByteregScratchpad4:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetIdentifier(dest)) {
	  input.file->PrintError("identifier expected");
	  return NULL;
	}
	if (strncasecmp(byteregs[instructions[i].byteregs.dest].name, dest.name, dest.length)!=0 ) {
	  input.file->PrintError(dest, "wrong register");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetOperator(dest)) {
	  input.file->PrintError("operator expected");
	  return NULL;
	}
	if (strncmp(source.name, ",", 1)!=0) {
	  input.file->PrintError(source, "operator , expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!ParseScratchPad(scratch, input)) return NULL;
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeScratchPad(addr, instructions+i, scratch);
      case AddressingModeIncludedScratchpad4Bytereg:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!ParseScratchPad(scratch, input)) return NULL;
	input.GetWhiteSpace();
	if (!input.GetOperator(dest)) {
	  input.file->PrintError("operator expected");
	  return NULL;
	}
	if (strncmp(source.name, ",", 1)!=0) {
	  input.file->PrintError(source, "operator , expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetIdentifier(source)) {
	  input.file->PrintError("identifier expected");
	  return NULL;
	}
	if (strncasecmp(byteregs[instructions[i].byteregs.source].name, source.name, source.length)!=0 ) {
	  input.file->PrintError(source, "wrong register");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeScratchPad(addr, instructions+i, scratch);
      case AddressingModeConstant:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	for (; i<LENOF(instructions); i++) {
	  if (strncasecmp(instructions[i].mnemonic,operation.name,operation.length)==0 && dest.number.value_unsigned==instructions[i].constant ) {
	    return new F8Opcode(addr, instructions+i);
	  }
	}
	input.file->PrintError(operation, "mnemonic does not support this constant");
	return NULL;
      case AddressingModeByteregBytereg: // several commands with same name, and 3 addressing modes
      case AddressingModeWordregWordreg:
	{
	  bool left_scratch=false, right_scratch=false;
	  if (!input.GetWhiteSpace()) {
	    input.file->PrintError("white space expected");
	    return NULL;
	  }
	  if (!input.GetIdentifier(dest)) {
	    if (strcmp(instructions[i].mnemonic,"LR")!=0) {
	      input.file->PrintError("identifier expected");
	      return NULL;
	    }
	    if (!ParseScratchPad(scratch, input)) return NULL;
	    left_scratch=true;
	  }
	  input.GetWhiteSpace();
	  if (!input.GetOperator(source)) {
	    input.file->PrintError("operator expected");
	    return NULL;
	  }
	  if (strncmp(source.name, ",", 1)!=0) {
	    input.file->PrintError(source, "operator , expected");
	    return NULL;
	  }
	  input.GetWhiteSpace();
	  if (!input.GetIdentifier(source)) {
	    if (left_scratch || strcmp(instructions[i].mnemonic,"LR")!=0 ) {
	      input.file->PrintError("identifier expected");
	      return NULL;
	    }
	    if (!ParseScratchPad(scratch, input)) return NULL;
	    right_scratch=true;
	  }
	  if (!input.GetEndOfLine()) {
	    input.file->PrintError("end of line expected");
	    return NULL;
	  }
	  for (; i<LENOF(instructions); i++) {
	    if (operation.name.casecmp(instructions[i].mnemonic)==0) {
	      if (instructions[i].addressing_mode==AddressingModeWordregWordreg
		  && strncasecmp(dest.name, wordregs[instructions[i].wordregs.dest].name,dest.length)==0
		  && strncasecmp(source.name, wordregs[instructions[i].wordregs.source].name, source.length)==0)
		return new F8Opcode(addr, instructions+i);
	      if (instructions[i].addressing_mode==AddressingModeByteregBytereg
		  && strncasecmp(dest.name, byteregs[instructions[i].byteregs.dest].name,dest.length)==0
		&& strncasecmp(source.name, byteregs[instructions[i].byteregs.source].name, source.length)==0)
		return new F8Opcode(addr, instructions+i);
	      if (instructions[i].addressing_mode==AddressingModeIncludedScratchpad4Bytereg && left_scratch
		  && strncasecmp(source.name, byteregs[instructions[i].byteregs.source].name, source.length)==0)
		return new F8OpcodeScratchPad(addr, instructions+i, scratch);	  
	      if (instructions[i].addressing_mode==AddressingModeIncludedByteregScratchpad4 && right_scratch
		  && strncasecmp(dest.name, byteregs[instructions[i].byteregs.dest].name, dest.length)==0)
		return new F8OpcodeScratchPad(addr, instructions+i, scratch);	  
	    }
	    
	  }	
	  input.file->PrintError(operation, "mnemonic does not support these registers");
	  return NULL;
	}
#if 0
      case AddressingModeWordregWordreg:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetIdentifier(dest)) {
	  input.file->PrintError("identifier expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetOperator(source)) {
	  input.file->PrintError("operator expected");
	  return NULL;
	}
	if (strncmp(source.name, ",", 1)!=0) {
	  input.file->PrintError(source, "operator , expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetIdentifier(source)) {
	  input.file->PrintError("identifier expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	for (; i<LENOF(instructions); i++) {
	  if (operation.name.casecmp(instructions[i].mnemonic)==0) {
	    if (instructions[i].addressing_mode==AddressingModeWordregWordreg
		&& strncasecmp(dest.name, wordregs[instructions[i].wordregs.dest].name,dest.length)==0
		&& strncasecmp(source.name, wordregs[instructions[i].wordregs.source].name, source.length)==0)
	      return new F8Opcode(addr, instructions+i);
	    if (instructions[i].addressing_mode==AddressingModeByteregBytereg
		&& strncasecmp(dest.name, byteregs[instructions[i].byteregs.dest].name,dest.length)==0
		&& strncasecmp(source.name, byteregs[instructions[i].byteregs.source].name, source.length)==0)
	      return new F8Opcode(addr, instructions+i);
	  }
	}
	input.file->PrintError(operation, "mnemonic does not support these wordregister");
	return NULL;
#endif
      case AddressingModeImmediate:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0xff) {
	  input.file->PrintError(dest, "unsigned number smaller 256 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeImmediate(addr, instructions+i, dest.number.value_unsigned);
      case AddressingModeImmediateWord:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  if (!input.GetIdentifier(source)) {
	    input.file->PrintError("unsigned number or identifier expected");
	    return NULL;
	  }
	  Symbol *s=scope.Get(source.name);
	  if (s!=0) {
	    if ( typeid(*s) != typeid(SymbolAddress) ) {
	      input.file->PrintError(source, "Symbol "+source.name+" not of type address");
	      return NULL;
	    }
	  }
	  if (!input.GetEndOfLine()) {
	    input.file->PrintError("end of line expected");
	    return NULL;
	  }
	  return new F8OpcodeImmediateWordAss(input, addr, instructions+i, source.line, source.column, source.name);
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0xffff) {
	  input.file->PrintError(dest, "unsigned number smaller 65536 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeImmediateWord(addr, instructions+i, dest.number.value_unsigned);
      case AddressingModePort:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0xff) {
	  input.file->PrintError(dest, "unsigned number smaller 256 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeImmediatePort(addr, instructions+i, dest.number.value_unsigned);
      case AddressingModeAbsolute:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  if (!input.GetIdentifier(source)) {
	    input.file->PrintError("unsigned number or identifier expected");
	    return NULL;
	  }
	  Symbol *s=scope.Get(source.name);
	  if (s!=0) {
	    if ( typeid(*s) != typeid(SymbolAddress) ) {
	      input.file->PrintError(source, "Symbol "+source.name+" not of type address");
	      return NULL;
	    }
	    //	    SymbolAddress *sa=dynamic_cast<SymbolAddress*>(s);
	  }
	  if (!input.GetEndOfLine()) {
	    input.file->PrintError("end of line expected");
	    return NULL;
	  }
	  return new F8OpcodeAbsoluteAss(input, addr, instructions+i, source.line, source.column, source.name);
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0xffff) {
	  input.file->PrintError(dest, "unsigned number smaller 65536 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeAbsolute(addr, instructions+i, dest.number.value_unsigned);
      case AddressingModeRelative:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  if (!input.GetIdentifier(source)) {
	    input.file->PrintError("number or identifier expected");
	    return NULL;
	  }
	  Symbol *s=scope.Get(source.name);
	  if (s!=0) {
	    if ( typeid(*s) != typeid(SymbolAddress) ) {
	      input.file->PrintError(source, "Symbol "+source.name+" not of type address");
	      return NULL;
	    }
	    SymbolAddress *sa=dynamic_cast<SymbolAddress*>(s);
	    if (sa->address+127<addr || sa->address-128>addr) {
	      input.file->PrintError("label not within relativ distance");
	      return NULL;
	    }
	  }
	  if (!input.GetEndOfLine()) {
	    input.file->PrintError("end of line expected");
	    return NULL;
	  }
	  return new F8OpcodeRelativeAss(input, addr, instructions+i, source.line, source.column, source.name);
	}
	if (dest.number.value_signed<-128 || dest.number.value_signed>127 ) {
	  input.file->PrintError(dest, "number between pc-127 and pc+128 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeRelative(addr, instructions+i, dest.number.value_signed);
      case AddressingModeIncluded3Relative:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0x7 ) {
	  input.file->PrintError(source, "unsigned number smaller 8 expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetOperator(source)) {
	  input.file->PrintError("operator expected");
	  return NULL;
	}
	if (strncmp(source.name, ",", 1)!=0) {
	  input.file->PrintError(source, "operator , expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetNumber(source)) {
	  if (!input.GetIdentifier(source)) {
	    input.file->PrintError("number or identifier expected");
	    return NULL;
	  }
	  Symbol *s=scope.Get(source.name);
	  if (s!=0) {
	    if ( typeid(*s) != typeid(SymbolAddress) ) {
	      input.file->PrintError(source, "Symbol "+source.name+" not of type address");
	      return NULL;
	    }
	    SymbolAddress *sa=dynamic_cast<SymbolAddress*>(s);
	    if (sa->address+127<addr || sa->address-128>addr) {
	      input.file->PrintError("label not within relativ distance");
	      return NULL;
	    }
	  }
	  if (!input.GetEndOfLine()) {
	    input.file->PrintError("end of line expected");
	    return NULL;
	  }
	  return new F8OpcodeIncludedRelativeAss(input, addr, instructions+i, source.line, source.column, dest.number.value_unsigned, source.name);
	}
	if (source.number.value_signed<-128 || source.number.value_signed>127 ) {
	  input.file->PrintError(source, "number between pc-127 and pc+128 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeIncludedRelative(addr, instructions+i, dest.number.value_unsigned, source.number.value_signed);
      case AddressingModeIncluded4Relative:
	if (!input.GetWhiteSpace()) {
	  input.file->PrintError("white space expected");
	  return NULL;
	}
	if (!input.GetNumber(dest)) {
	  input.file->PrintError("unsigned number expected");
	  return NULL;
	}
	if (dest.number.has_sign) {
	  input.file->PrintError(dest, "unsigned number expected");
	  return NULL;
	}
	if (dest.number.value_unsigned>0xf ) {
	  input.file->PrintError(source, "unsigned number smaller 16 expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetOperator(source)) {
	  input.file->PrintError("operator expected");
	  return NULL;
	}
	if (strncmp(source.name, ",", 1)!=0) {
	  input.file->PrintError(source, "operator , expected");
	  return NULL;
	}
	input.GetWhiteSpace();
	if (!input.GetNumber(source)) {
	  if (!input.GetIdentifier(source)) {
	    input.file->PrintError("number or identifier expected");
	    return NULL;
	  }
	  Symbol *s=scope.Get(source.name);
	  if (s!=0) {
	    if ( typeid(*s) != typeid(SymbolAddress) ) {
	      input.file->PrintError(source, "Symbol "+source.name+" not of type address");
	      return NULL;
	    }
	    SymbolAddress *sa=dynamic_cast<SymbolAddress*>(s);
	    if (sa->address+127<addr || sa->address-128>addr) {
	      input.file->PrintError("label not within relativ distance");
	      return NULL;
	    }
	  }
	  if (!input.GetEndOfLine()) {
	    input.file->PrintError("end of line expected");
	    return NULL;
	  }
	  return new F8OpcodeIncludedRelativeAss(input, addr, instructions+i, source.line, source.column, dest.number.value_unsigned, source.name);
	}
	if (source.number.value_signed<-128 || source.number.value_signed>+127 ) {
	  input.file->PrintError(source, "number between pc-127 and pc+128 expected");
	  return NULL;
	}
	if (!input.GetEndOfLine()) {
	  input.file->PrintError("end of line expected");
	  return NULL;
	}
	return new F8OpcodeIncludedRelative(addr, instructions+i, dest.number.value_unsigned, source.number.value_signed);
      }
    }
    input.file->PrintError(operation, "mnemonic expected");
    return NULL;
  }
}
