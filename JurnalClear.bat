REM Last-ЁЄ ActivityView

netsh winsock reset
netsh winsock reset catalog
netsh int ip reset
netsh advfirewall reset
netsh int reset all
netsh int ipv4 reset
netsh int ipv6 reset
ipconfig / release
ipconfig / renew
ipconfig / flushdns
@ECHO OFF
@TITLE = [QIONYX LEGEND].
REM Ќ ¤Ґобм, б®еа ­Ёвм д ©« ў Є®¤Ёа®ўЄҐ DOS-866 ­Ґ § Ўл«Ё
CHCP 866

REM ‡Ґ«Ґ­л© ­  зҐа­®¬ - Ё­ваЁЈгойҐ... ®Їпвм ¦Ґ, е ЄҐал Ё ўбҐ в Є®Ґ
COLOR 04

CLS

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
	IF (%adminTest%)==(ЋвЄ § ­®) GOTO errNoAdmin
	IF (%adminTest%)==(Access) GOTO errNoAdmin

ECHO.

	ECHO.
	ECHO Ћ—€‘’ЉЂ ‚‘…• †“ђЌЂ‹Ћ‚ Windows
	FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
	ECHO.
	ECHO ‚лЇ®«­Ґ­®
	ECHO.
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ ShellBag - аҐҐбва
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags" /f
ECHO.

ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ Explorer - аҐҐбва
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ComDlg32. €бв®аЁп ¤Ё «®Ј®ў "®вЄалвм\б®еа ­Ёвм" Ё "Ї®б«Ґ¤­Ёе ¬Ґбв Ї®бҐйҐ­Ё©"
REM гвЁ«Ёвл NirSoft - LastActivityView
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ OpenSave Ё LastVisited - аҐҐбва
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
REM (гвЁ«Ёвл NirSoft - OpenSaveFilesView)
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM Ґб«Ё Ї®«м§®ў вҐ«м ўлЎа « ў ¬Ґ­о ­Ґ 1 в.Ґ. 2 Ё«Ё 3

	REM UserAssist. ЋзЁбвЄ  бЇЁб®Є  § ЇгйҐ­­ле Їа®Ја ¬¬ ў ¬Ґ­о "ЏгбЄ"
	REM гвЁ«Ёвл NirSoft - UserAssistView
	ECHO.	
	ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ UserAssist - аҐҐбва
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
	ECHO.


REM ------------------------------------------------------------------------------------------
REM AppCompatCache
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ AppCompatCache - аҐҐбва
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\AppCompatCache" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM DiagnosedApplications. „Ё Ј­®бвЁЄ  гвҐзҐЄ Ї ¬пвЁ ў ЇаЁ«®¦Ґ­ЁЁ Ћ‘ Windows
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ DiagnosedApplications - аҐҐбва
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM Џ®«гзҐ­ЁҐ SID - Ё¤Ґ­вЁдЁЄ в®а ЎҐ§®Ї б­®бвЁ вҐЄгйҐЈ® Ї®«м§®ў вҐ«п 
FOR /F "tokens=2" %%i IN ('whoami /user /fo table /nh') DO SET usersid=%%i
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM Search. €бв®аЁп Ї®ЁбЄ  
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ Search - аҐҐбва
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM BAM. 
REM Џ® Ё¤ҐҐ, ЇаЁ ЇҐаҐ§ Јаг§ЄҐ § ваҐвбп б ¬®.  
REM Ќ® ¬®¦­® б¤Ґ« вм ®в¤Ґ«м­л© bat Ё § ЇгбЄ вм, ­ ЇаЁ¬Ґа, Ї®б«Ґ а Ў®вл б portable-ЇаЁ«®¦Ґ­Ёп¬Ё
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ б«г¦Ўл Background Activity Moderator - аҐҐбва
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\UserSettings\%usersid%" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\UserSettings\%usersid%" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM AppCompatFlags
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ AppCompatFlags - аҐҐбва
REM гвЁ«Ёвл NirSoft - ExecutedProgramsList
REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /va /f

	REG DELETE  "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM €бв®аЁп "¬®­вЁа®ў ­Ёп" ¤ЁбЄ®ў ў в.з. Ё TrueCrypt
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ MountedDevices - аҐҐбва
ECHO.
REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ЋзЁбвЄ  бЇЁбЄ®ў Ўлбва®Ј® ЇҐаҐе®¤ 
ECHO.
REM гвЁ«Ёвл NirSoft - JumpListsView, RecentFilesView
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ Recent - д ©«®ў п бЁбвҐ¬ 
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\*.*
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*.*
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*.*
ECHO ‚лЇ®«­Ґ­®
ECHO.
REM ------------------------------------------------------------------------------------------

