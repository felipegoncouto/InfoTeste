program InfoTeste;

uses
  Vcl.Forms,
  untCadCliente in 'untCadCliente.pas' {frmCadCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
