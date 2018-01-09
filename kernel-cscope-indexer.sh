#!/bin/sh

find . \( -type f -o -type l \) | \
	egrep -i '\.([chlySs](xx|pp)*|cc|hh)$' | \
	sed -e '/\/CVS\//d' -e '/\/RCS\//d' -e 's/^\.\///' | \
	sed -e '/^arch\/alpha/d' \
	-e '/^arch\/arm/d' \
	-e '/^arch\/avr32/d' \
	-e '/^arch\/blackfin/d' \
	-e '/^arch\/cris/d' \
	-e '/^arch\/frv/d' \
	-e '/^arch\/h8300/d' \
	-e '/^arch\/ia64/d' \
	-e '/^arch\/m32r/d' \
	-e '/^arch\/m68k/d' \
	-e '/^arch\/microblaze/d' \
	-e '/^arch\/mips/d' \
	-e '/^arch\/mn10300/d' \
	-e '/^arch\/openrisc/d' \
	-e '/^arch\/parisc/d' \
	-e '/^arch\/powerpc/d' \
	-e '/^arch\/s390/d' \
	-e '/^arch\/score/d' \
	-e '/^arch\/sh/d' \
	-e '/^arch\/sparc/d' \
	-e '/^arch\/tile/d' \
	-e '/^arch\/um/d' \
	-e '/^arch\/unicore32/d' \
	-e '/^arch\/xtensa/d' | \
	sort > cscope.files

cscope -i cscope.files -f cscope.out -b -k -q
