PREFIX          = /usr/local
TARGETS         = epgdump
OBJ_TARGETS     = epgdump.o aribstr.o eit.o ts.o util.o sdt.o
HEDDERDEPEND    = eit.h sdt.h aribstr.h ts.h util.h

LANG            = C
CC              = gcc
OPTFLAGS        = -O2
CFLAGS          = -std=c99 -O2 -g -Wall -Werror -Wno-return-type
LDFLAGS         =
LIBS            =

.c.o:
	${CC} ${OPTFLAGS} ${CFLAGS} -c $<

all: ${TARGETS}

${TARGETS}: ${OBJ_TARGETS}
	${CC} ${OPTFLAGS} ${CFLAGS} ${OBJ_TARGETS} -o $@ ${LDFLAGS} ${LIBS}

${OBJ_TARGETS}: ${HEDDERDEPEND}

clean:
	rm -f core ${TARGETS} *.o

install:
	install -m 755 ${TARGETS} ${PREFIX}/bin

.PHONEY: all install clean
