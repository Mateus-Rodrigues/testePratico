unit UCon_cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UCon_cliente;

type
  Tfrm_con_clientes = class(TForm)
    lbl_nome: TLabel;
    edt_pesquisa: TEdit;
    BitBtn1: TBitBtn;
    dbg_registros_pesquisados: TDBGrid;
    ds_pesquisa: TDataSource;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    pesquisa : String;
    const sql = 'SELECT cod_cidades, cid_nome, ' +
                 'cid_estado, cid_cep_imicial, cid_cep_final,'+
                 'FROM cidades';
  public
    { Public declarations }
  end;

var
  frm_con_clientes: Tfrm_con_clientes;

implementation

{$R *.dfm}

uses UDM, UCad_clientes, Ucad_cidades;

procedure Tfrm_con_clientes.BitBtn1Click(Sender: TObject);
var frm_cad_clientes : tfrm_cad_clientes;
begin

    frm_con_clientes := Tfrm_con_clientes.Create(Self);
    try
      frm_con_clientes.ShowModal;
    finally
      frm_con_clientes.Free;
    end;

   dm_teste_sinqia.qry_pesq_clientes.Close;
   dm_teste_sinqia.qry_pesq_clientes.SQL.Clear;
   dm_teste_sinqia.qry_pesq_clientes.SQL.Add(sql + pesquisa);
   dm_teste_sinqia.qry_pesq_clientes.Parameters.ParamByName('pNmFant').value :=
   '%' +  edt_pesquisa.Text + '%';
   dm_teste_sinqia.qry_pesq_clientes.Open;

   frm_cad_clientes := tfrm_cad_clientes.Create(Self);
   try
     frm_cad_clientes.ShowModal;
   finally
     frm_cad_clientes.Free;
   end;
end;

procedure Tfrm_con_clientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm_teste_sinqia.qry_pesq_clientes.Close;
   dm_teste_sinqia.qry_pesq_clientes.SQL.Clear;
   dm_teste_sinqia.qry_pesq_clientes.SQL.Add(sql);
end;

procedure Tfrm_con_clientes.FormShow(Sender: TObject);
begin
 dm_teste_sinqia.qry_pesq_clientes.open;
 pesquisa := 'WHERE cod_cliente like :pNmFant ORDER BY cod_cliente ASC ';
end;

end.
