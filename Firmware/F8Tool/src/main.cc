#include "assembler.hh"
#include "disassembler.hh"
#include "memory.hh"
#include "scope.hh"
#include "f8.hh"
#include <stdlib.h>
#include <string.h>
#include <typeinfo>

namespace PeT { // debugger gdb6.1 has problems with objects in different namespaces

void Dis(int argc, char *argv[])
{
  PeT::MemoryBigEndian memory;
  unsigned char *buffer;
  size_t size;
  int addr=0;

  if (argc>0) {
    FILE *file;
    file=fopen(argv[0], "rb");
    if (file==NULL) throw "FILEOPEN";
    fseek(file, 0, SEEK_END);
    size=ftell(file);
    fseek(file, 0, SEEK_SET);
    buffer= new unsigned char[size];
    fread(buffer, 1, size, file);
    fclose(file);
    argc--;
    argv++;
  }
  if (argc>0) {
    sscanf(argv[0], "%i", &addr);
    argc--;
    argv++;
  }
  memcpy(memory.memory+addr, buffer, size);

  PeT::F8 f8;
  PeT::Scope scope;
  scope.Add(new PeT::SymbolAddress("Reset", 0) );
  scope.Add(new PeT::SymbolAddress("CartridgeStart", 0x800));
  scope.Add(new PeT::SymbolAddress("CartridgeEntry", 0x802));
  for (unsigned a=addr;;) { // dissassemble
    PeT::Opcode *o=f8.DisassembleInstruction(scope, memory, a);
    f8.segment.Add(o);
    a+=o->GetSize();
    if (a>=addr+size) break;
  }
  //
  for (unsigned i=0; i<f8.segment.length(); i++) {
    unsigned short a;
    PeT::Opcode *o=f8.segment[i];
    if (o->ReferencesAddress(a)) {

      if (scope.GetAddress(a)==NULL && f8.segment.SearchAddress(a)) {
	scope.Add(new SymbolAddress("A"+PeT::String::Hex(a).right(4,'0'), a));
      }
    }
  }
  if (addr!=0) { printf("Reset: equ $0000\n\n"); }
  if (addr!=0x800) { 
    printf("CartridgeStart: equ $0800\n"
	   "CartridgeEntry: equ $0802\n\n");
  }
  if (addr!=0) {
    printf("org $%04x\n\n",addr);
  }
  f8.segment.Print(scope, memory);
}

void Ass(int argc, char *argv[])
{
  PeT::F8 f8;
  PeT::Assembler ass;
  PeT::MemoryBigEndian memory;
  PeT::Scope scope;

  if (argc>0) {
    ass.Assemble(f8, scope, argv[0], PeT::F8::AssembleInstruction);
    argc--;
    argv++;
  }

#if 0
  for (unsigned i=0; i<f8.segment.length(); i++) {
    PeT::String string;
    SymbolAddress *p;
    PeT::Opcode *o=f8.segment[i];
    o->Text(scope, string);
    p=scope.GetAddress(o->GetAddress());
    if (p) { PeT::String p1=p->name+":";printf("%-15s", (const char*)p1); }
    else printf("%15s", "");
    if (o->IsValid()) {
      printf(" %-25s", (const char *)string);
      //      printf("; %.04x", o->GetAddress() );
      //      for (j=0; j<o->GetSize(); j++) printf(" %.02x", memory.memory[o->GetAddress()+j]);
      //      for (;j<3; j++) printf("   ");
      printf("\n");
    } else {
      printf(" %-25s\n", (const char*)string);
    }
  }
#endif

  unsigned addr, end;
  for (unsigned i=0; i<f8.segment.length(); i++) {
    PeT::Opcode *o=f8.segment[i];
    if (i==0) addr=o->GetAddress();
    o->Bin(scope, memory);
    end=o->GetAddress()+o->GetSize();
  }
  unsigned size=end-addr;
  if (argc>0) {
    FILE *file;
    file=fopen(argv[0], "wb");
    if (file==NULL) throw "FILEOPEN";
    fwrite(memory.memory+addr, 1, size, file);
    fclose(file);
    argc--;
    argv++;
  }
}

}
int main(int argc, char *argv[])
{
  try {
    char *p=strrchr(argv[0],'/');
    if (p==NULL) p=argv[0];
    if ( strcasecmp(p+1, "f8dis")==0) {
      PeT::Dis(argc-1, argv+1);
    } else if ( strcasecmp(p+1, "f8asm")==0) {
      PeT::Ass(argc-1, argv+1);
    } else if (argc>1 && strcasecmp(argv[1], "dis")==0) {
      PeT::Dis(argc-2, argv+2);
    } else if (argc>1 && strcasecmp(argv[1], "asm")==0) {
      PeT::Ass(argc-2, argv+2);
    }
  } catch (...) {
    printf("unexpected\n");
  }

  return 0;
}
