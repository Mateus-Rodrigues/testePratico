program Project1;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {frm_principal},
  UDM in 'UDM.pas' {dm_teste_sinqia: TDataModule},
  Ucad_cidades in 'Ucad_cidades.pas' {frm_cad_cidades},
  UCad_clientes in 'UCad_clientes.pas' {frm_cad_clientes},
  UCon_cidade in 'UCon_cidade.pas' {frm_con_clientes},
  UCon_cliente in 'UCon_cliente.pas' {frm_con_cidades};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(Tdm_teste_sinqia, dm_teste_sinqia);
  Application.Run;
end.
