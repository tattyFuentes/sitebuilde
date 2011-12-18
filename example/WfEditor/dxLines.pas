{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressFlowChart                                            }
{                                                                   }
{       Copyright (c) 1998-2004 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSFLOWCHART AND ALL ACCOMPANYING}
{   VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.             }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE end USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxLines;

interface

uses Windows,Classes;

type TLineType = (liStraight, liQSpline, liRectH, liRectV);

procedure QSpline(DC: HDC; var Points; Count: Integer);
procedure RectHLine(DC: HDC; var Points; Count: Integer);
procedure RectVLine(DC: HDC; var Points; Count: Integer);
procedure ExtendRect(var R: TRect; const P: TPoint);
function Distance(const A,B: TPoint): Integer;
function LineLength(LType: TLineType; var Points; Count: Integer): Integer;
function LineCenter(LType: TLineType; var Points; Count: Integer): TPoint;
function MassCenter(LType: TLineType; var Points; Count: Integer): TPoint;
function PtOnLine(LType: TLineType; var Points; Count,Delta,X,Y: Integer): Boolean;
function RectOnLine(LType: TLineType; var Points; Count: Integer; const R: TRect): Boolean;
function PointIndex: Integer;

implementation

type

  TQSData = packed record
    P0,P1,P2: TPoint;
    Px2,DPx2,Qx: TPoint;
    Result: Integer;
    Step,Limit: Word;
    Mode,Last: Byte;
    case Integer of
    0: (Source,Prev: TPoint);
    1: (Rect: TRect);
  end;

  TPointArray = array[0..$FFFFFF] of TPoint;
  PPointArray = ^TPointArray;
  PPoint = ^TPoint;
  TPointFunc = function(LType:TLineType;P:PPointArray;I,Count:Integer;var Data: TQSData): Boolean;

var LastIndex: Integer;

{ Service public routines }

procedure ExtendRect(var R: TRect; const P: TPoint);
begin
  if P.X < R.Left then R.Left := P.X;
  if P.X > R.Right then R.Right := P.X;
  if P.Y < R.Top then R.Top := P.Y;
  if P.Y > R.Bottom then R.Bottom := P.Y;
end;

function Distance(const A,B: TPoint): Integer;
var
  DX, DY: Extended;
begin
  try
    DX := A.X - B.X;
    DY := A.Y - B.Y;
    if (DX=0) or (DY=0) then
      Result := Round(Abs(DX+DY))
    else
      Result := Round(Sqrt(DX * DX + DY * DY));
  except
    Result := 0;
  end;
end;

{ Internal routines }

procedure QSPoints(var Data: TQSData); register;
asm
    JMP	@MAIN

@ABSMAX:	MOV	EAX,[EBX]
    SUB	EAX,[ECX]
    JNS	@@A1
    NEG	EAX
@@A1:		MOV	EDX,[EBX].4
    SUB	EDX,[ECX].4
    JNS	@@A2
    NEG	EDX
@@A2:		CMP	EAX,EDX
    JAE	@@A3
    XCHG	EAX,EDX
@@A3:		RET

@INIT:		XOR	EBX,EBX
    MOV	EBP,EBX
    MOV	BP,AX
    CALL	@@I1
    INC	EBX
@@I1:		MOV	EAX,[ESI+EBX*4].TQSData.P0.X
    ADD	EAX,[ESI+EBX*4].TQSData.P2.X
    SUB	EAX,[ESI+EBX*4].TQSData.P1.X
    SUB	EAX,[ESI+EBX*4].TQSData.P1.X
    IMUL	EBP
    IMUL	EBP
    SHRD	EAX,EDX,15
    ADC	EAX,0
    MOV	[ESI+EBX*4].TQSData.DPx2.X,EAX
    SAR	EAX,1
    ADC	EAX,0
    MOV	[ESI+EBX*4].TQSData.Px2.X,EAX
    MOV	EAX,[ESI+EBX*4].TQSData.P1.X
    SUB	EAX,[ESI+EBX*4].TQSData.P0.X
    SAL	EAX,1
    IMUL	EBP
    ADD	[ESI+EBX*4].TQSData.Px2.X,EAX
    MOV	[ESI+EBX*4].TQSData.Qx.X,0
    MOV	EAX,[ESI+EBX*4].TQSData.P0.X
    MOV	[ESI+EBX*4].TQSData.P1.X,EAX
    RET

