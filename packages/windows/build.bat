@echo off
setlocal
set PATH=%PATH%;"C:\Program Files (x86)\WiX Toolset v3.7\bin";"C:\Program Files\WiX Toolset v3.7\bin"
candle kerkerkruip.wxs WixUI_Kerkerkruip.wxs
echo.
light -ext WixUIExtension -ext WixUtilExtension ^
	-sice:ICE61 -sice:ICE91 ^
	-cultures:en-us ^
	kerkerkruip.wixobj WixUI_Kerkerkruip.wixobj ^
	-o kerkerkruip.msi
@pause