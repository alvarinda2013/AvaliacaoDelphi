object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object mmEmpresas: TFDMemTable
    BeforePost = mmEmpresasBeforePost
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 120
    Top = 24
    object mmEmpresasID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      KeyFields = 'ID'
    end
    object mmEmpresasCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object mmEmpresasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mmEmpresasCEP: TStringField
      FieldName = 'CEP'
      Size = 11
    end
    object mmEmpresasLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 50
    end
    object mmEmpresasNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object mmEmpresasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object mmEmpresasUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mmEmpresasMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 50
    end
    object mmEmpresasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 10
    end
    object mmEmpresasCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object mmEmpresasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object mmPessoas: TFDMemTable
    CachedUpdates = True
    IndexFieldNames = 'CNPJCPF;NOME'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 216
    Top = 24
    object mmPessoasID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      KeyFields = 'ID'
      Visible = False
    end
    object mmPessoasID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      LookupDataSet = mmEmpresas
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_EMPRESA'
      Visible = False
    end
    object mmPessoasCNPJ: TStringField
      FieldName = 'CNPJCPF'
      Size = 14
    end
    object mmPessoasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mmPessoasCEP: TStringField
      FieldName = 'CEP'
      Size = 11
    end
    object mmPessoasLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 50
    end
    object mmPessoasNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object mmPessoasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object mmPessoasUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mmPessoasMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 50
    end
    object mmPessoasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 10
    end
    object mmPessoasCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object mmPessoasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object XMLDocument: TXMLDocument
    Left = 52
    Top = 200
    DOMVendorDesc = 'MSXML'
  end
end
