(*
  Bizmut, Item de Lancamento Edit Form
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit LancItemEditFrm;

{$i bizmut.inc}

interface

uses
  StdCtrls, CustomEditFrm;

type

  { TLancItemEditForm }

  TLancItemEditForm = class(TCustomEditForm)
    ContaComboBox: TComboBox;
    ValorEdit: TEdit;
    ContaLabel: TLabel;
    ValorLabel: TLabel;
  end; 

implementation

uses
  PressXCLBroker, LancMVP;

{$ifdef fpc}{$R *.lfm}{$else}{$R *.dfm}{$endif}

initialization
  PressXCLForm(TLancItemEditPresenter, TLancItemEditForm);

end.

