unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfrm_principal = class(TForm)
    atlAbreForm: TActionList;
    actCadClientes: TAction;
    actCadCidades: TAction;
    actConsultaClientes: TAction;
    actConsultacidades: TAction;
    actRelClientes: TAction;
    actRelCidades: TAction;
    actSair: TAction;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    Clientes2: TMenuItem;
    Clientes3: TMenuItem;
    Clientes4: TMenuItem;
    Cidades1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes5: TMenuItem;
    Cidades2: TMenuItem;
    Sair1: TMenuItem;
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadClientesExecute(Sender: TObject);
    procedure actConsultaCidadesExecute(Sender: TObject);
    procedure actConsultaClientesExecute(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
  private
    { Private declarations }
    pesquisa : String;
    const sql = 'SELECT cod_cliente, cgc_cpf_cliente, ' +
                 'cli_nome, cli_telefone, cli_endereco,' +
                 'cli_bairro, cli_complemento, cli_e_mail,' +
                 'cod_cidade, cli_DDD ' +
                 'FROM clientes';
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

{$R *.dfm}

uses Ucad_cidades, UDM, UCad_clientes, UCon_cidade, UCon_cliente;

procedure Tfrm_principal.actConsultaCidadesExecute(Sender: TObject);
begin

   frm_con_cidades := Tfrm_con_cidades.Create(self);
   try
     frm_con_cidades.ShowModal;
   finally
     frm_con_cidades.free;
   end;
end;

procedure Tfrm_principal.actCadClientesExecute(Sender: TObject);
var frm_cad_clientes :  Tfrm_cad_clientes;
begin

   frm_cad_clientes := Tfrm_cad_clientes.Create(self);
   try
     frm_cad_clientes.ShowModal;
   finally
     frm_cad_clientes.free;
   end;

end;

procedure Tfrm_principal.actSairExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_principal.Cidades1Click(Sender: TObject);
begin
  dm_teste_sinqia.qry_pesq_cidades.Open;
end;

procedure Tfrm_principal.actConsultaClientesExecute(Sender: TObject);
begin
   dm_teste_sinqia.qry_pesq_clientes.open;
   frm_con_clientes := Tfrm_con_clientes.Create(self);
   try
     frm_cad_clientes.ShowModal;
   finally
     frm_cad_clientes.free;
   end;
end;

procedure Tfrm_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if messageBox(Application.Handle, 'Você deseja sair do sistema?', 'Sair', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
        Action := caFree; //Ação do objeto TCloseAction para fechar o form
  end
  else
  begin
    Action := caNone; //A ação do objeto TClose Action recebe um valor nulo
  end;
end;

end.
