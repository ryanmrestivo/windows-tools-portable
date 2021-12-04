SET NEWLINE=^& echo.

FIND /C /I "DOMAIN_TO_BLOCK_HERE" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	DOMAIN_TO_BLOCK_HERE>>%WINDIR%\system32\drivers\etc\hosts

echo you *MUST* run this as admin for it to work.
pause