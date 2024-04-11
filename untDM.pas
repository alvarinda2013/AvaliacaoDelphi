unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc;

type
  Tdm = class(TDataModule)
    mmEmpresas: TFDMemTable;
    mmPessoas: TFDMemTable;
    mmEmpresasCNPJ: TStringField;
    mmEmpresasNOME: TStringField;
    mmEmpresasCEP: TStringField;
    mmEmpresasLOGRADOURO: TStringField;
    mmEmpresasNUMERO: TStringField;
    mmEmpresasBAIRRO: TStringField;
    mmEmpresasUF: TStringField;
    mmEmpresasMUNICIPIO: TStringField;
    mmEmpresasTELEFONE: TStringField;
    mmEmpresasCELULAR: TStringField;
    mmEmpresasEMAIL: TStringField;
    mmEmpresasID: TIntegerField;
    mmPessoasID: TIntegerField;
    mmPessoasCNPJ: TStringField;
    mmPessoasNOME: TStringField;
    mmPessoasCEP: TStringField;
    mmPessoasLOGRADOURO: TStringField;
    mmPessoasNUMERO: TStringField;
    mmPessoasBAIRRO: TStringField;
    mmPessoasUF: TStringField;
    mmPessoasMUNICIPIO: TStringField;
    mmPessoasTELEFONE: TStringField;
    mmPessoasCELULAR: TStringField;
    mmPessoasEMAIL: TStringField;
    mmPessoasID_EMPRESA: TIntegerField;
    XMLDocument: TXMLDocument;
    procedure DataModuleCreate(Sender: TObject);
    procedure mmEmpresasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  mmEmpresas.Close;
  mmEmpresas.CreateDataSet;

  mmPessoas.Close;
  mmPessoas.CreateDataSet;
end;

procedure Tdm.mmEmpresasBeforePost(DataSet: TDataSet);
begin
  DataSet.FindField('ID').AsInteger := DataSet.FindField('ID').AsInteger * -1;
end;

end.
