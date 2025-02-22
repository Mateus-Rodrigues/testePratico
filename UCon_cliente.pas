unit UCon_cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, frxClass, frxDBSet,
  frCoreClasses;

type
  Tfrm_con_cidades = class(TForm)
    lbl_nome: TLabel;
    edt_pesquisa: TEdit;
    BitBtn1: TBitBtn;
    dbg_registros_pesquisados: TDBGrid;
    ds_pesquisa: TDataSource;
    ImageList1: TImageList;
    frx_rep_rel_for: TfrxReport;
    frx_db_pesq_form: TfrxDBDataset;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  frm_con_cidades: Tfrm_con_cidades;

implementation

{$R *.dfm}

uses UDM, UCon_cidade, UCad_clientes;

procedure Tfrm_con_cidades.BitBtn1Click(Sender: TObject);
begin

   frm_con_cidades := Tfrm_con_cidades.Create(Self);
    try
      frm_con_cidades.ShowModal;
    finally
      frm_con_cidades.Free;
    end;

    dm_teste_sinqia.qry_pesq_cidades.Close;
   dm_teste_sinqia.qry_pesq_cidades.SQL.Clear;
   dm_teste_sinqia.qry_pesq_cidades.SQL.Add(sql + pesquisa);
   dm_teste_sinqia.qry_pesq_cidades.Parameters.ParamByName('pNmFant').value :=
   '%' +  edt_pesquisa.Text + '%';
   dm_teste_sinqia.qry_pesq_cidades.Open;
end;

procedure Tfrm_con_cidades.Button1Click(Sender: TObject);
begin
   frx_rep_rel_for.ShowReport();
end;

procedure Tfrm_con_cidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm_teste_sinqia.qry_pesq_cidades.Close;
   dm_teste_sinqia.qry_pesq_cidades.SQL.Clear;
   dm_teste_sinqia.qry_pesq_cidades.SQL.Add(sql);
end;

procedure Tfrm_con_cidades.FormShow(Sender: TObject);
begin
   dm_teste_sinqia.qry_pesq_cidades.open;
   pesquisa := 'WHERE cli_nome like  :pCliNm ORDER BY cod_cidade ASC ';
end;

end.