@NEXT:		XOR	EBX,EBX
    CALL	@@N1
    INC	EBX
@@N1:		MOV	EAX,[ESI+EBX*4].TQSData.Px2.X
    ADD	EAX,[ESI+EBX*4].TQSData.Qx.X
    MOV	[ESI+EBX*4].TQSData.Qx.X,EAX
    SAR	EAX,16
    ADC	EAX,[ESI+EBX*4].TQSData.P1.X
    MOV	[ESI+EBX*4].TQSData.P0.X,EAX
    MOV	EAX,[ESI+EBX*4].TQSData.DPx2.X
    ADD	[ESI+EBX*4].TQSData.Px2.X,EAX
    RET

@DO_PTS:	MOV	EAX,[ESI].TQSData.P0.X
    STOSD
    MOV	EAX,[ESI].TQSData.P0.Y
    STOSD
    RET

@MAIN:		PUSH	EBX
    PUSH	EBP
    PUSH	ESI
    PUSH	EDI
    MOV	ESI,EAX
    LEA	EBX,[ESI].TQSData.P0
    LEA	ECX,[ESI].TQSData.P1
    CALL	@ABSMAX
    MOV	EBP,EAX
    LEA	EBX,[ESI].TQSData.P2
    CALL	@ABSMAX
    ADD	EBP,EAX
    JZ	@@END
    XOR	EAX,EAX
    CDQ
    MOV	DL,8
@@1:		CMP	DX,BP
    JB	@@2
    SAL	EBP,1
    JMP	@@1
@@2:		DIV	BP
    MOV	[ESI].TQSData.Step,AX
    MOV	[ESI].TQSData.Limit,0
    CALL	@INIT
    MOV	EDI,[ESI].TQSData.Result
@@3:		CALL	@DO_PTS
    CALL	@NEXT
    MOV	AX,[ESI].TQSData.Step
    ADD	[ESI].TQSData.Limit,AX
    JNC	@@3
    MOV	EAX,[ESI].TQSData.P2.X
    MOV	[ESI].TQSData.P0.X,EAX
    MOV	EAX,[ESI].TQSData.P2.Y
    MOV	[ESI].TQSData.P0.Y,EAX
    CMP	[ESI].TQSData.Last,0
    JZ	@@4
    CALL	@DO_PTS
@@4:		MOV	[ESI].TQSData.Result,EDI
@@END:		POP	EDI
    POP	ESI
    POP	EBP
    POP	EBX
end;

function StackAlloc(Size: Integer): Pointer; register;
asm
    POP	ECX
    MOV	EDX,ESP
    ADD	EAX,3
    AND	AL,NOT 3
@@1:		CMP	EAX,4092
    JBE	@@2
    SUB	ESP,4092
    PUSH	EAX
    SUB	EAX,4096
    JMP	@@1
@@2:		SUB	ESP,EAX
    MOV	EAX,ESP
    PUSH	EDX
    PUSH	ECX
end;

procedure StackFree(P: Pointer); register;
asm
    POP	ECX
    MOV	ESP,[EAX].-4
    PUSH	ECX
end;

procedure MiddlePoint(var Dst: TPoint; const Src: TPoint);
begin
  Dst.X := Src.X + (Dst.X - Src.X) div 2;
  Dst.Y := Src.Y + (Dst.Y - Src.Y) div 2;
end;

procedure DoQSPoints(const Points: array of TPoint; Count: Integer; var Data: TQSData);
var I: Integer;
begin
  with Data do begin
    P0 := Points[0];
    Last := 0;
    for I:=1 to Count-2 do begin
      P1 := Points[I];
      P2 := Points[I+1];
      if I = Count-2 then Last := 1
      else MiddlePoint(P2,P1);
      QSPoints(Data);
    end;
  end;
end;

{$O-}
procedure RectLine(DC: HDC; var Points; Count: Integer; Vertical: Boolean);
var
  I,J: Integer;
  P1,P2: ^TPointArray;