REM ------------------------------------------------------------------------------------------
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ Panther - д ©«®ў п бЁбвҐ¬ 
DEL /f /q %systemroot%\Panther\*.*
ECHO ‚лЇ®«­Ґ­®
ECHO.
REM ------------------------------------------------------------------------------------------

REM ------------------------------------------------------------------------------------------
ECHO.
ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ AppCompat - д ©«®ў п бЁбвҐ¬ 
DEL /f /q %systemroot%\appcompat\Programs\*.dll
DEL /f /q %systemroot%\appcompat\Programs\*.exe
DEL /f /q %systemroot%\appcompat\Programs\*.txt
DEL /f /q %systemroot%\appcompat\Programs\*.xml
DEL /f /q %systemroot%\appcompat\Programs\Install\*.txt
DEL /f /q %systemroot%\appcompat\Programs\Install\*.xml
DEL /f /q %systemroot%\appcompat\Programs\Install\*.dll
DEL /f /q %systemroot%\appcompat\Programs\Install\*.exe
ECHO ‚лЇ®«­Ґ­®
ECHO.
REM ----


REM ------------------------------------------------------------------------------------------
	ECHO.
	REM Prefetch. “¤ «Ґ­ЁҐ д ©«®ў, ®ЇвЁ¬Ё§ЁагойЁе § ЇгбЄ ЇаЁ«®¦Ґ­Ё©. Windows ў б«Ґ¤гойЁ© а § § Јаг§Ёвбп ¬Ґ¤«Ґ­­ҐҐ
	REM гвЁ«Ёвл NirSoft - LastActivityView, ExecutedProgramsList
	ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ Prefetch - д ©«®ў п бЁбвҐ¬ 
	DEL /f /q %systemroot%\Prefetch\*.pf
	DEL /f /q %systemroot%\Prefetch\*.ini
	DEL /f /q %systemroot%\Prefetch\*.7db
	DEL /f /q %systemroot%\Prefetch\*.ebd
	DEL /f /q %systemroot%\Prefetch\*.bin
	REM SuperFetch. “¤ «Ґ­ЁҐ Ў § ®ЇвЁ¬Ё§ жЁЁ SuperFetch
	DEL /f /q %systemroot%\Prefetch\*.db
	REM Trace. “¤ «Ґ­ЁҐ д ©«®ў ва ббЁа®ўЄЁ
	DEL /f /q %systemroot%\Prefetch\ReadyBoot\*.fx
	ECHO ‚лЇ®«­Ґ­®
	ECHO.

	ECHO.
	ECHO Ћ—€‘’ЉЂ €‘’Ћђ€€ Minidump - д ©«®ў п бЁбвҐ¬ 
	REM “¤ «Ґ­ЁҐ ¤ ¬Ї®ў ®иЁЎ®Є
	REM гвЁ«Ёвл NirSoft - LastActivityView
	DEL /f /q %systemroot%\Minidump\*.*
	ECHO ‚лЇ®«­Ґ­®
COLOR 02
ECHO.



EXIT

:do_clear
ECHO ЋзЁбвЄ  ¦га­ «  %1
wevtutil.exe cl %1
GOTO :eof

:errNoAdmin
COLOR 4
ECHO ЌҐ®Ўе®¤Ё¬® § ЇгбвЁвм нв®в бЄаЁЇв ®в Ё¬Ґ­Ё  ¤¬Ё­Ёбва в®а 
ECHO.
PAUSE
