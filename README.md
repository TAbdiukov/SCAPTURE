#  ![oooOOOooo](icons8-third-eye-symbol-64.png) simple_capture ( `SCAPTURE` )  
Simple screen-capturing tool for embedded systems.

[![Download](https://img.shields.io/badge/download-success?style=for-the-badge&logo=github&logoColor=white)](https://github.com/TAbdiukov/SCAPTURE/releases/download/1.42/SCAPTURE.exe)

## Features
* Barebones Windows OS compatible.
	* Does not use any external WinAPI.
	* Works on 16-bit, embedded, other nonstandard systems.
	* The tool saves in `.BMP` format only (limitation).  
		PNG and other lossless formats require WinAPI/3rd-party classes - avoided for compatibility.
* Simple to compile! Compile in IDE → Good to go!

## Usage

* Run the tool, make sure the status is ON
* Press `PrintScreen`
* Observe .BMP images in the directory

## Interesting insights

* Sometimes, upon startup, the tool captures out-of-place random icons, such as the classic Windows logo (observed on Windows 10!)
* `Clipboard.GetData.Type` lets you read and write everywhere within application memory. It returns Booleans, but still peculiar.

## Sidenote
* Third Eye Symbol icon by Icons8
	* Although I have their subscription, better safe than sorry

## See also
*My other small Windows tools,*  

* [AMC_patcher-CLI](https://github.com/TAbdiukov/AMC_patcher-CLI) – (CLI) Patches app's SUBSYSTEM flag to modify app's behavior.
* [exe2wordsize](https://github.com/TAbdiukov/exe2wordsize) – (CLI) Detects Windows-compatible application bitness, without ever running it.
* **<ins>SCAPTURE</ins>** – (GUI) Simple screen-capturing tool for embedded systems.
* [txtShear](https://github.com/TAbdiukov/txtShear) – (CLI) Fast engine to skew (or shear) text by a desired angle, emulating handwriting.
