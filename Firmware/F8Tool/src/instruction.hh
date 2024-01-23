#ifndef PET_INSTRUCTION_HH
#define PET_INSTRUCTION_HH

#include <inttypes.h>
#include <cstdlib>
#include "array.hh"

namespace PeT {

  class String;
  class Memory;
  class Scope;
  //  template<class Type> class Array;

  class Opcode {
  public:
    virtual ~Opcode();
    virtual int GetAddress()=0;
    virtual int GetSize() { return 1; }
    virtual bool IsValid() { return true; }
    virtual void Bin(const Scope& ass, Memory& memory)=0;
    virtual void Text(const Scope& dis, String& string)=0;
    virtual bool ReferencesAddress(unsigned short& ref) { return false; }
    virtual bool ReferencesPort(unsigned char& port) { return false; }
  };

#if 0
  template<class Type>
  class OpcodeData: public Opcode {
    unsigned short address;
    Type data;
  public:
    OpcodeData(unsigned short address_, const Type& data_);
    ~OpcodeData();
    int GetAddress();
    bool IsValid();
    void Bin(const Scope& ass, Memory& memory);
    void Text(const Scope& dis, String& string);
  };
  typedef OpcodeData<uint8_t> Databyte;
  typedef OpcodeData<uint16_t> Dataword;
  typedef OpcodeData<uint32_t> Datalong;
  typedef OpcodeData<uint64_t> Dataquad;
#else
  class Databyte: public Opcode {
    unsigned short address;
    unsigned char data;
  public:
    Databyte(unsigned short address_, unsigned char data_);
    ~Databyte();
    int GetAddress();
    bool IsValid();
    void Bin(const Scope& ass, Memory& memory);
    void Text(const Scope& dis, String& string);
  };
#endif

  class Databytes: public Opcode {
    unsigned short address;
    Array<uint8_t> data;
  public:
    Databytes(unsigned short address_, const uint8_t *data_, size_t len);
    ~Databytes();
    int GetSize();
    int GetAddress();
    bool IsValid();
    void Bin(const Scope& ass, Memory& memory);
    void Text(const Scope& dis, String& string);
  };

  class Segment {
    Array<Opcode*> segment;
  public:
    unsigned short addr;
    bool SearchAddress(unsigned short address) const;
    void Add(Opcode *opcode);
    Opcode* operator [](unsigned index) const;
    unsigned length() const;
    void Print(const Scope& dis, Memory& memory) const;
  };


}
  
#endif
