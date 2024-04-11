unit UFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.ExtCtrls
  , unConstantes, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs
  ;

type
  TFormPadrao = class(TForm)
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnSair: TButton;
    btnAdicionar: TButton;
    pnlTitulo: TPanel;
    img24: TImageList;
    Picture: TOpenPictureDialog;
    imgFechar: TImage;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
  private
    FTitulo: string;
    procedure SetFTitulo(const Value: string);
    { Private declarations }
  public
    situacao: TStatus;
    property titulo : string read FTitulo write SetFTitulo;
    procedure DrawPadrao(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure DrawComboBox(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    { Public declarations }
  end;

var
  FormPadrao: TFormPadrao;

implementation
  uses
    unFuncoes;

{$R *.dfm}

procedure TFormPadrao.btnAdicionarClick(Sender: TObject);
begin
  situacao := stAdicionar;
  controlaComponente(Self, True);
end;

procedure TFormPadrao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPadrao.DrawComboBox(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control).Canvas do
  begin

    FillRect(Rect);
    Font.Style := [];
    Font.Color := TColor($00404040);
    if odSelected in State then
    begin
      Brush.Color := TColor(CL_SELECT_ITEM);
      Font.Style := [TFontStyle.fsBold];
      RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 1, 1);
    end;

    TextOut(Rect.Left + 2, Rect.Top + 2, TComboBox(Control).Items.Strings[Index]);
  end;
end;

procedure TFormPadrao.DrawPadrao(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TListBox(Control).Canvas do
  begin
    FillRect(Rect);
    Font.Style := [];
    Font.Color := clBlack;
    if odSelected in State then
    begin
      Brush.Color :=  CL_SELECT_ITEM;
      RoundRect(Rect.Left, Rect.Top, Rect.Right - 1, Rect.Bottom, 1, 1);
    end
    else if Odd(Index) then //se é um item ímpar
    begin
      Brush.Color := $00F8F8F8;
      FillRect(Rect);
      Brush.Style := bsClear;
    end else Brush.Color := clWhite;
  end;
end;

procedure TFormPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    Close;
    Key := #0;
  end
  else if key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TFormPadrao.FormResize(Sender: TObject);
begin
  imgFechar.Left := (Self.Width - imgFechar.Width);
end;

procedure TFormPadrao.FormShow(Sender: TObject);
begin
//  controlaComponente(Self, False);

end;

procedure TFormPadrao.SetFTitulo(const Value: string);
begin
  FTitulo := Value;
  pnlTitulo.Caption := '   - ' + Ftitulo;
end;


end.
