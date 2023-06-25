.PHONY: install uninstall

all:
	@echo "Nothing to compile. Use 'make [DESTDIR=dir] install' to install hp-omen-rgb."

install:
	@if [ "$$DESTDIR" = "" ]; then \
		if [ "$$(id -u)" -ne 0 ]; then \
			echo "Please execute this script as root."; \
			exit 1; \
		fi; \
	fi;

	@depends="zenity gawk"; \
	for dependency in $$(echo "$$depends" | xargs) ; do \
		echo "Checking for: $$dependency."; \
		if ! which "$$dependency" > /dev/null 2>&1 ; then \
			echo "  error: Required dependency '$$dependency' is missing."; \
			exit 1; \
		else \
			echo "  '$$dependency' found!"; \
		fi; \
	done;

	@echo

	@if [ -e "$$DESTDIR/usr/bin/hp-omen-rgb" ]; then \
		echo "Please un-install the previous version first"; \
		exit 1; \
	fi; \

	@if [ ! -d "$$DESTDIR/usr/bin" ]; then \
		mkdir -p "$$DESTDIR/usr/bin"; \
	fi;

	@if [ ! -d "$$DESTDIR/usr/share/applications" ]; then \
		mkdir -p "$$DESTDIR/usr/share/applications"; \
	fi;

	@if [ ! -d "$$DESTDIR/usr/share/icons" ]; then \
		mkdir -p "$$DESTDIR/usr/share/icons"; \
	fi;

	@if [ ! -d "$$DESTDIR/usr/share/icons/hicolor/scalable/apps" ]; then \
		mkdir -p "$$DESTDIR/usr/share/icons/hicolor/scalable/apps"; \
	fi;

	@echo 'Copying hp-omen-rgb'
	@echo

	cp hp-omen-rgb.sh "$$DESTDIR/usr/bin/hp-omen-rgb"
	cp hp-omen-rgb.png "$$DESTDIR/usr/share/icons/"
	cp hp-omen-rgb.svg "$$DESTDIR/usr/share/icons/hicolor/scalable/apps/"
	cp hp-omen-rgb.desktop "$$DESTDIR/usr/share/applications/"


	@echo
	@echo 'Done!'

	@exit 0

uninstall:
	@if [ "$$(id -u)" != "0" ]; then \
		echo "Please execute uninstallation as root."; \
		exit 1; \
	fi;

	@echo 'Uninstalling hp-omen-rgb'
	@echo

	rm "/usr/bin/hp-omen-rgb"
	rm "/usr/share/icons/hp-omen-rgb.png"
	rm "/usr/share/icons/hicolor/scalable/apps/hp-omen-rgb.svg"
	rm "/usr/share/applications/hp-omen-rgb.desktop"

	@echo
	@echo 'Done!'

