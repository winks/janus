MYSELF='ExpressionParser.jison'
MYJS='ExpressionParser.js'
MYPHP='ExpressionParser.php'
JISONBIN='./node_modules/.bin/jison'
JISONPHP='../jison/ports/php/jison.js'
PHPBIN='php'
NODEBIN='node'
PTEST='test.php'

all: js php

clean:
	rm ${MYJS}
	rm ${MYPHP}

js:
	${JISONBIN} ${MYSELF} -o ${MYJS}

php:
	${NODEBIN} ${JISONPHP} ${MYSELF}
	sed -i -e "s/return 'INVALID'/return 'INVALID';/" ${MYPHP}

test: tbase tstrings tstringd top tvar

ptest: ptbase ptstrings ptstringd ptop ptvar

tstrings: TDIR = examples/strings
tstrings:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${NODEBIN} ${MYJS} ${TDIR}/$${f}; \
	done

tstringd: TDIR = examples/stringd
tstringd:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${NODEBIN} ${MYJS} ${TDIR}/$${f}; \
	done

tbase: TDIR = examples/base
tbase:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${NODEBIN} ${MYJS} ${TDIR}/$${f}; \
	done

top: TDIR = examples/op
top:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${NODEBIN} ${MYJS} ${TDIR}/$${f}; \
	done

tvar: TDIR = examples/var
tvar:
	for f in `ls $(TDIR)`; do \
		echo -e "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${NODEBIN} ${MYJS} ${TDIR}/$${f}; \
	done

ptstrings: TDIR = examples/strings
ptstrings:
	for f in `ls $(TDIR)`; do \
		echo "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${PHPBIN} ${PTEST} ${TDIR}/$${f}; \
	done

ptstringd: TDIR = examples/stringd
ptstringd:
	for f in `ls $(TDIR)`; do \
		echo "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${PHPBIN} ${PTEST} ${TDIR}/$${f}; \
	done

ptbase: TDIR = examples/base
ptbase:
	for f in `ls $(TDIR)`; do \
		echo "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${PHPBIN} ${PTEST} ${TDIR}/$${f}; \
	done

ptop: TDIR = examples/op
ptop:
	for f in `ls $(TDIR)`; do \
		echo "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${PHPBIN} ${PTEST} ${TDIR}/$${f}; \
	done

ptvar: TDIR = examples/var
ptvar:
	for f in `ls $(TDIR)`; do \
		echo "========== $${f} =========="; \
		echo -n ":INPUT :"; \
		cat ${TDIR}/$${f}; \
		${PHPBIN} ${PTEST} ${TDIR}/$${f}; \
	done
