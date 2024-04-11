unit UFormPadraoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.DApt, FireDAC.Comp.Client, Vcl.WinXCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Imaging.pngimage, Vcl.Samples.Spin, UFormPadrao, Vcl.ExtDlgs, System.ImageList, Vcl.ImgList;

type


  TFormPadraoCadastro = class(TFormPadrao)
    pg: TPageControl;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    pnlCadastro: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    lblNumero: TLabel;
    edtCNPJCPF: TEdit;
    edtRAZAOSOCIAL: TEdit;
    edtCEP: TEdit;
    edtLOGRADOURO: TEdit;
    edtCOMPLEMENTO: TEdit;
    cbUF: TComboBox;
    edtTELEFONE: TEdit;
    edtCELULAR: TEdit;
    edtEMAIL: TEdit;
    edtNumero: TEdit;
    Panel1: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TButtonedEdit;
    spLimite: TSpinEdit;
    Panel2: TPanel;
    lblCPFCNPJ: TLabel;
    lblNome: TLabel;
    lblBloqueado: TLabel;
    btnPesquisa: TButton;
    StringGrid1: TStringGrid;
    edtMunicipio: TEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure ListaDblClick(Sender: TObject);
    procedure ListaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure FormShow(Sender: TObject);
    procedure edtCEPEnter(Sender: TObject);
    procedure edtCNPJCPFExit(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtTELEFONEExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure ListaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CbMunicipioDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cbUFDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cbIDINDICADORIEDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cbPesquisaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pgChange(Sender: TObject);
    procedure pgDrawTab(Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure atualizaListaDestinatario;virtual;

    function validaCadastro : boolean;
    { Private declarations }
  public
    procedure limparEdits;virtual;
    constructor Create(AOwner: TComponent; Const pSituacao : TStatus = stNone); reintroduce; overload;
    { Public declarations }
  end;

var
  FormPadraoCadastro: TFormPadraoCadastro;

implementation
  uses
      System.DateUtils, System.UITypes, System.Types, ACBrUtil.strings,  untFuncoes;

{$R *.dfm}

procedure TFormPadraoCadastro.atualizaListaDestinatario;
begin
  situacao := stNone;
  pg.ActivePage := tbPesquisa;
  btnPesquisaClick(Nil);
end;

procedure TFormPadraoCadastro.btnConfirmarClick(Sender: TObject);
begin
  try
    if not(validaCadastro) then Exit;
    atualizaListaDestinatario;
    limparEdits;
    controlaComponente(Self, False);
    Situacao := stNone;
  except
    on e: exception do
      Erro(e.Message);
  end;

end;

procedure TFormPadraoCadastro.btnPesquisaClick(Sender: TObject);
//var
//  CNPJCPF,
//  RazaoSocial : String;
//  sl : TStrings;
begin
  pgChange(btnPesquisa);

//  try
//    try
//
//
//      if cbPesquisa.ItemIndex = 0 then
//      begin
//
//      end
//      else if cbPesquisa.ItemIndex = 1 then
//      begin
//
//      end;
//
//
////      lblQuantidade.Caption := FormatFloat('Total de cadastros: 0000', Lista.Items.Count);
//
//      edtPesquisa.SetFocus;
//
//    except
//      on e: exception do
//        Erro(e.Message);
//    end;
//
//  finally
//    FreeAndNil(sl);
//  end;
end;

procedure TFormPadraoCadastro.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  limparEdits;
  edtCNPJCPF.SetFocus;
  Situacao := stAdicionar;

end;

procedure TFormPadraoCadastro.cbIDINDICADORIEDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control).Canvas do
  begin

    FillRect(Rect);
    Font.Style := [];

    if odSelected in State then
    begin
      Brush.Color := TColor(CL_SELECT_ITEM);
      Font.Color := clBlack;
      Font.Style := [TFontStyle.fsBold];
      RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 1, 1);
    end;

    TextOut(Rect.Left + 1, Rect.Top + 2, TComboBox(Control).Items.Strings[Index]);
  end;
