unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MemTableDataEh, Data.DB, MemTableEh, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    cbb: TComboBox;
    MDS: TMemTableEh;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbbChange(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  k: Integer;
begin
  k:= cbb.Items.IndexOfObject(TObject(StrToInt(Edit1.Text)));
  if (k > -1)
    then cbb.ItemIndex:= k
    else cbb.ItemIndex:= 0;
  cbbChange(Sender);
end;

procedure TForm1.cbbChange(Sender: TObject);
begin
  if Assigned(TObject(cbb.Items[cbb.ItemIndex])) then
    Label1.Caption:= IntToStr(System.Integer(cbb.Items.Objects[cbb.ItemIndex]));
  if ((cbb.ItemIndex mod 2) = 0)
    then cbb.Font.Color:= clRed
    else cbb.Font.Color:= clWindowText;

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(Ord(VK_BACK))]) then Key:= #0;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
begin
  with mds do
  begin
    FieldDefs.Add('ID',ftInteger);
    FieldDefs.Add('Str',ftString, 30);

    CreateDataSet;
    Filtered := False;
    Active := False;
  end;

  mds.Active:= True;

  for i := 1 to 20 do
  begin
    MDS.AppendRecord([i, FormatDateTime('hh.nn.zzzz', Now)]);
    Sleep(50);
  end;

  cbb.Clear;
  MDS.First;

  while not MDS.Eof do
  begin
    cbb.Items.AddObject(MDS.Fields[1].AsString, TObject(MDS.Fields[0].AsInteger));
    MDS.Next;
  end;

  Edit1.Text:= IntToStr(1);
  cbb.ItemIndex:= 0;
  cbbChange(Sender);
end;

end.
