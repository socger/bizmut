(*
  Bizmut, MVP Classes for Main Form
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit MainMVP;

{$I bizmut.inc}

interface

uses
  PressMVP,
  CustomMVP;

type

  { TMainFormPresenter }

  TMainFormPresenter = class(TCustomMainFormPresenter)
  private
    FCaption: string;
  protected
    procedure ExecuteLogoff; override;
    procedure ExecuteLogon; override;
    procedure InitPresenter; override;
  end;

  { TGenerateMetadataCommand }

  TGenerateMetadataCommand = class(TPressMVPCommand)
  protected
    procedure InternalExecute; override;
  end;

implementation

uses
  Clipbrd,
  PressDialogs,
  PressUser,
  PressMVPCommand,
  PressOPF,
  PressUserModel,
  UserMVP,
  LancMVP,
  MainFrm;

{ TMainFormPresenter }

procedure TMainFormPresenter.ExecuteLogoff;
begin
  inherited;
  MainForm.Menu := MainForm.MainMenuLogoff;
  MainForm.Caption := FCaption;
end;

procedure TMainFormPresenter.ExecuteLogon;
begin
  inherited;
  MainForm.Menu := MainForm.MainMenu;
  MainForm.Caption := FCaption + ' [' +
   (PressUserData.CurrentUser as TPressUser).UserName + ']';
end;

procedure TMainFormPresenter.InitPresenter;
begin
  inherited InitPresenter;
  BindPresenter(TUserQueryPresenter, 'UsuarioMenuItem');
  BindPresenter(TUserGroupQueryPresenter, 'GrupoUsuarioMenuItem');
  BindCommand(TGenerateMetadataCommand, 'MetadataMenuItem');
  BindCommand(TGenerateMetadataCommand, 'MetadataMenuItemLogoff');
  BindPresenter(TUserLogonPresenter, 'LogonMenuItem');
  BindCommand(TLogoffCommand, 'LogoffMenuItem');
  BindCommand(TPressMVPCloseApplicationCommand, 'SairMenuItem');
  BindCommand(TPressMVPCloseApplicationCommand, 'SairLogoffMenuItem');
  BindPresenter(TLancamentoEditPresenter, 'LancIncMenuItem');
  BindPresenter(nil, 'LancConsMenuItem');
  BindPresenter(nil, 'ContaConsMenuItem');
  FCaption := MainForm.Caption;
  MainForm.Menu := MainForm.MainMenuLogoff;
end;

{ TGenerateMetadataCommand }

procedure TGenerateMetadataCommand.InternalExecute;
begin
  inherited InternalExecute;
  if PressDialog.ConfirmDlg('Copiar metadata para a área de transferência?') then
    Clipboard.AsText := PressOPFService.CreateDatabaseStatement;
end;

initialization
  TGenerateMetadataCommand.RegisterCommand.EnabledIfNoUser := True;

end.

