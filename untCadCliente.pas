unit untCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, System.JSON, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  System.UITypes, XMLDoc, XMLIntf;

type
  TfrmCadCliente = class(TForm)
    lblTitulo: TLabel;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCpf: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblCep: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblPais: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCpf: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    lblBasico: TLabel;
    edtCep: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    edtPais: TEdit;
    btnBuscarCep: TButton;
    btnSalvar: TButton;
    IdHTTP1: TIdHTTP;
    IdSMTP1: TIdSMTP;
    procedure btnBuscarCepClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure limparCampos;
    function enviarEmail(anexo, destinatario: string): Boolean;

  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.btnBuscarCepClick(Sender: TObject);
var
  dadosCep: string;
  jsonObject: TJsonObject;
begin
  try
    dadosCep := IdHTTP1.Get('http://viacep.com.br/ws/' + edtCep.text + '/json/');

    jsonObject := TJsonObject.ParseJSONValue(dadosCep) as TJsonObject;

    edtLogradouro.text := jsonObject.GetValue('logradouro').Value;
    edtCidade.text := jsonObject.GetValue('localidade').Value;
    edtEstado.text := jsonObject.GetValue('uf').Value;
    edtBairro.text := jsonObject.GetValue('bairro').Value;

    if edtNumero.CanFocus then
    begin
      edtNumero.SetFocus;
    end;

  finally
    FreeAndNil(jsonObject)
  end;
end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
var
  XMLDocument: TXMLDocument;
  NodeCliente, NodeBasico, NodeEndereco: IXMLNode;
begin
  XMLDocument := TXMLDocument.Create(Self);

  try
    XMLDocument.Active := True;
    NodeCliente := XMLDocument.AddChild('Cliente');

    NodeBasico := NodeCliente.AddChild('Basico');
    NodeBasico.ChildValues['Nome'] := edtNome.Text;
    NodeBasico.ChildValues['Identidade'] := edtIdentidade.Text;
    NodeBasico.ChildValues['CPF'] := edtCpf.Text;
    NodeBasico.ChildValues['Telefone'] := edtTelefone.Text;
    NodeBasico.ChildValues['Email'] := edtEmail.Text;
    NodeEndereco := NodeCliente.AddChild('Endereco');
    NodeEndereco.ChildValues['Cep'] := edtCep.Text;
    NodeEndereco.ChildValues['Logradouro'] := edtLogradouro.Text;
    NodeEndereco.ChildValues['Numero'] := edtNumero.Text;
    NodeEndereco.ChildValues['Complemento'] := edtComplemento.Text;
    NodeEndereco.ChildValues['Bairro'] := edtBairro.Text;
    NodeEndereco.ChildValues['Cidade'] := edtCidade.Text;
    NodeEndereco.ChildValues['Estado'] := edtEstado.Text;
    NodeEndereco.ChildValues['Pais'] := edtPais.Text;

    XMLDocument.SaveToFile(ExtractFileDir(GetCurrentDir) + '\cliente.xml');
  finally
    XMLDocument.Free;
  end;

  if enviarEmail(ExtractFileDir(GetCurrentDir) + '\cliente.xml', edtEmail.Text) then
  begin
    MessageDlg('Cadastro Finalizado com sucesso!', mtInformation, [mbOK], 0);
    limparCampos;
  end
  else
  begin
    MessageDlg('Erro ao finalizar cadastro!', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmCadCliente.limparCampos;
begin
  edtNome.text := EmptyStr;
  edtIdentidade.text := EmptyStr;
  edtCpf.text := EmptyStr;
  edtTelefone.text := EmptyStr;
  edtEmail.text := EmptyStr;
  edtCep.text := EmptyStr;
  edtLogradouro.text := EmptyStr;
  edtNumero.text := EmptyStr;
  edtComplemento.text := EmptyStr;
  edtBairro.text := EmptyStr;
  edtCidade.text := EmptyStr;
  edtEstado.text := EmptyStr;
  edtPais.text := EmptyStr;

  if edtNome.CanFocus then
  begin
    edtNome.SetFocus;
  end;
end;

function TfrmCadCliente.enviarEmail(anexo, destinatario: string): Boolean;
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
  enviou: Boolean;
begin
  enviou := False;
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := 465;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'fc18473@gmail.com';
    IdSMTP.Password := 'utkeyjekrciotaxu';
    IdMessage.From.Address := 'fc18473@gmail.com';
    IdMessage.From.Name := 'Felipe Couto';
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := destinatario;
    IdMessage.Subject := 'Cadastro novo cliente';
    IdMessage.Encoding := meMIME;
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add('Informações Cliente');
    IdText.Body.Add('Basico');
    IdText.Body.Add('Nome:' + edtNome.Text);
    IdText.Body.Add('Identidade:' + edtIdentidade.Text);
    IdText.Body.Add('CPF:' + edtCpf.Text);
    IdText.Body.Add('Telefone:' + edtTelefone.Text);
    IdText.Body.Add('Email:' + edtEmail.Text);
    IdText.Body.Add('Endereco');
    IdText.Body.Add('Cep:' + edtCep.Text);
    IdText.Body.Add('Logradouro:' + edtLogradouro.Text);
    IdText.Body.Add('Numero:' + edtNumero.Text);
    IdText.Body.Add('Complemento:' + edtComplemento.Text);
    IdText.Body.Add('Bairro:' + edtBairro.Text);
    IdText.Body.Add('Cidade:' + edtCidade.Text);
    IdText.Body.Add('Estado:' + edtEstado.Text);
    IdText.Body.Add('Pais:' + edtPais.Text);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    if FileExists(anexo) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, anexo);
    end;

    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E: Exception do
      begin
        enviou := False;
      end;
    end;

    try
      IdSMTP.Send(IdMessage);
      enviou := True;
    except
      on E: Exception do
      begin
        enviou := False;
      end;
    end;
  finally
    Result := enviou;
    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

end.
