unit UDatabase;

interface
uses DB, SqlExpr,SysUtils,Classes,DBXpress;
procedure InitDatabaseConnection(host:string;userName:String;password:String;databaseName:String);
procedure CloseDatabaseConnection(dbConnection:TSQLConnection);
function GetNewDatabaseConnection(host:string;userName:String;password:String;databaseName:String):TSQLConnection;

procedure addParam(params:TParams;paramName:String;paramValue:variant;fieldType:TFieldType;paramType:TParamType);
function execQuery(sql:string;params:TParams):TSQLDataSet;
function execQueryWithConn(sql:string;conn:TSQLConnection;params:TParams):TSQLDataSet;
function execUpdateWithConn(sql:string;conn:TSQLConnection;params:TParams):integer;
function execUpdate(sql:string;params:TParams):integer;
function execUpdateWithTran(sql:TStrings):integer;
function execUpdateWithTranAndConn(sql:TStrings;conn:TSQLConnection):integer;
function getFieldText(sqlDataSet:TSQLDataSet;fieldName:String):String;
var
  DBConnection: TSQLConnection;

implementation


procedure addParam(params:TParams;paramName:String;paramValue:variant;fieldType:TFieldType;paramType:TParamType);
var
  param:TParam;
begin
  param:=params.CreateParam(fieldType, paramName, paramType);
  param.Value := paramValue;
end;


function execQuery(sql:string;params:TParams):TSQLDataSet;
begin
  result:=execQueryWithConn(sql,DBConnection,params);
end;


function getFieldText(sqlDataSet:TSQLDataSet;fieldName:String):String;
var
  s:string;
begin
  s:=sqlDataSet.FindField(fieldName).AsVariant;
  result:=s;
end;

function execQueryWithConn(sql:string;conn:TSQLConnection;params:TParams):TSQLDataSet;
var
  SQLDataSet:TSQLDataSet;
  i:integer;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=conn;
  SQLDataSet.CommandType:=ctQuery;
  SQLDataSet.CommandText:=sql;
  if(not (params=nil)) then
  begin
    for i:=0 to params.Count-1 do
    begin
      SQLDataSet.Params[i].AsString:=params[i].AsString;
    end;
  end;
  SQLDataSet.Open;
  SQLDataSet.First;
  result:=sqldataset;
end;

function execUpdateWithConn(sql:string;conn:TSQLConnection;params:TParams):integer;
var
  SQLDataSet:TSQLDataSet;
  i:integer;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=conn;
  SQLDataSet.CommandType:=ctQuery;
  SQLDataSet.CommandText:=sql;
  if(not (params=nil)) then
  begin
    for i:=0 to params.Count-1 do
    begin
      SQLDataSet.Params[i].AsString:=params[i].AsString;
    end;
  end;
  SQLDataSet.Prepared:=true;
  result:=SQLDataSet.ExecSQL(false);
  SQLDataSet.Close;
  SQLDataSet.Params.Clear;
  SQLDataSet.CommandText:='select @@identity';
  SQLDataSet.Open;
  SQLDataSet.First;
  result:=strtoint(SQLDataSet.Fields[0].Text);
  SQLDataSet.Close;

end;

function execUpdate(sql:string;params:TParams):integer;
begin
  result:=execUpdateWithConn(sql,DBConnection,params);
end;

function execUpdateWithTranAndConn(sql:TStrings;conn:TSQLConnection):integer;
var
  SQLDataSet:TSQLDataSet;
  TD:   TTransactionDesc;
  i:integer;
begin
  result:=0;
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=conn;
  SQLDataSet.CommandType:=ctQuery;
  TD.TransactionID   :=   1;
  TD.IsolationLevel   :=   xilREADCOMMITTED;
  DBConnection.StartTransaction(TD);
  try
    for i:=0 to sql.Count-1 do
    begin
      SQLDataSet.CommandText:=sql.Strings[i];
      SQLDataSet.ExecSQL(true);
    end;
    DBConnection.Commit(TD);   {on   success,   commit   the   changes};
    sql.free;
    SQLDataSet.Close;
    result:=1;
  except
    on e:Exception do
    begin
      DBConnection.Rollback(TD);   {on   failure,   undo   the   changes};
      sql.free;
      raise;
    end;
  end;
end;

function execUpdateWithTran(sql:TStrings):integer;
begin
  result:=execUpdateWithTranAndConn(sql,DBConnection);
end;


procedure InitDatabaseConnection(host:string;userName:String;password:String;databaseName:String);
begin
  DBConnection := GetNewDatabaseConnection(host,userName,password,databaseName);
end;


function GetNewDatabaseConnection(host:string;userName:String;password:String;databaseName:String):TSQLConnection;
var
  SQLDataSet:TSQLDataSet;
begin
  result := TSQLConnection.Create(nil);
  result.DriverName := 'dbxmysql';
  result.GetDriverFunc := 'getSQLDriverMYSQL50';
  result.LibraryName := 'dbxopenmysql50.dll';
  result.VendorLib := 'libmysql.dll';
  result.Params.Append('Database='+databaseName);
  result.Params.Append('User_Name='+userName);
  result.Params.Append('Password='+password);
  result.Params.Append('HostName='+host);
  result.LoginPrompt:=false;
  result.Open;

  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=result;
  SQLDataSet.CommandType:=ctQuery;
  SQLDataSet.CommandText:= 'SET NAMES GBK;';
  SQLDataSet.ExecSQL(true);
  SQLDataSet.Close;

end;

procedure CloseDatabaseConnection(dbConnection:TSQLConnection);
begin
  dbConnection.Close;
  dbConnection.Free;
end;

end.
 