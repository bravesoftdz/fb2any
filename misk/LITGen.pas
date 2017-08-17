unit LITGen;

interface

uses
  Winapi.Windows;

type
  ILITCallback = interface(IUnknown)
  ['{6BC62165-B91C-4993-8002-5BC30B2D1196}']
    function &Message(iType: Integer; iMessageCode: Integer;
      pwszMessage: PWideChar): HRESULT; stdcall;
  end;

  ILITTag = interface(IUnknown)
  ['{D655ECEB-829A-11d3-929B-00C04F68FC0F}']
    function SetName(const pwchName: PWideChar; cwchName: ULONG): HRESULT; stdcall;
    function AddAttribute(const pwchName: PWideChar; cwchName: ULONG;
      const pwchValue: PWideChar; cwchValue: ULONG): HRESULT; stdcall;
  end;

  ILITHost = interface(IUnknown)
  ['{65E8FC16-8661-11d3-929C-00C04F68FC0F}']
    function GetId(out pbstrId: WideString): HRESULT; stdcall;
    function GetFilename(out pbstrFilename: WideString): HRESULT; stdcall;
    function GetMimeType(out pbstrMimeType: WideString): HRESULT; stdcall;
  end;

  ILITParserHost = interface(ILITHost)
  ['{607A85B7-59C1-4b22-B873-A36334740661}']
    function NewTag(out ppTag: IUnknown): HRESULT; stdcall;
    function Tag(pTag: IUnknown; fChildren: BOOL): HRESULT; stdcall;
    function Text(const pwchText: PWideChar; cwchText: ULONG): HRESULT; stdcall;
    function EndChildren: HRESULT; stdcall;
    function ExternalStylesheet(pTag: IUnknown): HRESULT; stdcall;
    function Finish: HRESULT; stdcall;
  end;

  ILITCSSHost = interface(ILITHost)
  ['{D7426056-FA2D-4d14-B36C-34D49A20D237}']
    function Write(const pb: Pointer; cb: ULONG; out pcbWritten: ULONG): HRESULT; stdcall;
    function Finish: HRESULT; stdcall;
    function GetCurrentLine(out pcLine: ULONG): HRESULT; stdcall;
  end;

  ILITImageHost = interface(ILITHost)
  ['{D655ECEE-829A-11d3-929B-00C04F68FC0F}']
    function Write(const pb: Pointer; cb: ULONG; out pcbWritten: ULONG): HRESULT; stdcall;
  end;

  ILITWriter = interface(IUnknown)
  ['{9EC81687-D4F9-4b20-969A-222BC00CE50A}']
    function SetCallback(pCallback: IUnknown): HRESULT; stdcall;
    function Create(const pwszLitFile: PWideChar;
      const pwszSourceBasePath: PWideChar;
      const pwszSource: PWideChar;
      iMinimumReaderVersion: Integer): HRESULT; stdcall;
    function GetPackageHost(fEnforceOEB: BOOL; out ppHost: IUnknown): HRESULT; stdcall;
    function GetNextCSSHost(out ppHost: IUnknown): HRESULT; stdcall;
    function GetNextContentHost(out ppHost: IUnknown): HRESULT; stdcall;
    function GetNextImageHost(out ppHost: IUnknown): HRESULT; stdcall;
    function Finish: HRESULT; stdcall;
    function Fail: HRESULT; stdcall;
  end;

implementation

end.
