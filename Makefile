MYJS='simple.js'
JISON='./node_modules/.bin/jison'

all: generate

clean:
	rm ${MYJS}

generate:
	${JISON} simple.jison -o ${MYJS}

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
