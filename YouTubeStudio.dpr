program YouTubeStudio;

uses
  Vcl.Forms,
  View.Main in 'Src\View.Main.pas' {ViewMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'YouTube Studio em Delphi';
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
