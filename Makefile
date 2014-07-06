CODENAME = $(shell lsb_release -sc)

# Ensure codename is only alphanumerics
ifneq (y,$(shell echo "$(CODENAME)" | egrep -qx '[A-Za-z0-9]+' && echo y))
    $(error Unacceptable LSB codename value)
endif

.PHONY: clean all install

all: athena_user

athena_user:
	@echo "user-db:user_$(CODENAME)" > $@
	@echo "system-db:athena" >> $@

install: athena_user
	mkdir -p "$(DESTDIR)/etc/dconf/profile"
	install -m 0644 athena_user "$(DESTDIR)/etc/dconf/profile"

clean:
	rm -f athena_user
