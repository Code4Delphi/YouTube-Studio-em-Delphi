unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.IOUtils,
  System.IniFiles,
  System.Math,
  System.NetEncoding,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCCloudOAuth,
  VCL.TMSFNCCloudGoogle,
  VCL.TMSFNCCloudGoogleYouTube,
  VCL.TMSFNCCloudImage,
  VCL.TMSFNCGraphics;

type
  TViewMain = class(TForm)
    pnTopo: TPanel;
    btnConectar: TButton;
    btnDesconectar: TButton;
    lbStatus: TLabel;
    pageControlStudio: TPageControl;
    tabVideos: TTabSheet;
    tabEnviar: TTabSheet;
    tabComentarios: TTabSheet;
    pnVideosLista: TPanel;
    pnVideosBotoes: TPanel;
    btnAtualizarVideos: TButton;
    btnCarregarMais: TButton;
    strGridVideos: TStringGrid;
    pnVideoDetalhes: TPanel;
    gBoxDetalhes: TGroupBox;
    imgMiniatura: TTMSFNCCloudImage;
    lbPublicadoEm: TLabel;
    lbCanal: TLabel;
    lbCategoria: TLabel;
    btnAbrirNoYouTube: TButton;
    btnAbrirNoStudio: TButton;
    lbTitulo: TLabel;
    edtTitulo: TEdit;
    lbDescricao: TLabel;
    memoDescricao: TMemo;
    btnSalvarAlteracoes: TButton;
    btnExcluirVideo: TButton;
    gBoxAvaliacao: TGroupBox;
    btnGostei: TButton;
    btnNaoGostei: TButton;
    btnRemoverAvaliacao: TButton;
    lbAvaliacaoAtual: TLabel;
    gBoxEnviar: TGroupBox;
    lbArquivo: TLabel;
    edtArquivo: TEdit;
    btnSelecionarArquivo: TButton;
    lbTituloEnvio: TLabel;
    edtTituloEnvio: TEdit;
    lbDescricaoEnvio: TLabel;
    memoDescricaoEnvio: TMemo;
    btnEnviarVideo: TButton;
    pbEnvio: TProgressBar;
    lbProgresso: TLabel;
    pnComentariosTopo: TPanel;
    btnCarregarComentarios: TButton;
    lbVideoComentarios: TLabel;
    gBoxSorteio: TGroupBox;
    lbParticipantes: TLabel;
    ckIgnorarDonoCanal: TCheckBox;
    btnSortear: TButton;
    lbGanhador: TLabel;
    lbComentarioGanhador: TLabel;
    tvComentarios: TTreeView;
    tmrSorteio: TTimer;
    OpenDialogVideo: TOpenDialog;
    YouTube: TTMSFNCCloudGoogleYouTube;
    lbClientID: TLabel;
    lbSecret: TLabel;
    edtClientID: TEdit;
    edtSecret: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnAtualizarVideosClick(Sender: TObject);
    procedure btnCarregarMaisClick(Sender: TObject);
    procedure strGridVideosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btnAbrirNoYouTubeClick(Sender: TObject);
    procedure btnAbrirNoStudioClick(Sender: TObject);
    procedure btnSalvarAlteracoesClick(Sender: TObject);
    procedure btnExcluirVideoClick(Sender: TObject);
    procedure btnGosteiClick(Sender: TObject);
    procedure btnNaoGosteiClick(Sender: TObject);
    procedure btnRemoverAvaliacaoClick(Sender: TObject);
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure btnEnviarVideoClick(Sender: TObject);
    procedure btnCarregarComentariosClick(Sender: TObject);
    procedure ckIgnorarDonoCanalClick(Sender: TObject);
    procedure btnSortearClick(Sender: TObject);
    procedure tmrSorteioTimer(Sender: TObject);
    procedure YouTubeConnected(Sender: TObject);
    procedure YouTubeAccessDenied(Sender: TObject; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeGetVideos(Sender: TObject; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeGetVideoDetails(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeUpdateVideo(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeDeleteVideo(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeGetVideoRating(Sender: TObject; const ARating: TTMSFNCCloudGoogleYouTubeRating; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeSetVideoRating(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeBeforeAddVideo(Sender: TObject; AFileName: TTMSFNCUtilsFile; var allow: Boolean);
    procedure YouTubeUploadVideoProgress(Sender: TObject; const AFileName: TTMSFNCUtilsFile; AProgress: Single; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeUploadVideo(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure YouTubeGetCommentThreadsComplete(Sender: TObject; const ARequestResult: TTMSFNCCloudBaseRequestResult);
  private
    FArquivoConfiguracao: string;
    FConectado: Boolean;
    FTemMaisVideos: Boolean;
    FQtdeVideosAntes: Integer;
    FDetalhesCarregados: Boolean;
    FEnviandoVideo: Boolean;
    FComentariosCarregados: Boolean;
    FCanalDosComentarios: string;
    FVoltasRoleta: Integer;
    FVideoSelecionado: TTMSFNCCloudGoogleYouTubeVideo;
    FParticipantes: TList<TTMSFNCCloudGoogleYouTubeCommentThread>;
    procedure CarregarConfiguracao;
    procedure SalvarConfiguracao;
    procedure ConfigurarGrid;
    procedure AtualizarEstadoTela;
    procedure CarregarPrimeiraPagina;
    procedure PreencherGridVideos;
    procedure AtualizarLinhaGrid(const AVideo: TTMSFNCCloudGoogleYouTubeVideo);
    procedure SelecionarVideo(const AVideo: TTMSFNCCloudGoogleYouTubeVideo);
    procedure ExibirDetalhes(const AVideo: TTMSFNCCloudGoogleYouTubeVideo);
    procedure LimparDetalhes;
    procedure LimparComentarios;
    procedure PreencherComentarios;
    procedure MontarParticipantes;
    procedure Avaliar(const ARating: TTMSFNCCloudGoogleYouTubeRating);
    procedure AbrirURL(const AURL: string);
    procedure MostrarErro(const AMensagem: string; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    function LocalizarArquivoConfiguracao: string;
    function EscaparJSON(const AValor: string): string;
    function TextoEmUmaLinha(const AValor: string): string;
    function DescricaoAvaliacao(const ARating: TTMSFNCCloudGoogleYouTubeRating): string;
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

const
  ARQUIVO_CONFIGURACAO = 'config.ini';
  NIVEIS_BUSCA_CONFIGURACAO = 2;
  PASTA_TOKENS = 'YouTubeStudioDelphi';
  ARQUIVO_TOKENS = 'tokens.ini';
  SECAO_GOOGLE = 'Google';
  CALLBACK_URL_PADRAO = 'http://127.0.0.1:8888/';
  QTDE_VIDEOS_POR_PAGINA = 10;
  VOLTAS_ROLETA = 30;
  INTERVALO_INICIAL_ROLETA = 40;
  COLUNA_TITULO = 0;
  COLUNA_PUBLICACAO = 1;
  COLUNA_ID = 2;
  FORMATO_DATA = 'dd/mm/yyyy hh:nn';

procedure TViewMain.FormCreate(Sender: TObject);
begin
  Randomize;
  FParticipantes := TList<TTMSFNCCloudGoogleYouTubeCommentThread>.Create;
  pageControlStudio.ActivePage := tabVideos;
  Self.ConfigurarGrid;
  Self.CarregarConfiguracao;
  Self.LimparDetalhes;
  Self.LimparComentarios;
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.FormDestroy(Sender: TObject);
begin
  tmrSorteio.Enabled := False;
  FParticipantes.Free;
end;

procedure TViewMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F5) and btnAtualizarVideos.Enabled then
    btnAtualizarVideos.Click;
end;

procedure TViewMain.CarregarConfiguracao;
begin
  FArquivoConfiguracao := Self.LocalizarArquivoConfiguracao;
  var LIni := TIniFile.Create(FArquivoConfiguracao);
  try
    edtClientID.Text := Trim(LIni.ReadString(SECAO_GOOGLE, 'ClientID', ''));
    edtSecret.Text := Trim(LIni.ReadString(SECAO_GOOGLE, 'Secret', ''));
    YouTube.Authentication.CallBackURL := Trim(LIni.ReadString(SECAO_GOOGLE, 'CallBackURL', CALLBACK_URL_PADRAO));
  finally
    LIni.Free;
  end;

  // Os tokens de acesso
  //var LPastaTokens := TPath.Combine(TPath.GetHomePath, PASTA_TOKENS);
  var LPastaTokens := ExtractFilePath(ParamStr(0));
  ForceDirectories(LPastaTokens);
  YouTube.PersistTokens.Location := plIniFile;
  YouTube.PersistTokens.Key := TPath.Combine(LPastaTokens, ARQUIVO_TOKENS);
end;

procedure TViewMain.SalvarConfiguracao;
begin
  var LIni := TIniFile.Create(FArquivoConfiguracao);
  try
    LIni.WriteString(SECAO_GOOGLE, 'ClientID', Trim(edtClientID.Text));
    LIni.WriteString(SECAO_GOOGLE, 'Secret', Trim(edtSecret.Text));
    LIni.WriteString(SECAO_GOOGLE, 'CallBackURL', YouTube.Authentication.CallBackURL);
  finally
    LIni.Free;
  end;
end;

function TViewMain.LocalizarArquivoConfiguracao: string;
begin
  // Procura na pasta do executável e nas pastas acima dela (ex.: bin\ ou Win32\Debug\ dentro do projeto)
  var LPasta := ExtractFilePath(ParamStr(0));
  if FileExists(Result) then
    Exit;

  // Se não encontrar, cria o arquivo ao lado do executável
  Result := TPath.Combine(ExtractFilePath(ParamStr(0)), ARQUIVO_CONFIGURACAO);
end;

procedure TViewMain.ConfigurarGrid;
begin
  strGridVideos.Cells[COLUNA_TITULO, 0] := 'Título';
  strGridVideos.Cells[COLUNA_PUBLICACAO, 0] := 'Publicado em';
  strGridVideos.Cells[COLUNA_ID, 0] := 'ID';
end;

procedure TViewMain.AtualizarEstadoTela;
begin
  var LTemVideo := FConectado and Assigned(FVideoSelecionado);
  var LSorteando := tmrSorteio.Enabled;

  edtClientID.Enabled := not FConectado;
  edtSecret.Enabled := not FConectado;
  btnConectar.Enabled := not FConectado;
  btnDesconectar.Enabled := FConectado and not FEnviandoVideo;
  btnAtualizarVideos.Enabled := FConectado;
  btnCarregarMais.Enabled := FConectado and FTemMaisVideos;
  btnAbrirNoYouTube.Enabled := LTemVideo;
  btnAbrirNoStudio.Enabled := LTemVideo;
  btnSalvarAlteracoes.Enabled := LTemVideo and FDetalhesCarregados;
  btnExcluirVideo.Enabled := LTemVideo;
  btnGostei.Enabled := LTemVideo;
  btnNaoGostei.Enabled := LTemVideo;
  btnRemoverAvaliacao.Enabled := LTemVideo;
  btnSelecionarArquivo.Enabled := FConectado and not FEnviandoVideo;
  btnEnviarVideo.Enabled := FConectado and not FEnviandoVideo;
  btnCarregarComentarios.Enabled := LTemVideo and not LSorteando;
  ckIgnorarDonoCanal.Enabled := not LSorteando;
  btnSortear.Enabled := (FParticipantes.Count > 0) and not LSorteando;
end;

{ Bloco 1 - Conexão }

procedure TViewMain.btnConectarClick(Sender: TObject);
begin
  if Trim(edtClientID.Text).IsEmpty then
    raise Exception.Create('Informe o ClientID do Google.');

  if Trim(edtSecret.Text).IsEmpty then
    raise Exception.Create('Informe o Secret do Google.');

  // Grava os dados para que os campos já venham preenchidos na próxima abertura
  Self.SalvarConfiguracao;
  YouTube.Authentication.ClientID := Trim(edtClientID.Text);
  YouTube.Authentication.Secret := Trim(edtSecret.Text);
  lbStatus.Caption := 'Conectando... confirme o acesso no navegador, se for solicitado.';
  YouTube.Connect;
end;

procedure TViewMain.YouTubeConnected(Sender: TObject);
begin
  FConectado := True;
  lbStatus.Caption := 'Conectado ao YouTube';
  Self.CarregarPrimeiraPagina;
end;

procedure TViewMain.YouTubeAccessDenied(Sender: TObject; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  FConectado := False;
  lbStatus.Caption := 'Acesso negado pelo Google';
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.btnDesconectarClick(Sender: TObject);
begin
  // Apaga os tokens salvos: na próxima conexão o Google pede o consentimento de novo
  YouTube.ClearTokens;
  FConectado := False;
  FTemMaisVideos := False;
  FVideoSelecionado := nil;
  Self.LimparComentarios;
  YouTube.Videos.Clear;
  Self.PreencherGridVideos;
  Self.LimparDetalhes;
  lbStatus.Caption := 'Desconectado';
  Self.AtualizarEstadoTela;
end;

{ Bloco 2 - Lista de vídeos }

procedure TViewMain.CarregarPrimeiraPagina;
begin
  FVideoSelecionado := nil;
  FQtdeVideosAntes := 0;
  FTemMaisVideos := False;
  Self.LimparDetalhes;
  Self.LimparComentarios;
  YouTube.Videos.Clear;
  Self.PreencherGridVideos;
  lbStatus.Caption := 'Carregando vídeos...';
  Self.AtualizarEstadoTela;
  YouTube.GetFirstVideos(QTDE_VIDEOS_POR_PAGINA);
end;

procedure TViewMain.btnAtualizarVideosClick(Sender: TObject);
begin
  Self.CarregarPrimeiraPagina;
end;

procedure TViewMain.btnCarregarMaisClick(Sender: TObject);
begin
  FQtdeVideosAntes := YouTube.Videos.Count;
  FTemMaisVideos := False;
  Self.AtualizarEstadoTela;
  YouTube.GetNextVideos(QTDE_VIDEOS_POR_PAGINA);

  // Sem próxima página o componente não faz a requisição e nenhum evento é disparado
  if YouTube.GetRequestCount(True, 'GET VIDEOS') = 0 then
    lbStatus.Caption := 'Não há mais vídeos para carregar'
  else
    lbStatus.Caption := 'Carregando mais vídeos...';
end;

procedure TViewMain.YouTubeGetVideos(Sender: TObject; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if not ARequestResult.Success then
  begin
    Self.MostrarErro('Não foi possível carregar os vídeos.', ARequestResult);
    Self.AtualizarEstadoTela;
    Exit;
  end;

  // Página cheia indica que provavelmente existem mais vídeos
  FTemMaisVideos := (YouTube.Videos.Count - FQtdeVideosAntes) >= QTDE_VIDEOS_POR_PAGINA;
  if not Assigned(FVideoSelecionado) and (YouTube.Videos.Count > 0) then
    Self.SelecionarVideo(YouTube.Videos[0]);

  Self.PreencherGridVideos;
  lbStatus.Caption := Format('Conectado - %d vídeo(s) carregado(s)', [YouTube.Videos.Count]);
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.PreencherGridVideos;
begin
  // Limpa antes de mudar o RowCount para o OnSelectCell nunca receber um vídeo já liberado
  for var I := 1 to Pred(strGridVideos.RowCount) do
    strGridVideos.Rows[I].Clear;
  strGridVideos.RowCount := Max(2, Succ(YouTube.Videos.Count));

  for var I := 0 to Pred(YouTube.Videos.Count) do
  begin
    var LLinha := Succ(I);
    var LVideo := YouTube.Videos[I];
    // A busca do YouTube devolve o título com entidades HTML (ex.: &#39;)
    strGridVideos.Cells[COLUNA_TITULO, LLinha] := TNetEncoding.HTML.Decode(LVideo.Title);
    strGridVideos.Cells[COLUNA_PUBLICACAO, LLinha] := FormatDateTime(FORMATO_DATA, LVideo.PublishDate);
    strGridVideos.Cells[COLUNA_ID, LLinha] := LVideo.ID;
    strGridVideos.Objects[COLUNA_TITULO, LLinha] := LVideo;
  end;

  if not Assigned(FVideoSelecionado) then
    Exit;

  for var I := 1 to Pred(strGridVideos.RowCount) do
    if strGridVideos.Objects[COLUNA_TITULO, I] = FVideoSelecionado then
      strGridVideos.Row := I;
end;

procedure TViewMain.AtualizarLinhaGrid(const AVideo: TTMSFNCCloudGoogleYouTubeVideo);
begin
  for var I := 1 to Pred(strGridVideos.RowCount) do
    if strGridVideos.Objects[COLUNA_TITULO, I] = AVideo then
      strGridVideos.Cells[COLUNA_TITULO, I] := AVideo.Title;
end;

procedure TViewMain.strGridVideosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  Self.SelecionarVideo(strGridVideos.Objects[COLUNA_TITULO, ARow] as TTMSFNCCloudGoogleYouTubeVideo);
end;

procedure TViewMain.SelecionarVideo(const AVideo: TTMSFNCCloudGoogleYouTubeVideo);
begin
  if AVideo = FVideoSelecionado then
    Exit;

  FVideoSelecionado := AVideo;
  Self.LimparDetalhes;
  Self.LimparComentarios;
  if Assigned(AVideo) then
  begin
    edtTitulo.Text := TNetEncoding.HTML.Decode(AVideo.Title);
    imgMiniatura.URL := AVideo.ImageURL;
    lbVideoComentarios.Caption := 'Vídeo: ' + edtTitulo.Text;
    // A busca traz a descrição resumida e sem a categoria, por isso os detalhes são carregados
    YouTube.GetVideoDetails(AVideo);
    YouTube.GetVideoRating(AVideo);
  end;
  Self.AtualizarEstadoTela;
end;

{ Bloco 3 - Detalhes e edição }

procedure TViewMain.YouTubeGetVideoDetails(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if not ARequestResult.Success then
  begin
    Self.MostrarErro('Não foi possível carregar os detalhes do vídeo.', ARequestResult);
    Exit;
  end;

  Self.AtualizarLinhaGrid(AVideo);
  if AVideo <> FVideoSelecionado then
    Exit;

  Self.ExibirDetalhes(AVideo);
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.ExibirDetalhes(const AVideo: TTMSFNCCloudGoogleYouTubeVideo);
begin
  edtTitulo.Text := AVideo.Title;
  memoDescricao.Text := AdjustLineBreaks(AVideo.Description, tlbsCRLF);
  lbPublicadoEm.Caption := 'Publicado em: ' + FormatDateTime(FORMATO_DATA, AVideo.PublishDate);
  lbCanal.Caption := 'Canal: ' + AVideo.ChannelTitle;
  lbCategoria.Caption := 'Categoria: ' + AVideo.CategoryID.ToString;
  lbVideoComentarios.Caption := 'Vídeo: ' + AVideo.Title;
  FDetalhesCarregados := True;
end;

procedure TViewMain.LimparDetalhes;
begin
  FDetalhesCarregados := False;
  imgMiniatura.URL := '';
  edtTitulo.Clear;
  memoDescricao.Clear;
  lbPublicadoEm.Caption := 'Publicado em: -';
  lbCanal.Caption := 'Canal: -';
  lbCategoria.Caption := 'Categoria: -';
  lbAvaliacaoAtual.Caption := 'Avaliação atual: -';
  lbVideoComentarios.Caption := 'Vídeo: nenhum selecionado';
end;

procedure TViewMain.btnAbrirNoYouTubeClick(Sender: TObject);
begin
  if Assigned(FVideoSelecionado) then
    Self.AbrirURL(FVideoSelecionado.Link);
end;

procedure TViewMain.btnAbrirNoStudioClick(Sender: TObject);
begin
  if Assigned(FVideoSelecionado) then
    Self.AbrirURL('https://studio.youtube.com/video/' + FVideoSelecionado.ID + '/edit');
end;

procedure TViewMain.btnSalvarAlteracoesClick(Sender: TObject);
begin
  if not Assigned(FVideoSelecionado) then
    Exit;

  if Trim(edtTitulo.Text).IsEmpty then
    raise Exception.Create('Informe o título do vídeo.');

  // O componente monta o JSON sem escapar o texto, por isso aspas e quebras de linha são tratadas aqui
  FVideoSelecionado.Title := Self.EscaparJSON(Trim(edtTitulo.Text));
  FVideoSelecionado.Description := Self.EscaparJSON(memoDescricao.Text);
  FDetalhesCarregados := False;
  lbStatus.Caption := 'Salvando alterações no YouTube...';
  Self.AtualizarEstadoTela;
  YouTube.UpdateVideo(FVideoSelecionado);
end;

procedure TViewMain.YouTubeUpdateVideo(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequestResult.Success then
    lbStatus.Caption := 'Alterações salvas no YouTube'
  else
    Self.MostrarErro('Não foi possível salvar as alterações.', ARequestResult);

  // Recarrega o vídeo para exibir o que realmente ficou gravado no YouTube
  YouTube.GetVideoDetails(AVideo);
end;

procedure TViewMain.btnExcluirVideoClick(Sender: TObject);
begin
  if not Assigned(FVideoSelecionado) then
    Exit;

  if MessageDlg(Format('Excluir definitivamente o vídeo "%s" do YouTube?', [edtTitulo.Text]), mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;

  lbStatus.Caption := 'Excluindo vídeo...';
  YouTube.DeleteVideo(FVideoSelecionado);
end;

procedure TViewMain.YouTubeDeleteVideo(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if not ARequestResult.Success then
  begin
    Self.MostrarErro('Não foi possível excluir o vídeo.', ARequestResult);
    Exit;
  end;

  if AVideo = FVideoSelecionado then
  begin
    FVideoSelecionado := nil;
    Self.LimparDetalhes;
    Self.LimparComentarios;
  end;

  // O componente não remove o vídeo da coleção Videos
  YouTube.Videos.Delete(AVideo.Index);
  Self.PreencherGridVideos;
  if not Assigned(FVideoSelecionado) then
    Self.SelecionarVideo(strGridVideos.Objects[COLUNA_TITULO, strGridVideos.Row] as TTMSFNCCloudGoogleYouTubeVideo);

  lbStatus.Caption := 'Vídeo excluído do YouTube';
  Self.AtualizarEstadoTela;
end;

{ Bloco 4 - Envio de vídeo }

procedure TViewMain.btnSelecionarArquivoClick(Sender: TObject);
begin
  if OpenDialogVideo.Execute then
    edtArquivo.Text := OpenDialogVideo.FileName;
end;

procedure TViewMain.btnEnviarVideoClick(Sender: TObject);
begin
  var LArquivo := Trim(edtArquivo.Text);
  if LArquivo.IsEmpty then
    raise Exception.Create('Selecione o arquivo de vídeo.');

  if not FileExists(LArquivo) then
    raise Exception.Create('Arquivo de vídeo não encontrado.');

  pbEnvio.Position := 0;
  lbProgresso.Caption := '';
  // O título é validado no evento OnBeforeAddVideo, que pode cancelar o envio
  YouTube.UploadVideo(LArquivo, Self.EscaparJSON(Trim(edtTituloEnvio.Text)), Self.EscaparJSON(memoDescricaoEnvio.Text));
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.YouTubeBeforeAddVideo(Sender: TObject; AFileName: TTMSFNCUtilsFile; var allow: Boolean);
begin
  allow := not Trim(edtTituloEnvio.Text).IsEmpty;
  if not allow then
  begin
    lbProgresso.Caption := 'Envio cancelado no evento OnBeforeAddVideo';
    MessageDlg('Informe o título antes de enviar o vídeo.', mtWarning, [mbOK], 0);
    Exit;
  end;

  FEnviandoVideo := True;
  lbProgresso.Caption := 'Enviando ' + ExtractFileName(AFileName) + '...';
end;

procedure TViewMain.YouTubeUploadVideoProgress(Sender: TObject; const AFileName: TTMSFNCUtilsFile; AProgress: Single; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  var LPercentual := EnsureRange(Round(AProgress), 0, 100);
  pbEnvio.Position := LPercentual;
  lbProgresso.Caption := Format('Enviando %s... %d%%', [ExtractFileName(AFileName), LPercentual]);
end;

procedure TViewMain.YouTubeUploadVideo(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  FEnviandoVideo := False;
  Self.AtualizarEstadoTela;

  if not ARequestResult.Success then
  begin
    // Em caso de erro o componente adiciona à coleção um item montado a partir do JSON de erro
    if Assigned(AVideo) then
      YouTube.Videos.Delete(AVideo.Index);

    lbProgresso.Caption := 'Falha no envio';
    Self.MostrarErro('Não foi possível enviar o vídeo.', ARequestResult);
    Exit;
  end;

  pbEnvio.Position := 100;
  lbProgresso.Caption := 'Envio concluído!';
  if Assigned(AVideo) then
  begin
    // O vídeo novo entra no fim da coleção; move para o topo, junto dos mais recentes
    AVideo.Index := 0;
    Self.PreencherGridVideos;
  end;

  edtArquivo.Clear;
  edtTituloEnvio.Clear;
  memoDescricaoEnvio.Clear;
  lbStatus.Caption := 'Vídeo enviado com sucesso';
end;

{ Bloco 5 - Comentários }

procedure TViewMain.btnCarregarComentariosClick(Sender: TObject);
begin
  if not Assigned(FVideoSelecionado) then
    raise Exception.Create('Selecione um vídeo na aba "Meus vídeos".');

  Self.LimparComentarios;
  FCanalDosComentarios := FVideoSelecionado.ChannelID;
  lbStatus.Caption := 'Carregando comentários...';
  YouTube.GetAllCommentThreads(FVideoSelecionado);
end;

procedure TViewMain.YouTubeGetCommentThreadsComplete(Sender: TObject; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  // Ignora a resposta se outro vídeo foi selecionado enquanto os comentários carregavam
  if not Assigned(FVideoSelecionado) or (ARequestResult.DataString <> FVideoSelecionado.ID) then
    Exit;

  if not ARequestResult.Success then
  begin
    Self.MostrarErro('Não foi possível carregar os comentários. Verifique se o vídeo aceita comentários.', ARequestResult);
    Exit;
  end;

  FComentariosCarregados := True;
  Self.PreencherComentarios;
  Self.MontarParticipantes;
  lbStatus.Caption := Format('%d comentário(s) carregado(s)', [YouTube.CommentThreads.Count]);
end;

procedure TViewMain.PreencherComentarios;
begin
  tvComentarios.Items.BeginUpdate;
  try
    tvComentarios.Items.Clear;
    for var I := 0 to Pred(YouTube.CommentThreads.Count) do
    begin
      var LComentario := YouTube.CommentThreads[I];
      var LNo := tvComentarios.Items.Add(nil, LComentario.AuthorDisplayName + ': ' + Self.TextoEmUmaLinha(LComentario.TextOriginal));
      for var J := 0 to Pred(LComentario.Replies.Count) do
      begin
        var LResposta := LComentario.Replies[J];
        tvComentarios.Items.AddChild(LNo, LResposta.AuthorDisplayName + ': ' + Self.TextoEmUmaLinha(LResposta.TextOriginal));
      end;

      // A API devolve no máximo algumas respostas por comentário
      var LRespostasOcultas := LComentario.TotalReplyCount - LComentario.Replies.Count;
      if LRespostasOcultas > 0 then
        tvComentarios.Items.AddChild(LNo, Format('(+%d resposta(s) disponível(is) no YouTube)', [LRespostasOcultas]));
    end;
    tvComentarios.FullExpand;
  finally
    tvComentarios.Items.EndUpdate;
  end;
end;

procedure TViewMain.LimparComentarios;
begin
  tmrSorteio.Enabled := False;
  FComentariosCarregados := False;
  FCanalDosComentarios := '';
  FParticipantes.Clear;
  tvComentarios.Items.Clear;
  lbParticipantes.Caption := 'Participantes: 0';
  lbGanhador.Caption := '';
  lbComentarioGanhador.Caption := '';
end;

{ Bloco 6 - Sorteio }

procedure TViewMain.MontarParticipantes;
begin
  FParticipantes.Clear;
  var LAutores := TStringList.Create;
  try
    LAutores.Sorted := True;
    LAutores.CaseSensitive := True;
    for var I := 0 to Pred(YouTube.CommentThreads.Count) do
    begin
      var LComentario := YouTube.CommentThreads[I];
      if ckIgnorarDonoCanal.Checked and (LComentario.AuthorChannelId = FCanalDosComentarios) then
        Continue;

      // Cada autor participa uma única vez, mesmo que tenha comentado várias vezes
      var LAutor := LComentario.AuthorChannelId;
      if LAutor.IsEmpty then
        LAutor := LComentario.AuthorDisplayName;

      if LAutores.IndexOf(LAutor) >= 0 then
        Continue;

      LAutores.Add(LAutor);
      FParticipantes.Add(LComentario);
    end;
  finally
    LAutores.Free;
  end;

  lbParticipantes.Caption := Format('Participantes: %d', [FParticipantes.Count]);
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.ckIgnorarDonoCanalClick(Sender: TObject);
begin
  if FComentariosCarregados then
    Self.MontarParticipantes;
end;

procedure TViewMain.btnSortearClick(Sender: TObject);
begin
  if FParticipantes.Count = 0 then
    raise Exception.Create('Não há participantes para o sorteio.');

  FVoltasRoleta := 0;
  lbComentarioGanhador.Caption := '';
  tmrSorteio.Interval := INTERVALO_INICIAL_ROLETA;
  tmrSorteio.Enabled := True;
  Self.AtualizarEstadoTela;
end;

procedure TViewMain.tmrSorteioTimer(Sender: TObject);
begin
  if FParticipantes.Count = 0 then
  begin
    tmrSorteio.Enabled := False;
    Self.AtualizarEstadoTela;
    Exit;
  end;

  Inc(FVoltasRoleta);
  var LSorteado := FParticipantes[Random(FParticipantes.Count)];
  lbGanhador.Caption := LSorteado.AuthorDisplayName;
  // A roleta desacelera a cada volta
  tmrSorteio.Interval := INTERVALO_INICIAL_ROLETA + (FVoltasRoleta * 10);
  if FVoltasRoleta < VOLTAS_ROLETA then
    Exit;

  tmrSorteio.Enabled := False;
  lbComentarioGanhador.Caption := '"' + LSorteado.TextOriginal + '"';
  Self.AtualizarEstadoTela;
end;

{ Bloco 7 - Avaliação }

procedure TViewMain.btnGosteiClick(Sender: TObject);
begin
  Self.Avaliar(yrLike);
end;

procedure TViewMain.btnNaoGosteiClick(Sender: TObject);
begin
  Self.Avaliar(yrDislike);
end;

procedure TViewMain.btnRemoverAvaliacaoClick(Sender: TObject);
begin
  Self.Avaliar(yrNone);
end;

procedure TViewMain.Avaliar(const ARating: TTMSFNCCloudGoogleYouTubeRating);
begin
  if not Assigned(FVideoSelecionado) then
    Exit;

  lbAvaliacaoAtual.Caption := 'Avaliação atual: enviando...';
  YouTube.SetVideoRating(FVideoSelecionado, ARating);
end;

procedure TViewMain.YouTubeSetVideoRating(Sender: TObject; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if not ARequestResult.Success then
  begin
    Self.MostrarErro('Não foi possível registrar a avaliação.', ARequestResult);
    YouTube.GetVideoRating(AVideo);
    Exit;
  end;

  if AVideo = FVideoSelecionado then
    lbAvaliacaoAtual.Caption := 'Avaliação atual: ' + Self.DescricaoAvaliacao(AVideo.Rating);
end;

procedure TViewMain.YouTubeGetVideoRating(Sender: TObject; const ARating: TTMSFNCCloudGoogleYouTubeRating; const AVideo: TTMSFNCCloudGoogleYouTubeVideo; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if AVideo <> FVideoSelecionado then
    Exit;

  if ARequestResult.Success then
    lbAvaliacaoAtual.Caption := 'Avaliação atual: ' + Self.DescricaoAvaliacao(ARating)
  else
    lbAvaliacaoAtual.Caption := 'Avaliação atual: indisponível';
end;

function TViewMain.DescricaoAvaliacao(const ARating: TTMSFNCCloudGoogleYouTubeRating): string;
begin
  case ARating of
    yrLike: Result := 'Gostei';
    yrDislike: Result := 'Não gostei';
    yrNone: Result := 'Sem avaliação';
  else
    Result := 'Não informada';
  end;
end;

{ Utilitários }

procedure TViewMain.AbrirURL(const AURL: string);
begin
  ShellExecute(0, 'open', PChar(AURL), nil, nil, SW_SHOWNORMAL);
end;

procedure TViewMain.MostrarErro(const AMensagem: string; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  lbStatus.Caption := AMensagem;
  MessageDlg(Format('%s%s%sCódigo HTTP: %d%s%s', [AMensagem, sLineBreak, sLineBreak, ARequestResult.ResponseCode, sLineBreak, ARequestResult.ResultString]), mtError, [mbOK], 0);
end;

function TViewMain.EscaparJSON(const AValor: string): string;
begin
  Result := AValor
    .Replace('\', '\\')
    .Replace('"', '\"')
    .Replace(#13#10, '\n')
    .Replace(#13, '\n')
    .Replace(#10, '\n')
    .Replace(#9, '\t');
end;

function TViewMain.TextoEmUmaLinha(const AValor: string): string;
begin
  Result := AValor.Replace(#13#10, ' ').Replace(#13, ' ').Replace(#10, ' ');
end;

end.
