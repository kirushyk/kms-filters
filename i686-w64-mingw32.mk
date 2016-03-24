AR=i686-w64-mingw32-ar
CC=i686-w64-mingw32-gcc
CXX=i686-w64-mingw32-g++
RANLIB=i686-w64-mingw32-ranlib
TARGET_DIR=./build/

CXXFLAGS=--std=gnu++17 -fpermissive

CFLAGS= \
-DKURENTO_MODULES_DIR="\"./modules/\"" \
-DPACKAGE="\"kms-filters\"" \
-DVERSION="\"6.4.1.6\"" \
-DWIN32_LEAN_AND_MEAN=1 \
-I./win32/server/implementation/HttpServer/ \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/nice \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/libsoup-2.4 \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/gstreamer-1.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/gstreamer-1.0/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glibmm-2.4 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glibmm-2.4/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/sigc++-2.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/sigc++-2.0/include \
-I../kms-core/win32/server/implementation/generated-cpp/ \
-I../kms-core/win32/server/interface/generated-cpp/ \
-I../kms-core/src/server/interface/ \
-I../kms-core/src/server/implementation/ \
-I../kms-core/src/server/implementation/objects/ \
-I../kms-core/src/gst-plugins/ \
-I./win32/server/implementation/generated-cpp/ \
-I./win32/server/interface/generated-cpp/  \
-I./win32/gst-plugins/ \
-I./win32 \
-I./src/server/implementation/ \
-I./src/server/implementation/objects/ \
-I./src/server/interface/ \
-I./src/gst-plugins/ \
-I./src/gst-plugins/commons/ \
-I../jsoncpp/include/ \
-I../kms-jsonrpc/src/

LIBS= \
-L/usr/i686-w64-mingw32/sys-root/mingw/lib \
-L/usr/lib/gcc/i686-w64-mingw32/5.2.0 \
-L/usr/i686-w64-mingw32/lib/ \
-L../kms-jsonrpc/build/ \
-L../jsoncpp/build/ \
-L../kms-core/build/ \
-L./build/

FACEOVERLAY_TARGET=libfaceoverlay.dll

FACEOVERLAY_SRC= \
./src/gst-plugins/faceoverlay/faceoverlay.c \
./src/gst-plugins/faceoverlay/kmsfaceoverlay.c

FACEOVERLAY_LIBS= \
-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lgstvideo-1.0 -lgstbase-1.0

LOGOOVERLAY_TARGET=liblogooverlay.dll

LOGOOVERLAY_SRC= \
./src/gst-plugins/logooverlay/logooverlay.c \
./src/gst-plugins/logooverlay/kmslogooverlay.c

LOGOOVERLAY_LIBS= \
-lopencv_imgproc310.dll -lopencv_imgcodecs310.dll -lopencv_core310.dll -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lgstvideo-1.0 -lsoup-2.4

FACEOVERLAY_OBJS=$(FACEOVERLAY_SRC:.c=.o)
LOGOOVERLAY_OBJS=$(LOGOOVERLAY_SRC:.c=.o)
IMAGEOVERLAY_OBJS=$(IMAGEOVERLAY_SRC:.c=.o)
FACEDETECTOR_OBJS=$(FACEDETECTOR_SRC:.c=.o)
MOVEMENTDETECTOR_OBJS=$(MOVEMENTDETECTOR_SRC:.c=.o)
OPENCVFILTER_OBJS=$(OPENCVFILTER_SRC:.c=.o)
KMSFILTERSINTERFACE_OBJS=$(KMSFILTERSINTERFACE_SRC:.cpp=.o)
KMSFILTERSIMPL_OBJS=$(KMSFILTERSIMPL_SRC:.cpp=.o)
KMSFILTERSMODULE_OBJS=$(KMSFILTERSMODULE_SRC:.cpp=.o)

all: \
$(TARGET_DIR)/$(FACEOVERLAY_TARGET) \
$(TARGET_DIR)/$(LOGOOVERLAY_TARGET) \
$(TARGET_DIR)/$(IMAGEOVERLAY_TARGET) \
$(TARGET_DIR)/$(FACEDETECTOR_TARGET) \
$(TARGET_DIR)/$(MOVEMENTDETECTOR_TARGET) \
$(TARGET_DIR)/$(OPENCVFILTER_TARGET) \
\
$(TARGET_DIR)/$(KMSFILTERSINTERFACE_TARGET) \
$(TARGET_DIR)/$(KMSFILTERSIMPL_TARGET) \
$(TARGET_DIR)/$(KMSFILTERSMODULE_TARGET)

$(TARGET_DIR)/$(KMSFILTERSINTERFACE_TARGET): $(KMSFILTERSINTERFACE_OBJS)
	mkdir -p $(TARGET_DIR)
	$(AR) cr $@ $^
	$(RANLIB) $@

$(TARGET_DIR)/$(KMSFILTERSIMPL_TARGET): $(KMSFILTERSIMPL_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(KMSFILTERSIMPL_LIBS) -Wl,--out-implib,$@.a

$(TARGET_DIR)/$(KMSFILTERSMODULE_TARGET): $(KMSFILTERSMODULE_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(KMSFILTERSMODULE_LIBS) -Wl,--out-implib,$@.a

$(TARGET_DIR)/$(FACEOVERLAY_TARGET): $(FACEOVERLAY_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(FACEOVERLAY_LIBS)

$(TARGET_DIR)/$(LOGOOVERLAY_TARGET): $(LOGOOVERLAY_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(LOGOOVERLAY_LIBS)

$(TARGET_DIR)/$(IMAGEOVERLAY_TARGET): $(IMAGEOVERLAY_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(IMAGEOVERLAY_LIBS)

$(TARGET_DIR)/$(FACEDETECTOR_TARGET): $(FACEDETECTOR_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(FACEDETECTOR_LIBS)

$(TARGET_DIR)/$(MOVEMENTDETECTOR_TARGET): $(MOVEMENTDETECTOR_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(MOVEMENTDETECTORPLIBS)

$(TARGET_DIR)/$(OPENCVFILTER_TARGET): $(OPENCVFILTER_OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $@ $^ $(OPENCVFILTER_LIBS)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -f $(TARGET_DIR)/$(FACEOVERLAY_TARGET)
	rm -f $(FACEOVERLAY_OBJS)
	rm -f $(TARGET_DIR)/$(LOGOOVERLAY_TARGET)
	rm -f $(LOGOOVERLAY_OBJS)
	rm -f $(TARGET_DIR)/$(IMAGEOVERLAY_TARGET)
	rm -f $(IMAGEOVERLAY_OBJS)q
	rm -f $(TARGET_DIR)/$(FACEDETECTOR_TARGET)
	rm -f $(FACEDETECTOR_OBJS)
	rm -f $(TARGET_DIR)/$(MOVEMENTDETECTOR_TARGET)
	rm -f $(MOVEMENTDETECTOR_OBJS)
	rm -f $(TARGET_DIR)/$(OPENCVFILTER_TARGET)
	rm -f $(OPENCVFILTER_OBJS)
	rm -f $(TARGET_DIR)/$(KMSFILTERSINTERFACE_TARGET)
	rm -f $(KMSFILTERSINTERFACE_OBJS)
	rm -f $(TARGET_DIR)/$(KMSFILTERSIMPL_TARGET)
	rm -f $(TARGET_DIR)/$(KMSFILTERSIMPL_TARGET).a
	rm -f $(KMSFILTERSIMPL_OBJS)
	rm -f $(TARGET_DIR)/$(KMSFILTERSMODULE_TARGET)
	rm -f $(KMSFILTERSMODULE_OBJS)

