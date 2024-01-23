#ifndef PET_SCOPE_HH
#define PET_SCOPE_HH

#include "string.hh"
#include "array.hh"

namespace PeT {
  class String;

  class Symbol {
  public:
    String name;
    Symbol(const char *name_):name(name_) {}
    virtual ~Symbol() {}
  };
  class SymbolAddress: public Symbol {
  public:
    unsigned short address;
    SymbolAddress(const char *name_, unsigned short address_):Symbol(name_), address(address_) {}
  };
  class SymbolPort: public Symbol {
    unsigned char port;
    SymbolPort(const char *name_, unsigned char port_):Symbol(name_), port(port_) {}
  };
  class SymbolByte: public Symbol {
    unsigned char byte;
    SymbolByte(const char *name_, unsigned char byte_):Symbol(name_), byte(byte_) {}
  };

  class Symbols {
    Array<Symbol*> symbols;
  public:
    Symbols();
    void Add(Symbol *symbol);
    Symbol* Get(const char *name) const;
    SymbolAddress* GetAddress(unsigned short address) const;
  };

  class Scope {
    Symbols global;
  public:
    Scope();
    Symbol *Get(const char *name) const;
    void Add(Symbol *symbol);
    SymbolAddress *GetAddress(unsigned short addr) const;
    // context switching, ...
  };
}
#endif
