#ifndef PET_STRING_HH
#define PET_STRING_HH

#include <cstdlib>

namespace PeT {
  class String {
    friend bool operator ==(const String& left, const String& right);
    friend bool operator !=(const String& left, const String& right);
    friend String operator +(const String& left, const String& right);
    //    friend String operator +(const char *left, const char *right);
    char *buffer;
    int length;
    int allocated;
  public:
    static String Hex(unsigned number);
    static String Decimal(unsigned number);
    String(const char *string=NULL);
    String(const char *string, int len);
    String(const String& string);
    ~String();
    
    int cmp(const String& right) const;
    int casecmp(const String& right) const;
    int ncmp(const String& right, int len) const;
    int ncasecmp(const String& right, int len) const;
    String& left(int signs, char filler=' ');
    String& right(int signs, char filler=' ');
    
    operator const char *() const;
    //    operator char *();
    String& operator =(const String& right);
    String& operator +=(const String& right);
    bool operator !() const; //empty
  };
  
  bool operator ==(const String& left, const String& right);
  bool operator !=(const String& left, const String& right);
  String operator +(const String& left, const String& right);
  //  String operator +(const char *left, const char *right);
}

#endif
