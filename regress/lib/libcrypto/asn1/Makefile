#	$OpenBSD: Makefile,v 1.7 2021/11/30 07:34:29 jsing Exp $

TESTS = \
	asn1evp \
	asn1string_copy \
	asn1time \
	asn1x509 \
	rfc5280time

PROGS = ${TESTS}

REGRESS_TARGETS= all_tests

LDADD=		-lcrypto
DPADD=		${LIBCRYPTO} ${LIBSSL}
WARNINGS=	Yes
LDFLAGS+=	-lcrypto
CFLAGS+=	-DLIBRESSL_INTERNAL -Wall -Wundef -Werror

all_tests: ${TESTS}
	@for test in $>; do \
		./$$test; \
	done

.include <bsd.regress.mk>
