#include "string.hh"
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include "types.h"

#define OVERALLOC 5

namespace PeT {
  bool operator ==(const String& left, const String& right)
  {
    return left.cmp(right)==0;
  }
  
  bool operator !=(const String& left, const String& right)
  {
    return left.cmp(right)!=0;
  }
  
  String operator +(const String& left, const String& right)
  {
    String n=String(NULL, left.length+right.length);
    strcpy(n.buffer, left.buffer);
    strcpy(n.buffer+left.length, right.buffer);
    return n;
  }
#if 0
  String operator +(const char *left, const char *right)
  {
    int l=strlen(left), r=strlen(right);
    String n=String(NULL, l+r);
    strcpy(n.buffer, left);
    strcpy(n.buffer+l, right);
    return n;
  }
#endif  
  String String::Hex(unsigned number)
  {
    String test=String(NULL, 9);
    sprintf(test.buffer, "%x%n", number, &test.length);
    return test;
  }
  String String::Decimal(unsigned number)
  {
    String test=String(NULL, 11);
    sprintf(test.buffer, "%d%n", number, &test.length);
    return test;
  }

  String::String(const char *string)
    {
      //      printf("%p string(const char* %p:%s)\n", this, string, string);
      if (string==NULL) {
	length=0;
	allocated=length+1+OVERALLOC;
	
	buffer=new char[allocated];
	buffer[0]=0;
      } else {
	length=strlen(string);
	allocated=length+1+OVERALLOC;
	
	buffer=new char[allocated];
	strcpy(buffer, string);
      }
    }
  
  String::String(const char *string, int len)
    {
      //      printf("%p string(const char* %p:%s, int %d)\n", this, string, string, len);
      length=len;
      allocated=length+1+OVERALLOC;
      
      buffer=new char[allocated];
      
      if (string==NULL) {
	buffer[0]=0;
      } else {
	strncpy(buffer, string, len);
	buffer[len]=0;
      }
    }
  
  String::String(const String& string)
    {
      //      printf("%p string(String& %p:%s)\n", this, (const char*)string, (const char*)string);
      allocated=string.allocated;
      length=string.length;
      buffer=new char[allocated];
      strcpy(buffer, string);
    }
  
  String::~String()
    {
      //      printf("%p ~string()\n", this);
      if (buffer) { delete[] buffer; buffer=NULL; }
    }
  
  int String::cmp(const String& right) const
    {
      return strcmp(buffer, right.buffer);
    }
  int String::casecmp(const String& right) const
    {
      return strcasecmp(buffer, right.buffer);
    }
  int String::ncmp(const String& right, int len) const
    {
      return strncmp(buffer, right.buffer, len);
    }
  
  int String::ncasecmp(const String& right, int len) const
    {
      return strncasecmp(buffer, right.buffer, len);
    }
  
  String& String::left(int signs, char filler)
  {
    if (signs<=length) return *this;
    if (signs+1>allocated) {
      char *old_buffer=buffer;
      buffer=new char[signs+1+OVERALLOC];
      strcpy(buffer, old_buffer);
      delete[] old_buffer;
    }
    memset(buffer+length, filler, signs-length);
    length=signs;
    buffer[signs]=0;
    return *this;
  }
  String& String::right(int signs, char filler)
  {
    if (signs<=length) return *this;
    if (signs+1>allocated) {
      char *old_buffer=buffer;
      buffer=new char[signs+1+OVERALLOC];
      strcpy(buffer+signs-length, old_buffer);
      delete[] old_buffer;
    } else {
      memmove(buffer+signs-length, buffer, length+1);
      buffer[signs]=0;
    }
    memset(buffer, filler, signs-length);
    length=signs;
    return *this;
  }
  
  String::operator const char *() const
    {
      return buffer;
    }
#if 0  
  String::operator char *()
    {
      return buffer;
    }
#endif  
  bool String::operator !() const
  {
    return length==0;
  }

  String& String::operator =(const String& right)
    {
      //      printf("%p operator=(string& %p:%s)\n", this, (const char*)right, (const char*)right);
      if (right.length+1>=allocated) {
	allocated=right.length+1+OVERALLOC;
	delete[] buffer;
	buffer=new char[allocated];
      }
      strcpy(buffer, right.buffer);
      length=right.length;
      return *this;
    }
  
  String& String::operator +=(const String& right)
    {
      if (length+right.length+1>=allocated) {
	allocated=length+right.length+1+OVERALLOC;
	char *new_buffer=new char[allocated];
	strcpy(new_buffer, buffer);
	delete[] buffer;
	buffer=new_buffer;
      }
      strcpy(buffer+length, right.buffer);
      length+=right.length;
      return *this;
    }
}
