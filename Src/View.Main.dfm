object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'YouTube Studio em Delphi'
  ClientHeight = 680
  ClientWidth = 1120
  Color = clBtnFace
  Constraints.MinHeight = 640
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 17
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 1120
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    object lbStatus: TLabel
      Left = 890
      Top = 28
      Width = 83
      Height = 17
      Caption = 'Desconectado'
    end
    object lbClientID: TLabel
      Left = 12
      Top = 7
      Width = 44
      Height = 17
      Caption = 'ClientID'
    end
    object lbSecret: TLabel
      Left = 315
      Top = 7
      Width = 36
      Height = 17
      Caption = 'Secret'
    end
    object btnConectar: TButton
      Left = 626
      Top = 21
      Width = 120
      Height = 32
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = btnConectarClick
    end
    object btnDesconectar: TButton
      Left = 754
      Top = 21
      Width = 120
      Height = 32
      Caption = 'Desconectar'
      TabOrder = 3
      OnClick = btnDesconectarClick
    end
    object edtClientID: TEdit
      Left = 12
      Top = 26
      Width = 300
      Height = 25
      TabOrder = 0
    end
    object edtSecret: TEdit
      Left = 315
      Top = 26
      Width = 300
      Height = 25
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object pageControlStudio: TPageControl
    Left = 0
    Top = 57
    Width = 1120
    Height = 623
    ActivePage = tabVideos
    Align = alClient
    TabOrder = 1
    ExplicitTop = 52
    ExplicitHeight = 634
    object tabVideos: TTabSheet
      Caption = 'Meus v'#237'deos'
      object pnVideosLista: TPanel
        Left = 0
        Top = 0
        Width = 560
        Height = 591
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 596
        object pnVideosBotoes: TPanel
          Left = 0
          Top = 0
          Width = 560
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnAtualizarVideos: TButton
            Left = 8
            Top = 8
            Width = 130
            Height = 32
            Caption = 'Atualizar lista'
            TabOrder = 0
            OnClick = btnAtualizarVideosClick
          end
          object btnCarregarMais: TButton
            Left = 146
            Top = 8
            Width = 130
            Height = 32
            Caption = 'Carregar mais'
            TabOrder = 1
            OnClick = btnCarregarMaisClick
          end
        end
        object strGridVideos: TStringGrid
          AlignWithMargins = True
          Left = 8
          Top = 48
          Width = 549
          Height = 540
          Margins.Left = 8
          Margins.Top = 0
          Align = alClient
          ColCount = 3
          DefaultRowHeight = 26
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 1
          OnSelectCell = strGridVideosSelectCell
          ExplicitTop = 51
          ColWidths = (
            300
            125
            110)
        end
      end
      object pnVideoDetalhes: TPanel
        Left = 560
        Top = 0
        Width = 552
        Height = 591
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 596
        object gBoxDetalhes: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 541
          Height = 489
          Margins.Right = 8
          Align = alClient
          Caption = ' Detalhes do v'#237'deo '
          TabOrder = 0
          ExplicitHeight = 494
          DesignSize = (
            541
            489)
          object lbPublicadoEm: TLabel
            Left = 192
            Top = 30
            Width = 91
            Height = 17
            Caption = 'Publicado em: -'
          end
          object lbCanal: TLabel
            Left = 192
            Top = 54
            Width = 44
            Height = 17
            Caption = 'Canal: -'
          end
          object lbCategoria: TLabel
            Left = 192
            Top = 78
            Width = 69
            Height = 17
            Caption = 'Categoria: -'
          end
          object lbTitulo: TLabel
            Left = 16
            Top = 160
            Width = 32
            Height = 17
            Caption = 'T'#237'tulo'
          end
          object lbDescricao: TLabel
            Left = 16
            Top = 214
            Width = 57
            Height = 17
            Caption = 'Descri'#231#227'o'
          end
          object imgMiniatura: TTMSFNCCloudImage
            Left = 16
            Top = 28
            Width = 160
            Height = 120
            ParentDoubleBuffered = False
            DoubleBuffered = True
            TabOrder = 6
            Bitmaps = <>
            Stretch = True
          end
          object btnAbrirNoYouTube: TButton
            Left = 192
            Top = 112
            Width = 140
            Height = 32
            Caption = 'Abrir no YouTube'
            TabOrder = 0
            OnClick = btnAbrirNoYouTubeClick
          end
          object btnAbrirNoStudio: TButton
            Left = 340
            Top = 112
            Width = 140
            Height = 32
            Caption = 'Abrir no Studio'
            TabOrder = 1
            OnClick = btnAbrirNoStudioClick
          end
          object edtTitulo: TEdit
            Left = 16
            Top = 180
            Width = 509
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object memoDescricao: TMemo
            Left = 16
            Top = 234
            Width = 509
            Height = 193
            Anchors = [akLeft, akTop, akRight, akBottom]
            ScrollBars = ssVertical
            TabOrder = 3
            ExplicitHeight = 198
          end
          object btnSalvarAlteracoes: TButton
            Left = 16
            Top = 441
            Width = 160
            Height = 34
            Anchors = [akLeft, akBottom]
            Caption = 'Salvar altera'#231#245'es'
            TabOrder = 4
            OnClick = btnSalvarAlteracoesClick
            ExplicitTop = 446
          end
          object btnExcluirVideo: TButton
            Left = 385
            Top = 441
            Width = 140
            Height = 34
            Anchors = [akRight, akBottom]
            Caption = 'Excluir v'#237'deo'
            TabOrder = 5
            OnClick = btnExcluirVideoClick
            ExplicitTop = 446
          end
        end
        object gBoxAvaliacao: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 498
          Width = 541
          Height = 90
          Margins.Right = 8
          Align = alBottom
          Caption = ' Minha avalia'#231#227'o '
          TabOrder = 1
          ExplicitTop = 503
          object lbAvaliacaoAtual: TLabel
            Left = 16
            Top = 62
            Width = 99
            Height = 17
            Caption = 'Avalia'#231#227'o atual: -'
          end
          object btnGostei: TButton
            Left = 16
            Top = 24
            Width = 90
            Height = 30
            Caption = 'Gostei'
            TabOrder = 0
            OnClick = btnGosteiClick
          end
          object btnNaoGostei: TButton
            Left = 112
            Top = 24
            Width = 100
            Height = 30
            Caption = 'N'#227'o gostei'
            TabOrder = 1
            OnClick = btnNaoGosteiClick
          end
          object btnRemoverAvaliacao: TButton
            Left = 218
            Top = 24
            Width = 140
            Height = 30
            Caption = 'Remover avalia'#231#227'o'
            TabOrder = 2
            OnClick = btnRemoverAvaliacaoClick
          end
        end
      end
    end
    object tabEnviar: TTabSheet
      Caption = 'Enviar v'#237'deo'
      ImageIndex = 1
      object gBoxEnviar: TGroupBox
        Left = 12
        Top = 12
        Width = 660
        Height = 430
        Caption = ' Novo v'#237'deo '
        TabOrder = 0
        object lbArquivo: TLabel
          Left = 16
          Top = 28
          Width = 100
          Height = 17
          Caption = 'Arquivo de v'#237'deo'
        end
        object lbTituloEnvio: TLabel
          Left = 16
          Top = 86
          Width = 32
          Height = 17
          Caption = 'T'#237'tulo'
        end
        object lbDescricaoEnvio: TLabel
          Left = 16
          Top = 142
          Width = 57
          Height = 17
          Caption = 'Descri'#231#227'o'
        end
        object lbProgresso: TLabel
          Left = 16
          Top = 398
          Width = 4
          Height = 17
        end
        object edtArquivo: TEdit
          Left = 16
          Top = 48
          Width = 504
          Height = 25
          ReadOnly = True
          TabOrder = 0
        end
        object btnSelecionarArquivo: TButton
          Left = 528
          Top = 46
          Width = 116
          Height = 30
          Caption = 'Selecionar...'
          TabOrder = 1
          OnClick = btnSelecionarArquivoClick
        end
        object edtTituloEnvio: TEdit
          Left = 16
          Top = 106
          Width = 628
          Height = 25
          TabOrder = 2
        end
        object memoDescricaoEnvio: TMemo
          Left = 16
          Top = 162
          Width = 628
          Height = 150
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object btnEnviarVideo: TButton
          Left = 16
          Top = 324
          Width = 150
          Height = 34
          Caption = 'Enviar v'#237'deo'
          TabOrder = 4
          OnClick = btnEnviarVideoClick
        end
        object pbEnvio: TProgressBar
          Left = 16
          Top = 372
          Width = 628
          Height = 20
          TabOrder = 5
        end
      end
    end
    object tabComentarios: TTabSheet
      Caption = 'Coment'#225'rios e sorteio'
      ImageIndex = 2
      object pnComentariosTopo: TPanel
        Left = 0
        Top = 0
        Width = 1112
        Height = 52
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbVideoComentarios: TLabel
          Left = 200
          Top = 17
          Width = 161
          Height = 17
          Caption = 'V'#237'deo: nenhum selecionado'
        end
        object btnCarregarComentarios: TButton
          Left = 8
          Top = 10
          Width = 180
          Height = 32
          Caption = 'Carregar coment'#225'rios'
          TabOrder = 0
          OnClick = btnCarregarComentariosClick
        end
      end
      object gBoxSorteio: TGroupBox
        AlignWithMargins = True
        Left = 769
        Top = 55
        Width = 335
        Height = 533
        Margins.Right = 8
        Align = alRight
        Caption = ' Sorteio '
        TabOrder = 2
        ExplicitHeight = 538
        object lbParticipantes: TLabel
          Left = 16
          Top = 28
          Width = 88
          Height = 17
          Caption = 'Participantes: 0'
        end
        object lbGanhador: TLabel
          Left = 16
          Top = 148
          Width = 303
          Height = 60
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
        object lbComentarioGanhador: TLabel
          Left = 16
          Top = 216
          Width = 303
          Height = 160
          AutoSize = False
          WordWrap = True
        end
        object ckIgnorarDonoCanal: TCheckBox
          Left = 16
          Top = 54
          Width = 303
          Height = 21
          Caption = 'Ignorar coment'#225'rios do dono do canal'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = ckIgnorarDonoCanalClick
        end
        object btnSortear: TButton
          Left = 16
          Top = 88
          Width = 303
          Height = 44
          Caption = 'Sortear!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnSortearClick
        end
      end
      object tvComentarios: TTreeView
        AlignWithMargins = True
        Left = 8
        Top = 55
        Width = 755
        Height = 533
        Margins.Left = 8
        Align = alClient
        Indent = 19
        ReadOnly = True
        TabOrder = 1
        ExplicitHeight = 538
      end
    end
  end
  object YouTube: TTMSFNCCloudGoogleYouTube
    Left = 121
    Top = 308
    Width = 26
    Height = 26
    Visible = True
    OnAccessDenied = YouTubeAccessDenied
    OnConnected = YouTubeConnected
    OnBeforeAddVideo = YouTubeBeforeAddVideo
    OnGetVideos = YouTubeGetVideos
    OnDeleteVideo = YouTubeDeleteVideo
    OnGetVideoDetails = YouTubeGetVideoDetails
    OnUpdateVideo = YouTubeUpdateVideo
    OnUploadVideo = YouTubeUploadVideo
    OnUploadVideoProgress = YouTubeUploadVideoProgress
    OnGetVideoRating = YouTubeGetVideoRating
    OnSetVideoRating = YouTubeSetVideoRating
    OnGetCommentThreadsComplete = YouTubeGetCommentThreadsComplete
  end
  object tmrSorteio: TTimer
    Enabled = False
    Interval = 40
    OnTimer = tmrSorteioTimer
    Left = 336
    Top = 314
  end
  object OpenDialogVideo: TOpenDialog
    Filter = 
      'V'#237'deos|*.mp4;*.mov;*.avi;*.mkv;*.wmv;*.webm|Todos os arquivos|*.' +
      '*'
    Title = 'Selecione o v'#237'deo'
    Left = 248
    Top = 314
  end
end
