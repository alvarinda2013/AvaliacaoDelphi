unit UFormCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormPadraoCadastro, Vcl.ExtDlgs, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Grids, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFormCadastroPessoa = class(TFormPadraoCadastro)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    idEmpresa : integer;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; const pIdEmpresa : integer); reintroduce; overload;

    { Public declarations }
  end;

var
  FormCadastroPessoa: TFormCadastroPessoa;

implementation
  uses
    untDM, data.DB;

{$R *.dfm}

procedure TFormCadastroPessoa.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  dm.mmPessoas.Insert;
end;

procedure TFormCadastroPessoa.btnConfirmarClick(Sender: TObject);
begin
  if (not (dm.mmPessoas.State in [dsEdit, dsInsert])) then Exit;
  inherited;

  try
    inherited;
    dm.mmPessoas.FindField('ID_EMPRESA').AsInteger := idEmpresa;
    dm.mmPessoas.Post;
  except
    on e: exception do
      Erro(e.Message);
  end;

end;

procedure TFormCadastroPessoa.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  dm.mmPessoas.FindNearest([edtPesquisa.Text]);

end;

constructor TFormCadastroPessoa.Create(AOwner: TComponent; const pIdEmpresa: integer);
begin
  inherited Create(owner);
  idEmpresa := pIdEmpresa;
end;

procedure TFormCadastroPessoa.FormShow(Sender: TObject);
begin
  inherited;
  Titulo := 'Cadastro de Pessoas';
  dm.mmPessoas.Filtered := False;
  dm.mmPessoas.Filter   := 'ID_EMPRESA = ' + idEmpresa.ToString;
  dm.mmPessoas.Filtered := true;

end;

end.