end;

procedure TFormPadraoCadastro.CbMunicipioDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control).Canvas do
  begin

    FillRect(Rect);
    Font.Style := [];

    if odSelected in State then
    begin
      Brush.Color := TColor(CL_SELECT_ITEM);
      Font.Color := clBlack;
      Font.Style := [TFontStyle.fsBold];
      RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 1, 1);
    end;

    TextOut(Rect.Left + 1, Rect.Top + 2, TComboBox(Control).Items.Strings[Index]);
  end;
end;

procedure TFormPadraoCadastro.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.NumbersOnly := cbPesquisa.ItemIndex = 0;
end;

procedure TFormPadraoCadastro.cbPesquisaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control).Canvas do
  begin
    FillRect(Rect);
    Font.Style := [];

    if odSelected in State then
    begin
      Brush.Color := TColor(CL_SELECT_ITEM);
      Font.Color := clBlack;
      Font.Style := [TFontStyle.fsBold];
      RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 1, 1);
    end;

    TextOut(Rect.Left + 1, Rect.Top + 2, TComboBox(Control).Items.Strings[Index]);
  end;
end;

procedure TFormPadraoCadastro.cbUFDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control).Canvas do
  begin

    FillRect(Rect);
    Font.Style := [];

    if odSelected in State then
    begin
      Brush.Color := TColor(CL_SELECT_ITEM);
      Font.Color := clBlack;
      Font.Style := [TFontStyle.fsBold];
      RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 1, 1);
    end;

    TextOut(Rect.Left + 1, Rect.Top + 2, TComboBox(Control).Items.Strings[Index]);
  end;
end;

constructor TFormPadraoCadastro.Create(AOwner: TComponent; Const pSituacao : TStatus);
begin
  inherited Create(owner);
  situacao := pSituacao;
end;

procedure TFormPadraoCadastro.edtCEPEnter(Sender: TObject);
begin
  TEdit(Sender).Text := OnlyNumber(TEdit(Sender).Text);
end;

procedure TFormPadraoCadastro.edtCEPExit(Sender: TObject);
var
  endereco : TDadosEndereco;
begin
  if (Trim(OnlyNumber(TEdit(Sender).Text)).IsEmpty)
  or (not Trim(edtLogradouro.Text).IsEmpty)
  then exit;

  endereco  := consultarCEP(OnlyNumber(TEdit(Sender).Text));
  edtLogradouro.SetFocus;

  edtLOGRADOURO.Text  := UpperCase(Endereco.Logradouro + endereco.Complemento);
  edtCOMPLEMENTO.Text := UpperCase(Endereco.bairro);

  cbUF.ItemIndex      := cbUF.Items.IndexOf(endereco.UF);
  TEdit(Sender).Text := FormatarCEP(TEdit(Sender).Text);
end;

procedure TFormPadraoCadastro.edtCNPJCPFExit(Sender: TObject);
var
  pDadosPJ : TDadosPJ;
  sl : TStrings;
begin

  if Trim(OnlyNumber(TEdit(Sender).Text)).isEmpty then Exit;

  if not(ValidarCPFCNPJ(TEdit(Sender).Text)) then
    Exit;


  case Length(OnlyNumber(TEdit(Sender).Text)) of
    11 : begin
//          cbIDINDICADORIE.ItemIndex := 2;
//          edtINSCESTADUAL.Enabled := False;
         end;
    14 : begin
          if (Trim(edtRAZAOSOCIAL.Text).IsEmpty) then
          begin
            pDadosPJ := ConsultarCNPJ(TEdit(Sender).Text);

            edtRAZAOSOCIAL.Text := pDadosPJ.ds_RazaoSocial;
            edtLOGRADOURO.Text  := pDadosPJ.ds_Logradouro + ' ' + pDadosPJ.ds_Complemento;
            edtCOMPLEMENTO.Text := pDadosPJ.ds_bairro;
            edtTELEFONE.Text    := FormatarTelefone(pDadosPJ.ds_telefone);
            edtCEP.Text         := FormatarCep(pDadosPJ.ds_CEP);
            edtCEPExit(edtCEP);
          end;
         end;
  end;

  TEdit(Sender).Text := FormatarCPFCNPJ(TEdit(Sender).Text);

