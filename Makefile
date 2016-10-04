CC = gcc
INCLUDES = $(shell pkg-config --cflags gio-2.0 glib-2.0)
LIBS = $(shell pkg-config --libs gio-2.0 glib-2.0)
OPTIONS = -fPIC -shared
NAME = ddb_gnome_mmkeys
ROOTDIR = /
INSTALL_DIR = opt/deadbeef/lib/deadbeef

all: plugin

plugin: $(NAME).so

$(NAME).so: $(NAME).c
	$(CC) $(INCLUDES) $(OPTIONS) -o $(NAME).so $(NAME).c $(LIBS)
	
install:
	mkdir -p $(ROOTDIR)$(INSTALL_DIR)
	install -m 644 $(NAME).so $(ROOTDIR)$(INSTALL_DIR)

clean:
	rm -f $(NAME).so
