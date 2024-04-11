inherited FormPadraoCadastro: TFormPadraoCadastro
  ActiveControl = cbPesquisa
  ClientHeight = 420
  ClientWidth = 622
  OnClose = FormClose
  ExplicitWidth = 622
  ExplicitHeight = 420
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 371
    Width = 622
    TabOrder = 2
    ExplicitTop = 346
    ExplicitWidth = 643
    DesignSize = (
      622
      49)
    inherited btnConfirmar: TButton
      Left = 330
      Visible = False
      OnClick = btnConfirmarClick
      ExplicitLeft = 351
    end
    inherited btnSair: TButton
      Left = 474
      ExplicitLeft = 495
    end
    inherited btnAdicionar: TButton
      Left = 186
      ExplicitLeft = 207
    end
  end
  object pg: TPageControl [1]
    Left = 0
    Top = 48
    Width = 622
    Height = 323
    Cursor = crHandPoint
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tbPesquisa
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    OwnerDraw = True
    ParentFont = False
    TabHeight = 30
    TabOrder = 0
    TabWidth = 150
    StyleElements = []
    OnChange = pgChange
    OnDrawTab = pgDrawTab
    ExplicitWidth = 643
    ExplicitHeight = 298
    object tbPesquisa: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        Color = 15198183
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitTop = -1
        object cbPesquisa: TComboBox
          Tag = 1001
          Left = 10
          Top = 19
          Width = 128
          Height = 26
          Style = csOwnerDrawVariable
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 20
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = 'CPF/CNPJ'
          StyleElements = []
          OnChange = cbPesquisaChange
          OnDrawItem = cbPesquisaDrawItem
          Items.Strings = (
            'CPF/CNPJ'
            'Nome')
        end
        object edtPesquisa: TButtonedEdit
          Tag = 1001
          Left = 141
          Top = 19
          Width = 375
          Height = 26
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          RightButton.HotImageIndex = 28
          RightButton.ImageIndex = 29
          RightButton.Visible = True
          TabOrder = 1
          TextHint = 'Informe algo a pesquisar.'
          StyleElements = []
          OnKeyPress = edtPesquisaKeyPress
          OnRightButtonClick = btnPesquisaClick
        end
        object spLimite: TSpinEdit
          Tag = 1001
          Left = 519
          Top = 19
          Width = 91
          Height = 26
          Cursor = crHandPoint
          Hint = 'Limitar o total de registro na pesquisa.'
          Color = clWhite
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Increment = 10
          MaxValue = 1000
          MinValue = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Value = 100
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 60
        Width = 614
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 42495
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        ExplicitWidth = 635
        DesignSize = (
          614
          25)
        object lblCPFCNPJ: TLabel
          Left = 9
          Top = 5
          Width = 137
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNome: TLabel
          Left = 152
          Top = 5
          Width = 121
          Height = 16
          Caption = '| Nome/Raz'#227'o Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBloqueado: TLabel
          Left = 535
          Top = 5
          Width = 69
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '| Bloqueado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 556
        end
        object btnPesquisa: TButton
          Left = -213
          Top = 73
          Width = 28
          Height = 28
          HotImageIndex = 29
          ImageIndex = 28
          ImageMargins.Left = 2
          ImageMargins.Top = 2
          ImageMargins.Right = 2
          ImageMargins.Bottom = 2
          TabOrder = 0
        end
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 85
        Width = 614
        Height = 198
        Align = alClient
        TabOrder = 2
        ExplicitLeft = 40
        ExplicitTop = 136
        ExplicitWidth = 320
        ExplicitHeight = 120
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 2
      object pnlCadastro: TPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 283
        Align = alClient
        BevelOuter = bvNone
        Color = 15198183
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 635
        ExplicitHeight = 258
        object Label1: TLabel
          Left = 18
          Top = 12
          Width = 55
          Height = 16
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label3: TLabel
          Left = 18
          Top = 54
          Width = 111
          Height = 16
          Caption = 'Nome/Raz'#227'o Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label4: TLabel
          Left = 18
          Top = 96
          Width = 22
          Height = 16
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label5: TLabel
          Left = 97
          Top = 96
          Width = 65
          Height = 16
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label6: TLabel
          Left = 18
          Top = 138
          Width = 34
          Height = 16
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label7: TLabel
          Left = 529
          Top = 138
          Width = 15
          Height = 16
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label8: TLabel
          Left = 18
          Top = 179
          Width = 53
          Height = 16
          Caption = 'Munic'#237'pio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label9: TLabel
          Left = 269
          Top = 181
          Width = 50
          Height = 16
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label10: TLabel
          Left = 437
          Top = 181
          Width = 40
          Height = 16
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object Label12: TLabel
          Left = 18
          Top = 224
          Width = 35
          Height = 16
          Caption = 'E-Mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object lblNumero: TLabel
          Left = 529
          Top = 96
          Width = 45
          Height = 16
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = []
        end
        object edtCNPJCPF: TEdit
          Left = 18
          Top = 29
          Width = 185
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 14
          NumbersOnly = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          StyleElements = []
          OnEnter = edtCEPEnter
          OnExit = edtCNPJCPFExit
        end
        object edtRAZAOSOCIAL: TEdit
          Left = 18
          Top = 71
          Width = 584
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 200
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          StyleElements = []
        end
        object edtCEP: TEdit
          Left = 18
          Top = 113
          Width = 73
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 8
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          StyleElements = []
          OnEnter = edtCEPEnter
          OnExit = edtCEPExit
        end
        object edtLOGRADOURO: TEdit
          Left = 97
          Top = 113
          Width = 426
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 100
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          StyleElements = []
        end
        object edtCOMPLEMENTO: TEdit
          Left = 18
          Top = 155
          Width = 505
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 200
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          StyleElements = []
        end
        object cbUF: TComboBox
          Left = 529
          Top = 155
          Width = 73
          Height = 24
          Style = csOwnerDrawVariable
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 18
          ParentFont = False
          TabOrder = 6
          StyleElements = []
          OnDrawItem = cbUFDrawItem
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object edtTELEFONE: TEdit
          Left = 269
          Top = 197
          Width = 164
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
          StyleElements = []
          OnEnter = edtCEPEnter
          OnExit = edtTELEFONEExit
        end
        object edtCELULAR: TEdit
          Left = 437
          Top = 197
          Width = 165
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
          StyleElements = []
          OnEnter = edtCEPEnter
          OnExit = edtTELEFONEExit
        end
        object edtEMAIL: TEdit
          Left = 18
          Top = 240
          Width = 584
          Height = 24
          AutoSize = False
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 100
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
          StyleElements = []
        end
        object edtNumero: TEdit
          Left = 529
          Top = 113
          Width = 73
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          StyleElements = []
        end
        object edtMunicipio: TEdit
          Left = 18
          Top = 197
          Width = 247
          Height = 24
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4998466
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 200
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
          StyleElements = []
        end
      end
    end
  end
  inherited pnlTitulo: TPanel
    Width = 622
    ExplicitWidth = 643
    DesignSize = (
      622
      48)
    inherited imgFechar: TImage
      Left = 571
      ExplicitLeft = 592
    end
  end
end
