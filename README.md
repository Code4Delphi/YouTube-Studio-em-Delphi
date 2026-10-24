# YouTube Studio em Delphi

O `TTMSFNCCloudGoogleYouTube`, do **TMS FNC Cloud Pack**, conecta aplicações Delphi à YouTube Data API v3 com o login OAuth 2.0 já resolvido pelo componente. Com ele você lista os vídeos de um canal, consulta e edita título, descrição e categoria, envia novos vídeos acompanhando o progresso, avalia e exclui vídeos e lê os comentários e as respostas. Por ser um componente FNC, o mesmo código serve para VCL, FMX, TMS WEB Core e Lazarus.

Este demo VCL é um pequeno "YouTube Studio" para o seu próprio canal: mostra os vídeos com miniatura e paginação, edita os detalhes, envia vídeos, marca **Gostei** / **Não gostei**, exclui vídeos e carrega os comentários de um vídeo para sortear um ganhador entre os comentaristas, ideal para promoções no canal.

## Criar as credenciais no Google Cloud

1. Acesse https://console.cloud.google.com.
2. Crie um novo projeto, por exemplo `YouTube Studio Delphi`.
3. Abra **Menu → APIs e serviços → Biblioteca**, pesquise **YouTube Data API v3** e clique em **Ativar**.
4. Abra **Menu → Tela de permissão OAuth** e conclua a configuração inicial (nome do app, e-mail de suporte e público **Externo**).
5. Em **Público-alvo → Usuários de teste**, clique em **Adicionar usuários** e informe o e-mail da conta dona do canal.
6. Em **Clientes → Criar cliente** (ou **Credenciais → Criar credenciais → ID do cliente OAuth**), escolha o tipo **App para computador** (Desktop).
7. Copie na hora o **ID do cliente** e a **chave secreta**, ou baixe o JSON. Depois o Google não mostra a chave secreta de novo.

> Não é preciso cadastrar URI de redirecionamento: o app usa `http://127.0.0.1:8888/`, que o Google aceita automaticamente em clientes do tipo Desktop.

## Adicionar as credenciais no app

1. Abra `YouTubeStudio.dproj` no RAD Studio e execute o projeto.
2. No topo da tela, cole o ID do cliente no campo **ClientID** e a chave secreta no campo **Secret**.
3. Clique em **Conectar**, entre no navegador com a conta cadastrada como usuário de teste e autorize o acesso. No aviso "O Google não verificou este app", clique em **Continuar**.
4. O status muda para **Conectado ao YouTube** e a aba **Meus vídeos** carrega os vídeos do canal. As credenciais ficam salvas no `config.ini`, então nas próximas aberturas basta clicar em **Conectar**.

O botão **Desconectar** apaga os tokens salvos em `%APPDATA%\YouTubeStudioDelphi\tokens.ini`, e a próxima conexão pede a autorização de novo.

## Cuidados

- **Secret:** o `config.ini` guarda a chave secreta em texto puro. Não publique esse arquivo com dados reais.
- **Tokens:** o `tokens.ini` guarda os tokens do último acesso. Não publique esse arquivo com dados reais.

## 🏷️ Cupom de desconto
- Use este cupom exclusivo e tenha 30% de desconto em qualquer produto da TMS:
```
2026Code4Delphi30
```

## Links úteis
|[Site oficial](https://www.tmssoftware.com/site/tmsfnccloudpack.asp)|[Documentação](https://doc.tmssoftware.com/fnc/cloudpack/googleyoutube/index.html)|
|--|--|


## Vídeos de demonstração
- [Criei meu próprio YouTube Studio em Delphi (upload, edição e sorteio nos comentários)](https://www.youtube.com/watch?v=K53uT4jsXl0)


## Multiplataforma
<img width="524" height="124" alt="VCL-FMX-Web-FNC" src="https://github.com/user-attachments/assets/17b23899-0e26-4901-810e-f9a03e38deae" />

<br>

## 📞 Contatos
[![Telegram](https://img.shields.io/badge/Telegram-Join-blue?logo=telegram)](https://t.me/Code4Delphi)
[![YouTube](https://img.shields.io/badge/YouTube-Join-red?logo=youtube&logoColor=red)](https://www.youtube.com/@code4delphi)
[![Instagram](https://img.shields.io/badge/Intagram-Follow-red?logo=instagram&logoColor=pink)](https://www.instagram.com/code4delphi/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://www.linkedin.com/in/cesar-cardoso-dev)
[![Blog](https://img.shields.io/badge/Blog-Code4Delphi-F00?logo=delphi)](https://code4delphi.com.br/blog/)
[![Course](https://img.shields.io/badge/Course-Delphi-F00?logo=delphi)](https://code4delphi.github.io/ia-devs-delphi-lazarus/)
[![E-mail](https://img.shields.io/badge/E--mail-Send-yellowgreen?logo=maildotru&logoColor=yellowgreen)](mailto:contato@code4delphi.com.br)
