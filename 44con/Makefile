ROOT?=/home/zach/code
DB=$(ROOT)/embedded-dropbear
SCP=$(DB)/scp
DROPBEAR=$(DB)/dropbear
BB=$(ROOT)/busybox-1.21.0
BUSYBOX=$(BB)/toolkit.tar.gz

TK_DIR=$(PWD)/tk-installer

all:$(TK_DIR) $(SCP) $(DROPBEAR) $(BUSYBOX)
	cp $(SCP) $(DROPBEAR) $(TK_DIR)/tk
	cp $(BUSYBOX) $(TK_DIR)/tk
	cp profile $(TK_DIR)/tk
	cp rsa-host-key $(TK_DIR)/tk
	cp demosetup.sh $(PWD)/tk-installer
$(TK_DIR):
	mkdir -p $(TK_DIR)/tk

clean:
	-rm -rf $(TK_DIR)