end;

procedure TFormPadraoCadastro.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    btnPesquisaClick(Sender);
    key := #0;
  end;
end;

procedure TFormPadraoCadastro.edtTELEFONEExit(Sender: TObject);
begin
  TEdit(Sender).Text := FormatarTelefone(TEdit(Sender).Text);
end;

procedure TFormPadraoCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 situacao := stNone;
end;

procedure TFormPadraoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (pg.ActivePage <> tbPesquisa) then
  begin
    pg.ActivePage := tbPesquisa;
    edtPesquisa.SetFocus;
  end
  else if key = #27 then Close
  else if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TFormPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;

  edtPesquisa.Clear;
  cbPesquisa.ItemIndex := 0;
  edtPesquisa.NumbersOnly := cbPesquisa.ItemIndex = 0;

  if situacao = stAdicionar then
  begin
    tbPesquisa.TabVisible := False;
    pg.ActivePage := tbCadastro;
//    btnAdicionar.SetFocus
  end
  else
  begin
    pg.ActivePage := tbPesquisa;
    if tbPesquisa.TabVisible then
      edtPesquisa.SetFocus;
  end;

  limparEdits;
  controlaComponente(Self, False);

end;

procedure TFormPadraoCadastro.limparEdits;
begin
  edtRAZAOSOCIAL.Text       := emptyStr;
  edtCNPJCPF.Text           := emptyStr;
  edtEMAIL.Text             := emptyStr;

  edtMunicipio.Text        := emptyStr;
  edtLOGRADOURO.Text        := emptyStr;
  edtCOMPLEMENTO.Text       := emptyStr;
  edtCEP.Text               := emptyStr;
  edtTELEFONE.Text          := emptyStr;
  edtCELULAR.Text           := emptyStr;
  cbUF.ItemIndex            := -1;
end;

procedure TFormPadraoCadastro.ListaDblClick(Sender: TObject);
begin
  if TListBox(Sender).ItemIndex < 0  then exit;

  limparEdits;

  controlaComponente(Self, True);

  pgChange(Nil);

end;

procedure TFormPadraoCadastro.ListaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  r: TRect;
//  itm : TPessoa;
begin
  with TListBox(Control).Canvas do
  begin

    DrawPadrao(Control, Index, Rect, State);

//    itm := TPessoa(TListBox(Control).Items.Objects[Index]);

    r := Rect;
    r.top := r.top + 2;

    r.Right := lblCPFCNPJ.Left  + lblCPFCNPJ.Width;
    r.Left  := lblCPFCNPJ.Left;
//    DrawText(Handle, FormataCPFCNPJ(itm.NU_CNPJ_CPF), -1, r, DT_CENTER);

    r := Rect;
    r.top := r.top + 2;

    r.Right := lblNome.Left  + lblBloqueado.Left;
    r.Left  := lblNome.Left;
//    DrawText(Handle, itm.DS_RAZAO_SOCIAL, -1, r, DT_LEFT);

    r := Rect;
    r.top := r.top + 2;

    r.Right := lblBloqueado.Left  + lblBloqueado.Width;
    r.Left  := lblBloqueado.Left;

//    DrawText(Handle, IIF(itm.BLOQUEADO, 'Sim', 'Não'), -1, r, DT_CENTER);

//
//    if
//    {$IFDEF WEB}
//    (itm.TP_CONSUMIDOR_FINAL)
//    {$ELSE}
//    (itm.TP_CONSUMIDOR_FINAL = 'S')
//    {$ENDIF}
//
//    and (itm.PADRAO <> 'S')
//    then Draw(Rect.Right - 26, RECT.Top, formImg.imgExcluir.Picture.Graphic);

  end;
