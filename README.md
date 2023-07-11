#  ![oooOOOooo](icons8-third-eye-symbol-64.png) simple_capture ( `SCAPTURE.EXE` )  
Simple capturing tool for embedded systems.

## Features
* Barebones Windows OS compatible.
	* Doesn't use any external WinAPI.
	* Works on 16-bit systems.
	* The slight limitation, tool saves in `.bmp` only. 
		PNG/other lossless formats require WinAPI/3rd-party classes, avoided for compatibility.
* Doesn't require any sophisticated compiling procedures! Compile in IDE -> Good to go!

## Usage

* Run the tool, make sure the status is ON
* Press `Printscreen`
* Observe .BMP images in the directory

## Interesting insights

* Sometimes, upon startup, the tool captures out-of-place random icons, such as the classic Windows logo (observed on Windows 10!).
* Clipboard.GetData.Type *LITERALLY* lets you read and write everywhere, just like fmt str. It deals Booleans, sure, but still peculiar.

## Sidenote
* Third Eye Symbol icon icon by Icons8

	( although I have the Icons8 licence, best safe than sorry)
