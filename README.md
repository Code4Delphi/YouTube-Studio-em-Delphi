# YouTube Studio em Delphi

Demo VCL do componente `TTMSFNCCloudGoogleYouTube` (TMS FNC Cloud Pack) que gerencia o seu próprio canal do YouTube: lista, edita, envia, avalia e exclui vídeos, lê comentários e faz um sorteio entre os comentaristas.

## Requisitos

- RAD Studio 12 (Delphi) com TMS FNC Core e TMS FNC Cloud Pack instalados.
- Uma conta Google com canal no YouTube. **Use um canal de testes**: editar e excluir mexem em vídeos reais.

## Configuração no Google Cloud Console

1. Crie um projeto e ative a **YouTube Data API v3**.
2. Configure a tela de consentimento OAuth em modo **Teste** e adicione a sua conta em **Usuários de teste**.
3. Crie uma credencial **ID do cliente OAuth** do tipo **Aplicativo da Web** com o URI de redirecionamento `http://127.0.0.1:8888/`.
   O valor precisa ser idêntico ao `CallBackURL` do arquivo de configuração, inclusive a barra final.

## Configuração do app

O ClientID e o Secret não ficam no projeto, para não aparecerem na gravação. Na primeira execução o app cria o arquivo:

```
%APPDATA%\YouTubeStudioDelphi\config.ini
```

Preencha esse arquivo seguindo o modelo [config.exemplo.ini](config.exemplo.ini). Os tokens de acesso ficam em `tokens.ini`, na mesma pasta.

## Como compilar

Abra `YouTubeStudio.dproj` no RAD Studio e compile (Win32 ou Win64). Pela linha de comando:

```bash
cmd /c "call ""C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"" && msbuild YouTubeStudio.dproj /p:Config=Debug /p:Platform=Win32"
```

## Roteiro da demo

| Bloco | Onde | Recursos do componente |
|---|---|---|
| 1. Conectar | Botões **Conectar** / **Desconectar** | `Connect`, `OnConnected`, `OnAccessDenied`, `PersistTokens`, `ClearTokens` |
| 2. Listar | Aba **Meus vídeos** | `GetFirstVideos`, `GetNextVideos`, `OnGetVideos`, `ImageURL` |
| 3. Editar | Painel **Detalhes do vídeo** | `GetVideoDetails`, `UpdateVideo`, `OnUpdateVideo` |
| 4. Enviar | Aba **Enviar vídeo** | `UploadVideo`, `OnBeforeAddVideo`, `OnUploadVideoProgress`, `OnUploadVideo` |
| 5. Comentários | Aba **Comentários e sorteio** | `GetAllCommentThreads`, `OnGetCommentThreadsComplete`, `Replies` |
| 6. Sorteio | Grupo **Sorteio** | `CommentThreads`, `AuthorChannelId`, `AuthorDisplayName` |
| 7. Extras | Grupo **Minha avaliação** e botão **Excluir vídeo** | `GetVideoRating`, `SetVideoRating`, `DeleteVideo` |

Dicas para a gravação:

- **Desconectar** apaga os tokens, então o próximo **Conectar** mostra de novo a tela de consentimento do Google.
- Para o momento "uau" do bloco 3, deixe o vídeo aberto com **Abrir no Studio**, salve a alteração no app e atualize o navegador.
- No bloco 4, tente enviar sem título: o evento `OnBeforeAddVideo` cancela o envio.
- **F5** atualiza a lista de vídeos.

## Cuidados

- **Cota da API:** o limite diário é baixo. A listagem (que usa o endpoint de busca) e o envio de vídeo estão entre as operações mais caras, então ensaie com moderação.
- **Edição:** o `UpdateVideo` envia somente título, descrição e categoria. Pela regra da API, outros campos do snippet que não forem enviados, como as tags, podem ser apagados.
- **Envio:** vídeos enviados por projetos de API não verificados pelo Google podem ficar restritos ao modo privado.
- **Comentários:** se o vídeo estiver com os comentários desativados, a API devolve erro. A API também traz só algumas respostas por comentário; a árvore indica quantas ficaram de fora.

## Particularidades do componente tratadas na demo

- O `UpdateVideo` e o `UploadVideo` montam o JSON sem escapar o texto. A demo escapa aspas, barras e quebras de linha antes de enviar (`EscaparJSON`).
- O `UpdateVideo` não faz nada quando `CategoryID = 0`, e a busca não traz a categoria. Por isso a demo chama `GetVideoDetails` ao selecionar o vídeo.
- A busca devolve a descrição resumida e o título com entidades HTML; os detalhes completos vêm do `GetVideoDetails`.
- O `DeleteVideo` não remove o vídeo da coleção `Videos`; a demo remove no evento `OnDeleteVideo`.
- Quando não há próxima página, o `GetNextVideos` não faz a requisição e nenhum evento é disparado.
- No Windows, o `AProgress` do `OnUploadVideoProgress` vai de 0 a 100.
