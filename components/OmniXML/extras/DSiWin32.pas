(*:Collection of Win32 wrappers and helper functions.
   @desc <pre>
   Free for personal and commercial use. No rights reserved.

   Maintainer        : gabr
   Contributors      : ales, aoven, gabr, Lee_Nover, _MeSSiah_, Miha-R, Odisej, xtreme,
                       Brdaws, Gre-Gor
   Creation date     : 2002-10-09
   Last modification : 2004-02-12
   Version           : 1.11
</pre>*)(*
   History:
     1.11: 2004-02-12
       - Added functions DSiSetProcessPriorityClass, DSiGetProcessOwnerInfo (two
         overloaded versions), DSiEnablePrivilege.
     1.10: 2003-12-18
       - Updated TDSiRegistry.ReadString to handle DWORD registry values too.
       - Updated TDSiRegistry.ReadInteger to handle string registry values too.
     1.09: 2003-11-14
       - Added functions DSiValidateProcessAffinity, DSiValidateThreadAffinity,
         DSiValidateProcessAffinityMask, DSiValidateThreadAffinityMask,
         DSiGetSystemAffinityMask, DSiGetProcessAffinityMask,
         DSiGetThreadAffinityMask, DSiAffinityMaskToString, and
         DSiStringToAffinityMask.
     1.08: 2003-11-12
       - Added functions DSiCloseHandleAndInvalidate, DSiWin32CheckHandle,
         DSiGetSystemAffinity, DSiGetProcessAffinity, DSiSetProcessAffinity,
         DSiGetThreadAffinity, DSiSetThreadAffinity.
       - Added types TDSiFileHandle, TDSiPipeHandle, TDSiMutexHandle,
         TDSiEventHandle, TDSiSemaphoreHandle; all equivaled to THandle.
     1.07a: 2003-10-18
       - DSiuSecDelay was broken. Fixed.
     1.07: 2003-10-09
       - Added functions DSiGetUserNameEx, DSiIsDiskInDrive, DSiGetDiskLabel,
         DSiGetMyDocumentsFolder, DSiGetSystemVersion, DSiRefreshDesktop,
         DSiGetWindowsVersion, DSiRebuildDesktopIcons.
       - Added TDSiRegistry methods ReadStrings and WriteStrings dealing with
         MULTI_SZ registry format.
     1.06a: 2003-09-03
       - Typo fixed in DSiMsgWaitForTwoObjectsEx.
     1.06: 2003-09-02
       - New functions: DSiMsgWaitForTwoObjectsEx, DSiMsgWaitForThreeObjectsEx.
       - Documented 'Handles' and 'Registry' sections.
       - Bug fixed in DSiLoadLibrary.
     1.05: 2003-09-02
       - New functions: DSiMonitorOn, DSiMonitorOff, DSiMonitorStandby,
         DSiGetBootType, DSiShareFolder, DSiUnshareFolder, DSiFileSize,
         DSiEnumFiles, DSiEnumFilesEx, DSiGetDomain, DSiProcessMessages,
         DSiProcessThreadMessages, DSiLoadLibrary, DSiGetProcAddress,
         DSiDisableX, DSiEnableX.
       - Added dynamically loaded API forwarders: DSiNetApiBufferFree,
         DSiNetWkstaGetInfo, DSiSHEmptyRecycleBin, DSiCreateProcessAsUser,
         DSiLogonUser, DSiImpersonateLoggedOnUser, DSiRevertToSelf,
         DSiCloseServiceHandle, DSiOpenSCManager, DSi9xNetShareAdd,
         DSi9xNetShareDel, DSiNTNetShareAdd, DSiNTNetShareDel.
       - DSiGetUserName could fail on Win9x. Fixed.
       - Declared constants WAIT_OBJECT_1 (= WAIT_OBJECT_0+1) to WAIT_OBJECT_9
         (=WAIT_OBJECT_0+9).
       - All dynamically loaded functions are now available to the public
         (see new { DynaLoad } section).
       - All functions using dynamically loaded API calls were modified to use
         new DynaLoad methods.
       - All string parameters turned into 'const' parameters.
       - Various constants and type declarations moved to the 'interface'
         section.
     1.04: 2003-05-27
       - New functions: DSiLoadMedia, DSiEjectMedia.
     1.03: 2003-05-24
       - New functions: DSiExecuteAndCapture, DSiFreeMemAndNil.
     1.02a: 2003-05-05
       - Refuses to compile with Kylix.
       - Removed platform-related warnings on Delphi 6&7.
     1.02: 2002-12-29
       - New function: DSiElapsedSince.
     1.01: 2002-12-19
       - Compiles with Delphi 6 and Delphi 7.
       - New functions:
          Files:
            procedure DSiDeleteFiles(folder: string; fileMask: string);
            procedure DSiDeleteTree(folder: string; removeSubdirsOnly: boolean);
            procedure DSiEmptyFolder(folder: string);
            procedure DSiEmptyRecycleBin;
            procedure DSiRemoveFolder(folder: string);
            procedure DSiuSecDelay(delay: word);
          Processes:
            function  DSiExecuteAsUser(const commandLine, username, password: string;
              const domain: string = '.'; visibility: integer = SW_SHOWDEFAULT;
              workDir: string = ''; wait: boolean = false): cardinal;
            function  DSiImpersonateUser(const username, password, domain: string): boolean;
            procedure DSiStopImpersonatingUser;
     1.0: 2002-11-25
       - Released.
*)

unit DSiWin32;                                                   

{$J+} // required!

interface 

{$IFDEF Linux}{$MESSAGE FATAL 'This unit is for Windows only'}{$ENDIF Linux}
{$IFDEF MSWindows}{$WARN SYMBOL_PLATFORM OFF}{$WARN UNIT_PLATFORM OFF}{$ENDIF MSWindows}

uses
  Windows,
  {$IFDEF VER140}Variants,{$ELSE}
  {$IFDEF VER150}Variants,{$ENDIF}{$ENDIF}
  SysUtils,
  ShlObj,
  Classes,
  Graphics,
  Registry;

// TODO 3 -oPrimoz Gabrijelcic: Settlement APIs - TDM 86
// TODO 3 -oPrimoz Gabrijelcic: ForegrounWindow trick: WDJ

const
  // pretty wrappers
  WAIT_OBJECT_1 = WAIT_OBJECT_0+1;
  WAIT_OBJECT_2 = WAIT_OBJECT_0+2;
  WAIT_OBJECT_3 = WAIT_OBJECT_0+3;
  WAIT_OBJECT_4 = WAIT_OBJECT_0+4;
  WAIT_OBJECT_5 = WAIT_OBJECT_0+5;
  WAIT_OBJECT_6 = WAIT_OBJECT_0+6;
  WAIT_OBJECT_7 = WAIT_OBJECT_0+7;
  WAIT_OBJECT_8 = WAIT_OBJECT_0+8;
  WAIT_OBJECT_9 = WAIT_OBJECT_0+9;

  // folder constants missing from ShellObj in Delphi 5
  CSIDL_APPDATA              = $001A;      // Application Data, new for NT4

  CSIDL_LOCAL_APPDATA        = $001C;      // non roaming, user\Local Settings\Application Data
  CSIDL_INTERNET_CACHE       = $0020;
  CSIDL_COOKIES              = $0021;
  CSIDL_HISTORY              = $0022;
  CSIDL_COMMON_APPDATA       = $0023;      // All Users\Application Data
  CSIDL_WINDOWS              = $0024;      // GetWindowsDirectory()
  CSIDL_SYSTEM               = $0025;      // GetSystemDirectory()
  CSIDL_PROGRAM_FILES        = $0026;      // C:\Program Files
  CSIDL_MYPICTURES           = $0027;      // My Pictures, new for Win2K
  CSIDL_PROGRAM_FILES_COMMON = $002b;      // C:\Program Files\Common
  CSIDL_COMMON_DOCUMENTS     = $002e;      // All Users\Documents

  CSIDL_COMMON_ADMINTOOLS    = $002f;      // All Users\Start Menu\Programs\Administrative Tools
  CSIDL_ADMINTOOLS           = $0030;      // <user name>\Start Menu\Programs\Administrative Tools

  CSIDL_FLAG_CREATE          = $8000;      // new for Win2K, OR this in to force creation of folder

  FILE_DEVICE_MASS_STORAGE = $2D;
  METHOD_BUFFERED          = 0;
  FILE_ANY_ACCESS          = 0;
  FILE_READ_ACCESS         = 1;
  FILE_WRITE_ACCESS        = 2;
  IOCTL_STORAGE_EJECT_MEDIA = (FILE_DEVICE_MASS_STORAGE shl 16) OR
                              (FILE_READ_ACCESS shl 14)         OR
                              ($202 shl 2)                      OR
                              (METHOD_BUFFERED);
  IOCTL_STORAGE_LOAD_MEDIA  = (FILE_DEVICE_MASS_STORAGE shl 16) OR
                              (FILE_READ_ACCESS shl 14)         OR
                              ($203 shl 2)                      OR
                              (METHOD_BUFFERED);

  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;

  STYPE_DISKTREE = 0;
  SHI50F_RDONLY = $0001;
  SHI50F_FULL = $0002;
  SHI50F_DEPENDSON = SHI50F_RDONLY or SHI50F_FULL;
  SHI50F_ACCESSMASK = SHI50F_RDONLY or SHI50F_FULL;

  // IPersisteFile GUID
  IID_IPersistFile: TGUID = (
    D1: $0000010B; D2: $0000; D3: $0000; D4: ($C0, $00, $00, $00, $00, $00, $00, $46));

  // Extension for shortcut files
  CLinkExt = '.lnk';

  // ShEmptyRecycleBinA flags
  SHERB_NOCONFIRMATION = $00000001;
  SHERB_NOPROGRESSUI   = $00000002;
  SHERB_NOSOUND        = $00000004;

  // CurrentVersion registry key
  DSiWinVerKey9x = '\Software\Microsoft\Windows\CurrentVersion';
  DSiWinVerKeyNT = '\Software\Microsoft\Windows NT\CurrentVersion';
  DSiWinVerKeys: array [boolean] of string = (DSiWinVerKey9x, DSiWinVerKeyNT);

  // CPU IDs for the Affinity familiy of functions
  DSiCPUIDs = '0123456789ABCDEFGHIJKLMNOPQRSTUV';

type
  // API types not defined in Delphi 5
  PWkstaInfo100 = ^TWkstaInfo100;
  _WKSTA_INFO_100 = record
    wki100_platform_id: DWORD;
    wki100_computername: LPWSTR;
    wki100_langroup: LPWSTR;
    wki100_ver_major: DWORD;
    wki100_ver_minor: DWORD;
  end;
  {$EXTERNALSYM _WKSTA_INFO_100}
  TWkstaInfo100 = _WKSTA_INFO_100;
  WKSTA_INFO_100 = _WKSTA_INFO_100;
  {$EXTERNALSYM WKSTA_INFO_100}

  SHARE_INFO_2_NT = record
    shi2_netname: PWideChar;
    shi2_type: Integer;
    shi2_remark: PWideChar;
    shi2_permissions: Integer;
    shi2_max_uses: Integer;
    shi2_current_uses: Integer;
    shi2_path: PWideChar;
    shi2_passwd: PWideChar;
  end;

  SHARE_INFO_50_9x = record
    shi50_netname: array[1..13] of char;
    shi50_type: byte;
    shi50_flags: short;
    shi50_remark: pchar;
    shi50_path: pchar;
    shi50_rw_password: array[1..9] of char;
    shi50_ro_password: array[1..9] of char;
    szWhatever: array[1..256] of char;
  end;
 
  // Service Controller handle
  SC_HANDLE = THandle;

  // DSiEnumFiles callback
  TDSiEnumFilesCallback = procedure(const longFileName: string) of object;
  // DSiEnumFilesEx callback
  TDSiEnumFilesExCallback = procedure(const folder: string;
    S: TSearchRec; isAFolder: boolean; var stopEnum: boolean) of object;
    
{ Handles }

  // Pretty-print aliases
  TDSiFileHandle      = THandle;
  TDSiPipeHandle      = THandle;
  TDSiMutexHandle     = THandle;
  TDSiEventHandle     = THandle;
  TDSiSemaphoreHandle = THandle;

  procedure DSiCloseHandleAndInvalidate(var handle: THandle);
  procedure DSiCloseHandleAndNull(var handle: THandle);
  function  DSiMsgWaitForThreeObjectsEx(obj0, obj1, obj2: THandle;
    timeout: DWORD; wakeMask: DWORD; flags: DWORD): DWORD;
  function  DSiMsgWaitForTwoObjectsEx(obj0, obj1: THandle; timeout: DWORD;
    wakeMask: DWORD; flags: DWORD): DWORD;
  function  DSiWaitForThreeObjects(obj0, obj1, obj2: THandle; waitAll: boolean;
    timeout: DWORD): DWORD;
  function  DSiWaitForThreeObjectsEx(obj0, obj1, obj2: THandle; waitAll: boolean;
    timeout: DWORD; alertable: boolean): DWORD;
  function  DSiWaitForTwoObjects(obj0, obj1: THandle; waitAll: boolean;
    timeout: DWORD): DWORD;
  function  DSiWaitForTwoObjectsEx(obj0, obj1: THandle; waitAll: boolean;
    timeout: DWORD; alertable: boolean): DWORD;
  function DSiWin32CheckHandle(handle: THandle): THandle;

{ Registry }

type
  TDSiRegistry = class(TRegistry)
    function  ReadBool(const name: string; defval: boolean): boolean;
    function  ReadDate(const name: string; defval: TDateTime): TDateTime;
    function  ReadFont(const name: string; font: TFont): boolean;
    function  ReadInt64(const name: string; defval: int64): int64;
    function  ReadInteger(const name: string; defval: integer): integer;
    function  ReadString(const name, defval: string): string;
    procedure ReadStrings(const name: string; strings: TStrings);
    function  ReadVariant(const name: string; defval: variant): variant;
    procedure WriteFont(const name: string; font: TFont);
    procedure WriteInt64(const name: string; value: int64);
    procedure WriteStrings(const name: string; strings: TStrings);
    procedure WriteVariant(const name: string; value: variant);
  end; { TDSiRegistry }

  function DSiCreateRegistryKey(const registryKey: string;
    root: HKEY = HKEY_CURRENT_USER): boolean;
  function DSiKillRegistry(const registryKey: string;
    root: HKEY = HKEY_CURRENT_USER): boolean;
  function DSiReadRegistry(const registryKey, name: string;
    defaultValue: Variant; root: HKEY = HKEY_CURRENT_USER): Variant; overload;
  function DSiReadRegistry(const registryKey, name: string;
    defaultValue: int64; root: HKEY = HKEY_CURRENT_USER): int64; overload;
  function DSiRegistryKeyExists(const registryKey: string;
    root: HKEY = HKEY_CURRENT_USER): boolean;
  function DSiWriteRegistry(const registryKey, name: string; value: int64;
    root: HKEY = HKEY_CURRENT_USER): boolean; overload;
  function DSiWriteRegistry(const registryKey, name: string; value: Variant;
    root: HKEY = HKEY_CURRENT_USER): boolean; overload;

