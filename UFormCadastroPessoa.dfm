inherited FormCadastroPessoa: TFormCadastroPessoa
  Caption = 'FormCadastroPessoa'
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnConfirmar: TButton
      Left = 331
      ExplicitLeft = 331
    end
    inherited btnSair: TButton
      Left = 475
      ExplicitLeft = 475
    end
    inherited btnAdicionar: TButton
      Left = 185
      ExplicitLeft = 185
    end
  end
  inherited pg: TPageControl
    inherited tbPesquisa: TTabSheet
      inherited Panel1: TPanel
        inherited edtPesquisa: TButtonedEdit
          Images = img24
          RightButton.DisabledImageIndex = 3
          RightButton.HotImageIndex = 3
          RightButton.ImageIndex = 3
          RightButton.PressedImageIndex = 3
        end
      end
      inherited StringGrid1: TStringGrid
        Tag = 3
        ColCount = 3
        FixedCols = 0
        RowCount = 2
        ExplicitLeft = 0
        ExplicitTop = 85
        ExplicitWidth = 614
        ExplicitHeight = 198
        ColWidths = (
          102
          354
          354)
        ColAligments = (
          0
          0
          0)
      end
    end
    inherited tbCadastro: TTabSheet
      inherited pnlCadastro: TPanel
        ExplicitWidth = 614
        ExplicitHeight = 327
      end
    end
  end
  inherited pnlTitulo: TPanel
    inherited imgFechar: TImage
      Left = 567
      ExplicitLeft = 567
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dm.mmPessoas
    ScopeMappings = <>
    Left = 296
    Top = 200
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkFillControlToField1: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'UF'
      Control = cbUF
      Track = True
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <
        item
          MemberName = 'CNPJCPF'
        end
        item
          MemberName = 'NOME'
        end
        item
          MemberName = 'LOGRADOURO'
        end>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'NOME'
      Control = edtRAZAOSOCIAL
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'LOGRADOURO'
      Control = edtLOGRADOURO
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'CNPJCPF'
      Control = edtCNPJCPF
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'NUMERO'
      Control = edtNumero
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'CEP'
      Control = edtCEP
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'CELULAR'
      Control = edtCELULAR
      Track = True
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'MUNICIPIO'
      Control = edtMunicipio
      Track = True
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'EMAIL'
      Control = edtEMAIL
      Track = True
    end
    object LinkControlToField9: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'BAIRRO'
      Control = edtCOMPLEMENTO
      Track = True
    end
    object LinkControlToField10: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'TELEFONE'
      Control = edtTELEFONE
      Track = True
    end
  end
end
