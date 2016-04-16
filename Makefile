CC = $(CROSS_COMPILE)g++

COMPILER = $(shell $(CC) -dM -E -  < /dev/null | grep _WIN32 > /dev/null && echo "mingw"  || echo "none")
ifeq ($(COMPILER), none)
COMPILER = linux
endif

TARGET=emmcdl
TARGET_EXE=$(TARGET)

SRC = \
	src/crc.cpp \
	src/dload.cpp \
	src/emmcdl.cpp \
	src/ffu.cpp \
	src/firehose.cpp \
	src/partition.cpp \
	src/protocol.cpp \
	src/sahara.cpp \
	src/sparse.cpp \
	src/xmlparser.cpp

OBJ = $(SRC:.cpp=.o)
DEPEND_STATIC_LIB = 

CFLAGS = -fpermissive
CFLAGS += -I./inc
LDFLAGS = -lpthread

ifeq ($(COMPILER), linux)
SRC += src/diskwriter_linux.cpp src/usbport.cpp src/usb_linux.cpp
#DEPEND_STATIC_LIB += ../../../output/lib/libselinux.a ../../../output/lib/libpcre.a
endif
ifeq ($(COMPILER), mingw)
SRC += src/diskwriter.cpp src/serialport.cpp
CFLAGS += -DPLATFORM_WINDOWS
#CFLAGS += -I../../../development/host/windows/usb/api -DUSE_MINGW src/sysdeps_windows.cpp
#DEPEND_STATIC_LIB += ../../../prebuild/host/windows-x64/AdbWinApi.lib
#LDFLAGS += -lws2_32
endif

$(TARGET_EXE):$(OBJ) $(DEPEND_STATIC_LIB);$(CC) -o $@ $^ $(LDFLAGS)
$(filter %.o,$(OBJ)):%.o:%.cpp;$(CC) $(CFLAGS) -c -o $@ $<

.PHONY:install
install:
	 cp -rf $(TARGET_EXE) ../../../output/bin/

.PHONY:clean
clean:
	 rm -f $(OBJ) $(TARGET_EXE) *.o