begin
  if Count < 2 then Exit;
  P1 := @Points; P2 := StackAlloc(Count shl 4);
  J := 0; P2^[0] := P1^[0];
  for I:=1 to Count-1 do begin
    Inc(J); P2^[J] := P2^[J-1];
    if Vertical then P2^[J].Y := P1^[I].Y
    else P2^[J].X := P1^[I].X;
    Inc(J); P2^[J] := P1^[I];
  end;
  Polyline(DC,P2^,Count shl 1 - 1);
  StackFree(P2);
end;
{$O+}

function PartLen(LType: TLineType; P: PPointArray; I,Count: Integer; LC,MC: PPoint): Integer;
var
  Ax,Bx,Ay,By,A,C: Integer;
  W,B2A,SqA,L0,T,DT: Extended;
  P0,P1,P2: TPoint;

  procedure RectPoints;
  begin
    P0 := Point(P^[I+1].X,P^[I].Y);
    P1 := Point(P^[I].X,P^[I+1].Y);
    if P0.X < P1.X then Ax := -Ax;
    if P1.Y < P0.Y then Ay := -Ay;
    Dec(P0.X,Ax); Inc(P0.Y,Ay);
    Inc(P1.X,Ax); Dec(P1.Y,Ay);
  end;

  function Limits(X: Extended): Extended;
  var S: Extended;
  begin
    if W=0 then Result := X * Abs(X)
    else begin
      S := Sqrt(X*X + W);
      Result := X*S + W*Ln(X+S);
    end;
  end;

begin
  Bx := 0;
  By := 0;
  B2A := 0;
  Result := 0;
  SqA := 0;
  L0 := 0;
  case LType of
    liStraight: Result := Distance(P^[I],P^[I+1]);
    liRectH,liRectV: Result := Abs(P^[I].X - P^[I+1].X) + Abs(P^[I].Y - P^[I+1].Y);
    liQSpline: begin
      P0 := P^[I]; P1 := P^[I+1]; P2 := P^[I+2];
      if I > 0 then MiddlePoint(P0,P1);
      if I < Count-2 then MiddlePoint(P2,P1);
      Ax := P0.X + P2.X - P1.X shl 1; Bx := P1.X - P0.X;
      Ay := P0.Y + P2.Y - P1.Y shl 1; By := P1.Y - P0.Y;
      A := Ax*Ax + Ay*Ay; C := Bx*Bx + By*By; W := 0;
      if A=0 then Result := Round(Sqrt(C shl 2))
      else begin
  B2A := (Ax*Bx + Ay*By) / A; W := C/A - B2A*B2A;
  SqA := Sqrt(A); L0 := Limits(B2A);
  Result := Round(SqA*(Limits(B2A+1)-L0));
      end;
    end;
  end;
  if LC <> nil then case LType of
    liStraight: begin
      A := LC^.X; C := LC^.Y;
      LC^.X := P^[I].X + MulDiv(P^[I+1].X-P^[I].X,A,C);
      LC^.Y := P^[I].Y + MulDiv(P^[I+1].Y-P^[I].Y,A,C);
    end;
    liRectH,liRectV: begin
      Ax := Abs(P^[I].X - P^[I+1].X) - LC^.X;
      if Ax >= 0 then Ay := 0
      else begin
  Ay := -Ax;
  Ax := 0;
      end;
      RectPoints;
      if LType=liRectH then LC^ := P0 else LC^ := P1;
    end;
    liQSpline: begin
      T := 0.5; DT := 0.25;
      if W<>0 then while true do begin
  C := Round(SqA*(Limits(B2A+T)-L0)) - LC^.X;
  if C = 0 then Break;
  if C > 0 then T := T - DT else T := T + DT;
  DT := DT / 2;
      end;
      if T >= 0.5 then Inc(LastIndex);
      LC^.X := Round(T*(Ax*T + Bx shl 1)) + P0.X;
      LC^.Y := Round(T*(Ay*T + By shl 1)) + P0.Y;
    end;
  end;
  if MC <> nil then case LType of
    liStraight: begin
      MC^.X := (P^[I].X + P^[I+1].X) div 2;
      MC^.Y := (P^[I].Y + P^[I+1].Y) div 2;
    end;
    liRectH,liRectV: begin
      Ax := Abs(P^[I].X - P^[I+1].X) shr 2;
      Ay := Abs(P^[I].Y - P^[I+1].Y) shr 2;
      RectPoints;
      if LType=liRectH then MC^ := P0 else MC^ := P1;
    end;
    liQSpline: begin
      MC^.X := (P0.X + P1.X + P2.X) div 3;
      MC^.Y := (P0.Y + P1.Y + P2.Y) div 3;
    end;
  end;