end;

procedure TFormPadraoCadastro.ListaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if key = VK_RETURN then
//    ListaDblClick(Lista);
end;

procedure TFormPadraoCadastro.ListaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Rect: TRect;
//  pessoa : TPessoa;
begin
  if TListBox(Sender).ItemIndex < 0 then exit;
  
//  if Button = mbLeft then
//  begin
//    Rect := TListBox(Sender).ItemRect(TListBox(Sender).ItemIndex);
//    pessoa :=  TPessoa(TListBox(Sender).Items.Objects[TListBox(Sender).ItemIndex]);
//
//    if (X >= (Rect.Right - 20)) and (x <= rect.right) then
//    begin
//      if
//        {$IFDEF WEB}
//        (pessoa.TP_CONSUMIDOR_FINAL)
//        {$ELSE}
//        (pessoa.TP_CONSUMIDOR_FINAL = 'S')
//        {$ENDIF}
//      or (pessoa.PADRAO = 'S')
//      then
//      begin
//        Mensagem(Informacao, 'Não é permitido excluir cadastro padrão do sistema! ');
//        exit;
//      end;
//
//    end;
//
//    if (X >= (Rect.Right - 20)) and (x <= rect.right) and
//    (Mensagem(Atencao, 'Tem certeza que deseja excluir ? '))
//    then
//    begin
//      pessoa.excluirPessoa;
//      TListBox(Sender).Items.Delete(TListBox(Sender).ItemIndex);
//      lblQuantidade.Caption := FormatFloat('Total de cadastros: 0000', Lista.Items.Count);
//      pessoa.Free;
//    end;
//  end;
end;

procedure TFormPadraoCadastro.pgChange(Sender: TObject);
begin
  btnAdicionar.Visible         := pg.ActivePage = tbCadastro;
  btnConfirmar.Visible         := pg.ActivePage = tbCadastro;
end;

procedure TFormPadraoCadastro.pgDrawTab(Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  Control.Canvas.Font.Color  := COR_FONTE_PAINEL_TITULO;
  Control.Canvas.Brush.Color := Control.Canvas.Brush.Color;
  Control.Canvas.Pen.Color   := Control.Canvas.Brush.Color;

  TPageControl(Control).Canvas.Rectangle(Rect);
  case TabIndex of
    00 : Control.Canvas.TextOut(Rect.Left + 45, Rect.Top + 8, TPageControl(Control).Pages[TabIndex].Caption);
    01 : Control.Canvas.TextOut(Rect.Left + 50, Rect.Top + 8, TPageControl(Control).Pages[TabIndex].Caption);
    02 : Control.Canvas.TextOut(Rect.Left + 50, Rect.Top + 8, TPageControl(Control).Pages[TabIndex].Caption);
    03 : Control.Canvas.TextOut(Rect.Left + 40, Rect.Top + 8, TPageControl(Control).Pages[TabIndex].Caption);
  end;
end;

function TFormPadraoCadastro.validaCadastro  : boolean;
var
  sl : TStrings;
begin
  try
    result := True;

    sl := TStringList.Create;

    if edtRAZAOSOCIAL.Text = EmptyStr then
      sl.Add('Nome/Razão Social  é obrigatório');

    if edtLogradouro.Text = EmptyStr then
      sl.Add('Logradouro é obrigatório');


    if cbUF.ItemIndex < 0 then
      sl.Add('UF - Unidade Federativa  é obrigatório');

    if Trim(edtMunicipio.Text).IsEmpty then
      sl.Add('Município  é obrigatório');

    if (sl.Count > 0) then
    begin
      result := False;
      ShowMessage(sl.Text);
    end;

  finally
    FreeAndNil(sl);
  end;
end;

end.
