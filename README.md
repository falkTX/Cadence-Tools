# Cadence-Tools

Cadence is a set of tools useful for audio production. <br/>
It's being developed by falkTX, using Python3 and Qt5 (and some C++ where needed).

The tools share the same base source code, so most of them look quite similar (which is intentional). <br/>
Also, lots of custom widgets were coded when needed (like pixmapdial, pixmapkeyboard, patchcanvas and systray). <br/>
They can be re-used in other projects. Contact the author if you need help on that.


## The tools
Here's a brief description of the included tools:

### [Cadence-JackMeter](http://kxstudio.sourceforge.net/KXStudio:Applications:Cadence-JackMeter)
Digital peak meter for JACK. <br/>
It automatically connects itself to all application JACK output ports that are also connected to the system output.

### [Cadence-JackSettings](http://kxstudio.sourceforge.net/KXStudio:Applications:Cadence-JackSettings)
Simple and easy-to-use configure dialog for jackdbus. <br/>
It can configure JACK's driver and engine parameters.

### [Cadence-Logs](http://kxstudio.sourceforge.net/KXStudio:Applications:Cadence-Logs)
Small tool that shows JACK, A2J, LASH and LADISH logs in a multi-tab window. <br/>
The logs are viewed in a text box, making it easy to browse and extract status messages using copy and paste commands.

### [Cadence-Render](http://kxstudio.sourceforge.net/KXStudio:Applications:Cadence-Render)
Tool to record (or 'render') a JACK project using jack-capture, controlled by JACK Transport. <br/>
It supports a vast number of file types and can render in both realtime and freewheel modes.

### [Cadence-XY Controller](http://kxstudio.sourceforge.net/KXStudio:Applications:Cadence-XYController)
Simple XY widget that sends and receives data from Jack MIDI. <br/>
It can send data through specific channels and has a MIDI Keyboard too.
