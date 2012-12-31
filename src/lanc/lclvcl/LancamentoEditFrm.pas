(*
  Bizmut, Lancamento Edit Form
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit LancamentoEditFrm;

{$I bizmut.inc}

interface

uses
  StdCtrls, Grids, CustomEditFrm;

type

  { TLancamentoEditForm }

  TLancamentoEditForm = class(TCustomEditForm)
    FornecedorComboBox: TComboBox;
    DataEdit: TEdit;
    DescricaoEdit: TEdit;
    DespesasTotalEdit: TEdit;
    ReceitasTotalEdit: TEdit;
    DataLabel: TLabel;
    DespesasLabel: TLabel;
    ReceitasLabel: TLabel;
    FornecedorLabel: TLabel;
    DescricaoLabel: TLabel;
    DespesasStringGrid: TStringGrid;
    ReceitasStringGrid: TStringGrid;
  end; 

implementation

{$ifdef fpc}{$R *.lfm}{$else}{$R *.dfm}{$endif}

uses
  PressXCLBroker, LancMVP;

initialization
  PressXCLForm(TLancamentoEditPresenter, TLancamentoEditForm);

end.

