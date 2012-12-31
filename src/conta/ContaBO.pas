(*
  Bizmut, Business Classes for Plano de Contas
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit ContaBO;

{$i bizmut.inc}

interface

uses
  PressAttributes,
  CustomBO;

type

  { TPlanoContas }

  TPlanoContas = class(TCustomObject)
    _Nome: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TConta }

  TConta = class(TPlanoContas)
    _SaldoAbertura: TPressCurrency;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TPlanoContas }

class function TPlanoContas.InternalMetadataStr: string;
begin
  Result := 'TPlanoContas IsPersistent (' +
   'Nome: AnsiString(100);' +
   ')';
end;

{ TConta }

class function TConta.InternalMetadataStr: string;
begin
  Result := 'TConta IsPersistent (' +
   'SaldoAbertura: Currency;' +
   ')';
end;

initialization
  TPlanoContas.RegisterClass;
  TConta.RegisterClass;

end.