end;

function PartDistance(const PS,PE,Src: TPoint): Integer;
var
  DX,DY,Tmp: Integer;
begin
  DX := PE.X - PS.X;
  DY := PE.Y - PS.Y;
  if DX+DY = 0 then begin
    DX := PS.Y - Src.Y;
    DY := Src.X - PS.X;
    if DX+DY = 0 then DX := 1;
  end;
  if Abs(DX) <= Abs(DY)
  then Result := Src.X - PS.X - MulDiv(Src.Y-PS.Y,DX,DY)
  else Result := Src.Y - PS.Y - MulDiv(Src.X-PS.X,DY,DX);
  if Result=0 then Exit;
  Result := Abs(Result);
  DX := Abs(DX); DY := Abs(DY);
  if DX < DY then begin
    Tmp := DX; DX := DY; DY := Tmp;
  end;
  DX := DX * 181 shr 7;
  Result := MulDiv(Result,DX,DX+DY);
end;

procedure ChkType(var LType: TLineType; var Count: Integer);
begin
  if (LType=liQSpline) and (Count < 3) then LType := liStraight;
  if LType=liQSpline then Dec(Count);
end;

function DoPoints(LType:TLineType;var Points;Count:Integer;var Data:TQSData;Action:TPointFunc): Boolean;
var
  I: Integer;
  P: PPointArray;
begin
  P := @Points; Result := False;
  ChkType(LType,Count);
  for I:=0 to Count-2 do begin
    LastIndex := I;
    Result := Action(LType,P,I,Count,Data);
    if Result then Exit;
  end;
  LastIndex := -1;
end;

function DoLineLength(LType:TLineType;P:PPointArray;I,Count:Integer;var Data: TQSData): Boolean;
begin
  Inc(Data.Result,PartLen(LType,P,I,Count,nil,nil));
  Result := False;
end;

function DoMassCenter(LType:TLineType;P:PPointArray;I,Count:Integer;var Data: TQSData): Boolean;
var PL: Integer;
begin
  with Data do begin
    PL := PartLen(LType,P,I,Count,nil,@Prev);
    Inc(Result,PL);
    Inc(Source.X,PL*Prev.X);
    Inc(Source.Y,PL*Prev.Y);
  end;
  Result := False;
end;

function DoPtOnLine(LType:TLineType;P:PPointArray;I,Count:Integer;var Data:TQSData): Boolean;
var
  D1,D2,Delta: Integer;
  R: TRect;
begin
  Delta := Data.Prev.X;
  Data.P0 := P^[I]; Data.P1 := P^[I+1];
  R.TopLeft := Data.P1; R.BottomRight := Data.P1;
  with Data do case LType of
    liRectH: begin
      P2.X := P1.X;
      P2.Y := P0.Y;
    end;
    liRectV: begin
      P2.X := P0.X;
      P2.Y := P1.Y;
    end;
    liQSpline: begin
      P2 := P^[I+2];
      if I > 0 then MiddlePoint(P0,P1);
      if I < Count-2 then MiddlePoint(P2,P1);
      ExtendRect(R,P2);
    end;
  end;
  ExtendRect(R,Data.P0);
  InflateRect(R,Delta,Delta);
  Result := PtInRect(R,Data.Source);
  if Result then case LType of
    liStraight: Result := PartDistance(Data.P0,Data.P1,Data.Source) <= Delta;
    liRectH,liRectV: begin
      D1 := Abs(Data.P2.X - Data.Source.X);
      D2 := Abs(Data.P2.Y - Data.Source.Y);
      if D1 > D2 then D1 := D2;
      Result := D1 <= Delta;
    end;
    liQSpline: begin
      D1 := Data.Result; D2 := LastIndex;
      QSPoints(Data);
      Result := PtOnLine(liStraight,Pointer(D1)^,(Data.Result-D1) shr 3,Delta,Data.Source.X,Data.Source.Y);
      if LastIndex >= (Data.Result-D1) shr 4 then Inc(D2);
      Data.Result := D1; LastIndex := D2;
    end;
  end;
end;

