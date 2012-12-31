(*
  Bizmut, Business Classes for Lancamento
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit LancBO;

{$i bizmut.inc}

interface

uses
  PressSubject,
  PressAttributes,
  CustomBO;

type

  { TLancamento }

  {$m+}
  TLancDespesaParts = class;
  TLancReceitaParts = class;
  {$m-}

  TLancamento = class(TCustomObject)
    _Data: TPressDate;
    _Fornecedor: TPressReference;
    _Descricao: TPressAnsiString;
    _Despesas: TLancDespesaParts;
    _Receitas: TLancReceitaParts;
    _TotalDespesas: TPressCurrency;
    _TotalReceitas: TPressCurrency;
  protected
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
    class function InternalMetadataStr: string; override;
  public
    property Despesas: TLancDespesaParts read _Despesas;
    property Receitas: TLancReceitaParts read _Receitas;
  end;

  { TLancDespesaParts }

  {$m+}
  TLancItemDespesa = class;
  TLancItemReceita = class;
  {$m-}

  TLancDespesaParts = class(TCustomParts)
  private
    function GetObjects(AIndex: Integer): TLancItemDespesa;
    procedure SetObjects(AIndex: Integer; const AValue: TLancItemDespesa);
  public
    class function ValidObjectClass: TPressObjectClass; override;
    property Objects[AIndex: Integer]: TLancItemDespesa read GetObjects write SetObjects; default;
  end;

  { TLancReceitaParts }

  TLancReceitaParts = class(TCustomParts)
  private
    function GetObjects(AIndex: Integer): TLancItemReceita;
    procedure SetObjects(AIndex: Integer; const AValue: TLancItemReceita);
  public
    class function ValidObjectClass: TPressObjectClass; override;
    property Objects[AIndex: Integer]: TLancItemReceita read GetObjects write SetObjects; default;
  end;

  { TLancItem }

  TLancItem = class(TCustomObject)
    _Conta: TPressReference;
    _Valor: TPressCurrency;
  private
    function GetValor: Currency;
    procedure SetValor(const AValue: Currency);
  protected
    class function InternalMetadataStr: string; override;
  published
    property Valor: Currency read GetValor write SetValor;
  end;

  { TLancItemDespesa }

  TLancItemDespesa = class(TLancItem)
    _MembroFamilia: TPressReference;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TLancItemReceita }

  TLancItemReceita = class(TLancItem)
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMembroFamilia }

  TMembroFamilia = class(TCustomObject)
    _Nome: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TLancamento }

procedure TLancamento.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  VTotal: Currency;
  I: Integer;
begin
  inherited InternalCalcAttribute(AAttribute);
  if AAttribute = _TotalDespesas then
  begin
    VTotal := 0;
    for I := 0 to Pred(Despesas.Count) do
      VTotal := VTotal + Despesas[I].Valor;
    _TotalDespesas.Value := VTotal;
  end else if AAttribute = _TotalReceitas then
  begin
    VTotal := 0;
    for I := 0 to Pred(Receitas.Count) do
      VTotal := VTotal + Receitas[I].Valor;
    _TotalReceitas.Value := VTotal;
  end;
end;

class function TLancamento.InternalMetadataStr: string;
begin
  Result := 'TLancamento IsPersistent PersistentName="TLanc" (' +
   'Data: Date;' +
   'Fornecedor: Reference(TFornecedor);' +
   'Descricao: AnsiString(100);' +
   'Despesas: TLancDespesaParts ShortName="Des";' +
   'Receitas: TLancReceitaParts ShortName="Rec";' +
   'TotalDespesas: Currency;' +
   'TotalReceitas: Currency;' +
   ')';
end;

{ TLancDespesaParts }

function TLancDespesaParts.GetObjects(AIndex: Integer): TLancItemDespesa;
begin
  Result := inherited Objects[AIndex] as TLancItemDespesa;
end;

procedure TLancDespesaParts.SetObjects(AIndex: Integer;
  const AValue: TLancItemDespesa);
begin
  inherited Objects[AIndex] := AValue;
end;

class function TLancDespesaParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TLancItemDespesa;
end;

{ TReceitaParts }

function TLancReceitaParts.GetObjects(AIndex: Integer): TLancItemReceita;
begin
  Result := inherited Objects[AIndex] as TLancItemReceita;
end;

procedure TLancReceitaParts.SetObjects(AIndex: Integer;
  const AValue: TLancItemReceita);
begin
  inherited Objects[AIndex] := AValue;
end;

class function TLancReceitaParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TLancItemReceita;
end;

{ TLancItem }

function TLancItem.GetValor: Currency;
begin
  Result := _Valor.Value;
end;

procedure TLancItem.SetValor(const AValue: Currency);
begin
  _Valor.Value := AValue;
end;

class function TLancItem.InternalMetadataStr: string;
begin
  Result := 'TLancItem IsPersistent (' +
   'Conta: Reference(TPlanoContas);' +
   'Valor: Currency;' +
   ')';
end;

{ TLancItemDespesa }

class function TLancItemDespesa.InternalMetadataStr: string;
begin
  Result := 'TLancItemDespesa IsPersistent PersistentName="TLancItemDes" (' +
   'MembroFamilia: Reference(TMembroFamilia);' +
   ')';
end;

{ TLancItemReceita }

class function TLancItemReceita.InternalMetadataStr: string;
begin
  Result := 'TLancItemReceita IsPersistent PersistentName="TLancItemRec" (' +
   ')';
end;

{ TMembroFamilia }

class function TMembroFamilia.InternalMetadataStr: string;
begin
  Result := 'TMembroFamilia IsPersistent (' +
   'Nome: AnsiString(100);' +
   ')';
end;

initialization
  TLancamento.RegisterClass;
  TLancDespesaParts.RegisterAttribute;
  TLancReceitaParts.RegisterAttribute;
  TLancItem.RegisterClass;
  TLancItemDespesa.RegisterClass;
  TLancItemReceita.RegisterClass;
  TMembroFamilia.RegisterClass;

end.

