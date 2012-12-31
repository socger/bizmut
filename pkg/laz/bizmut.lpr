program bizmut;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainFrm, MainMVP, Brokers, Users, LancamentoEditFrm, LancMVP, LancBO,
  FornBO, ContaBO, LancItemEditFrm, LancItemDespesaEditFrm,
  LancItemReceitaEditFrm, MembroFamiliaEditFrm, PressLazReportRT,
  AbstractOPFSQLdbRT, AbstractCoreRT, AbstractUserRT;

{$R bizmut.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  TMainFormPresenter.Run;
end.

