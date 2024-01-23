#ifndef PET_ARRAY_HH
#define PET_ARRAY_HH

#include <cstdlib>

namespace PeT {
  template <class Type>
  class Array {
    static const int OVERALLOC=5;
    Type *array;
    unsigned allocated, used;
  public:
    Array(unsigned len=0) {
      allocated=len+OVERALLOC;
      array=new Type[allocated];
      used=0;
    }
    ~Array() {
      delete[] array;
      array=0;
    }
    Array(const Array& right) {
      allocated=right.allocated;
      array=new Type[allocated];
      used=right.used;
      for (unsigned i=0; i<used; i++) {
	array[i]=right.array[i];
      }
    }
    Array& operator =(const Array& right) {
      if (right.used>=allocated) {
	allocated=right.used+5;
	delete[] buffer;
	buffer=new Type[allocated];	
      }
      for (int i=0; i<right.used; i++)
	buffer[i]=right.buffer[i];
      used=right.used;
      return *this;
    }
    // copy constructor, operator missing
    void Add(const Type& type) {
      if (used+1>=allocated) {
	Type *old_array=array;
	allocated=used+1+OVERALLOC;
	array=new Type[allocated];
	for (unsigned i=0; i<used; i++) array[i]=old_array[i];
	delete[] old_array;
      }
      array[used++]=type;
    }
    void Add(const Type *types, size_t len) {
      if (used+len>=allocated) {
	Type *old_array=array;
	allocated=used+len+OVERALLOC;
	array=new Type[allocated];
	for (unsigned i=0; i<used; i++) array[i]=old_array[i];
	delete[] old_array;
      }
      for (size_t i=0; i<len; i++)
	array[used++]=types[i];
    }
    Type *base() { return array; }
    const Type& operator [](unsigned index) const {
      if (index>=used) throw "index";
      return array[index];
    }
    unsigned length() const { return used; }
  };
}

#endif
