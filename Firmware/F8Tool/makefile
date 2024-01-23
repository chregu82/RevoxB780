OBJDIR= ./obj
SRCDIR= ./src
#INCDIR= ./inc

CXX = /opt/gcc-3.3.2/bin/g++-3.3.2
#CPPFLAGS = -Wall -ggdb -I $(INCDIR)
CPPFLAGS = -Wall -ggdb

$(OBJDIR)/%.o: $(SRCDIR)/%.cc
	$(CXX) $(CPPFLAGS) -c -o $@ $<

OBJECTS = \
	$(OBJDIR)/string.o $(OBJDIR)/array.o \
	$(OBJDIR)/memory.o $(OBJDIR)/token.o $(OBJDIR)/instruction.o $(OBJDIR)/scope.o \
	$(OBJDIR)/assembler.o $(OBJDIR)/disassembler.o \
	$(OBJDIR)/f8.o \
	$(OBJDIR)/main.o

f8tool: $(OBJECTS)
	$(CXX) $(CPPFLAGS) -o $@ $^

clean:
	rm $(OBJDIR)/* f8tool
