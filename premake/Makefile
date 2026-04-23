MAKEFILES = ../build/Makefile ../build/wxWabbitemu.make ../build/wxWidgetsVer.make
GEN_SOURCES = create_makefile.sh premake4.lua use_wxwidgets.lua wxWidgetsVer.make

all: $(MAKEFILES)

$(MAKEFILES): $(GEN_SOURCES)
	./create_makefile.sh

distclean:
	rm -f $(MAKEFILES)
