unit UFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs;

type
  TStatus            = (stNone, stAdicionar, stAlterar, stExcluir);
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
    FSituacao: TStatus;
    procedure SetFTitulo(const Value: string);
    procedure setFSituacao(const Value: TStatus);
    { Private declarations }
  public
    procedure DrawPadrao(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure DrawComboBox(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure controlaComponente(form : TForm; habilita : boolean = false);
    procedure Erro(const sValue : string);
    procedure Mensagem(const sValue : string);

    property Titulo : string read FTitulo write SetFTitulo;
    property Situacao : TStatus read FSituacao write setFSituacao;
    { Public declarations }
  end;
const
  CL_SELECT_ITEM     = $00FFD2A6;
  COR_FONTE_PAINEL_TITULO = $00404040;

var
  FormPadrao: TFormPadrao;

implementation
  uses
  RxCurrEdit, Vcl.ComCtrls, Vcl.Samples.Spin, RxToolEdit, Vcl.CheckLst;
//    unFuncoes;

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

procedure TFormPadrao.controlaComponente(form: TForm; habilita: boolean);
var
  i : integer;
begin
  for i := 0 to form.ComponentCount - 1 do
  begin
    if form.Components[i] is TButtonedEdit then
    begin
      if TButtonedEdit(form.Components[i]).Tag = 1001 then
        continue;

      TButtonedEdit(form.Components[i]).Enabled := habilita;
      if not habilita then TButtonedEdit(form.Components[i]).Clear;

    end else
    if form.Components[i] is TCurrencyEdit then
    begin
      if TCurrencyEdit(form.Components[i]).Tag = 1001 then
        continue;

      TCurrencyEdit(form.Components[i]).Enabled := habilita;
      if not habilita then TCurrencyEdit(form.Components[i]).Clear;

    end else
    if form.Components[i] is TEdit then
    begin
      if TEdit(form.Components[i]).Tag = 1001 then
        continue;

      TEdit(form.Components[i]).Enabled := habilita;

      if not habilita then TEdit(form.Components[i]).Clear;
    end else
    if form.Components[i] is TComboBox then
    begin
      if TComboBox(form.Components[i]).Tag = 1001 then
        continue;

      TComboBox(form.Components[i]).Enabled := habilita;

      if TComboBox(form.Components[i]).Items.Count = 1 then
        TComboBox(form.Components[i]).ItemIndex := 0;

    end else
    if form.Components[i] is TDateTimePicker then
    begin
      if TDateTimePicker(form.Components[i]).Tag = 1001 then
        continue;

      TDateTimePicker(form.Components[i]).Enabled := habilita;
    end else
    if form.Components[i] is TSpinEdit then
    begin
      if TSpinEdit(form.Components[i]).Tag = 1001 then
        continue;

      TSpinEdit(form.Components[i]).Enabled := habilita;
    end else
    if form.Components[i] is TListBox then
    begin
      if TListBox(form.Components[i]).Tag = 1001 then
        continue;

      TListBox(form.Components[i]).Enabled := habilita;

//      if not habilita then TListBox(form.Components[i]).Clear;
    end else
    if form.Components[i] is TCheckBox then
    begin
      if TCheckBox(form.Components[i]).Tag = 1001 then
        continue;

      TCheckBox(form.Components[i]).Enabled := habilita;
    end else
    if form.Components[i] is TMemo then
    begin
      if TMemo(form.Components[i]).Tag = 1001 then
        continue;

      TMemo(form.Components[i]).Enabled := habilita;

       if not habilita then TMemo(form.Components[i]).Lines.Clear;
    end;
    if form.Components[i] is TDateEdit then
    begin
      if TDateEdit(form.Components[i]).Tag = 1001 then
        continue;

      TDateEdit(form.Components[i]).Enabled := habilita;
    end;
    if form.Components[i] is TRadioGroup then
    begin
      if TRadioGroup(form.Components[i]).Tag = 1001 then
        continue;

      TRadioGroup(form.Components[i]).Enabled := habilita;
    end;
    if form.Components[i] is TCheckListBox then
    begin
      if TCheckListBox(form.Components[i]).Tag = 1001 then
        continue;

      TCheckListBox(form.Components[i]).Enabled := habilita;
    end;

  end;

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

procedure TFormPadrao.Erro(const sValue: string);
begin

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

procedure TFormPadrao.Mensagem(const sValue: string);
begin

end;

procedure TFormPadrao.setFSituacao(const Value: TStatus);
begin
  FSituacao := Value;
end;

procedure TFormPadrao.SetFTitulo(const Value: string);
begin
  FTitulo := Value;
  pnlTitulo.Caption := '   - ' + Ftitulo;
end;


end.
