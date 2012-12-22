# QtCreator project file

QT = core

CONFIG    = debug
CONFIG   += static
CONFIG   += link_pkgconfig qt warn_on

DEFINES   = DEBUG
DEFINES  += QTCREATOR_TEST

# JACK
DEFINES  += CARLA_ENGINE_JACK

# RtAudio/RtMidi
DEFINES  += CARLA_ENGINE_RTAUDIO HAVE_GETTIMEOFDAY _FORTIFY_SOURCE=2
DEFINES  += __LINUX_ALSA__ __LINUX_ALSASEQ__ __LINUX_PULSE__ __UNIX_JACK__
DEFINES  += __RTAUDIO_DEBUG__ __RTMIDI_DEBUG__

# DISTRHO Plugin
DEFINES  += CARLA_ENGINE_PLUGIN
DEFINES  += DISTRHO_PLUGIN_TARGET_DSSI

# Misc
DEFINES  += WANT_LV2

PKGCONFIG = liblo jack alsa libpulse-simple

TARGET   = carla_engine
TEMPLATE = lib
VERSION  = 0.5.0

SOURCES  = \
    carla_engine.cpp \
    carla_engine_osc.cpp \
    carla_engine_thread.cpp \
    jack.cpp \
    rtaudio.cpp \
    plugin.cpp

HEADERS  = \
    carla_engine.hpp \
    carla_engine_osc.hpp \
    carla_engine_thread.hpp

HEADERS += \
    DistrhoPluginInfo.h

INCLUDEPATH = . \
    ../carla-backend \
    ../carla-includes \
    ../carla-plugin \
    ../carla-utils

# FIXME
INCLUDEPATH += \
    /opt/kxstudio/include

# JACK
INCLUDEPATH += ../carla-jackbridge

# RtAudio/RtMidi
INCLUDEPATH += rtaudio-4.0.11
INCLUDEPATH += rtmidi-2.0.1
SOURCES     += rtaudio-4.0.11/RtAudio.cpp
SOURCES     += rtmidi-2.0.1/RtMidi.cpp

# Plugin
INCLUDEPATH += ../distrho-plugin-toolkit

QMAKE_CXXFLAGS *= -std=c++0x
