#include "scope.hh"
#include "types.h"
#include <typeinfo>

namespace PeT {
  Symbols::Symbols() {}
  void Symbols::Add(Symbol *symbol) {
    symbols.Add(symbol);
  }
  Symbol* Symbols::Get(const char *name) const {
    for (unsigned i=0; i<symbols.length(); i++) {
      if (symbols[i]->name.casecmp(name)==0) return symbols[i];
    }
    return NULL;
  }
  SymbolAddress * Symbols::GetAddress(unsigned short addr) const 
  {
    for (unsigned i=0; i<symbols.length(); i++) {
      Symbol *s=symbols[i];
      if (typeid(*s)==typeid(SymbolAddress)) {
	SymbolAddress *sa=dynamic_cast<SymbolAddress*>(s);
	if (sa->address==addr) return sa;
      }
    }
    return NULL;
  }

  Scope::Scope()
  {
    const char *s[]={
      "org", "equ", "con", 
      "db", "dw", "dl", "dq",
      "A", "IS", "W",
      "J", "QU", "QL", "KU", "KL",
      "P", "P0", "PC0", "PC1", "H", "Q", "K", "DC", "DC0", "DC1",
      "MOD", "DIV", "SHL", "SHR", "ROL", "ROR",
      "LR", "PK", "SR", "SL", "LM", "ST", "COM", "LNK", "EI", "DI",
      "POP", "INC", "LI", "NI", "OI", "XI", "AI", "CI",
      "IN", "OUT", "PI", "JMP", "DCI", "NOP", "XDC", "DC", 
      "LISU", "LISL", "LIS", "BT", "AM", 
      "AMD", "NM", "OM", "XM", "CM", "ADC",
      "BR7", "BF", "INS", "OUTS", "AS", "ASD", "XS", "NS"
    };
    for (unsigned i=0; i<LENOF(s); i++) 
      global.Add(new Symbol(s[i]) );
  }
  Symbol *Scope::Get(const char *name) const { return global.Get(name); }
  void Scope::Add(Symbol *symbol) { global.Add(symbol); }
  SymbolAddress *Scope::GetAddress(unsigned short addr) const { return global.GetAddress(addr); }

}
