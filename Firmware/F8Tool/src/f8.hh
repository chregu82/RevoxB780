#ifndef PET_F8_HH
#define PET_F8_HH

#include "array.hh"
#include "instruction.hh"

namespace PeT {
  class Memory;
  class Assembler;
  class Scope;
  class String;
  
  class F8 {
  public:
    Segment segment;
    static Opcode *DisassembleInstruction(Scope& scope, Memory& memory, unsigned short addr);
    static Opcode *AssembleInstruction(Assembler& input, Scope &scope, unsigned short addr);
  };
}

#endif
