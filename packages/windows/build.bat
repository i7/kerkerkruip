@echo off
setlocal
set PATH=%PATH%;"C:\Program Files (x86)\WiX Toolset v3.7\bin";"C:\Program Files\WiX Toolset v3.7\bin"
candle kerkerkruip.wxs
light -ext WixUIExtension -cultures:en-us kerkerkruip.wixobj
@pause