function PtCode(const P: TPoint; const R: TRect): Integer;
begin
  Result := 0;
  if P.X < R.Left then Result := Result or 1;
  if P.Y < R.Top then Result := Result or 2;
  if P.X > R.Right then Result := Result or 4; // Fix: by Kirill
  if P.Y > R.Bottom then Result := Result or 8; // Fix: by Kirill
end;

function LineInRect(P1,P2: TPoint; const R: TRect): Boolean;
label Start;
var
  D1,D2: Integer;
begin
  D2 := PtCode(P2,R);
  Start: D1 := PtCode(P1,R);
  Result := D1 and D2 = 0;
  if not Result then Exit;
  Result := (D1=0) or (D2=0) or (D1 or D2 = 5) or (D1 or D2 = 10);
  if Result then Exit;
  if D1 and 1 <> 0 then begin
    P1.Y := P1.Y + MulDiv(P2.Y-P1.Y,R.Left-P1.X,P2.X-P1.X);
    P1.X := R.Left; goto Start;
  end;
  if D1 and 2 <> 0 then begin
    P1.X := P1.X + MulDiv(P2.X-P1.X,R.Top-P1.Y,P2.Y-P1.Y);
    P1.Y := R.Top; goto Start;
  end;
  if D1 and 4 <> 0 then begin
    P1.Y := P1.Y + MulDiv(P2.Y-P1.Y,R.Right-P1.X,P2.X-P1.X);
    P1.X := R.Right; goto Start;
  end;
  if D1 and 8 <> 0 then begin // Fix: by Kirill
    P1.X := P1.X + MulDiv(P2.X-P1.X,R.Bottom-P1.Y,P2.Y-P1.Y);
    P1.Y := R.Bottom; goto Start;
  end;
end;

function DoRectOnLine(LType:TLineType;P:PPointArray;I,Count:Integer;var Data:TQSData): Boolean;
var
  D0,D1,D2: Integer;
begin
  Result := False;
  Data.P0 := P^[I]; Data.P1 := P^[I+1];
  case LType of
    liStraight: Result := LineInRect(Data.P0,Data.P1,Data.Rect);
    liRectH: begin
      with Data do begin P2.X := P1.X; P2.Y := P0.Y; end;
      Result := LineInRect(Data.P0,Data.P2,Data.Rect) or LineInRect(Data.P2,Data.P1,Data.Rect);
    end;
    liRectV: begin
      with Data do begin P2.X := P0.X; P2.Y := P1.Y; end;
      Result := LineInRect(Data.P0,Data.P2,Data.Rect) or LineInRect(Data.P2,Data.P1,Data.Rect);
    end;
    liQSpline: begin
      with Data do begin
  P2 := P^[I+2];
  if I > 0 then MiddlePoint(P0,P1);
  if I < Count-2 then MiddlePoint(P2,P1);
  D0 := PtCode(P0,Rect); D1 := PtCode(P1,Rect); D2 := PtCode(P2,Rect);
      end;
      Result := D0 and D1 and D2 = 0;
      if not Result then Exit;
      Result := (D0=0) or (D1=0) or (D2=0);
      if Result then Exit;
      D1 := Data.Result; D2 := LastIndex;
      QSPoints(Data);
      Result := RectOnLine(liStraight,Pointer(D1)^,(Data.Result-D1) shr 3,Data.Rect);
      if LastIndex >= (Data.Result-D1) shr 4 then Inc(D2);
      Data.Result := D1; LastIndex := D2;
    end;
  end;
end;

{ Public routines }

{$O-}
procedure QSpline(DC: HDC; var Points; Count: Integer);
var
  I,Sum: Integer;
  POut: Pointer;
  PIn: PPointArray;
  QSData: TQSData;
begin
  if Count < 3 then Exit;
  PIn := @Points; Sum := 0;
  for I:=0 to Count-2 do Sum := Sum + Abs(PIn^[I+1].X-PIn^[I].X) + Abs(PIn^[I+1].Y-PIn^[I].Y);
  POut := StackAlloc(Sum shl 3);
  QSData.Result := Integer(POut);
  QSData.Mode := 0;
  DoQSPoints(PIn^,Count,QSData);
  Polyline(DC,POut^,(QSData.Result - Integer(POut)) shr 3);
  StackFree(POut);
end;
{$O+}

