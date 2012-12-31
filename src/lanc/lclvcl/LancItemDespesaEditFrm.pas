(*
  Bizmut, Item de Lancamento (Despesa) Edit Form
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit LancItemDespesaEditFrm;

{$i bizmut.inc}

interface

uses
  StdCtrls, LancItemEditFrm;

type

  { TLancItemDespesaEditForm }

  TLancItemDespesaEditForm = class(TLancItemEditForm)
    MembroFamiliaComboBox: TComboBox;
    MembroFamiliaLabel: TLabel;
  end; 

implementation

uses
  PressXCLBroker, LancMVP;

{$ifdef fpc}{$R *.lfm}{$else}{$R *.dfm}{$endif}

initialization
  PressXCLForm(TLancItemDespesaEditPresenter, TLancItemDespesaEditForm);

end.

