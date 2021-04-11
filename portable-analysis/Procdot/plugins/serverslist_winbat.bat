@echo off
rem ****************************************************************************
rem *             THIS IS AN EXEMPLARY TEST PLUGIN FOR PROCDOT                 *
rem *--------------------------------------------------------------------------*
rem * As such it returns a list of all the servers (domains and according IPs) *
rem * for the current session.                                                 *
rem ****************************************************************************

setlocal enabledelayedexpansion

rem set PROCDOTPLUGIN_GraphFileDetails=%temp%\procdot.dot.procdot
rem set PROCDOTPLUGIN_ResultCSV=%temp%\serverslist.txt

set in=%PROCDOTPLUGIN_GraphFileDetails%
set out=%PROCDOTPLUGIN_ResultCSV%

echo "Domain","IP-Address" > %out%
echo "*","*" >> %out%
for /F "tokens=1,3" %%i in (%in%) do (
	if "%%i" == "Domain" (
		set domain=%%j
	)
	if "%%i" == "IP-Address" (
		set ip=%%j
	)
	if "%%i" == "OnlyInPCAP" (
		set onlyinpcap=%%j
	)
	if "%%i" == "RelevantBecauseOfProcmonLines" (
		set procmon=%%j
		if not "!domain!" == "!ip!" (
			if not "!procmon!" == "" (
				echo "!domain!","!ip!" >> %out%
			)
			if "!onlyinpcap!" == "Yes" (
				echo {{color:blue}}"!domain!","!ip!" >> %out%
			)
		)
		set domain=""
		set ip=""
	)
)
