#include "memory.hh"

namespace PeT {
  Memory::~Memory() {}
  
  MemoryBigEndian::~MemoryBigEndian() {}
  unsigned char MemoryBigEndian::Get(unsigned short address)
  {
    return memory[address];
  }
  unsigned short MemoryBigEndian::GetWord(unsigned short address) { return Get(address)<<8|Get(address+1); }
  
  void MemoryBigEndian::Set(unsigned short address, unsigned char value)
  {
    memory[address]=value;
  }
  void MemoryBigEndian::SetWord(unsigned short address, unsigned short value) { Set(address, value>>8);Set(address+1, value); }
}