{ Files }

  function  DSiCreateTempFolder: string;
  procedure DSiDeleteFiles(const folder, fileMask: string);
  function  DSiDeleteOnReboot(const fileName: string): boolean;
  procedure DSiDeleteTree(const folder: string; removeSubdirsOnly: boolean);
  function  DSiDeleteWithBatch(const fileName: string; rmDir: boolean = false): boolean;
  function  DSiEjectMedia(deviceLetter: char): boolean;
  procedure DSiEmptyFolder(const folder: string);
  function  DSiEmptyRecycleBin: boolean;
  function  DSiEnumFiles(const fileMask: string; attr: integer;
    enumCallback: TDSiEnumFilesCallback): integer;
  function  DSiEnumFilesEx(const fileMask: string; attr: integer;
    enumSubfolders: boolean; enumCallback: TDSiEnumFilesExCallback): integer;
  function  DSiFileSize(const fileName: string): int64;
  function  DSiGetTempFileName(const prefix: string;
    const tempPath: string = ''): string;
  function  DSiGetTempPath: string;
  function  DSiGetUniqueFileName(const extension: string): string;
  function  DSiKillFile(const fileName: string): boolean;
  function  DSiLoadMedia(deviceLetter: char): boolean;
  function  DSiMoveOnReboot(const srcName, destName: string): boolean;
  procedure DSiRemoveFolder(const folder: string);
  function  DSiShareFolder(const folder, shareName, comment: string): boolean;
  function  DSiUnShareFolder(const shareName: string): boolean;

{ Processes }

  function  DSiAffinityMaskToString(affinityMask: DWORD): string;
  function  DSiEnablePrivilege(const privilegeName: string): boolean;
  function  DSiExecute(const commandLine: string;
    visibility: integer = SW_SHOWDEFAULT; const workDir: string = '';
    wait: boolean = false): cardinal;
  function  DSiExecuteAndCapture(const app: string; output: TStrings;
    const workDir: string = ''): cardinal;
  function  DSiExecuteAsUser(const commandLine, username, password: string;
    const domain: string = '.'; visibility: integer = SW_SHOWDEFAULT;
    const workDir: string = ''; wait: boolean = false): cardinal;
  function  DSiGetProcessAffinity: string;
  function  DSiGetProcessAffinityMask: DWORD;
  function  DSiGetProcessOwnerInfo(const processName: string; var user,
    domain: string): boolean; overload;
  function  DSiGetProcessOwnerInfo(processID: DWORD; var user,
    domain: string): boolean; overload;
  function  DSiGetProcessID(const processName: string; var processID: DWORD): boolean;
  function  DSiGetSystemAffinity: string;
  function  DSiGetSystemAffinityMask: DWORD;
  function  DSiGetThreadAffinity: string;
  function  DSiGetThreadAffinityMask: DWORD;
  function  DSiImpersonateUser(const username, password: string;
    const domain: string = '.'): boolean;
  function  DSiIsDebugged: boolean;
  function  DSiOpenURL(const URL: string; newBrowser: boolean = false): boolean;
  procedure DSiProcessThreadMessages;
  function  DSiRealModuleName: string;
  function  DSiSetProcessAffinity(affinity: string): string;
  function  DSiSetProcessPriorityClass(const processName: string;
    priority: DWORD): boolean;
  function  DSiSetThreadAffinity(affinity: string): string;
  procedure DSiStopImpersonatingUser;
  function  DSiStringToAffinityMask(affinity: string): DWORD;
  procedure DSiTrimWorkingSet;
  function  DSiValidateProcessAffinity(affinity: string): string;
  function  DSiValidateProcessAffinityMask(affinityMask: DWORD): DWORD;
  function  DSiValidateThreadAffinity(affinity: string): string;
  function  DSiValidateThreadAffinityMask(affinityMask: DWORD): DWORD;

{ Memory }

  procedure DSiFreePidl(pidl: PItemIDList);
  procedure DSiFreeMemAndNil(var mem: pointer);

{ Windows }

  procedure DSiDisableX(hwnd: THandle);
  procedure DSiEnableX(hwnd: THandle);
  function  DSiForceForegroundWindow(hwnd: THandle;
    restoreFirst: boolean = true): boolean;
  function  DSiGetClassName(hwnd: THandle): string;
  function  DSiGetProcessWindow(targetProcessID: cardinal): HWND;
  function  DSiGetWindowText(hwnd: THandle): string;
  procedure DSiProcessMessages(hwnd: THandle; waitForWMQuit: boolean = false);
  procedure DSiRebuildDesktopIcons;
  procedure DSiRefreshDesktop;
  procedure DSiSetTopMost(hwnd: THandle; onTop: boolean = true;
    activate: boolean = false);

{ Taskbar }

  function  DSiGetTaskBarPosition: integer;

{ Menus }

  function  DSiGetHotkey(const item: string): char;
  function  DSiGetMenuItem(menu: HMENU; item: integer): string;

{ Screen }

  procedure DSiDisableScreenSaver(out currentlyActive: boolean);
  procedure DSiEnableScreenSaver;
  function  DSiGetBitsPerPixel: integer;
  function  DSiGetBPP: integer;
  function  DSiGetDesktopSize: TRect;
  function  DSiIsFullScreen: boolean;
  procedure DSiMonitorOff;
  procedure DSiMonitorOn;
  procedure DSiMonitorStandby;
  function  DSiSetScreenResolution(width, height: integer): longint;

{ Information }

type
  TDSiBootType = (btNormal, btFailSafe, btFailSafeWithNetwork, btUnknown);
  TDSiWindowsVersion = (wvUnknown, wvWin31, wvWin95, wvWin95OSR2, wvWin98,
    wvWin98SE, wvWinME, wvWin9x, wvWinNT3, wvWinNT4, wvWin2000, wvWinXP,
    wvWinNT);

const
  CDSiWindowsVersionStr: array [TDSiWindowsVersion] of string = ('Unknown',
    'Windows 3.1', 'Windows 95', 'Windows 95 OSR 2', 'Windows 98',
    'Windows 98 SE', 'Windows Me', 'Windows 9x', 'Windows NT 3.5',
    'Windows NT 4', 'Windows 2000', 'Windows XP', 'Windows NT');

  function  DSiGetBootType: TDSiBootType;
  function  DSiGetCompanyName: string;
  function  DSiGetComputerName: string;
  function  DSiGetDefaultBrowser: string;
  function  DSiGetDirectXVer: string;
  function  DSiGetDiskLabel(disk: char): string;
  function  DSiGetDiskSerial(disk: char): string;
  function  DSiGetDomain: string;
  function  DSiGetFolderLocation(const CSIDL: integer): string;
  function  DSiGetMyDocumentsFolder: string;
  function  DSiGetProgramFilesFolder: string;
  function  DSiGetRegisteredOwner: string;
  function  DSiGetSystemFolder: string;
  function  DSiGetSystemVersion: string;
  function  DSiGetUserName: string;
  function  DSiGetUserNameEx: string;
  function  DSiGetWindowsFolder: string;
  function  DSiGetWindowsVersion: TDSiWindowsVersion;
  function  DSiIsAdminLoggedOn: boolean;
  function  DSiIsDiskInDrive(disk: char): boolean;
  function  DSiIsWinNT: boolean;

{ Install }

  function  DSiAddUninstallInfo(const displayName, uninstallCommand, publisher,
    URLInfoAbout, displayVersion, helpLink, URLUpdateInfo: string): boolean;
  function  DSiAutoRunApp(const applicationName, applicationPath: string;
    enabled: boolean = true): boolean;
  procedure DSiCreateShortcut(const fileName, displayName: string;
    folder: integer = CSIDL_STARTUP);
  function  DSiDeleteShortcut(const displayName: string;
    folder: integer = CSIDL_STARTUP): boolean;
  function  DSiGetUninstallInfo(const displayName: string;
    out uninstallCommand: string): boolean;
  function  DSiIsAutoRunApp(const applicationname: string): boolean;
  function  DSiRegisterActiveX(const fileName: string; registerDLL: boolean): HRESULT;
  procedure DSiRegisterRunOnce(const applicationName,
    applicationPath: string);
  procedure DSiRemoveRunOnce(const applicationName: string);
  function  DSiRemoveUninstallInfo(const displayName: string): boolean;
  function  DSiShortcutExists(const displayName: string;
    folder: integer = CSIDL_STARTUP): boolean;

{ Time }

  function  DSiElapsedSince(midTime, startTime: int64): int64;
  function  DSiElapsedTime(startTime: int64): int64;
  function  DSiHasElapsed(startTime: int64; timeout: DWORD): boolean;
  procedure DSiuSecDelay(delay: int64);

