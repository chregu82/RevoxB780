#ifndef PET_MEMORY_HH
#define PET_MEMORY_HH

namespace PeT {
  class Memory {
  public:
    virtual ~Memory();
    virtual unsigned char Get(unsigned short address)=0;
    virtual unsigned short GetWord(unsigned short address)=0;
    
    virtual void Set(unsigned short address, unsigned char value)=0;
    virtual void SetWord(unsigned short address, unsigned short value)=0;
  };
  
  class MemoryBigEndian: public Memory {
  public:
    unsigned char memory[0x10000];
    virtual ~MemoryBigEndian();
    virtual unsigned char Get(unsigned short address);
    virtual unsigned short GetWord(unsigned short address);
    
    virtual void Set(unsigned short address, unsigned char value);
    virtual void SetWord(unsigned short address, unsigned short value);
  };
}

#endif