procedure RectHLine(DC: HDC; var Points; Count: Integer);
begin
  RectLine(DC,Points,Count,False);
end;

procedure RectVLine(DC: HDC; var Points; Count: Integer);
begin
  RectLine(DC,Points,Count,True);
end;

function LineLength(LType: TLineType; var Points; Count: Integer): Integer;
var QSD: TQSData;
begin
  QSD.Result := 0;
  DoPoints(LType,Points,Count,QSD,DoLineLength);
  Result := QSD.Result;
end;

function MassCenter(LType: TLineType; var Points; Count: Integer): TPoint;
var QSD: TQSData;
begin
  Result := TPointArray(Points)[0];
  QSD.Result := 0;
  QSD.Source := Point(0,0);
  DoPoints(LType,Points,Count,QSD,DoMassCenter);
  if QSD.Result > 0 then begin
    Result.X := QSD.Source.X div QSD.Result;
    Result.Y := QSD.Source.Y div QSD.Result;
  end;
end;

function LineCenter(LType: TLineType; var Points; Count: Integer): TPoint;
var Pts: PPointArray;
  function PartialLength(OldLen,Index: Integer; var Center: TPoint): Integer;
  var NewLen: Integer;
  begin
    Result := PartLen(LType,Pts,Index,Count,nil,nil);
    if Index = Count-2 then NewLen := 0
    else NewLen := PartialLength(OldLen+Result,Index+1,Center);
    if (OldLen+Result >= NewLen) and (NewLen+Result >= OldLen) then begin
      Center.X := (NewLen+Result-OldLen) shr 1;
      Center.Y := Result;
      LastIndex := Index;
      PartLen(LType,Pts,Index,Count,@Center,nil);
    end;
    Inc(Result,NewLen);
  end;
begin
  Pts := @Points; Result := Pts^[0];
  ChkType(LType,Count);
  if Count > 1 then PartialLength(0,0,Result);
end;

function PointIndex: Integer;
begin
  Result := LastIndex;
end;

{$O-}
function PtOnLine(LType: TLineType; var Points; Count,Delta,X,Y: Integer): Boolean;
var
  I,D1,D2: Integer;
  Pt0,Pt1: PPointArray;
  QSD: TQSData;
begin
  Pt0 := @Points; Pt1 := nil;
  QSD.Source := Point(X,Y);
  QSD.Prev.X := Delta;
  if (LType=liQSpline) and (Count > 2) then begin
    QSD.Last := 1; D2 := 0;
    for I:=0 to Count-3 do begin
      D1 := Abs(Pt0^[I+1].X-Pt0^[I].X)+Abs(Pt0^[I+1].Y-Pt0^[I].Y);
      D1 := D1+Abs(Pt0^[I+2].X-Pt0^[I+1].X)+Abs(Pt0^[I+2].Y-Pt0^[I+1].Y);
      if D1 > D2 then D2 := D1;
    end;
    Pt1 := StackAlloc(D2 shl 3);
    QSD.Result := Integer(Pt1);
  end;
  Result := DoPoints(LType,Points,Count,QSD,DoPtOnLine);
  if Pt1 <> nil then StackFree(Pt1);
end;

function RectOnLine(LType: TLineType; var Points; Count: Integer; const R: TRect): Boolean;
var
  I,D1,D2: Integer;
  Pt0,Pt1: PPointArray;
  QSD: TQSData;
begin
  Pt0 := @Points; Pt1 := nil;
  QSD.Rect := R;
  if (LType=liQSpline) and (Count > 2) then begin
    QSD.Last := 1; D2 := 0;
    for I:=0 to Count-3 do begin
      D1 := Abs(Pt0^[I+1].X-Pt0^[I].X)+Abs(Pt0^[I+1].Y-Pt0^[I].Y);
      D1 := D1+Abs(Pt0^[I+2].X-Pt0^[I+1].X)+Abs(Pt0^[I+2].Y-Pt0^[I+1].Y);
      if D1 > D2 then D2 := D1;
    end;
    Pt1 := StackAlloc(D2 shl 3);
    QSD.Result := Integer(Pt1);
  end;
  Result := DoPoints(LType,Points,Count,QSD,DoRectOnLine);
  if Pt1 <> nil then StackFree(Pt1);
end;
{$O+}

end.