{ DynaLoad }

  function  DSi9xNetShareAdd(serverName: PChar; shareLevel: smallint;
    buffer: pointer; size: word): integer; stdcall;
  function  DSi9xNetShareDel(serverName: PChar; netName: PChar;
    reserved: word): integer; stdcall;
  function  DSiCloseServiceHandle(hSCObject: SC_HANDLE): BOOL; stdcall;
  function  DSiCreateProcessAsUser(hToken: THandle;
    lpApplicationName: PAnsiChar; lpCommandLine: PAnsiChar; lpProcessAttributes,
    lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL;
    dwCreationFlags: DWORD; lpEnvironment: pointer;
    lpCurrentDirectory: PAnsiChar; const lpStartupInfo: TStartupInfo;
    var lpProcessInformation: TProcessInformation): BOOL; stdcall;
  function  DSiImpersonateLoggedOnUser(hToken: THandle): BOOL; stdcall;
  function  DSiLogonUser(lpszUsername, lpszDomain, lpszPassword: LPCSTR;
    dwLogonType, dwLogonProvider: DWORD; var phToken: THandle): BOOL; stdcall;
  function  DSiNetApiBufferFree(buffer: pointer): cardinal; stdcall;
  function  DSiNetWkstaGetInfo(servername: PChar; level: cardinal;
    out bufptr: Pointer): cardinal; stdcall;
  function  DSiNTNetShareAdd(serverName: PChar; level: integer; buf: PChar;
    var parm_err: integer): DWord; stdcall;
  function  DSiNTNetShareDel(serverName: PChar; netName: PWideChar;
    reserved: integer): DWord; stdcall;
  function  DSiOpenSCManager(lpMachineName, lpDatabaseName: PChar;
    dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
  function  DSiRevertToSelf: BOOL; stdcall;
  function  DSiSHEmptyRecycleBin(Wnd: HWND; pszRootPath: PChar;
    dwFlags: DWORD): HRESULT; stdcall;

implementation

uses
  Messages,
  ShellAPI,
  ComObj,
  ActiveX,
  FileCtrl,
  TLHelp32;

type
  T9xNetShareAdd = function(serverName: PChar; shareLevel: smallint;
    buffer: pointer; size: word): integer; stdcall;
  T9xNetShareDel = function(serverName: PChar; netName: PChar;
    reserved: word): integer; stdcall;
  TCloseServiceHandle = function(hSCObject: SC_HANDLE): BOOL; stdcall;
  TCreateProcessAsUser = function(hToken: THandle;
    lpApplicationName: PAnsiChar; lpCommandLine: PAnsiChar; lpProcessAttributes,
    lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL;
    dwCreationFlags: DWORD; lpEnvironment: pointer;
    lpCurrentDirectory: PAnsiChar; const lpStartupInfo: TStartupInfo;
    var lpProcessInformation: TProcessInformation): BOOL; stdcall;
  TImpersonateLoggedOnUser = function(hToken: THandle): BOOL; stdcall;
  TLogonUser = function(lpszUsername, lpszDomain, lpszPassword: LPCSTR;
    dwLogonType, dwLogonProvider: DWORD; var phToken: THandle): BOOL; stdcall;
  TNetApiBufferFree = function(buffer: pointer): cardinal; stdcall;
  TNetWkstaGetInfo = function(servername: PChar; level: cardinal;
    out bufptr: Pointer): cardinal; stdcall;
  TNTNetShareAdd = function(serverName: PChar; level: integer; buf: PChar;
    var parm_err: integer): DWord; stdcall;
  TNTNetShareDel = function(serverName: PChar; netName: PWideChar;
    reserved: integer): DWord; stdcall;
  TOpenSCManager = function(lpMachineName, lpDatabaseName: PChar;
    dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
  TRevertToSelf = function: BOOL; stdcall;
  TSHEmptyRecycleBin = function(wnd: HWND; pszRootPath: PChar;
    dwFlags: DWORD): HRESULT; stdcall;

const
  G9xNetShareAdd: T9xNetShareAdd = nil;
  G9xNetShareDel: T9xNetShareDel = nil;
  GCloseServiceHandle: TCloseServiceHandle = nil;
  GCreateProcessAsUser: TCreateProcessAsUser = nil;
  GImpersonateLoggedOnUser: TImpersonateLoggedOnUser = nil;
  GLogonUser: TLogonUser = nil;
  GNetApiBufferFree: TNetApiBufferFree = nil;
  GNetWkstaGetInfo: TNetWkstaGetInfo = nil;
  GNTNetShareAdd: TNTNetShareAdd = nil;
  GNTNetShareDel: TNTNetShareDel = nil;
  GOpenSCManager: TOpenSCManager = nil;
  GRevertToSelf: TRevertToSelf = nil;
  GSHEmptyRecycleBin: TSHEmptyRecycleBin = nil;

{ Helpers }

  function FileOpenSafe(fileName: string; var fileHandle: textfile;
    diskRetryDelay, diskRetryCount: integer): boolean;
  var
    dum: integer;
  begin
    Assign (fileHandle, fileName);
    {$I-}
    repeat
      if FileExists(fileName) then
        Reset(fileHandle)
      else
        Rewrite (fileHandle);
      dum := IOResult;
      if (dum in [ERROR_SHARING_VIOLATION, ERROR_LOCK_VIOLATION]) and
         (diskRetryDelay > 0) then
      begin
        Sleep (diskRetryDelay);
        if diskRetryCount > 0 then Dec(diskRetryCount);
      end;
    until (not (dum in [ERROR_SHARING_VIOLATION, ERROR_LOCK_VIOLATION])) or
          (diskRetryCount = 0);
    {$I+}
    Result := (dum = 0);
  end; { FileOpenSafe }

{ Handles }

  {:Closes handle (if it is not already INVALID_HANDLE_VALUE) and sets it to
    INVALID_HANDLE_VALUE.
    @author  gabr
    @since   2002-11-25
  }
  procedure DSiCloseHandleAndInvalidate(var handle: THandle);
  begin
    if handle <> INVALID_HANDLE_VALUE then begin
      CloseHandle(handle);
      handle := INVALID_HANDLE_VALUE;
    end;
  end; { DSiCloseHandleAndInvalidate }

  {:Closes handle (if it is not already 0) and sets it to 0.
    @author  gabr
    @since   2002-11-25
  }
  procedure DSiCloseHandleAndNull(var handle: THandle);
  begin
    if handle <> 0 then begin
      CloseHandle(handle);
      handle := 0;
    end;
  end; { DSiCloseHandleAndNull }

  {:Shortcut for WaitForMultipleObjects with two objects.
    @author  gabr
    @since   2002-11-25
  }        
  function DSiWaitForTwoObjects(obj0, obj1: THandle; waitAll: boolean;
    timeout: DWORD): DWORD;
  var
    handles: array [0..1] of THandle;
  begin
    handles[0] := obj0;
    handles[1] := obj1;
    Result := WaitForMultipleObjects(2, @handles, waitAll, timeout);
  end; { DSiWaitForTwoObjects }

  {:Shortcut for WaitForMultipleObjectsEx with two objects.
    @author  gabr
    @since   2002-11-25
  }        
  function DSiWaitForTwoObjectsEx(obj0, obj1: THandle; waitAll: boolean;
    timeout: DWORD; alertable: boolean): DWORD;
  var
    handles: array [0..1] of THandle;
  begin
    handles[0] := obj0;
    handles[1] := obj1;
    Result := WaitForMultipleObjectsEx(2, @handles, waitAll, timeout, alertable);
  end; { DSiWaitForTwoObjectsEx }

  {:As Win32Check, only used for various handles.
    @author  gabr
    @since   2003-11-12
  }        
  function DSiWin32CheckHandle(handle: THandle): THandle;
  begin
    Win32Check(handle <> INVALID_HANDLE_VALUE);
    Result := handle;
  end; { TDSiRegistry.DSiWin32CheckHandle }

  {:Shortcut for MsgWaitForMultipleObjects with two objects.
    @author  gabr
    @since   2002-11-25
  }
  function DSiMsgWaitForTwoObjectsEx(obj0, obj1: THandle; timeout: DWORD;
    wakeMask: DWORD; flags: DWORD): DWORD;
  var
    handles: array [0..1] of THandle;
  begin
    handles[0] := obj0;
    handles[1] := obj1;
    Result := MsgWaitForMultipleObjectsEx(2, handles, timeout, wakeMask, flags);
  end; { DSiWaitForThreeObjects }

  {:Shortcut for WaitForMultipleObjects with three objects.
    @author  gabr
    @since   2002-11-25
  }
  function DSiWaitForThreeObjects(obj0, obj1, obj2: THandle; waitAll: boolean;
    timeout: DWORD): DWORD;
  var
    handles: array [0..2] of THandle;
  begin
    handles[0] := obj0;
    handles[1] := obj1;
    handles[2] := obj2;
    Result := WaitForMultipleObjects(3, @handles, waitAll, timeout);
  end; { DSiWaitForThreeObjects }

  {:Shortcut for WaitForMultipleObjectsEx with three objects.
    @author  gabr
    @since   2002-11-25
  }
  function DSiWaitForThreeObjectsEx(obj0, obj1, obj2: THandle; waitAll: boolean;
    timeout: DWORD; alertable: boolean): DWORD;
  var
    handles: array [0..2] of THandle;
  begin
    handles[0] := obj0;
    handles[1] := obj1;
    handles[2] := obj2;
    Result := WaitForMultipleObjectsEx(3, @handles, waitAll, timeout, alertable);
  end; { DSiWaitForThreeObjectsEx }

  {:Shortcut for MsgWaitForMultipleObjectsEx with three objects.
    @author  gabr
    @since   2002-11-25
  }        
  function DSiMsgWaitForThreeObjectsEx(obj0, obj1, obj2: THandle;
    timeout: DWORD; wakeMask: DWORD; flags: DWORD): DWORD;
  var
    handles: array [0..2] of THandle;
  begin
    handles[0] := obj0;
    handles[1] := obj1;
    handles[2] := obj2;
    Result := MsgWaitForMultipleObjectsEx(3, handles, timeout, wakeMask, flags);
  end; { DSiWaitForThreeObjectsEx }

{ Registry }

  {:Reads boolean value from the registry returning default value if name
    doesn't exist in the open key.
    @author  gabr
    @since   2002-11-25
  }
  function TDSiRegistry.ReadBool(const name: string; defval: boolean): boolean;
  begin
    try
      if GetDataSize(name) < 0 then
        Abort; // D4 does not generate an exception!
      ReadBool := inherited ReadBool(name);
    except ReadBool := defval; end;
  end; { TDSiRegistry.ReadBool }

  {:Reads date-time from the registry returning default value if name doesn't
    exist in the open key.
    @author  gabr
    @since   2002-11-25
  }
  function TDSiRegistry.ReadDate(const name: string; defval: TDateTime): TDateTime;
  begin
    try
      if GetDataSize(name) < 0 then
        Abort; // D4 does not generate an exception!
      ReadDate := inherited ReadDate(name);
    except ReadDate := defval; end;
  end; { TDSiRegistry.ReadDate }

  {:Reads TFont from the registry.
    @author  gabr
    @since   2002-11-25
  }        
  function TDSiRegistry.ReadFont(const name: string; font: TFont): boolean;
  var
    istyle: integer;
    fstyle: TFontStyles;
  begin
    Result := false;
    if GetDataSize(name) > 0 then begin
      font.Charset := ReadInteger(name+'_charset', font.Charset);
      font.Color   := ReadInteger(name+'_color', font.Color);
      font.Height  := ReadInteger(name+'_height', font.Height);
      font.Name    := ReadString(name, font.Name);
      font.Pitch   := TFontPitch(ReadInteger(name+'_pitch', Ord(font.Pitch)));
      font.Size    := ReadInteger(name+'_size', font.Size);
      fstyle := font.Style;
      istyle := 0;
      Move(fstyle, istyle, SizeOf(TFontStyles));
      istyle := ReadInteger(name+'_style', istyle);
      Move(istyle, fstyle, SizeOf(TFontStyles));
      font.Style := fstyle;
      Result := true;
    end;
  end; { TDSiRegistry.ReadFont }

  {:Reads integer from the registry returning default value if name doesn't
    exist in the open key.
    @author  gabr
    @since   2002-11-25
  }
  function TDSiRegistry.ReadInteger(const name: string; defval: integer): integer;
  begin
    try
      if GetDataSize(name) < 0 then
        Abort; // D4 does not generate an exception!
      if GetDataType(name) = rdInteger then
        Result := inherited ReadInteger(name)
      else
        Result := StrToIntDef(ReadString(name, IntToStr(defval)), defval);
    except ReadInteger := defval; end;
  end; { TDSiRegistry.ReadInteger }

  {:Reads 64-bit integer from the registry returning default value if name
    doesn't exist in the open key.
    @author  gabr
    @since   2002-11-25
  }
  function TDSiRegistry.ReadInt64(const name: string; defval: int64): int64;
  begin
    Result := StrToInt64Def(ReadString(name,'!'), defval);
  end; { TDSiRegistry.ReadInt64 }

  {:Reads string from the registry returning default value if name doesn't exist
    in the open key.
    @author  gabr
    @since   2002-11-25
  }
  function TDSiRegistry.ReadString(const name, defval: string): string;
  begin
    try
      if GetDataSize(name) < 0 then
        Abort; // D4 does not generate an exception!
      if GetDataType(name) = rdInteger then
        Result := IntToStr(inherited ReadInteger(name))
      else
        Result := inherited ReadString(name);
    except ReadString := defval; end;
  end; { TDSiRegistry.ReadString }

  {:Writes a MULTI_SZ value into the TStrings object.
    @author  Colin Wilson, borland.public.delphi.vcl.components.using
    @since   2003-10-02
  }
  procedure TDSiRegistry.ReadStrings(const name: string; strings: TStrings);
  var
    buffer   : PChar;
    p        : PChar;
    valueLen : DWORD;
    valueType: DWORD;
  begin
    strings.Clear;
    SetLastError(RegQueryValueEx(CurrentKey, PChar(name), nil, @valueType, nil,
      @valueLen));
    if GetLastError <> ERROR_SUCCESS then
      raise ERegistryException.CreateFmt('Unable read MULTI_SZ value. %s',
        [SysErrorMessage(GetLastError)])
    else if valueType <> REG_MULTI_SZ then
      raise ERegistryException.Create('String list expected.')
    else begin
      GetMem(buffer, valueLen);
      try
        RegQueryValueEx(CurrentKey, PChar(name), nil, nil, PByte(buffer),
          @valueLen);
        p := buffer;
        while p^ <> #0 do begin
          strings.Add(p);
          Inc (p, LStrLen(p) + 1);
        end
      finally FreeMem(buffer); end
    end;
  end; { TDSiRegistry.ReadStrings }

  {:Reads variant (string, integer, boolean, or date-time) from the registry
    returning default value if name doesn't exist in the open key.
    @author  gabr
    @since   2002-11-25
  }
  function TDSiRegistry.ReadVariant(const name: string; defval: variant): variant;
  begin
    case VarType(defval) of
      varInteger: Result := ReadInteger(name,defval);
      varBoolean: Result := ReadBool(name,defval);
      varString : Result := ReadString(name,defval);
      varDate   : Result := ReadDate(name,defval);
      else raise Exception.Create('TDSiRegistry.ReadVariant: Invalid value type!');
    end;
  end; { TDSiRegistry.ReadVariant }

  {:Writes 64-bit integer into the registry.
    @author  gabr
    @since   2002-11-25
  }
  procedure TDSiRegistry.WriteInt64(const name: string; value: int64);
  begin
    WriteString(name, IntToStr(value));
  end; { TDSiRegistry.WriteInt64 }

  {:Writes variant (string, integer, boolean, or date-time) into the registry.
    @author  gabr
    @since   2002-11-25
  }
  procedure TDSiRegistry.WriteVariant(const name: string; value: variant);
  begin
    case VarType(value) of
      varInteger: WriteInteger(name,value);
      varBoolean: WriteBool(name,value);
      varString : WriteString(name,value);
      varDate   : WriteDate(name,value);
      else raise Exception.Create('TDSiRegistry.WriteVariant: Invalid value type!');
    end;
  end; { TDSiRegistry.WriteVariant }

  {:Writes TFont into the registry.
    @author  gabr
    @since   2002-11-25
  }
  procedure TDSiRegistry.WriteFont(const name: string; font: TFont);
  var
    istyle: integer;
    fstyle: TFontStyles;
  begin
    WriteInteger(name+'_charset', font.Charset);
    WriteInteger(name+'_color', font.Color);
    WriteInteger(name+'_height', font.Height);
    WriteString(name, font.Name);
    WriteInteger(name+'_pitch', Ord(font.Pitch));
    WriteInteger(name+'_size', font.Size);
    fstyle := font.Style;
    istyle := 0;
    Move(fstyle, istyle, SizeOf(TFontStyles));
    WriteInteger(name+'_style', istyle);
  end; { TDSiRegistry.WriteFont }

  {:Writes TStrings into a MULTI_SZ value.
    @author  Colin Wilson, borland.public.delphi.vcl.components.using 
    @since   2003-10-02
  }        
  procedure TDSiRegistry.WriteStrings(const name: string; strings: TStrings);
  var
    buffer: PChar;
    i     : integer;
    p     : PChar;
    size  : DWORD;
  begin
    size := 0;
    for i := 0 to strings.Count - 1 do
      Inc(size, Length(strings[i]) + 1);
    Inc (size);
    GetMem (buffer, size);
    try
      p := buffer;
      for i := 0 to strings.count - 1 do begin
        LStrCpy(p, PChar(strings[i]));
        Inc(p, LStrLen(p) + 1);
      end;
      p^ := #0;
      SetLastError(RegSetValueEx(CurrentKey, PChar(name), 0, REG_MULTI_SZ,
        buffer, size));
      if GetLastError <> ERROR_SUCCESS then
        raise ERegistryException.CreateFmt('Unable to write MULTI_SZ value. %s',
          [SysErrorMessage(GetLastError)]);
    finally FreeMem(buffer); end
  end; { TDSiRegistry.WriteStrings }

  {:Creates a key in the registry.
    @author  gabr
    @since   2002-11-25
  }
  function DSiCreateRegistryKey(const registryKey: string; root: HKEY): boolean;
  begin
    Result := false;
    with TRegistry.Create do try
      RootKey := root;
      if OpenKey(registryKey, true) then begin
        CloseKey;
        Result := true;
      end;
    finally {TRegistry.}Free; end;
  end; { DSiCreateRegistryKey }

  {:Deletes a key with all subkeys from the registry.
    @author  gabr
    @since   2002-11-25
  }
  function DSiKillRegistry(const registryKey: string; root: HKEY): boolean;
  begin
    with TRegistry.Create do try
      RootKey := root;
      Result := DeleteKey(registryKey);
    finally {TRegistry.}  Free; end;
  end; { DSiKillRegistry }

  {:Reads 64-bit integer from the registry, returning default value if the
    specified name doesn't exist in the registry.
    @author  gabr
    @since   2002-11-25
  }
  function DSiReadRegistry(const registryKey, name: string; defaultValue: int64;
    root: HKEY): int64; overload;
  begin
    Result := defaultValue;
    try
      with TDSiRegistry.Create do try
        RootKey := root;
        if OpenKeyReadOnly(registryKey) then try
          Result := ReadInt64(name, defaultValue);
        finally CloseKey; end;
      finally {TDSiRegistry.}Free; end;
    except end;
  end; { DSiReadRegistry }

  {:Reads variant (string, integer, boolean, or date-time) from the registry,
    returning default value if the specified name doesn't exist in the registry.
    @author  gabr
    @since   2002-11-25
  }
  function DSiReadRegistry(const registryKey, name: string;
    defaultValue: Variant; root: HKEY): Variant;
  begin
    Result := defaultValue;
    try
      with TDSiRegistry.Create do try
        RootKey := root;
        if OpenKeyReadOnly(registryKey) then try
          Result := ReadVariant(name, defaultValue);
        finally CloseKey; end;
      finally {TDSiRegistry.}Free; end;
    except end;
  end; { DSiReadRegistry }

  {:Checks whether the specified registry key exists.
    @author  gabr
    @since   2002-11-25
  }        
  function DSiRegistryKeyExists(const registryKey: string;
    root: HKEY): boolean;
  begin
    with TRegistry.Create do try
      RootKey := root;
      Result := KeyExists(registryKey);
    finally {TRegistry.}Free; end;
  end; { DSiRegistryKeyExists }

  {:Writes 64-bit integer into the registry.
    @author  gabr
    @since   2002-11-25
  }        
  function DSiWriteRegistry(const registryKey, name: string; value: int64;
    root: HKEY): boolean; overload;
  begin
    Result := false;
    try
      with TDSiRegistry.Create do try
        RootKey := root;
        if OpenKey(registryKey, true) then try
          WriteInt64(name, value);
          Result := true;
        finally CloseKey; end;
      finally {TDSiRegistry.}Free; end;
    except end;
  end; { DSiWriteRegistry }

  {:Writes variant (string, integer, boolean, or date-time) into the registry.
    @author  gabr
    @since   2002-11-25
  }        
  function DSiWriteRegistry(const registryKey, name: string; value: Variant;
    root: HKEY): boolean; overload;
  begin
    Result := false;
    try
      with TDSiRegistry.Create do try
        RootKey := root;
        if OpenKey(registryKey, true) then try
          WriteVariant(name, value);
          Result := true;
        finally CloseKey; end;
      finally {TDSiRegistry.}Free; end;
    except end;
  end; { DSiWriteRegistry }

{ Files }

  {:Creates folder with the unique name under the temporary folder.
    @author  Miha-R
    @since   2002-11-25
  }
  function DSiCreateTempFolder: string;
  var
    GUID: TGUID;
  begin
    OleCheck(CoCreateGUID(GUID));
    Result := DSiGetTempPath + GUIDToString(GUID);
    ForceDirectories(Result);
  end; { DSiCreateTempFolder }

  {:Deletes files matching file mask.
    @author  gabr
    @since   2002-12-19
  }
  procedure DSiDeleteFiles(const folder, fileMask: string);
  var
    err     : integer;
    folderBk: string;
    S       : TSearchRec;
  begin                
    folderBk := IncludeTrailingBackslash(folder);
    err := FindFirst(folderBk+fileMask, 0, S);
    if err = 0 then begin
      repeat
        DSiKillFile(folderBk+S.Name);
        err := FindNext(S);
      until err <> 0;
      FindClose(S);
    end;
  end; { DSiDeleteFiles }

  {gp}
  function DSiDeleteOnReboot(const fileName: string): boolean;
  begin
    Result := DSiMoveOnReboot(fileName, '');
  end; { DSiDeleteOnReboot }

  {gp}
  procedure DSiDeleteTree(const folder: string; removeSubdirsOnly: boolean);

    procedure DeleteTree(const folder: string; depth: integer; delete0: boolean);
    var
      err: integer;
      s  : TSearchRec;
    begin
      err := FindFirst(IncludeTrailingBackslash(folder)+'*.*',faDirectory,S);
      if err = 0 then begin
        repeat
          if (S.Attr and faDirectory) <> 0 then
            if (S.Name <> '.') and (S.Name <> '..') then
              DeleteTree(IncludeTrailingBackslash(folder)+S.Name, depth+1, delete0);
          err := FindNext(S);
        until err <> 0;
        FindClose(S);
      end;
      if (depth > 0) or delete0 then
        DSiRemoveFolder(folder);
    end; { DeleteTree }
    
  begin { DSiDeleteTree }
    DeleteTree(folder, 0, not removeSubdirsOnly);
  end; { DSiDeleteTree }

  {gp}
  function DSiDeleteWithBatch(const fileName: string; rmDir: boolean): boolean;
  // Idea stollen from the article by Jeffrey Richter, first published in
  // Microsoft Systems Journal, reprinted in Microsoft Developer Network.
  // Simple but effective solution: create batch file that deletes exe and then
  // deletes itself, then run it as an invisible console app with low priority.
  var
    bat    : text;
    tmpFile: string;
    si     : TStartupInfo;
    pi     : TProcessInformation;
  begin
    Result := false;
    try
      tmpFile := ChangeFileExt(DSiGetTempFileName('wt'),'.bat');
      if tmpFile <> '' then begin
        Assign(bat,tmpFile);
        Rewrite(bat);
        Writeln(bat,':repeat');
        Writeln(bat,'del "',fileName,'"');
        Writeln(bat,'if exist "',fileName,'" goto repeat');
        if rmDir
          then Writeln(bat,'rmdir "',ExtractFilePath(fileName),'"');
        Writeln(bat,'del ',tmpFile);
        Close(bat);
        FillChar(si,SizeOf(si),0);
        si.cb := SizeOf(si);
        si.dwFlags := STARTF_USESHOWWINDOW;
        si.wShowWindow := SW_HIDE;
        if (CreateProcess(nil, PChar(tmpFile), nil, nil, false,
          CREATE_SUSPENDED or IDLE_PRIORITY_CLASS, nil,
          PChar(ExtractFilePath(tmpFile)), si, pi))
        then begin
          SetThreadPriority(pi.hThread, THREAD_PRIORITY_IDLE);
          CloseHandle(pi.hProcess);
          ResumeThread(pi.hThread);
          CloseHandle(pi.hThread);
          Result := true;
        end;
      end;
    except end;
  end; { DSiDeleteWithBatch }

  {gp}
  function DSiEjectMedia(deviceLetter: char): boolean;
  var
    cd : THandle;
    ret: DWORD;
  begin
    Result := false;
    cd := CreateFile(PChar('\\.\'+deviceLetter+':'), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
    if cd <> INVALID_HANDLE_VALUE then begin
      Result := DeviceIoControl(cd, IOCTL_STORAGE_EJECT_MEDIA, nil, 0, nil, 0, ret, nil);
      CloseHandle(cd);
    end;
  end; { DSiLoadMedia }

  {:Deletes all files in the folder.
    @author  gabr
    @since   2002-12-19
  }
  procedure DSiEmptyFolder(const folder: string);
  begin
    DSiDeleteFiles(folder, '*.*');
  end; { DSiEmptyFolder }

  {:Empties recycle bin.
    @author  ales
    @since   2002-12-19
  }
  function DSiEmptyRecycleBin: boolean;
  begin
    Result := DSiSHEmptyRecycleBin(0, nil,
      SHERB_NOCONFIRMATION OR SHERB_NOPROGRESSUI OR SHERB_NOSOUND) = S_OK;
  end; { DSiEmptyRecycleBin }

  {:Enumerates all files matching given mask and attribute and calls
    callback method for each file.
    @returns Number of files enumerated.
    @author  gabr
    @since   2003-06-17
  }        
  function DSiEnumFiles(const fileMask: string; attr: integer;
    enumCallback: TDSiEnumFilesCallback): integer;
  var
    err   : integer;
    folder: string;
    S     : TSearchRec;
  begin
    Result := 0;
    folder := IncludeTrailingBackslash(ExtractFilePath(fileMask));
    err := FindFirst(fileMask, attr, S);
    if err = 0 then try
      repeat
        enumCallback(folder+S.Name);
        Inc(Result);
        err := FindNext(S);
      until err <> 0;
    finally FindClose(S); end;
  end; { DSiEnumFiles }

  procedure _DSiEnumFilesEx(const folder, fileMask: string; attr: integer;
    enumSubfolders: boolean; enumCallback: TDSiEnumFilesExCallback;
    var totalFiles: integer; var stopEnum: boolean);
  var
    err: integer;
    s  : TSearchRec;
  begin
    if enumSubfolders then begin
      err := FindFirst(folder+'*.*',faDirectory,S);
      if err = 0 then try
        repeat
          if (S.Attr and faDirectory) <> 0 then
            if (S.Name <> '.') and (S.Name <> '..') then begin
              enumCallback(folder, S, true, stopEnum);
              if stopEnum then
                Exit;
              _DSiEnumFilesEx(folder+S.Name+'\', fileMask, attr, enumSubfolders,
                enumCallback, totalFiles, stopEnum);
            end;
          err := FindNext(S);
        until (err <> 0) or stopEnum;
      finally FindClose(S); end;
    end;
    if stopEnum then
      Exit;
    err := FindFirst(folder+fileMask, attr, S);
    if err = 0 then try
      repeat
        enumCallback(folder, S, false, stopEnum);
        Inc(totalFiles);
        err := FindNext(S);
      until (err <> 0) or stopEnum;
    finally FindClose(S); end;
  end; { _DSiEnumFilesEx }

  {:Enumerates all files matching given mask and attribute and calls callback
    method for each file. Optionally descends into subfolders.
    @returns Number of files (not folders!) enumerated.
    @author  gabr
    @since   2003-06-17
  }
  function DSiEnumFilesEx(const fileMask: string; attr: integer;
    enumSubfolders: boolean; enumCallback: TDSiEnumFilesExCallback): integer;
  var
    folder  : string;
    mask    : string;
    stopEnum: boolean;
  begin
    mask := fileMask;
    folder := ExtractFilePath(mask);
    Delete(mask, 1, Length(folder));
    if folder <> '' then
      folder := IncludeTrailingBackslash(folder);
    Result := 0;
    stopEnum := false;
    _DSiEnumFilesEx(folder, mask, attr, enumSubfolders, enumCallback, Result, stopEnum);
  end; { DSiEnumFilesEx }

  {:Retrieves file size.
    @returns -1 for unexisting/unaccessible file or file size.
    @author  gabr.
    @since   2003-06-17
  }
  function DSiFileSize(const fileName: string): int64;
  var
    fHandle: DWORD;
  begin
    fHandle := CreateFile(PChar(fileName), 0, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if fHandle = INVALID_HANDLE_VALUE then
      Result := -1
    else try
      Int64Rec(Result).Lo := GetFileSize(fHandle, @Int64Rec(Result).Hi);
    finally CloseHandle(fHandle); end;
  end; { DSiFileSize }

  {:Returns temporary file name, either in the specified path or in the default temp path
    (if 'tempPath' is empty).
    @author  Miha-R
    @since   2002-11-25
  }
  function DSiGetTempFileName(const prefix, tempPath: string): string;
  var
    tempFileName: PChar;
    useTempPath : string;
  begin
    Result := '';
    GetMem(tempFileName, MAX_PATH);
    try
      if tempPath = '' then
        useTempPath := DSiGetTempPath
      else
        useTempPath := tempPath;
      GetTempFileName(PChar(useTempPath), PChar(prefix), 0, tempFileName);
      Result := StrPas(tempFileName);
    finally FreeMem(tempFileName, MAX_PATH); end;
  end; { DSiGetTempFileName }

  {:Returns path designated for temporary files.
    @author  Miha-R
    @since   2002-11-25
  }
  function DSiGetTempPath: string;
  var
    tempPath: PChar;
  begin
    GetMem(tempPath, MAX_PATH);
    try
      GetTempPath(MAX_PATH, tempPath);
      Result := StrPas(tempPath);
    finally FreeMem(tempPath, MAX_PATH); end;
  end; { DSiGetTempPath }

  {:Returns unique file name with the specified extension.
    @author  Miha-R
    @since   2002-11-25
  }
  function DSiGetUniqueFileName(const extension: string): string;
  var
    GUID: TGUID;
  begin
    OleCheck(CoCreateGUID(GUID));
    Result := Copy(GUIDToString(GUID), 2, 36) + Extension;
  end; { DSiGetUniqueFileName }

  {:Deletes file, even if it is readonly.
    @author  gabr
    @since   2002-11-25
  }
  function DSiKillFile(const fileName: string): boolean;
  var
    oldAttr: DWORD;
  begin
    if not FileExists(fileName) then
      Result := true
    else begin
      oldAttr := GetFileAttributes(PChar(fileName));
      SetFileAttributes(PChar(fileName), 0);
      Result := DeleteFile(fileName);
      if not Result then
        SetFileAttributes(PChar(fileName), oldAttr);
    end;
  end; { DSiKillFile }

  {gp}
  function DSiLoadMedia(deviceLetter: char): boolean;
  var
    cd : THandle;
    ret: DWORD;
  begin
    Result := false;
    cd := CreateFile(PChar('\\.\'+deviceLetter+':'), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
    if cd <> INVALID_HANDLE_VALUE then begin
      Result := DeviceIoControl(cd, IOCTL_STORAGE_LOAD_MEDIA, nil, 0, nil, 0, ret, nil);
      CloseHandle(cd);
    end;
  end; { DSiLoadMedia }

  {gp}
  function DSiMoveOnReboot(const srcName, destName: string): boolean;
  var
    wfile: string;
    winit: text;
    wline: string;
    cont : TStringList;
    i    : integer;
    found: boolean;
    dest : PChar;
  begin
    if destName = '' then
      dest := nil
    else
      dest := PChar(destName);
    Result := MoveFileEx(PChar(srcName), dest, MOVEFILE_DELAY_UNTIL_REBOOT);
    if not Result then begin
      // not NT, write a Rename entry to WININIT.INI
      wfile := DSiGetWindowsFolder+'\wininit.ini';
      if FileOpenSafe(wfile,winit,500,120{one minute}) then begin
        try
          cont := TStringList.Create;
          try
            Reset(winit);
            while not Eof(winit) do begin
              Readln(winit,wline);
              cont.Add(wline);
            end; //while
            if destName = '' then
              wline := 'NUL='+srcName
            else
              wline := destName+'='+srcName;
            found := false;
            for i := 0 to cont.Count - 1 do begin
              if UpperCase(cont[i]) = '[RENAME]' then begin
                cont.Insert(i+1,wline);
                found := true;
                break;
              end;
            end; //for
            if not found then begin
              cont.Add('[Rename]');
              cont.Add(wline);
            end;
            Rewrite(winit);
            for i := 0 to cont.Count - 1 do
              Writeln(winit,cont[i]);
            Result := true;
          finally cont.Free; end;
        finally Close(winit); end;
      end;
    end;
  end; { DSiMoveOnReboot }

  {:Deletes all files and folders in the specified folder (recursively), then deletes the
    folder.
    @author  gabr
    @since   2002-12-19
  }
  procedure DSiRemoveFolder(const folder: string);
  begin
    DSiEmptyFolder(folder);
    if DirectoryExists(folder) then
      RemoveDir(folder);
  end; { DSiRemoveFolder }

  {ales}
  function DSiShareFolder(const folder, shareName, comment: string): boolean;
  var
    ntComment   : WideString;
    ntFolder    : WideString;
    ntShareName : WideString;
    paramError  : integer;
    shareInfo9x : SHARE_INFO_50_9x;
    shareInfoNT : SHARE_INFO_2_NT;
    w9xShareName: string;
  begin
    if folder = '' then
      raise Exception.Create('DSiShareFolder: empty folder');
    if shareName = '' then
      raise Exception.Create('DSiShareFolder: empty share name');
    if DSiIsWinNT then begin
      ntFolder := folder;
      ntShareName := shareName;
      ntComment := comment;
      with ShareInfoNT do begin
        shi2_NetName := PWideChar(ntShareName);
        shi2_Type := STYPE_DISKTREE;
        shi2_Remark := PWideChar(ntComment);
        shi2_Permissions := 0;
        shi2_Max_Uses := -1;
        shi2_Current_Uses := 0;
        shi2_Path := PWideChar(ntFolder);
        shi2_Passwd := nil;
      end;
      ParamError := 0;
      Result := (DSiNTNetShareAdd(nil, 2, @ShareInfoNT, paramError) = 0);
    end
    else begin
      with ShareInfo9x do begin
        FillChar(shi50_NetName, 13, 0);
        w9xShareName := Copy(shareName, 1, 13);
        Move(w9xShareName[1], shi50_NetName[1], Length(w9xShareName));
        shi50_Type := STYPE_DISKTREE;
        shi50_Remark := PChar(comment);
        shi50_rw_password[1] := #0;
        shi50_ro_password[1] := #0;
        shi50_flags := SHI50F_FULL;
        shi50_Path := PChar(ANSIUpperCase(folder));
      end;
      Result := (DSi9xNetShareAdd(nil, 50, @ShareInfo9x, SizeOf(SHARE_INFO_50_9x)) = 0);
    end;
  end; { DSiShareFolder }

  {ales}
  function DSiUnShareFolder(const shareName: string): boolean;
  var
    ntShareName: WideString;
  begin
    if DSiIsWinNT then begin
      ntShareName := shareName;
      Result := (DSiNTNetShareDel(nil, PWideChar(ntShareName), 0) = 0);
    end
    else
      Result := (DSi9xNetShareDel(nil, PChar(shareName), 0) = 0);
  end; { DSiUnShareFolder }

{ Processes }

  {:Convert affinity mask into a string representation (0..9, A..V).
    @author  gabr
    @since   2003-11-14
  }        
  function DSiAffinityMaskToString(affinityMask: DWORD): string;
  var
    idxID: integer;
  begin
    Result := '';
    for idxID := 1 to 32 do begin
      if Odd(affinityMask) then
        Result := Result + DSiCPUIDs[idxID];
      affinityMask := affinityMask SHR 1;
    end;
  end; { DSiAffinityMaskToString }

  {:Enables specified privilege for the current process.
    @author  Gre-Gor
    @since   2004-02-12
  }
  function DSiEnablePrivilege(const privilegeName: string): boolean;
  var
    hToken   : DWORD;
    retLength: DWORD;
    tokenPriv: TTokenPrivileges;
  begin
    Result := false;
    if not OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
      Exit;
    try
      tokenPriv.PrivilegeCount := 1;
      if not LookupPrivilegeValue(nil, PChar(privilegeName), tokenPriv.Privileges[0].Luid) then
        Exit;
      tokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      if not AdjustTokenPrivileges(hToken, false, tokenPriv, SizeOf(tokenPriv), nil, retLength) then
        Exit;
      Result := true;
    finally CloseHandle(hToken); end;
  end; { DSiEnablePrivilege }

  {mr}
  // Returns MaxInt if CreateProcess fails or process exit code if wait is specified or 0 in other cases.
  function DSiExecute(const commandLine: string;
    visibility: integer; const workDir: string; wait: boolean): cardinal;
  var
    processInfo: TProcessInformation;
    startupInfo: TStartupInfo;
    useWorkDir : string;
  begin
    if workDir = '' then
      GetDir(0, useWorkDir)
    else
      useWorkDir := workDir;
    FillChar(startupInfo, SizeOf(startupInfo), #0);
    startupInfo.cb := SizeOf(startupInfo);
    startupInfo.dwFlags := STARTF_USESHOWWINDOW;
    startupInfo.wShowWindow := visibility;
    if not CreateProcess(nil, PChar(commandLine), nil, nil, false,
             CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
             PChar(useWorkDir), startupInfo, processInfo)
    then
      Result := MaxInt
    else begin
      if wait then begin
        WaitForSingleObject(processInfo.hProcess, INFINITE);
        GetExitCodeProcess(processInfo.hProcess, Result);
      end
      else
        Result := 0;
      CloseHandle(processInfo.hProcess);
      CloseHandle(processInfo.hThread);
    end;
  end; { DSiExecute }

  {gp}
  // Executes process as another user. Same as DSiExecute on 9x architecture.
  // Returns MaxInt if any Win32 API fails or process exit code if wait is specified or 0 in other cases.
  function DSiExecuteAsUser(const commandLine, username, password,
    domain: string; visibility: integer; const workDir: string;
    wait: boolean): cardinal;
  var
    lastError  : DWORD;
    logonHandle: THandle;
    processInfo: TProcessInformation;
    startupInfo: TStartupInfo;
    useWorkDir : string;
  begin
    if not DSiIsWinNT then
      Result := DSiExecute(commandLine, visibility, workDir, wait)
    else begin
      Result := MaxInt;
      if DSiLogonUser(PChar(username), PChar(domain), PChar(password),
           LOGON32_LOGON_INTERACTIVE, LOGON32_PROVIDER_DEFAULT, logonHandle) then
      begin
        if workDir = '' then
          GetDir(0, useWorkDir)
        else
          useWorkDir := workDir;
        FillChar(startupInfo, SizeOf(startupInfo), #0);
        startupInfo.cb := SizeOf(startupInfo);
        startupInfo.dwFlags := STARTF_USESHOWWINDOW;
        startupInfo.wShowWindow := visibility;
        if not DSiCreateProcessAsUser(logonHandle, nil, PChar(commandLine), nil,
             nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
             PChar(useWorkDir), startupInfo, processInfo)
        then
          Result := MaxInt
        else begin
          if wait then begin
            WaitForSingleObject(processInfo.hProcess, INFINITE);
            GetExitCodeProcess(processInfo.hProcess, Result);
          end
          else
            Result := 0;
          CloseHandle(processInfo.hProcess);
          CloseHandle(processInfo.hThread);
        end;
        lastError := GetLastError;
        CloseHandle(logonHandle);
        SetLastError(lastError);
      end;
    end;
  end; { DSiExecuteAsUser }

  {:Executes console process in a hidden window and captures its output in a TStrings
    object.
    @returns ID of the console process or 0 if process couldn't be started.
    @author  aoven, Lee_Nover, gabr
    @since   2003-05-24
  }
  function DSiExecuteAndCapture(const app: string; output: TStrings;
    const workDir: string): cardinal;
  const
    StartBufSize = 1024;
  var
    bAvail     : longword;
    bRead      : longword;
    buffer     : pointer;
    exitCode   : longword;
    iBufSize   : cardinal;
    last       : string;
    newStdIn   : THandle;
    newStdOut  : THandle;
    pBuf       : PChar;
    PI         : TProcessInformation;
    pSentinel  : PChar;
    read_StdOut: THandle;
    SA         : TSecurityAttributes;
    SD         : TSecurityDescriptor;
    SI         : STARTUPINFO;
    str        : string;
    useWorkDir : string;
    write_StdIn: THandle;
  begin
    Result := 0;
    buffer := nil;
    write_StdIn := 0;
    read_StdOut := 0;
    newStdOut := 0;
    newStdIn := 0;
    ZeroMemory(@PI, SizeOf(PI));
    ZeroMemory(@SA, SizeOf(SA));
    try
      { Za Windows NT  inicializiraj security descriptor. }
      if DSiIsWinNT then begin
        InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION);
        SetSecurityDescriptorDacl(@SD, true, nil, false);
        SA.lpSecurityDescriptor := @SD;
      end
      else
        SA.lpSecurityDescriptor := nil;
      SA.nLength := SizeOf(TSecurityAttributes);
      SA.bInheritHandle := true; // dovoli dedovanje handlov
      { Ustvari nov stdin pipe. }
      if not CreatePipe(newStdIn, write_StdIn, @SA, 0) then
        Exit;
      { Ustvari nov stout pipe. }
      if not CreatePipe(read_StdOut, newStdOut, @SA, 0) then
        Exit;
      { Nastavi parametre novega procesa. }
      ZeroMemory(@SI, SizeOf(TStartupInfo));
      SI.cb := SizeOf(TStartupInfo);
      SI.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      SI.wShowWindow := SW_HIDE;
      SI.hStdOutput := newStdOut;
      SI.hStdError := newStdOut;
      SI.hStdInput := newStdIn;
      if workDir = '' then
        GetDir(0, useWorkDir)
      else
        useWorkDir := workDir;
      { Startaj proces. }
      if not CreateProcess(nil, PChar(app), nil, nil, true,
               NORMAL_PRIORITY_CLASS, nil, PChar(useWorkDir), SI, PI)
      then
        Exit;
      Result := PI.hProcess;
      last := ''; // buffer za shranjevanje nedokoncanih vrstic (brez zakljucnega CRLF)
      iBufSize := StartBufSize;
      buffer := AllocMem(iBufSize);
      try
        GetExitCodeProcess(PI.hProcess, exitCode);
        while exitCode = STILL_ACTIVE do begin
          { Poglej, ce je na stdout pipi kaj podatkov. }
          PeekNamedPipe(read_StdOut, buffer, iBufSize, @bRead, @bAvail, nil);
          if (bRead > 0) then begin
            if (iBufSize < bAvail) then begin // ce je buffer premajhen, ga povecaj
              iBufSize := bAvail;
              ReallocMem(buffer, iBufSize);
            end;
            ZeroMemory(buffer, iBufSize); // pocisti buffer
            ReadFile(read_StdOut, buffer^, iBufSize, bRead, nil); // preberi stdout pipe
            str := last; // shrani prejsnjo nedokoncano vrstico
            pBuf := buffer;
            pSentinel := pBuf;
            Inc(pSentinel, bRead);
            while (pBuf < pSentinel) do begin
              case pBuf^ of
                #0: Inc(pBuf);
                #10:
                  begin // konec vrstice
                    Inc(pBuf);
                    Output.Add(Str);
                    str := '';
                  end; //#10
                #13:
                  begin
                    Inc(pBuf);
                    if (pBuf < pSentinel) and (pBuf^ = #10) then
                      Inc(pBuf); // preskoci, ker je to konec vrstice
                    Output.Add(Str);
                    str := '';
                  end; //#13
                else begin
                  str := str + pBuf^; // shrani prebrani znak
                  Inc(pBuf);
                end; //else
              end; //case
            end;
            last := str; // shrani morebitno nedokon?ano vrstico
          end;
          Sleep(1); // pavza
          GetExitCodeProcess(PI.hProcess, exitCode);
        end;
      finally FreeMem(buffer, iBufSize); end;
      if (Last <> '') then
        Output.Add(Last); // poslji zadnjo vrstico tudi, ce ni bila dokoncana
    finally
      { Pocisti za sabo. }
      DSiCloseHandleAndNull(PI.hThread);
      DSiCloseHandleAndNull(PI.hProcess);
      DSiCloseHandleAndNull(NewStdIn);
      DSiCloseHandleAndNull(NewStdOut);
      DSiCloseHandleAndNull(Read_StdOut);
      DSiCloseHandleAndNull(Write_StdIn);
    end;
  end; { DSiExecuteAndCapture }

  {:Retrieves affinity mask of the current process as a list of CPU IDs (0..9,
    A..V).
    @author  gabr
    @since   2003-11-12
  }
  function DSiGetProcessAffinity: string;
  begin
    Result := DSiAffinityMaskToString(DSiGetProcessAffinityMask);
  end; { DSiGetProcessAffinity }

  {:Retrieves current process' affinity mask as a DWORD.
    @author  gabr
    @since   2003-11-14
  }        
  function DSiGetProcessAffinityMask: DWORD;
  var
    systemAffinityMask: DWORD;
  begin
    if not DSiIsWinNT then
      Result := 1
    else 
      GetProcessAffinityMask(GetCurrentProcess, Result, systemAffinityMask);
  end; { DSiGetProcessAffinityMask }

  {:Returns owner (user and domain) of the specified process. Requires Toolhelp API (e.g.
    non-NT4 OS).
    @author  Gre-Gor
    @since   2004-02-12
  }
  function DSiGetProcessOwnerInfo(const processName: string; var user,
    domain: string): boolean;
  var
    processID: DWORD;
  begin
    if not DSiGetProcessID(processName, processID) then
      Result := false
    else
      Result := DSiGetProcessOwnerInfo(processID, user, domain);
  end; { TDSiRegistry.DSiGetProcessOwnerInfo }

  procedure RetrieveSIDInfo(sid: PSID; var user, domain: string);
  var
    domainSize: DWORD;
    sidUse    : SID_NAME_USE;
    userSize  : DWORD;
  begin
    userSize := 257;
    domainSize := 257;
    SetLength(user, userSize);
    SetLength(domain, domainSize);
    if not LookupAccountSID(nil, sid, PChar(user), userSize, PChar(domain), domainSize, sidUse) then
      if GetLastError = ERROR_NONE_MAPPED then
        user := '?';
    user := PChar(user);
    domain := PChar(domain);
  end; { RetrieveSIDInfo }

  function GetOwnerName(descriptor: PSecurityDescriptor; var user,
    domain: string): boolean;
  var
    defaulted: BOOL;
    sid      : PSID;
  begin
    Result := false;
    if not GetSecurityDescriptorOwner(descriptor, sid, defaulted) then
      Exit;
    RetrieveSIDInfo(sid, user, domain);
    Result := true;
  end; { GetOwnerName }

  {:Returns owner (user and domain) of the specified process.
    @author  Gre-Gor
    @since   2004-02-12
  }
  function DSiGetProcessOwnerInfo(processID: DWORD; var user, domain: string): boolean;
  var
    descrSize    : DWORD;
    neededSize   : DWORD;
    process      : THandle;
    securityDescr: PSecurityDescriptor;
    tmpResult    : boolean;
  begin
    Result := false;
    if not DSiEnablePrivilege('SeDebugPrivilege') then
      Exit;
    process := OpenProcess(PROCESS_ALL_ACCESS, false, processID);
    try
      descrSize := 4096;
      neededSize := 0;
      securityDescr := AllocMem(descrSize);
      while true do begin
        tmpResult := GetKernelObjectSecurity(process, OWNER_SECURITY_INFORMATION,
          securityDescr, descrSize, neededSize);
        if tmpResult then begin
          if (neededSize > 0) and (descrSize <> neededSize) then begin
            descrSize := neededSize;
            ReallocMem(securityDescr, descrSize);
          end
          else begin
            Result := GetOwnerName(securityDescr, user, domain);
            break; //while
          end;
        end
        else if GetLastError <> ERROR_INSUFFICIENT_BUFFER then begin
          ReallocMem(securityDescr, 0);
          break; //while
        end;
      end;
    finally CloseHandle(process); end;
  end; { TDSiRegistry.DSiGetProcessOwnerInfo}

  {:Retrieves ID of the specified process. Requires Toolhelp API (e.g. non-NT4 OS).
    @returns False if ID cannot be retrieved. Check GetLastError - if it is 0, process
             doesn't exist; otherwise it contains the Win32 error code.
    @author  gabr
    @since   2004-02-12
  }
  function DSiGetProcessID(const processName: string; var processID: DWORD): boolean;
  var
    hSnapshot: THandle;
    procEntry: TProcessEntry32;
  begin
    Result := false;
    hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if hSnapshot = 0 then
      Exit;
    try
      procEntry.dwSize := Sizeof(procEntry);
      if not Process32First(hSnapshot, procEntry) then
        Exit;
      repeat
        if AnsiSameText(procEntry.szExeFile, processName) then begin
          processID := procEntry.th32ProcessID;
          Result := true;
          break; // repeat
        end;
      until not Process32Next(hSnapshot, procEntry);
    finally CloseHandle(hSnapshot); end;
  end; { DSiGetProcessID }

  {:Retrieves system affinity mask as a list of CPU IDs (0..9, A..V).
    @author  gabr
    @since   2003-11-12
  }
  function DSiGetSystemAffinity: string;
  begin
    Result := DSiAffinityMaskToString(DSiGetSystemAffinityMask);
  end; { DSiGetSystemAffinity }

  {:Retrieves system affinity mask as a DWORD.
    @author  gabr
    @since   2003-11-14
  }
  function DSiGetSystemAffinityMask: DWORD;
  var
    processAffinityMask: DWORD;
  begin
    if not DSiIsWinNT then
      Result := 1
    else 
      GetProcessAffinityMask(GetCurrentProcess, processAffinityMask, Result);
  end; { TDSiRegistry.DSiGetSystemAffinityMask }
  
  {:Retrieves affinity mask of the current thread as a list of CPU IDs (0..9,
    A..V).
    @author  gabr
    @since   2003-11-12
  }
  function DSiGetThreadAffinity: string;
  begin
    if not DSiIsWinNT then
      Result := '0'
    else
      Result := DSiAffinityMaskToString(DSiGetThreadAffinityMask);
  end; { DSiGetThreadAffinity }

  {:Retrieves affinity mask of the current thread as a DWORD.
    @author  gabr
    @since   2003-11-14
  }
  function DSiGetThreadAffinityMask: DWORD;
  var
    processAffinityMask: DWORD;
    systemAffinityMask : DWORD;
  begin
    if not DSiIsWinNT then
      Result := 1
    else begin
      GetProcessAffinityMask(GetCurrentProcess, processAffinityMask, systemAffinityMask);
      Result := SetThreadAffinityMask(GetCurrentThread, processAffinityMask);
      SetThreadAffinityMask(GetCurrentThread, Result);
    end;
  end; { DSiGetThreadAffinityMask }

  {gp}
  // Returns True if user can be impersonated. Always True on 9x architecture.
  function DSiImpersonateUser(const username, password, domain: string): boolean;
  var
    dsiDomain  : string;
    dsiUsername: string;
    lastError  : DWORD;
    logonHandle: THandle;
    posDomain  : integer;
  begin
    if not DSiIsWinNT then
      Result := true
    else begin
      Result := false;
      dsiDomain := domain;
      dsiUsername := username;
      if dsiDomain = '.' then begin
        posDomain := Pos('\', dsiUsername);
        if posDomain > 0 then begin
          dsiDomain := Copy(dsiUsername, 1, posDomain-1);
          Delete(dsiUsername, 1, posDomain);
        end;
      end;
      if DSiLogonUser(PChar(dsiUsername), PChar(dsiDomain), PChar(password),
           LOGON32_LOGON_INTERACTIVE, LOGON32_PROVIDER_DEFAULT, logonHandle) then
      begin
        Result := DSiImpersonateLoggedOnUser(logonHandle);
        lastError := GetLastError;
        CloseHandle(logonHandle);
        SetLastError(lastError);
      end;
    end;
  end; { DSiImpersonateUser }

  {mr}
  function DSiIsDebugged: boolean;
  var
    isDebuggerPresent: function: Boolean; stdcall;
    kernelHandle     : THandle;
    p                : pointer;
  begin
    kernelHandle := GetModuleHandle(kernel32);
    @isDebuggerPresent := GetProcAddress(kernelHandle, 'IsDebuggerPresent');
    if assigned(isDebuggerPresent) then // Win98+/NT4+ only
      Result := isDebuggerPresent
    else
    begin // Win9x uses thunk pointer outside the module when under a debugger
      p := GetProcAddress(kernelHandle, 'GetProcAddress');
      Result := (DWORD(p) < kernelHandle);
    end;
  end; { DSiIsDebugged }

  {ln}
  function DSiOpenURL(const URL: string; newBrowser: boolean): boolean;
  begin
    if NewBrowser then begin
      ShellExecute(0, nil, PChar(DSiGetDefaultBrowser), nil, nil, SW_SHOW);
      Sleep(500); // wait a bit to load the browser
    end;
    Result := (ShellExecute(0, nil, PChar(URL), nil, nil, SW_SHOW) > 32);
  end; { DSiOpenURL }

  {:Process all messages waiting in the current thread's message queue.
    @author  gabr
    @since   2003-08-25
  }        
  procedure DSiProcessThreadMessages;
  var
    msg: TMsg;
  begin
    while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) and (Msg.Message <> WM_QUIT) do begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end; { DSiProcessThreadMessages }
  
  {mr}
  function DSiRealModuleName: string;
  var
    FileName: array[0..MAX_PATH - 1] of Char;
  begin
    GetModuleFileName(HInstance, FileName, SizeOf(FileName));
    Result := string(FileName);
  end; { DSiRealModuleName }

  {:Sets current process' affinity mask.
    @param   affinity List of CPUs to include in the affinity mask (0..9, A..V).
                      May contain processors not available on the system or
                      processors already excluded from the current process'
                      affinity mask.
    @returns CPUs that were actually included in the affinity mask.
    @author  gabr
    @since   2003-11-12
  }
  function DSiSetProcessAffinity(affinity: string): string;
  begin
    SetProcessAffinityMask(GetCurrentProcess,
      DSiValidateProcessAffinityMask(DSiStringToAffinityMask(affinity)));
    Result := DSiGetProcessAffinity;
  end; { DSiSetProcessAffinity }

  {:Sets priority class for all processes with the given name. Requires Toolhelp API (e.g.
    non-NT4 OS).
    @param   priority See SetPriorityClass API function.
    @author  gabr
    @since   2004-02-12
  }
  function DSiSetProcessPriorityClass(const processName: string;
    priority: DWORD): boolean;
  var
    hSnapshot: THandle;
    procEntry: TProcessEntry32;
    process  : THandle;
  begin
    Result := false;
    hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if hSnapshot = 0 then
      Exit;
    procEntry.dwSize := Sizeof(procEntry);
    if not Process32First(hSnapshot, procEntry) then
      Exit;
    repeat
      if AnsiSameText(procEntry.szExeFile, processName) then begin
        process := OpenProcess(PROCESS_SET_INFORMATION, false, procEntry.th32ProcessID);
        if process = 0 then
          Exit;
        try
          SetPriorityClass(process, priority);
        finally DSiCloseHandleAndNull(process); end;
      end;
    until not Process32Next(hSnapshot, procEntry);
  end; { TDSiRegistry.DSiSetProcessPriortyClass }
  
  {:Sets current thread's affinity mask.
    @param   affinity List of CPUs to include in the affinity mask (0..9, A..V).
                      May contain processors not available on the system or
                      processors already excluded from the current process' or
                      thread's affinity mask.
    @returns CPUs that were actually included in the affinity mask.
    @author  gabr
    @since   2003-11-12
  }        
  function DSiSetThreadAffinity(affinity: string): string;
  begin
    SetThreadAffinityMask(GetCurrentThread,
      DSiValidateThreadAffinityMask(DSiStringToAffinityMask(affinity)));
    Result := DSiGetThreadAffinity;
  end; { DSiSetThreadAffinity }

  {gp}
  // Reverts back to the original program 'personae'. Does nothing on the 9x architecture.
  procedure DSiStopImpersonatingUser;
  begin
    if DSiIsWinNT then 
      DSiRevertToSelf;
  end; { DSiStopImpersonatingUser }

  {:Convert affinity list (0..9, A..V) to the DWORD mask.
    @author  gabr
    @since   2003-11-14
  }        
  function DSiStringToAffinityMask(affinity: string): DWORD;
  var
    idxID: integer;
  begin
    Result := 0;
    for idxID := 32 downto 1 do begin
      Result := Result SHL 1;
      if Pos(DSiCPUIDs[idxID], affinity) > 0 then
        Result := Result OR 1;
    end; //for
  end; { DSiStringToAffinityMask }

  {mr}
  procedure DSiTrimWorkingSet;
  var
    MainHandle: THandle;
  begin
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessId);
    try
      SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    finally
      CloseHandle(MainHandle);
    end;
  end; { DSiTrimWorkingSet }

  {:Validates process affinity mask (removes all CPUs that are not in the
    system affinity mask).
    @author  gabr
    @since   2003-11-14
  }
  function DSiValidateProcessAffinity(affinity: string): string;
  begin
    Result := DSiAffinityMaskToString(DSiValidateProcessAffinityMask(
                DSiStringToAffinityMask(affinity)));
  end; { DSiValidateProcessAffinity }

  {:Validates process affinity mask (removes all CPUs that are not in the
    system affinity mask).
    @author  gabr
    @since   2003-11-14
  }
  function DSiValidateProcessAffinityMask(affinityMask: DWORD): DWORD;
  begin
    Result := DSiGetSystemAffinityMask AND affinityMask;
  end; { TDSiRegistry.DSiValidateProcessAffinityMask }

  {:Validates process affinity mask (removes all CPUs that are not in the
    system affinity mask).
    @author  gabr
    @since   2003-11-14
  }
  function DSiValidateThreadAffinity(affinity: string): string;
  begin
    Result := DSiAffinityMaskToString(DSiValidateThreadAffinityMask(
                DSiStringToAffinityMask(affinity)));
  end; { DSiValidateThreadAffinityMask }

  function DSiValidateThreadAffinityMask(affinityMask: DWORD): DWORD;
  begin
    Result := DSiGetProcessAffinityMask AND affinityMask;
  end; { DSiValidateThreadAffinityMask }

{ Memory }

  {mr}
  procedure DSiFreePidl(pidl: PItemIDList);
  var
    allocator: IMalloc;
  begin
    if Succeeded(SHGetMalloc(allocator)) then begin
      allocator.Free(pidl);
  {$IFDEF VER90}
      allocator.Release;
  {$ENDIF}
    end;
  end; { DSiFreePidl }

  {:Frees memory allocated with GetMem and nils the pointer to the memory.
    Does nothing if pointer is already nil.
    @author: gp
    @since   2003-05-24
  }
  procedure DSiFreeMemAndNil(var mem: pointer);
  var
    tmp: pointer;
  begin
    if assigned(mem) then begin
      tmp := mem;
      mem := nil;
      FreeMem(tmp);
    end;
  end; { DSiFreeMemAndNil }

{ Windows }

  {:Disables 'X' button and Alt+F4.
    @author  aoven
    @since   2003-09-02
  }
  procedure DSiDisableX(hwnd: THandle);
  begin
    EnableMenuItem(GetSystemMenu(hwnd, false), SC_CLOSE, MF_BYCOMMAND or MF_DISABLED);
  end; { DSiDisableX }

  {:Enables 'X' button and Alt+F4.
    @author  gabr
    @since   2003-09-02
  }
  procedure DSiEnableX(hwnd: THandle);
  begin
    EnableMenuItem(GetSystemMenu(hwnd, false), SC_CLOSE, MF_BYCOMMAND or MF_ENABLED);
  end; { DSiDisableX }

  {gp}
  // TODO 1 -oPrimoz Gabrijelcic: Add WDJ trick
  function DSiForceForegroundWindow(hwnd: THandle; restoreFirst: boolean): boolean;
  var
    ForegroundThreadID: DWORD;
    ThisThreadID      : DWORD;
    timeout           : DWORD;
  begin
    if restoreFirst then
      if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);

    if GetForegroundWindow = hwnd then Result := true
    else begin

      // Windows 98/2000 doesn't want to foreground a window when some other
      // window has keyboard focus

      if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and (Win32MinorVersion > 0)))) then
      begin

        // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
        // Converted to Delphi by Ray Lischner
        // Published in The Delphi Magazine 55, page 16

        Result := false;
        ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
        ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
        if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then begin
          BringWindowToTop(hwnd); //IE 5.5 - related hack
          SetForegroundWindow(hwnd);
          AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
          Result := (GetForegroundWindow = hwnd);
        end;
        if not Result then begin

          // Code by Daniel P. Stasinski <dannys@karemor.com>

          SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
          SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0), SPIF_SENDCHANGE);
          BringWindowToTop(hwnd); //IE 5.5 - related hack
          SetForegroundWindow(hWnd);
          SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
        end;
      end
      else begin
        BringWindowToTop(hwnd); //IE 5.5 - related hack
        SetForegroundWindow(hwnd);
      end;

      Result := (GetForegroundWindow = hwnd);
    end;
  end; { DSiForceForegroundWindow }

  {gp}
  function DSiGetClassName(hwnd: THandle): string;
  var
    winClass: array [0..1024] of char;
  begin
    if GetClassName(hwnd, winClass, SizeOf(winClass)) <> 0 then
      Result := winClass
    else
      Result := '';
  end; { DSiGetClassName }

type
  TProcWndInfo = record
    TargetProcessID: DWORD;
    FoundWindow    : HWND;    
  end; { TProcWndInfo }
  PProcWndInfo = ^TProcWndInfo;

  function EnumGetProcessWindow(wnd: HWND; userParam: LPARAM): BOOL; stdcall;
  var
    wndProcessID: DWORD;
  begin
    GetWindowThreadProcessId(wnd, @wndProcessID);
    if wndProcessID = PProcWndInfo(userParam)^.TargetProcessID then begin
      PProcWndInfo(userParam)^.FoundWindow := Wnd;
      Result := false;
    end
    else
      Result := true;
  end; { EnumGetProcessWindow }

  {ln}
  function DSiGetProcessWindow(targetProcessID: cardinal): HWND;
  var
    procWndInfo: TProcWndInfo;
  begin
    procWndInfo.TargetProcessID := targetProcessID;
    procWndInfo.FoundWindow := 0;
    EnumWindows(@EnumGetProcessWindow, LPARAM(@procWndInfo));
    Result := procWndInfo.FoundWindow;
  end; { DSiGetProcessWindow }

  {gp}
  function DSiGetWindowText(hwnd: THandle): string;
  var
    winText: array [0..1024] of char;
  begin
    if GetWindowText(hwnd, winText, SizeOf(winText)) <> 0 then
      Result := winText
    else
      Result := '';
  end; { DSiGetWindowTextStr }

  {:Processes all waiting window messages.
    @author  gabr
    @since   2003-08-18
  }
  procedure DSiProcessMessages(hwnd: THandle; waitForWMQuit: boolean);
  var
    bGet: longint;
    msg : TMsg;
  begin
    if hwnd = 0 then
      Exit;
    repeat
      if not waitForWMQuit then begin
        if not PeekMessage(msg, hwnd, 0, 0, PM_REMOVE) then
          break; //repeat
      end
      else begin
        bGet := longint(GetMessage(msg, hwnd, 0, 0));
        if (bGet = 0) or (bGet = -1) then
          break; //repeat
      end;
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    until false;
  end; { DSiDeallocateHwnd }

  {xtreme}
  procedure DSiRebuildDesktopIcons;
  var
    dwResult: cardinal;
    oldSize : integer;
    registry: TRegistry;
  const
    CShellIconSize = 'Shell Icon Size';
    CTimeout = 10000;
  begin
    registry := TRegistry.Create;
    try
      if not registry.OpenKey('Control Panel\Desktop\WindowMetrics', false) then
        Exit;
      if registry.ValueExists(CShellIconSize) then
       oldSize := StrToInt(registry.ReadString(CShellIconSize))
      else
       oldSize := 0;
      registry.WriteString(CShellIconSize, IntToStr(oldSize + 1));
      SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE,
        SPI_SETNONCLIENTMETRICS, 0, SMTO_ABORTIFHUNG, CTimeout, dwResult);
      if oldSize > 0 then
        registry.WriteString(CShellIconSize, IntToStr(oldSize))
      else
        registry.DeleteValue(CShellIconSize);
      SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE,
        SPI_SETNONCLIENTMETRICS,0, SMTO_ABORTIFHUNG, CTimeout, dwResult);
      registry.CloseKey;
    finally FreeAndNil(registry);end;
  end; { DSiRebuildDesktopIcons }

  {xtreme}
  procedure DSiRefreshDesktop;
  var
    handleDesktop: HWND;
  begin
    handleDesktop := FindWindowEx(FindWindowEx(FindWindow('Progman',
      'Program Manager'), 0, 'SHELLDLL_DefView', ''), 0, 'SysListView32', '');
    PostMessage(handleDesktop, WM_DDE_FIRST, VK_F5, 0);
    PostMessage(handleDesktop, WM_DDE_LAST, VK_F5, 1 shl 31);
  end; { DSiRefreshDesktop }

  {ln}
  procedure DSiSetTopMost(hwnd: THandle; onTop, activate: boolean);
  const
    cTopMost : array [boolean] of THandle = (HWND_NOTOPMOST, HWND_TOPMOST);
    cActivate: array [boolean] of UINT    = (SWP_NOACTIVATE, 0);
  begin
    SetWindowPos(hwnd, cTopMost[OnTop], 0, 0, 0, 0,
      SWP_NOMOVE or SWP_NOSIZE or cActivate[Activate]);
  end; { DSiSetTopMost }

