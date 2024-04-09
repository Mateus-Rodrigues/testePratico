unit UCad_clientes;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  Tfrm_cad_clientes = class(TForm)
    Label1: TLabel;
    ds_cad_for: TDataSource;
    Label2: TLabel;
    db_cpf: TDBEdit;
    Label3: TLabel;
    db_nome: TDBEdit;
    Label4: TLabel;
    db_telefone: TDBEdit;
    Label5: TLabel;
    db_endereco: TDBEdit;
    Label6: TLabel;
    db_bairro: TDBEdit;
    Label7: TLabel;
    de_complemento: TDBEdit;
    Label8: TLabel;
    db_email: TDBEdit;
    Label9: TLabel;
    db_ddd: TDBEdit;
    db_codigo: TDBText;
    btn_Cadastrar: TButton;
    btn_Editar: TButton;
    btn_Salvar: TButton;
    btn_Cancelar: TButton;
    btn_Excluir: TButton;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CadastrarClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure ds_cad_forStateChange(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frm_cad_clientes: Tfrm_cad_clientes;

implementation

{$R *.dfm}

uses UDM, Winapi.Windows;

procedure Tfrm_cad_clientes.btn_CadastrarClick(Sender: TObject);
begin
  ds_cad_for.DataSet.Append;
end;

procedure Tfrm_cad_clientes.btn_CancelarClick(Sender: TObject);
begin
  ds_cad_for.DataSet.Cancel;
end;

procedure Tfrm_cad_clientes.btn_EditarClick(Sender: TObject);
begin
  ds_cad_for.DataSet.Edit;
end;

procedure Tfrm_cad_clientes.btn_ExcluirClick(Sender: TObject);
begin
   if (
       MessageBox(Application.Handle,
       ' Deseja Excluir este registro?', 'Excluir',
       MB_YESNO + MB_ICONQUESTION) = IDYES
      ) then
   begin
     ds_cad_for.DataSet.Delete;
   end;

end;

procedure Tfrm_cad_clientes.btn_SalvarClick(Sender: TObject);
begin
  ds_cad_for.DataSet.Post;
end;

procedure Tfrm_cad_clientes.ds_cad_forStateChange(Sender: TObject);
begin
    btn_Cadastrar.Enabled := ds_cad_for.State = dsBrowse;
    btn_editar.Enabled := ds_cad_for.State = dsBrowse;
    btn_excluir.Enabled := ds_cad_for.State = dsBrowse;
    btn_salvar.Enabled := ds_cad_for.State in [dsInsert, dsEdit];
    btn_cancelar.Enabled := ds_cad_for.State in [dsInsert, dsEdit];
end;

procedure Tfrm_cad_clientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm_teste_sinqia.qry_cad_clientes.Close;
end;

procedure Tfrm_cad_clientes.FormShow(Sender: TObject);
begin
   dm_teste_sinqia.qry_cad_clientes.open;
end;

end.
