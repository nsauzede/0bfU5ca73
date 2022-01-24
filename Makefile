TARGET:=
TARGET+=fib
TARGET+=qu1n3

CFLAGS:=-Wno-implicit-int -Wno-implicit-function-declaration -Wno-builtin-declaration-mismatch

all: $(TARGET)
	./fib 1 1 1 1 ; echo $$?
	echo `cat qu1n3.c` && ./qu1n3 && echo ""

fib:CFLAGS+=-D__=return -D____=printf -D___=main
qu1n3:CFLAGS+=-D____=printf -D___=char -D_____=main

clean:
	$(RM) $(TARGET)
