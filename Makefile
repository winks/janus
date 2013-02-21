MYSELF='simple.jison'
MYJS='simple.js'
MYPHP='simple.php'
JISON='./node_modules/.bin/jison'

all: generate php

clean:
	rm ${MYJS}

generate:
	${JISON} ${MYSELF} -o ${MYJS}

php:
	node ../jison/ports/php/jison.js ${MYSELF}
	sed -i -e "s/return 'INVALID'/return 'INVALID';/" ${MYPHP}

test: tbase tstrings tstringd top tvar

tstrings: TDIR = examples/strings
tstrings:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		cat ${TDIR}/$${f}; \
		node ${MYJS} ${TDIR}/$${f}; \
	done

tstringd: TDIR = examples/stringd
tstringd:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		cat ${TDIR}/$${f}; \
		node ${MYJS} ${TDIR}/$${f}; \
	done

tbase: TDIR = examples/base
tbase:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		cat ${TDIR}/$${f}; \
		node ${MYJS} ${TDIR}/$${f}; \
	done

top: TDIR = examples/op
top:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		cat ${TDIR}/$${f}; \
		node ${MYJS} ${TDIR}/$${f}; \
	done

tvar: TDIR = examples/var
tvar:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		cat ${TDIR}/$${f}; \
		node ${MYJS} ${TDIR}/$${f}; \
	done
