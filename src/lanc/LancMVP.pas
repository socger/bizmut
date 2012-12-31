(*
  Bizmut, MVP Classes for Lancamento
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit LancMVP;

{$I bizmut.inc}

interface

uses
  CustomMVP;

type

  { TLancamentoEditPresenter }

  TLancamentoEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TLancItemEditPresenter }

  TLancItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TLancItemDespesaEditPresenter }

  TLancItemDespesaEditPresenter = class(TLancItemEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TLancItemReceitaEditPresenter }

  TLancItemReceitaEditPresenter = class(TLancItemEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMembroFamiliaEditPresenter }

  TMembroFamiliaEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  LancBO;

{ TLancamentoEditPresenter }

procedure TLancamentoEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Data', 'DataEdit');
  CreateSubPresenter('Fornecedor', 'FornecedorComboBox', 'Nome');
  CreateSubPresenter('Descricao', 'DescricaoEdit');
  CreateSubPresenter('Despesas', 'DespesasStringGrid', 'Conta.Nome;MembroFamilia.Nome;Valor');
  CreateSubPresenter('Receitas', 'ReceitasStringGrid', 'Conta.Nome;Valor');
  CreateSubPresenter('TotalDespesas', 'DespesasTotalEdit');
  CreateSubPresenter('TotalReceitas', 'ReceitasTotalEdit');
end;

{ TLancItemEditPresenter }

procedure TLancItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Conta', 'ContaComboBox', 'Nome');
  CreateSubPresenter('Valor', 'ValorEdit');
end;

{ TLancItemDespesaEditPresenter }

procedure TLancItemDespesaEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('MembroFamilia', 'MembroFamiliaComboBox', 'Nome');
end;

{ TLancItemReceitaEditPresenter }

procedure TLancItemReceitaEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
end;

{ TMembroFamiliaEditPresenter }

procedure TMembroFamiliaEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Nome', 'NomeEdit');
end;

initialization
  TLancamentoEditPresenter.RegisterBO(TLancamento);
  TLancItemEditPresenter.RegisterBO(TLancItem, []);
  TLancItemDespesaEditPresenter.RegisterBO(TLancItemDespesa);
  TLancItemReceitaEditPresenter.RegisterBO(TLancItemReceita);
  TMembroFamiliaEditPresenter.RegisterBO(TMembroFamilia);

end.

