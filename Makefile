CODENAME = $(shell lsb_release -sc)

.PHONY: clean all install

all: athena_user

athena_user:
	@echo "user-db:user_$(CODENAME)" > $@
	@echo "system-db:athena" >> $@

install: athena_user
	mkdir -p $(DESTDIR)/etc/dconf/profile
	install -m 0644 athena_user $(DESTDIR)/etc/dconf/profile

clean:
	rm -f athena_user
