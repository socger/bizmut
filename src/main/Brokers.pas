(*
  Bizmut, Brokers Unit
  Copyright (C) 2013 Jitec Software

  http://www.jitec.com.br

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit Brokers;

{$I bizmut.inc}

interface

uses
  PressMessages_ptbr,
  PressSubject,
  PressAttributes,
  OPFSQLdbBroker,
  IBConnection,
  PQConnection,
  PressFastReportBroker;

implementation

initialization
  PressModel.ClassIdStorageName := 'classes';
  PressModel.DefaultGeneratorName := 'gen_bizmut';
  PressModel.DefaultKeyType := TPressInt64;

end.

