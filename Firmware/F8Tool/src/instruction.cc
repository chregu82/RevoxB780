#include "instruction.hh"
#include "memory.hh"
#include "string.hh"
#include "scope.hh"
#include <cstdio>

namespace PeT {
  Opcode::~Opcode() {}

#if 0
  template <class Type>
  OpcodeData<Type>::OpcodeData<Type>(unsigned short address_, const Type& data_) { address=address_;data=data_;}
  template <class Type>
  OpcodeData<Type>::~OpcodeData<Type>() {}
  template <class Type>
  int OpcodeData<Type>::GetAddress() { return address; }
  template <class Type>
  bool OpcodeData<Type>::IsValid() { return false; }
  template <class Type>
  void OpcodeData<Type>::Bin(const Scope& ass, Memory& memory) {
    for (i=0; i<sizeof(data); i++) {
      memory.Set(address+sizeof(data)-i, *((uint8_t*)data+i));
    }
  }
  template <class Type>
  void OpcodeData<Type>::Text(const Scope& dis, String& string) { 
    string=String("db").left(5);
    for (i=0; i<sizeof(data); i++) {
      if (i!=0) string+=", ";
      string+=+"$"+String::Hex(data).right(2,'0'); 
    }
  }
#else
  Databyte::Databyte(unsigned short address_, unsigned char data_) { address=address_;data=data_;}
  Databyte::~Databyte() {}
  int Databyte::GetAddress() { return address; }
  bool Databyte::IsValid() { return false; }
  void Databyte::Bin(const Scope& ass, Memory& memory) { memory.Set(address, data); }
  void Databyte::Text(const Scope& dis, String& string) { 
    string=String("db").left(5)+"$"+String::Hex(data).right(2,'0'); 
  }
#endif


  Databytes::Databytes(unsigned short address_, const uint8_t *data_, size_t len):address(address_),data() {
    data.Add(data_, len);
  }
  Databytes::~Databytes() {}
  int Databytes::GetSize() { return data.length(); }
  int Databytes::GetAddress() { return address; }
  bool Databytes::IsValid() { return false; }
  void Databytes::Bin(const Scope& scope, Memory& memory) { 
    for (size_t i=0; i<data.length(); i++) memory.Set(address+i, data[i]); 
  }
  void Databytes::Text(const Scope& dis, String& string) { 
    string=String("db").left(5)+"$"+String::Hex(data[0]).right(2,'0'); 
    for (size_t i=1;i<data.length(); i++) string+=",$"+String::Hex((unsigned)data[i]).right(2,'0');
  }



  bool Segment::SearchAddress(unsigned short address) const {
    for (unsigned i=0; i<segment.length(); i++) {
      if (segment[i]->GetAddress()==address) return true;
    }
    return false;
  }
  void Segment::Add(Opcode *opcode) { segment.Add(opcode); }
  Opcode* Segment::operator [](unsigned index) const { return segment[index]; }
  unsigned Segment::length() const { return segment.length(); }
  void Segment::Print(const Scope& dis, Memory& memory) const
  {
    for (unsigned i=0; i<length(); i++) {
      PeT::String string;
      SymbolAddress *p;
      PeT::Opcode *o=segment[i];
      o->Text(dis, string);
      p=dis.GetAddress(o->GetAddress());
      if (p) { PeT::String p1=p->name+":";printf("%-15s", (const char*)p1); }
      else printf("%15s", "");
      if (o->IsValid()) {
	printf(" %-25s", (const char *)string);
	printf("; %.04x", o->GetAddress() );
	for (int j=0; j<o->GetSize(); j++) printf(" %.02x", memory.Get(o->GetAddress()+j));
	printf("\n");
      } else {
	printf(" %-25s\n", (const char*)string);
      }
    }
  }

}
