TRUNK?=$(PWD)
DB_DIR=$(TRUNK)/db
BB_DIR=$(TRUNK)/bb
EXPLOIT_DIR=$(TRUNK)/exploit
BUSYBOX_TK=$(TRUNK)/toolkit

TK_DIR=$(TRUNK)/tk-installer

export IPADDRESS=192.168.0.10
	
all:tk.tar.gz exploit-code

exploit-code: .exploit-stamp

.exploit-stamp: $(EXPLOIT_DIR) stage2
	cp exploit-src/* $(EXPLOIT_DIR)/
	touch .exploit-stamp

$(EXPLOIT_DIR):
	mkdir -p $(EXPLOIT_DIR)

stage2: $(EXPLOIT_DIR)
	cd src && STAGE2_DROP="/tmp/tk.tar.gz" ./buildmips.sh
	cp src/stage2 $(EXPLOIT_DIR)/

scp dropbear:
	cd $(DB_DIR) && \
	ALT_SHELL=/tmp/tk/bin/sh FAKE_ROOT=1 ./buildmips.sh || exit 1
	cp $(DB_DIR)/scp .
	cp $(DB_DIR)/dropbear .
$(BUSYBOX_TK):
	CFLAGS='-DALT_PROFILE=\"/tmp/tk/profile\"' make -C $(BB_DIR) busybox-mips
	cp -a $(BB_DIR)/toolkit .

tk.tar.gz:$(TK_DIR) $(BUSYBOX_TK) scp dropbear
	rsync -av --delete $(BUSYBOX_TK)/ $(TK_DIR)/tk/
	cp scp $(TK_DIR)/tk/sbin/
	cp dropbear $(TK_DIR)/tk/sbin/
	cp profile $(TK_DIR)/tk
	cp rsa-host-key $(TK_DIR)/tk
	cp demosetup.sh $(PWD)/tk-installer
	tar zcvf tk.tar.gz tk-installer
	
$(TK_DIR):
	mkdir -p $(TK_DIR)/tk

clean:
	-rm -rf $(EXPLOIT_DIR)
	-rm -rf $(BUSYBOX_TK)
	-rm -rf scp
	-rm -rf	dropbear
	-make -C $(DB_DIR) clean
	-make -C $(BB_DIR) distclean
	-rm -f tk.tar.gz
	-rm -rf $(TK_DIR)
	-rm -f .*stamp

