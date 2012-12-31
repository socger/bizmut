(*
  Bizmut, Business Classes for Fornecedor
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit FornBO;

{$I bizmut.inc}

interface

uses
  PressAttributes, CustomBO;

type

  { TFornecedor }

  TFornecedor = class(TCustomObject)
    _Nome: TPressAnsiString;
    _Categoria: TPressReference;
    _Obs: TPressMemo;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TFornCategoria }

  TFornCategoria = class(TCustomObject)
    _Nome: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TFornecedor }

class function TFornecedor.InternalMetadataStr: string;
begin
  Result := 'TFornecedor IsPersistent PersistentName="TForn" (' +
   'Nome: AnsiString(100);' +
   'Categoria: Reference(TFornCategoria);' +
   'Obs: Memo;' +
   ')';
end;

{ TFornCategoria }

class function TFornCategoria.InternalMetadataStr: string;
begin
  Result := 'TFornCategoria IsPersistent PersistentName="TFornCat" (' +
   'Nome: AnsiString(100);' +
   ')';
end;

initialization
  TFornecedor.RegisterClass;
  TFornCategoria.RegisterClass;

end.

