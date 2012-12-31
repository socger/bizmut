(*
  Bizmut, User Access Configuration
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit Users;

{$I bizmut.inc}

interface

type
  TAppResource = (arGestaoUsuarios, arRelatorios);

implementation

uses
  PressSubject, CustomMVP;

initialization
  GReportResourceId := Ord(arRelatorios);
  PressModel.RegisterEnumMetadata(TypeInfo(TAppResource),
   'TPressAppResource', ['Gestão de Usuários', 'Relatórios']);

end.