{ Taskbar }

  {ln}
  function DSiGetTaskBarPosition: integer;
  var
    pData: TAppBarData;
  begin
    Result := -1;
    pData.cbSize := SizeOf(TAppBarData);
    pData.hWnd := 0;
    if SHAppBarMessage(ABM_GETTASKBARPOS, pData) = 0 then
      Exit;
    Result := pData.uEdge;
  end; { DSiGetTaskBarPosition }

{ Menus }

  {gp}
  function DSiGetHotkey(const item: string): char;
  var
    item2: string;
    p    : integer;
  begin
    item2 := StringReplace(item, '&&', '&', [rfReplaceAll]);
    p := Pos('&', item2);
    if (p > 0) and (p < Length(item2)) then
      Result := UpCase(item2[p+1])
    else
      Result := #0;
  end; { DSiGetHotkey }

  {gp}
  function DSiGetMenuItem(menu: HMENU; item: integer): string;
  var
    res: integer;
    buf: array [0..1024] of char;
  begin
    res := GetMenuString(menu, item, buf, SizeOf(buf), MF_BYPOSITION);
    if res > 0 then
      Result := buf
    else
      Result := '';
  end; { DSiGetMenuItem }

{ Screen }

  {mr}
  procedure DSiDisableScreenSaver(out currentlyActive: boolean);
  var
    isActive: BOOL;
  begin
    SystemParametersInfo(SPI_GETSCREENSAVEACTIVE, 0, @isActive, 0);
    currentlyActive := isActive;
    if currentlyActive then
      SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, UINT(false), nil, SPIF_SENDWININICHANGE);
  end; { DSiDisableScreenSaver }

  {mr}
  procedure DSiEnableScreenSaver;
  begin
    SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, UINT(true), nil, SPIF_SENDWININICHANGE);
  end; { DSiEnableScreenSaver }

  {mr}
  function DSiGetBitsPerPixel: integer;
  var
    h: hDC;
  begin
    h := GetDC(0);
    try
      Result := GetDeviceCaps(h, BITSPIXEL);
    finally ReleaseDC(0, h); end;
  end; { DSiGetBitsPerPixel }

  {mr}
  function DSiGetBPP: integer;
  var
    DC: HDC;
  begin
    DC := GetDC(0);
    try
      Result := GetDeviceCaps(DC, BITSPIXEL) * GetDeviceCaps(DC, PLANES);
    finally ReleaseDC(0, DC); end;
  end; { DSiGetBPP }

  {mr}
  function DSiGetDesktopSize: TRect;
  begin
    SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0);
  end; { DSiGetDesktopSize }

  {ln}
  function DSiIsFullScreen: boolean;
  var
    desktopRect   : TRect;
    foregroundRect: TRect;
  begin
    Result :=
      GetWindowRect(GetForegroundWindow, foregroundRect)  and
      GetWindowRect(GetDesktopWindow, desktopRect)        and
      (not PtInRect(desktopRect, foregroundRect.TopLeft)) and
      (not PtInRect(desktopRect, foregroundRect.BottomRight));
  end; { DSiIsFullScreen }

  {ales}
  procedure DSiMonitorOff;
  begin
    SendMessage(GetForegroundWindow, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  end; { DSiMonitorOff }

  {ales}
  procedure DSiMonitorOn;
  begin
    SendMessage(GetForegroundWindow, WM_SYSCOMMAND, SC_MONITORPOWER, -1);
  end; { DSiMonitorOn }

  {gp}
  procedure DSiMonitorStandby;
  begin
    SendMessage(GetForegroundWindow, WM_SYSCOMMAND, SC_MONITORPOWER, 1);
  end; { DSiMonitorOff }

  {matijap}
  function DSiSetScreenResolution(width, height: integer): longint;
  var
    deviceMode: TDeviceMode;
  begin
    with deviceMode do begin
      dmSize := SizeOf(TDeviceMode);
      dmPelsWidth := width;
      dmPelsHeight := height;
      dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    end;
    Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
  end; { DSiSetScreenResolution }

{ Information }

  {ales, gp}
  function DSiGetBootType: TDSiBootType;
  var
    iBoot: integer;
  begin
    iBoot := GetSystemMetrics(SM_CLEANBOOT);
    if iBoot = 0 then
      Result := btNormal
    else if iBoot = 1 then
      Result := btFailSafe
    else if iBoot = 2 then
      Result := btFailSafeWithNetwork
    else
      Result := btUnknown;
  end; { DSiGetBootType }
  
  {ln}
  function DSiGetCompanyName: string;
  begin
    Result := DSiReadRegistry(DSiWinVerKeys[DSiIsWinNT],
      'RegisteredOrganization', '', HKEY_LOCAL_MACHINE);
  end; { DSiGetCompanyName }

  {mr}
  function DSiGetComputerName: string;
  var
    buffer    : PChar;
    bufferSize: DWORD;
  begin
    bufferSize := MAX_COMPUTERNAME_LENGTH+1;
    GetMem(buffer, bufferSize);
    try
      GetComputerName(buffer, bufferSize);
      Result := StrNew(buffer);
    finally FreeMem(buffer); end;
  end; { DSiGetComputerName }

  function GetParamStr(p: PChar; var param: string): PChar;
  var
    i, len: integer;
    start, s, q: PChar;
  begin
    while true do begin
      while (p[0] <> #0) and (p[0] <= ' ') do
        p := CharNext(p);
      if (p[0] = '"') and (p[1] = '"') then
        Inc(p, 2)
      else
        break; //while true
    end;
    len := 0;
    start := P;
    while p[0] > ' ' do begin
      if p[0] = '"' then begin
        p := CharNext(p);
        while (p[0] <> #0) and (p[0] <> '"') do begin
          q := CharNext(p);
          Inc(len, q - p);
          p := q;
        end;
        if p[0] <> #0 then
          p := CharNext(p);
      end
      else begin
        q := CharNext(p);
        Inc(len, q - p);
        p := q;
      end;
    end;
    SetLength(param, len);
    p := start;
    s := pointer(param);
    i := 0;
    while p[0] > ' ' do begin
      if p[0] = '"' then begin
        p := CharNext(p);
        while (p[0] <> #0) and (p[0] <> '"') do begin
          q := CharNext(p);
          while p < q do begin
            s[i] := p^;
            Inc(p);
            Inc(i);
          end;
        end;
        if p[0] <> #0 then
          p := CharNext(p);
      end
      else begin
        q := CharNext(p);
        while p < q do begin
          s[i] := p^;
          Inc(p);
          Inc(i);
        end;
      end;
    end;
    Result := p;
  end; { GetParamStr }

  function CleanPath(path: string): string;
  begin
    GetParamStr(PChar(path), Result);
  end; { CleanPath }

  {ln}
  function DSiGetDefaultBrowser: string;
  begin
    Result := DSiReadRegistry('http\shell\open\command', '', '',
      HKEY_CLASSES_ROOT);
  end; { DSiGetDefaultBrowser }

  {ln}
  function DSiGetDirectXVer: string;
  begin
    Result := DSiReadRegistry('\Software\Microsoft\DirectX', 'Version', '',
      HKEY_LOCAL_MACHINE);
  end; { DSiGetDirectXVer }

  {ln}
  function DSiGetRegisteredOwner: string;
  begin
    Result := DSiReadRegistry(DSiWinVerKeys[DSiIsWinNT], 'RegisteredOwner', '',
      HKEY_LOCAL_MACHINE);
  end; { DSiGetRegisteredOwner }

  {Odisej}
  function DSiGetDiskLabel(disk: char): string;
  var
    fileSysFlags: DWORD;
    maxCompLen  : DWORD;
    volName     : array [0..MAX_PATH] of char;
  begin
    if GetVolumeInformation(PChar(disk+':\'), volName, SizeOf(volName)-1,
         nil, maxCompLen, fileSysFlags, nil, 0)
    then
      Result := volName
    else
      Result := '';
  end; { DSiGetDiskLabel }

  {aky}
  function DSiGetDiskSerial(disk: char): string;
  var
    fileSysFlags: DWORD;
    maxCompLen  : DWORD;
    serNum      : DWORD;
  begin
    GetVolumeInformation(PChar(disk+':\'), nil, 0, @serNum,
      maxCompLen, fileSysFlags, nil, 0);
    Result := Format('%4x-%4x', [HiWord(serNum), LoWord(serNum)]);
  end; { DSiGetDiskSerial }

  {ln}
  function GetDomainNT: string;
  var
    pwi: PWkstaInfo100;
  begin
    if DSiNetWkstaGetInfo(nil, 100, pointer(pwi)) = 0 then
      Result := string(pwi.wki100_langroup)
    else
      Result := '';
  end; { GetDomainNT }

  {ln}
  function DSiGetDomain: string;
  begin
    if DSiIsWinNT then
      Result := GetDomainNT
   else begin
     Result := DSiReadRegistry(
       '\System\CurrentControlSet\Services\MSNP32\NetworkProvider',
       'AuthenticatingAgent', '', HKEY_LOCAL_MACHINE);
     if Result = '' then // 9x
       Result := DSiReadRegistry(
         '\System\CurrentControlSet\Services\VXD\VNETSUP',
         'Workgroup', '', HKEY_LOCAL_MACHINE);
    end;
  end; { DSiGetDomain }
  
  {mr}
  function DSiGetFolderLocation(const CSIDL: integer): string;
  var
    path : PChar;
    pPIDL: PItemIDList;
  begin
    GetMem(path, MAX_PATH);
    try
      if Succeeded(SHGetSpecialFolderLocation(0, CSIDL, pPIDL)) then begin
        SHGetPathFromIDList(pPIDL, path);
        DSiFreePidl(pPIDL);
      end
      else
        StrCopy(path, '');
      Result := string(path);
    finally FreeMem(path); end;
  end; { DSiGetFolderLocation }

  {xtreme}
  function DSiGetMyDocumentsFolder: string;
  begin
    Result := DSiReadRegistry(
      '\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',
      'Personal', '');
  end; { DSiGetMyDocumentsFolder }

  {gp}
  function DSiGetProgramFilesFolder: string;
  begin
    Result := DSiReadRegistry('\Software\Microsoft\Windows\CurrentVersion',
      'ProgramFilesDir', '', HKEY_LOCAL_MACHINE);
  end; { DSiGetProgramFilesFolder }

  {mr}
  function DSiGetSystemFolder: string;
  var
    path: array [1..MAX_PATH] of char;
  begin
    if GetSystemDirectory(@path, MAX_PATH) <> 0 then
      Result := StrPas(PChar(@path))
    else
      Result := '';
  end; { DSiGetSystemDirectory }

  {xtreme}
  function DSiGetSystemVersion: string;
  var
    versionInfo: TOSVersionInfo;
  begin
    try
      versionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
      GetVersionEx(versionInfo);
    finally
      Result := versionInfo.szCSDVersion;
    end;
  end; { TDSiRegistry.DSiGetSystemVersion }

  {:Returns user name of the current thread
    @author  Miha-R, Lee_Nover
    @since   2002-11-25
  }
  function DSiGetUserName: string;
  var
    buffer    : PChar;
    bufferSize: DWORD;
  begin
    bufferSize := 128;
    buffer := AllocMem(bufferSize);
    try
      GetUserName(buffer, bufferSize);
      Result := string(buffer);
    finally FreeMem(buffer, bufferSize); end;
  end; { DSiGetUserName }

  {:Returns name of the user owning the desktop (currently logged user).
    @author  Lee_Nover
    @since   2003-09-03
  }        
  function DSiGetUserNameEx: string;
  var
    dwProcessId: DWORD;
    h          : HWND;
    hProcess   : THandle;
    hToken     : THandle;
  begin
    Result := '';
    h := FindWindow('Progman', nil);// maybe use GetDesktopWindow
    if h = 0 then
      Exit;
    if GetWindowThreadProcessId(h, @dwProcessId) = 0 then
      Exit;
    hProcess := OpenProcess(PROCESS_ALL_ACCESS, FALSE, dwProcessId);
    if hProcess = 0 then
      Exit;
    try
      if OpenProcessToken(hProcess, TOKEN_ALL_ACCESS, hToken) then
      try
        ImpersonateLoggedOnUser(hToken);
        try
          Result := DSiGetUserName;
        finally RevertToSelf; end;
      finally CloseHandle(hToken); end;
    finally CloseHandle(hProcess); end;
  end; { TDSiRegistry.DSiGetUserNameEx }

  {mr}
  function DSiGetWindowsFolder: string;
  var
    path: PChar;
  begin
    GetMem(path, MAX_PATH);
    try
      if GetWindowsDirectory(path, MAX_PATH) <> 0 then
        Result := string(path)
      else
        Result := '';
    finally FreeMem(path); end;
  end; { DSiGetWindowsFolder }

  {xtreme}
  function DSiGetWindowsVersion: TDSiWindowsVersion;
  var
    versionInfo: TOSVersionInfo;
  begin
    versionInfo.dwOSVersionInfoSize := SizeOf(versionInfo);
    GetVersionEx(versionInfo);
    Result := wvUnknown;
    case versionInfo.dwPlatformID of
      VER_PLATFORM_WIN32s: Result := wvWin31;
      VER_PLATFORM_WIN32_WINDOWS:
        case versionInfo.dwMinorVersion of
          0:
            if Trim(versionInfo.szCSDVersion[1]) = 'B' then
              Result := wvWin95OSR2
            else
              Result := wvWin95;
          10:
            if Trim(versionInfo.szCSDVersion[1]) = 'A' then
              Result := wvWin98SE
            else
              Result := wvWin98;
          90:
            if (versionInfo.dwBuildNumber = 73010104) then
               Result := wvWinME;
             else
               Result := wvWin9x;
        end; //case versionInfo.dwMinorVersion
      VER_PLATFORM_WIN32_NT:
        case versionInfo.dwMajorVersion of
          3: Result := wvWinNT3;
          4: Result := wvWinNT4;
          5:
            case versionInfo.dwMinorVersion of
              0: Result := wvWin2000;
              1: Result := wvWinXP;
              else Result := wvWinNT
            end; //case versionInfo.dwMinorVersion
        end; //case versionInfo.dwMajorVersion
      end; //versionInfo.dwPlatformID
  end; { DSiGetWindowsVersion }

  {mr, gp}
  // Returns True if an administrator is logged onto the system. Always returns True on Windows 95/98.
  function DSiIsAdminLoggedOn: boolean;
  var
    hSC: SC_HANDLE;
  begin
    if not DSiIsWinNT then
      Result := true
    else begin
      // try an admin privileged API
      hSC := DSiOpenSCManager(nil, nil,
        GENERIC_READ or GENERIC_WRITE or GENERIC_EXECUTE);
      Result := (hSC <> 0);
      if Result then
        DSiCloseServiceHandle(hSC);
    end;
  end; { DSiIsAdminLoggedOn }

  {Odisej}
  function DSiIsDiskInDrive(disk: char): boolean;
  var
    errorMode: word;
  begin
    errorMode := SetErrorMode(SEM_FailCriticalErrors);
    try
      Result := (DiskSize(Ord(disk) - Ord('A') + 1) >= 0);
    finally SetErrorMode(errorMode); end;
  end; { DSiIsDiskInDrive }

  {ln}
  function DSiIsWinNT: boolean;
  begin
    Result := (Win32Platform = VER_PLATFORM_WIN32_NT);
  end; { DSiIsWinNT }

{ Install }

  function UninstallRoot: HKEY;
  begin
    if DSiIsWinNT then
      Result := HKEY_CURRENT_USER
    else
      Result := HKEY_LOCAL_MACHINE;
  end; { UninstallRoot }

  {gp}
  function DSiAddUninstallInfo(const displayName, uninstallCommand, publisher,
    URLInfoAbout, displayVersion, helpLink, URLUpdateInfo: string): boolean;
  begin
    Result := false;
    with TRegistry.Create do try
      RootKey := UninstallRoot;
      if OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+displayName, true) then
      try
        WriteString('DisplayName', displayName);
        WriteString('UninstallString', uninstallCommand);
        if publisher <> '' then
          WriteString('Publisher', publisher);
        if URLInfoAbout <> '' then
          WriteString('URLInfoAbout', URLInfoAbout);
        if displayVersion <> '' then
          WriteString('DisplayVersion', displayVersion);
        if helpLink <> '' then
          WriteString('HelpLink', helpLink);
        if URLUpdateInfo <> '' then
          WriteString('URLUpdateInfo', URLUpdateInfo);
        Result := true;
      finally CloseKey; end;
    finally {TRegistry.}Free; end;
  end; { DSiAddUninstallInfo }

  {ln}
  function DSiAutoRunApp(const applicationName, applicationPath: string;
    enabled: boolean): boolean;
  begin
    Result := false;
    with TRegistry.Create do try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', true) then try
        if enabled then
          WriteString(applicationName, applicationPath)
        else
          DeleteValue(applicationname);
        Result:=true;
      finally CloseKey; end;
    finally {TRegistry.}Free; end;
  end; { DSiAutoRunApp }

  {gp}
  // stolen from RXLib
  procedure DSiCreateShortcut(const fileName, displayName: string;
    folder: integer);
  var
    fileDestPath: array [0..MAX_PATH] of char;
    fileNameW   : array [0..MAX_PATH] of WideChar;
    itemIDList  : PItemIDList;
    persistFile : IPersistFile;
    shellLink   : IShellLink;
  begin
    CoInitialize(nil);
    try
      OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_SERVER,
        IID_IShellLinkA, shellLink));
      OleCheck(shellLink.QueryInterface(IID_IPersistFile, persistFile));
      OleCheck(SHGetSpecialFolderLocation(0, folder, itemIDList));
      SHGetPathFromIDList(itemIDList, fileDestPath);
      StrCat(fileDestPath, PChar('\' + displayName + CLinkExt));
      shellLink.SetPath(PChar(fileName));
      shellLink.SetIconLocation(PChar(fileName), 0);
      MultiByteToWideChar(CP_ACP, 0, fileDestPath, -1, fileNameW, MAX_PATH);
      OleCheck(persistFile.Save(fileNameW, true));
    finally CoUninitialize; end;
  end; { DSiCreateShortcut }

  {gp}
  function DSiDeleteShortcut(const displayName: string;
    folder: integer): boolean;
  var
    path: string;
  begin
    Result := false;
    path := DSiGetFolderLocation(folder);
    if path <> '' then begin
      path := path + '\' + displayName + CLinkExt;
      Result := DSiKillFile(path);
    end;
  end; { DSiDeleteShortcut }

  {gp}
  function DSiGetUninstallInfo(const displayName: string;
    out uninstallCommand: string): boolean;
  begin
    uninstallCommand :=
      DSiReadRegistry('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+displayName,
        'UninstallString', '', UninstallRoot);
    Result := (uninstallCommand <> '');
  end; { DSiGetUninstallInfo }
  
  {ln}
  function DSiIsAutoRunApp(const applicationname: string): boolean;
  begin
    Result :=
      (DSiReadRegistry('\Software\Microsoft\Windows\CurrentVersion\Run', applicationname, '') <> '');
  end; { DSiIsAutoRunApp }

  {ln}
  function DSiRegisterActiveX(const fileName: string;
    registerDLL: boolean): HRESULT;
  type
    TDLLRegisterServer = function: HResult; stdcall;
  var
    _Register: TDllRegisterServer;
    DLLHandle: THandle;
  begin
    Result := E_FAIL;
    DLLHandle := LoadLibrary(PChar(FileName));
    if DLLHandle = 0 then
      Exit;
    try
      if RegisterDLL then
        _Register := GetProcAddress(DLLHandle, 'DllRegisterServer')
      else
        _Register := GetProcAddress(DLLHandle, 'DllUnregisterServer');
      Result := _Register;
    finally FreeLibrary(DLLHandle); end;
  end; { DSiRegisterActiveX }
  
  {gp}
  procedure DSiRegisterRunOnce(const applicationName, applicationPath: string);
  begin
    DSiWriteRegistry('SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',
      applicationName, applicationPath);
  end; { DSiRegisterRunOnce }

  {gp}
  procedure DSiRemoveRunOnce(const applicationName: string);
  begin
    with TRegistry.Create do try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce', true) then try
        DeleteValue(applicationName);
      finally CloseKey; end;
    finally {TRegistry.}Free; end;
  end; { DSiRemoveRunOnce }

  {gp}
  function DSiRemoveUninstallInfo(const displayName: string): boolean;
  begin
    Result :=
      DSiKillRegistry('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+displayName,
        UninstallRoot);
  end; { DSiRemoveUninstallInfo }

  {gp}
  function DSiShortcutExists(const displayName: string; folder: integer): boolean;
  var
    path: string;
  begin
    path := DSiGetFolderLocation(folder);
    if path <> '' then begin
      path := path + '\' + displayName + CLinkExt;
      Result := FileExists(path);
    end
    else
      Result := false;
  end; { DSiShortcutExists }

{ Time }

  {gp}
  function DSiElapsedSince(midTime, startTime: int64): int64;
  begin
    if midTime < startTime then
      midTime := midTime + $100000000;
    Result := midTime - startTime;
  end; { TDSiRegistry.DSiElapsedSince }

  {gp}
  function DSiElapsedTime(startTime: int64): int64;
  begin
    Result := DSiElapsedSince(GetTickCount, startTime);
  end; { DSiElapsedTime }

  {gp}
  function DSiHasElapsed(startTime: int64; timeout: DWORD): boolean;
  begin
    if timeout = 0 then
      Result := true
    else if timeout = INFINITE then
      Result := false
    else
      Result := (DSiElapsedTime(startTime) > timeout);
  end; { DSiHasElapsed }

  {ales, Brdaws}
  //'delay' is in microseconds
  procedure DSiuSecDelay(delay: int64);
  var
    dif    : int64;
    endTime: TLargeInteger;
    freq   : TLargeInteger;
    nowTime: TLargeInteger;
  begin
    QueryPerformanceFrequency(freq);
    dif := delay * freq div 1000000;
    QueryPerformanceCounter(endTime);
    endTime := endTime + dif;
    repeat
      QueryPerformanceCounter(nowTime);
    until nowTime >= endTime;
  end; { DSiuSecDelay }

{ DynaLoad }

var
  GLibraryList: TStringList;

  {:Loads library and adds library handle to the list of handles that must be
    unloaded at process termination. Caches library handle for future reference.
    @since   2003-09-02
  }        
  function DSiLoadLibrary(const libFileName: string): HMODULE;
  var
    hLib  : HMODULE;
    idxLib: integer;
  begin
    idxLib := GLibraryList.IndexOf(libFileName);
    if idxLib < 0 then begin
      hLib := LoadLibrary(PChar(libFileName));
      if hLib <> 0 then
        idxLib := GLibraryList.AddObject(libFileName, TObject(hLib));
    end;
    if idxLib >= 0 then
      Result := HMODULE(GLibraryList.Objects[idxLib])
    else
      Result := 0;
  end; { DSiLoadLibrary }

  {:Loads the library if it was not loaded yet (and adds it to the list of
    libraries that must be unloaded at process termination), then calls
    GetProcAddress.
    @since   2003-09-02
  }        
  function DSiGetProcAddress(const libFileName, procName: string): FARPROC;
  begin
    Result := GetProcAddress(DSiLoadLibrary(libFileName), PChar(procName));
  end; { DSiGetProcAddress }

  {:Unloads all loaded libraries.
    @since   2003-09-02
  }
  procedure DSiUnloadLibrary;
  var
    iLib: integer;
  begin
    for iLib := 0 to GLibraryList.Count-1 do
      if HMODULE(GLibraryList.Objects[iLib]) <> 0 then begin
        FreeLibrary(HMODULE(GLibraryList.Objects[iLib]));
        GLibraryList.Objects[iLib] := TObject(0);
      end;
  end; { TDSiRegistry.DSiUnloadLibrary }

  function DSi9xNetShareAdd(serverName: PChar; shareLevel: smallint;
    buffer: pointer; size: word): integer;
  begin
    if not assigned(G9xNetShareAdd) then
      G9xNetShareAdd := DSiGetProcAddress('svrapi.dll', 'NetShareAdd');
    if assigned(G9xNetShareAdd) then
      Result := G9xNetShareAdd(serverName, shareLevel, buffer, size)
    else
      Result := ERROR_NOT_SUPPORTED;
  end; { DSi9xNetShareAdd }

  function DSi9xNetShareDel(serverName: PChar; netName: PChar;
    reserved: word): integer;
  begin
    if not assigned(G9xNetShareDel) then
      G9xNetShareDel := DSiGetProcAddress('svrapi.dll', 'NetShareDel');
    if assigned(G9xNetShareDel) then
      Result := G9xNetShareDel(serverName, netName, reserved)
    else
      Result := ERROR_NOT_SUPPORTED;
  end; { DSi9xNetShareDel }
  
  function DSiCloseServiceHandle(hSCObject: SC_HANDLE): BOOL;
  begin
    if not assigned(GCloseServiceHandle) then
      GCloseServiceHandle := DSiGetProcAddress('advapi32.dll',
        'CloseServiceHandle');
    if assigned(GCloseServiceHandle) then
      Result := GCloseServiceHandle(hSCObject)
    else begin
      SetLastError(ERROR_NOT_SUPPORTED);
      Result := false;
    end;
  end; { DSiCloseServiceHandle }

  function DSiCreateProcessAsUser(hToken: THandle;
    lpApplicationName: PAnsiChar; lpCommandLine: PAnsiChar; lpProcessAttributes,
    lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL;
    dwCreationFlags: DWORD; lpEnvironment: pointer;
    lpCurrentDirectory: PAnsiChar; const lpStartupInfo: TStartupInfo;
    var lpProcessInformation: TProcessInformation): BOOL;
  begin
    if not assigned(GCreateProcessAsUser) then
      GCreateProcessAsUser := DSiGetProcAddress('advapi32.dll',
        'CreateProcessAsUserA');
    if assigned(GCreateProcessAsUser) then
      Result := GCreateProcessAsUser(hToken, lpApplicationName, lpCommandLine,
        lpProcessAttributes, lpThreadAttributes, bInheritHandles,
        dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo,
        lpProcessInformation)
    else begin
      SetLastError(ERROR_NOT_SUPPORTED);
      Result := false;
    end;
  end; { DSiCreateProcessAsUser }

  function DSiImpersonateLoggedOnUser(hToken: THandle): BOOL; stdcall;
  begin
    if not assigned(GImpersonateLoggedOnUser) then
      GImpersonateLoggedOnUser := DSiGetProcAddress('advapi32.dll',
        'ImpersonateLoggedOnUser');
    if assigned(GImpersonateLoggedOnUser) then
      Result := GImpersonateLoggedOnUser(hToken)
    else begin
      SetLastError(ERROR_NOT_SUPPORTED);
      Result := false;
    end;
  end; { DSiImpersonateLoggedOnUser }

  function DSiLogonUser(lpszUsername, lpszDomain, lpszPassword: LPCSTR;
    dwLogonType, dwLogonProvider: DWORD; var phToken: THandle): BOOL;
  begin
    Result := false;
    if not assigned(GLogonUser) then
      GLogonUser := DSiGetProcAddress('advapi32.dll', 'LogonUserA');
    if assigned(GLogonUser) then begin
      if not DSiEnablePrivilege('SeTcbName') and DSiEnablePrivilege('SeChangeNotifyName')
      then
        Exit;
      Result := GLogonUser(lpszUsername, lpszDomain, lpszPassword, dwLogonType,
        dwLogonProvider, phToken)
    end
    else
      SetLastError(ERROR_NOT_SUPPORTED);
  end; { DSiLogonUser }

  function DSiNetApiBufferFree(buffer: pointer): cardinal; stdcall;
  begin
    if not assigned(GNetApiBufferFree) then
      GNetApiBufferFree := DSiGetProcAddress('netapi32.dll', 'NetWkstaGetInfo');
    if assigned(GNetApiBufferFree) then
      Result := GNetApiBufferFree(buffer)
    else
      Result := ERROR_NOT_SUPPORTED;
  end; { DSiNetApiBufferFree }

  function DSiNetWkstaGetInfo(servername: PChar; level: cardinal;
    out bufptr: Pointer): cardinal; stdcall;
  begin
    if not assigned(GNetWkstaGetInfo) then
      GNetWkstaGetInfo := DSiGetProcAddress('netapi32.dll', 'NetWkstaGetInfo');
    if assigned(GNetWkstaGetInfo) then
      Result := GNetWkstaGetInfo(servername, level, bufptr)
    else
      Result := ERROR_NOT_SUPPORTED;
  end; { DSiNetWkstaGetInfo }

  function DSiNTNetShareAdd(serverName: PChar; level: integer; buf: PChar;
    var parm_err: integer): DWord;
  begin
    if not assigned(GNTNetShareAdd) then
      GNTNetShareAdd := DSiGetProcAddress('netapi32.dll', 'NetShareAdd');
    if assigned(GNTNetShareAdd) then
      Result := GNTNetShareAdd(serverName, level, buf, parm_err)
    else
      Result := ERROR_NOT_SUPPORTED;
  end; { DSiNTNetShareAdd }

  function DSiNTNetShareDel(serverName: PChar; netName: PWideChar;
    reserved: integer): DWord;
  begin
    if not assigned(GNTNetShareDel) then
      GNTNetShareDel := DSiGetProcAddress('netapi32.dll', 'NetShareDel');
    if assigned(GNTNetShareDel) then
      Result := GNTNetShareDel(serverName, netName, reserved)
    else
      Result := ERROR_NOT_SUPPORTED;
  end; { DSiNTNetShareDel }

  function DSiOpenSCManager(lpMachineName, lpDatabaseName: PChar;
    dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
  begin
    if not assigned(GOpenSCManager) then
      GOpenSCManager := DSiGetProcAddress('advapi32.dll', 'OpenSCManagerA');
    if assigned(GOpenSCManager) then
      Result := GOpenSCManager(lpMachineName, lpDatabaseName, dwDesiredAccess)
    else begin
      SetLastError(ERROR_NOT_SUPPORTED);
      Result := 0;
    end;
  end; { DSiOpenSCManager }

  function DSiRevertToSelf: BOOL; stdcall;
  begin
    if not assigned(GRevertToSelf) then
      GRevertToSelf := DSiGetProcAddress('advapi32.dll', 'RevertToSelf');
    if assigned(GRevertToSelf) then
      Result := GRevertToSelf
    else begin
      SetLastError(ERROR_NOT_SUPPORTED);
      Result := false;
    end;
  end; { DSiRevertToSelf }

  function DSiSHEmptyRecycleBin(Wnd: HWND; pszRootPath: PChar;
    dwFlags: DWORD): HRESULT; stdcall;
  begin
    if not assigned(GSHEmptyRecycleBin) then
      GSHEmptyRecycleBin := DSiGetProcAddress('shell32.dll',
        'SHEmptyRecycleBinA');
    if assigned(GSHEmptyRecycleBin) then
      Result := GSHEmptyRecycleBin(Wnd, pszRootPath, dwFlags)
    else
      Result := S_FALSE;
  end; { DSiSHEmptyRecycleBin }

initialization
  GLibraryList := TStringList.Create;
finalization
  DSiUnloadLibrary;
  FreeAndNil(GLibraryList);
end.
