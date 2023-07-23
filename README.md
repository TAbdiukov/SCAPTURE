#  ![oooOOOooo](icons8-third-eye-symbol-64.png) simple_capture ( `SCAPTURE.EXE` )  
Simple screen-capturing tool for embedded systems.

## Features
* Barebones Windows OS compatible.
	* Does not use any external WinAPI.
	* Works on 16-bit systems.
	* The tool saves in `.BMP` format only (limitation).  
		PNG and other lossless formats require WinAPI/3rd-party classes - avoided for compatibility.
* Doesn't require any sophisticated compiling procedures! Compile in IDE -> Good to go!

## Usage

* Run the tool, make sure the status is ON
* Press `PrintScreen`
* Observe .BMP images in the directory

## Interesting insights

* Sometimes, upon startup, the tool captures out-of-place random icons, such as the classic Windows logo (observed on Windows 10!).
* `Clipboard.GetData.Type` lets you read and write everywhere within application memory. It deals Booleans, but still peculiar.

## Sidenote
* Third Eye Symbol icon icon by Icons8

	( although I have the Icons8 licence, best safe than sorry)

## See also
*My other small Windows tools,*  

* [AMC_patcher-CLI](https://github.com/TAbdiukov/AMC_patcher-CLI) – (CLI) Patches app's SUBSYSTEM flag to modify app's behavior.
* [exe2wordsize](https://github.com/TAbdiukov/exe2wordsize) – (CLI) Detects Windows-compatible application bitness, without ever running it.
* [HWZ](https://github.com/TAbdiukov/HWZ) – (CLI) CLI engine to forge / synthesize handwriting.
* [SCAPTURE.EXE](https://github.com/TAbdiukov/SCAPTURE.EXE) – (GUI) Simple screen-capturing tool for embedded systems.
