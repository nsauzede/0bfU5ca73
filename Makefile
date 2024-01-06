TARGET:=
TARGET+=f1b
TARGET+=qu1n3
TARGET+=tr1g
TARGET+=d1g
TARGET+=quine
TARGET+=quine2c
#TARGET+=quine3c

CFLAGS:=-Wno-implicit-int -Wno-implicit-function-declaration -Wno-builtin-declaration-mismatch

all: $(TARGET)
	./f1b 1 1 1 1 ; echo $$?
	echo `cat qu1n3.c` && ./qu1n3 && echo ""
	./tr1g
	echo `cat quine.c` && ./quine && echo ""
	echo `cat quine.py` && python quine.py && echo ""
	@echo "QUINE2"
	echo `cat quine2c.c` && ./quine2c | tee quine2py.py && echo ""
	@echo `python quine2py.py`
#	@echo "QUINE3"
#	echo `cat quine3c.c` && ./quine3c | tee quine3pl.pl && echo ""
#	@echo `perl quine3pl.pl` | tee quine3py.py && echo ""
#	@echo `python quine3py.py`

check:
	@echo `cat quine3c.c` ; gcc -Wno-builtin-declaration-mismatch -Wno-implicit-int -Wno-implicit-function-declaration quine3c.c&&./a.out|tee quine3py0.py && echo "" && echo `python quine3py0.py`
	@echo `cat quine3py.py` ; python quine3py.py | tee quine3c0.c && gcc -Wno-builtin-declaration-mismatch -Wno-implicit-int -Wno-implicit-function-declaration quine3c0.c && ./a.out && echo "" ; 

f1b:CFLAGS+=-D__=return -D____=printf -D___=main
qu1n3:CFLAGS+=-D____=printf -D___=char -D_____=main
tr1g:CFLAGS+=-trigraphs

clean:
	$(RM) $(TARGET) quine2py.py quine3pl.pl quine3py.py quine3c0.c quine3py0.py
