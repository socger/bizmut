(*
  Bizmut, Main Form
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit MainFrm;

{$I bizmut.inc}

interface

uses
  Forms, Menus, Classes;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    ArquivoMenuGroup: TMenuItem;
    LogoffMenuItem: TMenuItem;
    LancMenuGroup: TMenuItem;
    LancIncMenuItem: TMenuItem;
    LancConsMenuItem: TMenuItem;
    ContaMenuGroup: TMenuItem;
    ContaConsMenuItem: TMenuItem;
    GrupoUsuarioMenuItem: TMenuItem;
    MainMenuLogoff: TMainMenu;
    ArquivoLogoffMenuGroup: TMenuItem;
    LogonMenuItem: TMenuItem;
    MetadataMenuItemLogoff: TMenuItem;
    SairLogoffMenuItem: TMenuItem;
    N3: TMenuItem;
    N1: TMenuItem;
    UsuarioMenuItem: TMenuItem;
    MetadataMenuItem: TMenuItem;
    SairMenuItem: TMenuItem;
    N2: TMenuItem;
  end;

var
  MainForm: TMainForm;

implementation

{$ifdef fpc}{$R *.lfm}{$else}{$R *.dfm}{$endif}

uses
  PressXCLBroker, MainMVP;

{ TMainForm }

initialization
  PressXCLForm(TMainFormPresenter, TMainForm);

end.

