object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'frmCadCliente'
  ClientHeight = 567
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 0
    Top = 0
    Width = 789
    Height = 23
    Align = alTop
    Alignment = taCenter
    Caption = 'Cadastro Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 135
  end
  object lblNome: TLabel
    Left = 30
    Top = 65
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblIdentidade: TLabel
    Left = 30
    Top = 93
    Width = 52
    Height = 13
    Caption = 'Identidade'
  end
  object lblCpf: TLabel
    Left = 30
    Top = 125
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lblTelefone: TLabel
    Left = 30
    Top = 155
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblEmail: TLabel
    Left = 30
    Top = 185
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblEndereco: TLabel
    Left = 8
    Top = 232
    Width = 65
    Height = 19
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCep: TLabel
    Left = 30
    Top = 275
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object lblLogradouro: TLabel
    Left = 30
    Top = 305
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object lblNumero: TLabel
    Left = 30
    Top = 335
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object lblComplemento: TLabel
    Left = 30
    Top = 365
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object lblBairro: TLabel
    Left = 29
    Top = 393
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object lblCidade: TLabel
    Left = 30
    Top = 425
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lblEstado: TLabel
    Left = 30
    Top = 455
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object lblPais: TLabel
    Left = 30
    Top = 485
    Width = 19
    Height = 13
    Caption = 'Pais'
  end
  object lblBasico: TLabel
    Left = 8
    Top = 29
    Width = 44
    Height = 19
    Caption = 'B'#225'sico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNome: TEdit
    Left = 100
    Top = 60
    Width = 430
    Height = 21
    TabOrder = 0
    TextHint = 'Nome'
  end
  object edtIdentidade: TEdit
    Left = 100
    Top = 90
    Width = 121
    Height = 21
    TabOrder = 1
    TextHint = 'Identidade'
  end
  object edtCpf: TEdit
    Left = 100
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
    TextHint = 'CPF'
  end
  object edtTelefone: TEdit
    Left = 100
    Top = 150
    Width = 121
    Height = 21
    TabOrder = 3
    TextHint = 'Telefone'
  end
  object edtEmail: TEdit
    Left = 100
    Top = 180
    Width = 121
    Height = 21
    TabOrder = 4
    TextHint = 'Email'
  end
  object edtCep: TEdit
    Left = 101
    Top = 270
    Width = 121
    Height = 21
    TabOrder = 5
    TextHint = 'Cep'
  end
  object edtLogradouro: TEdit
    Left = 100
    Top = 300
    Width = 430
    Height = 21
    TabOrder = 6
    TextHint = 'Logradouro'
  end
  object edtNumero: TEdit
    Left = 100
    Top = 330
    Width = 121
    Height = 21
    TabOrder = 7
    TextHint = 'Numero'
  end
  object edtComplemento: TEdit
    Left = 101
    Top = 363
    Width = 121
    Height = 21
    TabOrder = 8
    TextHint = 'Complemento'
  end
  object edtBairro: TEdit
    Left = 100
    Top = 390
    Width = 220
    Height = 21
    TabOrder = 9
    TextHint = 'Bairro'
  end
  object edtCidade: TEdit
    Left = 101
    Top = 423
    Width = 220
    Height = 21
    TabOrder = 10
    TextHint = 'Cidade'
  end
  object edtEstado: TEdit
    Left = 101
    Top = 450
    Width = 121
    Height = 21
    TabOrder = 11
    TextHint = 'Estado'
  end
  object edtPais: TEdit
    Left = 100
    Top = 480
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'Brasil'
    TextHint = 'Pais'
  end
  object btnBuscarCep: TButton
    Left = 248
    Top = 268
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 13
    OnClick = btnBuscarCepClick
  end
  object btnSalvar: TButton
    Left = 416
    Top = 534
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 14
    OnClick = btnSalvarClick
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 728
    Top = 24
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 728
    Top = 80
  end
end
