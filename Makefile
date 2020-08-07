#!/usr/bin/make -f
# Makefile for Cadence-Tools #
# -------------------------- #
# Created by falkTX
#

PREFIX  = /usr/local
DESTDIR =

LINK   = ln -s
PYUIC ?= pyuic5
PYRCC ?= pyrcc5

# ---------------------------------------------------------------------------------------------------------------------

all: CPP RES UI

# ---------------------------------------------------------------------------------------------------------------------
# C++ code

CPP: jackmeter xycontroller

jackmeter:
	$(MAKE) -C c++/jackmeter

xycontroller:
	$(MAKE) -C c++/xycontroller

# -----------------------------------------------------------------------------------------------------------------------------------------
# Resources

RES: src/resources_rc.py

src/resources_rc.py: resources/resources.qrc
	$(PYRCC) $< -o $@

# ---------------------------------------------------------------------------------------------------------------------
# UI code

UI: src/ui_logs.py src/ui_render.py src/ui_settings_app.py src/ui_settings_jack.py

src/ui_%.py: resources/ui/%.ui
	$(PYUIC) $< -o $@

# ---------------------------------------------------------------------------------------------------------------------

clean:
	$(MAKE) clean -C c++/jackmeter
	$(MAKE) clean -C c++/xycontroller
	rm -f *~ src/*~ src/*.pyc src/ui_*.py src/resources_rc.py

# ---------------------------------------------------------------------------------------------------------------------

debug:
	$(MAKE) DEBUG=true

# ---------------------------------------------------------------------------------------------------------------------

install:
	# Create directories
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/share/cadence-tools

	# Install script files and binaries
	install -m 755 \
		data/cadence-jacksettings \
		data/cadence-logs \
		data/cadence-render \
		c++/jackmeter/cadence-jackmeter \
		c++/xycontroller/cadence-xycontroller \
		$(DESTDIR)$(PREFIX)/bin/

	# Install main code
	install -m 755 src/*.py $(DESTDIR)$(PREFIX)/share/cadence-tools/

	# Adjust PREFIX value in script files
	sed -i "s?X-PREFIX-X?$(PREFIX)?" \
		$(DESTDIR)$(PREFIX)/bin/cadence-jacksettings \
		$(DESTDIR)$(PREFIX)/bin/cadence-logs \
		$(DESTDIR)$(PREFIX)/bin/cadence-render

# ---------------------------------------------------------------------------------------------------------------------

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/cadence-jackmeter
	rm -f $(DESTDIR)$(PREFIX)/bin/cadence-jacksettings
	rm -f $(DESTDIR)$(PREFIX)/bin/cadence-logs
	rm -f $(DESTDIR)$(PREFIX)/bin/cadence-render
	rm -f $(DESTDIR)$(PREFIX)/bin/cadence-xycontroller
	rm -rf $(DESTDIR)$(PREFIX)/share/cadence-tools
