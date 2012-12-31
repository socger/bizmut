(*
  Bizmut, Item de Lancamento (Receita) Edit Form
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit LancItemReceitaEditFrm;

{$i bizmut.inc}

interface

uses
  LancItemEditFrm;

type
  TLancItemReceitaEditForm = class(TLancItemEditForm)
  end; 

implementation

uses
  PressXCLBroker, LancMVP;

{$ifdef fpc}{$R *.lfm}{$else}{$R *.dfm}{$endif}

initialization
  PressXCLForm(TLancItemReceitaEditPresenter, TLancItemReceitaEditForm);

end.

