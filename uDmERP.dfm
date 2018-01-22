object DmERP: TDmERP
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 662
  Width = 1161
  object fdConnERP: TFDConnection
    Params.Strings = (
      'Database=erp'
      'User_Name=postgres'
      'Password=Rigon1990!'
      'Server=localhost'
      'DriverID=PG'
      'CharacterSet=UTF8')
    LoginPrompt = False
    OnError = fdConnERPError
    Left = 24
    Top = 8
  end
  object qyCliente: TFDQuery
    BeforePost = qyClienteBeforePost
    AfterScroll = qyClienteAfterScroll
    OnNewRecord = qyClienteNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT c.*'
      '  FROM erp.cliente c'
      ' &filtro'
      ' ORDER BY cdCliente DESC')
    Left = 100
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object dlPhysPg: TFDPhysPgDriverLink
    Left = 78
    Top = 8
  end
  object qyCidade: TFDQuery
    BeforePost = qyCidadeBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'select * '
      '  from erp.cidade'
      ' &filtro')
    Left = 319
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCidadePesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT cdCidade,'
      '               nmCidade,'
      '               sgEstado,'
      '               CAST(nmCidade || '#39'/'#39' ||'
      '                    sgEstado AS CHARACTER VARYING(250)'
      '                   ) AS deCidEst'
      '          FROM erp.cidade'
      '       ) t'
      ' &filtro')
    Left = 377
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyClientePesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*,'
      
        '       CAST(t.deCliCid || '#39' - Fone 1: '#39' || COALESCE(t.deFone1, '#39 +
        #39') || '
      
        '       '#39' - Fone 2: '#39' || COALESCE(t.deFone2, '#39#39') AS CHARACTER VAR' +
        'YING(250)) AS deCliCidFone'
      '  FROM ('
      '        SELECT cli.cdCliente,'
      '               cli.flFisJur,'
      '               cli.deCpfCnpj,'
      '               cli.deRazaoSocial,'
      '               cli.nmFantasia,'
      '               CAST('
      '                    CASE'
      '                      WHEN LENGTH(cli.nuFone1) = 11 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"00000'#39')'
      '                      WHEN LENGTH(cli.nuFone1) = 10 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"0000'#39') '
      '                      ELSE'
      '                        cli.nuFone1  '
      '                    END AS CHARACTER VARYING(20)'
      '                   ) AS deFone1,'
      '               CAST('
      '                    CASE'
      '                      WHEN LENGTH(cli.nuFone2) = 11 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"00000'#39')'
      '                      WHEN LENGTH(cli.nuFone2) = 10 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"0000'#39') '
      '                      ELSE'
      '                        cli.nuFone2  '
      '                    END AS CHARACTER VARYING(20)'
      '                   ) AS deFone2,'
      '               cid.nmCidade,'
      '               cid.sgEstado,'
      '               cli.deRazaoSocial || '#39' - '#39' ||'
      '               cid.nmCidade || '#39'/'#39' ||'
      '               cid.sgEstado AS deCliCid'
      '  FROM erp.cliente cli'
      '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = cli.cdCidade)'
      '       ) t'
      ' &filtro')
    Left = 164
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIndInscEstPesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.nuIndInscEst,'
      '       t.deIndInscEst'
      '  FROM ('
      
        '        SELECT CAST(1 AS INTEGER) AS nuIndInscEst, CAST('#39'Contrib' +
        'uinte'#39' AS CHARACTER VARYING(30)) AS deIndInscEst'
      '        UNION ALL'
      
        '        SELECT CAST(2 AS INTEGER) AS nuIndInscEst, CAST('#39'Contrib' +
        'uinte Isento'#39' AS CHARACTER VARYING(30)) AS deIndInscEst'
      '        UNION ALL'
      
        '        SELECT CAST(9 AS INTEGER) AS nuIndInscEst, CAST('#39'N'#227'o Con' +
        'tribuinte'#39' AS CHARACTER VARYING(30)) AS deIndInscEst'
      '       ) t'
      ' &filtro'
      ' ORDER BY t.nuIndInscEst')
    Left = 31
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyRepresentante: TFDQuery
    BeforePost = qyRepresentanteBeforePost
    AfterScroll = qyRepresentanteAfterScroll
    OnNewRecord = qyRepresentanteNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT r.*'
      '  FROM erp.representante r'
      ' &filtro'
      ' ORDER BY r.cdRepresentante DESC')
    Left = 244
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyRepresPesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT r.*,'
      '       t01.nmCidade,'
      '       t01.sgEstado'
      '  FROM erp.representante r'
      '  LEFT JOIN ('
      '             SELECT cid.cdCidade AS cdCid,'
      '                    cid.nmCidade,'
      '                    cid.sgEstado'
      '               FROM erp.cidade cid '
      '            ) t01 ON (t01.cdCid = r.cdCidade)'
      ' &filtro')
    Left = 324
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyUsuario: TFDQuery
    BeforePost = qyUsuarioBeforePost
    AfterScroll = qyUsuarioAfterScroll
    OnNewRecord = qyUsuarioNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT u.*,'
      '       t01.deSetor,'
      '       CAST('
      '            CASE'
      '              WHEN u.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(u.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(u.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN u.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(u.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(u.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t02.nmUsuCad,'
      '       t03.nmUsuAlt'
      '  FROM erp.usuario u'
      '  LEFT JOIN ('
      '             SELECT s.cdSetor AS cdSet,'
      '                    s.deSetor'
      '               FROM erp.setor s'
      '            ) t01 ON (t01.cdSet = u.cdSetor)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t02 ON (t02.cdUsuCad = u.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t03 ON (t03.cdUsuAlt = u.cdUsuarioAlteracao)'
      ' &filtro'
      ' ORDER BY u.cdUsuario')
    Left = 112
    Top = 56
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyUsuariocdusuario: TIntegerField
      FieldName = 'cdusuario'
      Origin = 'cdusuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyUsuarionmusuario: TWideStringField
      FieldName = 'nmusuario'
      Origin = 'nmusuario'
      Size = 250
    end
    object qyUsuarioflativo: TWideStringField
      FieldName = 'flativo'
      Origin = 'flativo'
      FixedChar = True
      Size = 1
    end
    object qyUsuariodelogin: TWideStringField
      FieldName = 'delogin'
      Origin = 'delogin'
    end
    object qyUsuariodesenha: TWideStringField
      FieldName = 'desenha'
      Origin = 'desenha'
      Size = 250
    end
    object qyUsuariodeemail: TWideStringField
      FieldName = 'deemail'
      Origin = 'deemail'
      Size = 250
    end
    object qyUsuariodtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyUsuariohrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyUsuariocdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyUsuariodtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyUsuariohralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyUsuariocdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyUsuariocdsetor: TIntegerField
      FieldName = 'cdsetor'
      Origin = 'cdsetor'
    end
    object qyUsuariocdcolaborador: TIntegerField
      FieldName = 'cdcolaborador'
      Origin = 'cdcolaborador'
    end
    object qyUsuariodesetor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'desetor'
      Origin = 'desetor'
      Size = 4000
    end
    object qyUsuariodehrcadastro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrcadastro'
      Origin = 'dehrcadastro'
      ReadOnly = True
      Size = 5
    end
    object qyUsuariodehralteracao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehralteracao'
      Origin = 'dehralteracao'
      ReadOnly = True
      Size = 5
    end
    object qyUsuarionmusucad: TWideStringField
      FieldName = 'nmusucad'
      Origin = 'nmusucad'
      ProviderFlags = [pfInWhere]
      Size = 250
    end
    object qyUsuarionmusualt: TWideStringField
      FieldName = 'nmusualt'
      Origin = 'nmusualt'
      ProviderFlags = [pfInWhere]
      Size = 250
    end
  end
  object qyPermissaoUsuario: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT ut.cdUsuario,'
      '       ut.cdTela,'
      '       t.deTituloTela,'
      '       t.deTituloPai,'
      '       t.nmForm,'
      '       ut.flAtivo,'
      '       ut.flCadastrar,'
      '       ut.flAlterar,'
      '       ut.flExcluir,'
      '       ut.flExibeQuadroAviso,'
      '       ut.flExibeMensagem'
      '  FROM erp.usuarioTela ut'
      ' INNER JOIN erp.tela t ON (t.cdTela = ut.cdTela)'
      ' WHERE t.flAtivo = '#39'S'#39
      '   AND (ut.cdUsuario = :cdUsuario OR :cdUsuario = 0)'
      ' &filtro'
      ' ORDER BY ut.cdUsuario, ut.cdTela')
    Left = 206
    Top = 8
    ParamData = <
      item
        Name = 'CDUSUARIO'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyCobranca: TFDQuery
    BeforePost = qyCobrancaBeforePost
    AfterScroll = qyCobrancaAfterScroll
    OnNewRecord = qyCobrancaNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT c.*,'
      '       CAST('
      '            CASE'
      '              WHEN c.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(c.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(c.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN c.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(c.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(c.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.cobranca c'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = c.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = c.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY c.cdCobranca DESC')
    Left = 22
    Top = 152
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCobrancaContatoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT c.cdCobranca,'
      '               c.dtCadastro AS dtCadCobranca,'
      '               c.cdCliente,'
      '               c.vlCobranca,'
      '               c.deTextoCobranca,'
      '               c.cdSituacao,'
      '               CAST('
      '                    CASE'
      '                      WHEN c.cdSituacao = 1 THEN'
      '                        '#39'Em aberto'#39
      '                      WHEN c.cdSituacao = 2 THEN'
      '                        '#39'Finalizado'#39' '
      '                    END AS CHARACTER VARYING(15)'
      '                   ) AS deSituacao,'
      '               cli.deRazaoSocial AS nmCliente,'
      '               cli.nmFantasia,'
      '               CAST('
      '                    CASE'
      '                      WHEN LENGTH(cli.nuFone1) = 11 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"00000'#39')'
      '                      WHEN LENGTH(cli.nuFone1) = 10 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"0000'#39') '
      '                      ELSE'
      '                        cli.nuFone1  '
      '                    END AS CHARACTER VARYING(20)'
      '                   ) AS deFone1,'
      '               CAST('
      '                    CASE'
      '                      WHEN LENGTH(cli.nuFone2) = 11 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"00000'#39')'
      '                      WHEN LENGTH(cli.nuFone2) = 10 THEN'
      
        '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
        'SION),'#39'FM"("00")"0000"-"0000'#39') '
      '                      ELSE'
      '                        cli.nuFone2  '
      '                    END AS CHARACTER VARYING(20)'
      '                   ) AS deFone2,'
      '               cli.cdCidade,'
      '               cid.nmCidade,'
      '               cid.sgEstado,'
      '               cli.cdRepresentante,'
      '               rep.deRazaoSocial AS nmRepresentante,'
      '               cc.cdCobrancaContato,'
      '               cc.dtContato,'
      '               cc.nmContato,               '
      '               cc.flRetornar,'
      '               cc.dtRetorno,'
      '               CAST('
      '                    CASE'
      '                      WHEN cc.hrRetorno > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(cc.hrRetorno/60), '#39'00' +
        #39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(cc.hrRetorno, 60), '#39'00'#39 +
        '))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrRetorno,'
      '               cc.deObsContato,'
      '               cc.cdUsuarioCadastro AS cdUsuCadContato'
      '          FROM erp.cobranca c '
      
        '          LEFT JOIN erp.cobrancaContato cc  ON (cc.cdCobranca = ' +
        'c.cdCobranca)'
      
        '          LEFT JOIN erp.cliente         cli ON (cli.cdCliente = ' +
        'c.cdCliente)'
      
        '          LEFT JOIN erp.representante   rep ON (rep.cdRepresenta' +
        'nte = cli.cdRepresentante)'
      
        '          LEFT JOIN erp.cidade          cid ON (cid.cdCidade = c' +
        'li.cdCidade)'
      '       ) t'
      ' &filtro'
      
        ' ORDER BY t.cdRepresentante, t.cdCidade, t.cdCliente, t.cdCobran' +
        'ca, t.cdCobrancaContato')
    Left = 418
    Top = 152
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCobrancaContato: TFDQuery
    BeforeOpen = qyCobrancaContatoBeforeOpen
    BeforePost = qyCobrancaContatoBeforePost
    AfterScroll = qyCobrancaContatoAfterScroll
    OnNewRecord = qyCobrancaContatoNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT cc.*,'
      '       CAST('
      '            CASE'
      '              WHEN cc.hrRetorno > 0 THEN'
      '                TRIM(TO_CHAR(TRUNC(cc.hrRetorno/60), '#39'00'#39')) || '
      '                TRIM(TO_CHAR(MOD(cc.hrRetorno, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrRetorno,'
      '       CAST('
      '            CASE'
      '              WHEN cc.hrRetorno > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(cc.hrRetorno/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(cc.hrRetorno, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrRetornoGrid,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.cobrancaContato cc'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = cc.cdUsuarioCadast' +
        'ro)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = cc.cdUsuarioAltera' +
        'cao)'
      ' WHERE cc.cdCobranca = :cdCobranca'
      ' ORDER BY cc.cdCobrancaContato DESC')
    Left = 106
    Top = 152
    ParamData = <
      item
        Name = 'CDCOBRANCA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qyCobrancaContatocdcobranca: TIntegerField
      FieldName = 'cdcobranca'
      Origin = 'cdcobranca'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyCobrancaContatocdcobrancacontato: TIntegerField
      FieldName = 'cdcobrancacontato'
      Origin = 'cdcobrancacontato'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyCobrancaContatodtcontato: TDateField
      FieldName = 'dtcontato'
      Origin = 'dtcontato'
    end
    object qyCobrancaContatonmcontato: TWideStringField
      FieldName = 'nmcontato'
      Origin = 'nmcontato'
      Size = 150
    end
    object qyCobrancaContatodeobscontato: TWideStringField
      FieldName = 'deobscontato'
      Origin = 'deobscontato'
      Size = 4000
    end
    object qyCobrancaContatoflretornar: TWideStringField
      FieldName = 'flretornar'
      Origin = 'flretornar'
      FixedChar = True
      Size = 1
    end
    object qyCobrancaContatodtretorno: TDateField
      FieldName = 'dtretorno'
      Origin = 'dtretorno'
    end
    object qyCobrancaContatohrretorno: TIntegerField
      FieldName = 'hrretorno'
      Origin = 'hrretorno'
    end
    object qyCobrancaContatodtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyCobrancaContatohrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyCobrancaContatocdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyCobrancaContatodtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyCobrancaContatohralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyCobrancaContatocdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyCobrancaContatodehrretorno: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrretorno'
      Origin = 'dehrretorno'
      Size = 5
    end
    object qyCobrancaContatodehrretornogrid: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrretornogrid'
      Origin = 'dehrretornogrid'
      Size = 5
    end
    object qyCobrancaContatonmusucad: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusucad'
      Origin = 'nmusucad'
      Size = 250
    end
    object qyCobrancaContatonmusualt: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusualt'
      Origin = 'nmusualt'
      Size = 250
    end
  end
  object qyCobrancaSituacao: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.cdSituacao,'
      '       t.deSituacao'
      '  FROM ('
      
        '        SELECT CAST(1 AS INTEGER) AS cdSituacao, CAST('#39'Em aberto' +
        #39' AS CHARACTER VARYING(15)) AS deSituacao'
      '        UNION ALL'
      
        '        SELECT CAST(2 AS INTEGER) AS cdSituacao, CAST('#39'Finalizad' +
        'o'#39' AS CHARACTER VARYING(15)) AS deSituacao'
      '       ) t'
      ' &filtro'
      ' ORDER BY t.cdSituacao')
    Left = 308
    Top = 152
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object dsCobrancaSituacao: TDataSource
    AutoEdit = False
    DataSet = qyCobrancaSituacao
    Left = 206
    Top = 152
  end
  object qyAviso: TFDQuery
    BeforePost = qyAvisoBeforePost
    OnNewRecord = qyClienteNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.aviso'
      ' &filtro')
    Left = 397
    Top = 56
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyAuxiliar: TFDQuery
    Connection = fdConnERP
    Left = 128
    Top = 8
  end
  object qyIntSupItensCfgPad: TFDQuery
    BeforePost = qyIntSupItensCfgPadBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.intSupItensConfPadrao'
      ' &filtro'
      ' ORDER BY cdItem')
    Left = 517
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyIntSupItensCfgPadcditem: TWideStringField
      FieldName = 'cditem'
      Origin = 'cditem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 50
    end
    object qyIntSupItensCfgPadcdtipoalcarecnum: TIntegerField
      FieldName = 'cdtipoalcarecnum'
      Origin = 'cdtipoalcarecnum'
    end
    object qyIntSupItensCfgPadcdtipoalca: TIntegerField
      FieldName = 'cdtipoalca'
      Origin = 'cdtipoalca'
    end
    object qyIntSupItensCfgPaddetipoalca: TWideStringField
      FieldName = 'detipoalca'
      Origin = 'detipoalca'
      OnValidate = qyIntSupItensCfgPaddetipoalcaValidate
      Size = 250
    end
    object qyIntSupItensCfgPadcdadornorecnum: TIntegerField
      FieldName = 'cdadornorecnum'
      Origin = 'cdadornorecnum'
    end
    object qyIntSupItensCfgPadcdadorno: TIntegerField
      FieldName = 'cdadorno'
      Origin = 'cdadorno'
    end
    object qyIntSupItensCfgPaddeadorno: TWideStringField
      FieldName = 'deadorno'
      Origin = 'deadorno'
      OnValidate = qyIntSupItensCfgPaddeadornoValidate
      Size = 250
    end
    object qyIntSupItensCfgPadcdchavetarecnum: TIntegerField
      FieldName = 'cdchavetarecnum'
      Origin = 'cdchavetarecnum'
    end
    object qyIntSupItensCfgPadcdchaveta: TIntegerField
      FieldName = 'cdchaveta'
      Origin = 'cdchaveta'
    end
    object qyIntSupItensCfgPaddechaveta: TWideStringField
      FieldName = 'dechaveta'
      Origin = 'dechaveta'
      OnValidate = qyIntSupItensCfgPaddechavetaValidate
      Size = 250
    end
    object qyIntSupItensCfgPadcdforracaorecnum: TIntegerField
      FieldName = 'cdforracaorecnum'
      Origin = 'cdforracaorecnum'
    end
    object qyIntSupItensCfgPadcdforracao: TIntegerField
      FieldName = 'cdforracao'
      Origin = 'cdforracao'
    end
    object qyIntSupItensCfgPaddeforracao: TWideStringField
      FieldName = 'deforracao'
      Origin = 'deforracao'
      OnValidate = qyIntSupItensCfgPaddeforracaoValidate
      Size = 250
    end
    object qyIntSupItensCfgPaddtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyIntSupItensCfgPadhrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyIntSupItensCfgPadcdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyIntSupItensCfgPaddtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyIntSupItensCfgPadhralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyIntSupItensCfgPadcdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyIntSupItensCfgPadcdtipoalcaseq: TIntegerField
      FieldName = 'cdtipoalcaseq'
      Origin = 'cdtipoalcaseq'
    end
    object qyIntSupItensCfgPadcdadornoseq: TIntegerField
      FieldName = 'cdadornoseq'
      Origin = 'cdadornoseq'
    end
    object qyIntSupItensCfgPadcdchavetaseq: TIntegerField
      FieldName = 'cdchavetaseq'
      Origin = 'cdchavetaseq'
    end
    object qyIntSupItensCfgPadcdforracaoseq: TIntegerField
      FieldName = 'cdforracaoseq'
      Origin = 'cdforracaoseq'
    end
    object qyIntSupItensCfgPadflcobrarcor: TWideStringField
      FieldName = 'flcobrarcor'
      Origin = 'flcobrarcor'
      OnGetText = qyIntSupItensCfgPadflcobrarcorGetText
      FixedChar = True
      Size = 1
    end
    object qyIntSupItensCfgPadflativo: TWideStringField
      FieldName = 'flativo'
      Origin = 'flativo'
      FixedChar = True
      Size = 1
    end
  end
  object qyIntComCarga: TFDQuery
    AfterScroll = qyIntComCargaAfterScroll
    OnNewRecord = qyIntComCargaNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       m.nmMotorista,'
      '       v.dePlaca,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.intComCarga a  '
      '  LEFT JOIN erp.motorista m  ON (m.cdMotorista = a.cdMotorista)'
      '  LEFT JOIN erp.veiculo   v  ON (v.cdVeiculo = a.cdVeiculo)'
      
        '  LEFT JOIN erp.usuario   uc ON (uc.cdUsuario = a.cdUsuarioCadas' +
        'tro)'
      
        '  LEFT JOIN erp.usuario   ua ON (ua.cdUsuario = a.cdUsuarioAlter' +
        'acao) '
      ' &filtro'
      ' ORDER BY a.cdCarga DESC')
    Left = 37
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntComItemPedImpresso: TFDQuery
    BeforePost = qyIntComItemPedImpressoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro, '
      '       CAST(CASE'
      '         WHEN a.nuTipoImpressao = 1 THEN'
      '           '#39'Etiqueta'#39
      '         WHEN a.nuTipoImpressao = 2 THEN'
      '           '#39'Rel. Produ'#231#227'o'#39
      '         WHEN a.nuTipoImpressao = 3 THEN'
      '           '#39'Bilhetinho'#39
      '         WHEN a.nuTipoImpressao = 4 THEN'
      '           '#39'Lista Pedidos'#39
      '         WHEN a.nuTipoImpressao = 5 THEN'
      '           '#39'Lista Pedido Por Representante'#39
      '         WHEN a.nuTipoImpressao = 6 THEN'
      '           '#39'Valor Vendas UF'#39
      '         WHEN a.nuTipoImpressao = 7 THEN'
      '           '#39'Baixa de Produ'#231#227'o'#39
      '         WHEN a.nuTipoImpressao = 8 THEN'
      '           '#39'Lista Item Pedidos'#39
      '         WHEN a.nuTipoImpressao = 9 THEN'
      '           '#39'Lista Pedidos 2'#39
      '         WHEN a.nuTipoImpressao = 10 THEN'
      '           '#39'Lista Pedidos 3'#39
      '         WHEN a.nuTipoImpressao = 11 THEN'
      '           '#39'Lista Carregamento'#39
      '         WHEN a.nuTipoImpressao = 12 THEN'
      '           '#39'Lista Pedido Por Cliente'#39
      '         WHEN a.nuTipoImpressao = 13 THEN'
      '           '#39'Vendas M'#234's Por Representante'#39
      '         WHEN a.nuTipoImpressao = 14 THEN'
      '           '#39'Vendas M'#234's Nfe Por Representante'#39
      '         WHEN a.nuTipoImpressao = 15 THEN'
      '           '#39'Refer'#234'ncias Vendidas'#39
      '         ELSE'
      '           '#39'Inv'#225'lida'#39
      '         END AS CHARACTER VARYING(100)) AS deTipoImpressao'
      '  FROM erp.intComItemPedImpresso a'
      ' &filtro'
      
        ' ORDER BY a.dtCadastro DESC, a.hrCadastro DESC, a.nuPedido, a.nu' +
        'SeqItem')
    Left = 279
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyEmpresa: TFDQuery
    BeforePost = qyEmpresaBeforePost
    AfterScroll = qyEmpresaAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT e.*,'
      '       CAST('
      '            CASE'
      '              WHEN e.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(e.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(e.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN e.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(e.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(e.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.empresa e'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = e.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = e.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY e.cdEmpresa DESC')
    Left = 15
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyFatDiario: TFDQuery
    BeforePost = qyFatDiarioBeforePost
    OnNewRecord = qyFatDiarioNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT fd.*,'
      '       CAST('
      '            CASE'
      '              WHEN fd.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(fd.hrCadastro/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(fd.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN fd.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(fd.hrAlteracao/60), '#39'00'#39')) ||' +
        ' '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(fd.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.fatDiario fd'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = fd.cdUsuarioCadast' +
        'ro)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = fd.cdUsuarioAltera' +
        'cao)'
      ' &filtro'
      ' ORDER BY fd.cdFatDiario DESC')
    Left = 17
    Top = 104
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyFatDiarioPesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t01.*'
      '  FROM ('
      '        SELECT fd.cdFatDiario,'
      '               fd.cdEmpresa,'
      '               e.nmFantasia,'
      '               e.deRazaoSocial,'
      '               fd.dtMovimento,'
      
        '               CAST(TO_CHAR(fd.dtMovimento, '#39'mm/yyyy'#39') AS CHARAC' +
        'TER VARYING(10)) AS deComp,'
      '               fd.vlFaturado'
      '          FROM erp.fatDiario fd'
      
        '          LEFT JOIN erp.empresa e ON (e.cdEmpresa = fd.cdEmpresa' +
        ')'
      '       ) t01 '
      ' &filtro')
    Left = 88
    Top = 104
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVeiculo: TFDQuery
    BeforePost = qyVeiculoBeforePost
    AfterScroll = qyVeiculoAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT v.*,'
      '       CAST('
      '            CASE'
      '              WHEN v.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(v.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(v.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN v.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(v.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(v.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.veiculo v'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = v.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = v.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY v.cdVeiculo DESC')
    Left = 152
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVeiculoPesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t01.*'
      '  FROM ('
      '        SELECT v.cdVeiculo,'
      '               v.dePlaca'
      '          FROM erp.veiculo v'
      '       ) t01 '
      ' &filtro')
    Left = 209
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qySetor: TFDQuery
    BeforePost = qySetorBeforePost
    OnNewRecord = qySetorNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT s.*,'
      '       CAST('
      '            CASE'
      '              WHEN s.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(s.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(s.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN s.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(s.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(s.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.setor s'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = s.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = s.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY s.cdSetor DESC')
    Left = 267
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyUsuarioTela: TFDQuery
    BeforeOpen = qyUsuarioTelaBeforeOpen
    BeforePost = qyUsuarioTelaBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT ut.*,'
      '       t01.deTituloPai,'
      '       t01.deTituloTela,'
      '       t02.nmUsuCad,'
      '       t03.nmUsuAlt'
      '  FROM erp.usuarioTela ut'
      '  LEFT JOIN ('
      '             SELECT t.cdTela AS cdCodTela,'
      '                    t.deTituloPai,'
      '                    t.deTituloTela'
      '               FROM erp.tela t'
      '            ) t01 ON (t01.cdCodTela = ut.cdTela)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t02 ON (t02.cdUsuCad = ut.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t03 ON (t03.cdUsuAlt = ut.cdUsuarioAlteracao)'
      ' WHERE ut.cdUsuario = :cdUsuario'
      ' ORDER BY t01.deTituloPai, t01.deTituloTela')
    Left = 248
    Top = 56
    ParamData = <
      item
        Name = 'CDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qyUsuarioPesq: TFDQuery
    AfterClose = qyUsuarioPesqAfterClose
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT u.cdUsuario,'
      '               u.nmUsuario,'
      '               u.deLogin,'
      '               u.deSenha,'
      '               u.deEmail,'
      '               u.flAtivo,'
      '               u.cdSetor,'
      '               s.deSetor,'
      '               u.cdColaborador'
      '          FROM erp.usuario u'
      '          LEFT JOIN erp.setor s ON (s.cdSetor = u.cdSetor)'
      '       ) t '
      ' &filtro'
      ' ORDER BY t.cdUsuario DESC')
    Left = 176
    Top = 56
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyTelasDisponiveis: TFDQuery
    BeforeOpen = qyTelasDisponiveisBeforeOpen
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.cdTela,'
      '       t.deTituloPai,'
      '       t.deTituloTela'
      '  FROM erp.tela t'
      ' WHERE t.flAtivo = '#39'S'#39' '
      '   AND NOT EXISTS ('
      '                   SELECT ut.cdUsuario'
      '                     FROM erp.usuarioTela ut'
      '                    WHERE ut.cdTela = t.cdTela'
      '                      AND ut.cdUsuario = :cdUsuario'
      '                  )'
      ' ORDER BY t.deTituloPai, t.deTituloTela')
    Left = 330
    Top = 56
    ParamData = <
      item
        Name = 'CDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qyTela: TFDQuery
    BeforePost = qyTelaBeforePost
    OnNewRecord = qyTelaNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*,'
      '       CAST('
      '            CASE'
      '              WHEN t.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(t.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(t.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN t.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(t.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(t.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.tela t'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = t.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = t.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY t.cdTela DESC')
    Left = 8
    Top = 56
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyTelaPesq: TFDQuery
    AfterClose = qyTelaPesqAfterClose
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT z.*'
      '  FROM ('
      '        SELECT t.cdTela,'
      '               t.deTituloPai,'
      '               t.deTituloTela,'
      '               t.flAtivo,'
      '               t.nmForm'
      '          FROM erp.tela t'
      '       ) z '
      ' &filtro'
      ' ORDER BY z.cdTela DESC')
    Left = 56
    Top = 56
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPatrimonioTipo: TFDQuery
    BeforePost = qyPatrimonioTipoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT pt.*,'
      '       CAST('
      '            CASE'
      '              WHEN pt.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(pt.hrCadastro/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(pt.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN pt.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(pt.hrAlteracao/60), '#39'00'#39')) ||' +
        ' '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(pt.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.patrimonioTipo pt'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = pt.cdUsuarioCadast' +
        'ro)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = pt.cdUsuarioAltera' +
        'cao)'
      ' &filtro'
      ' ORDER BY pt.cdPatrimonioTipo DESC')
    Left = 31
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPatrimonioTipoPesq: TFDQuery
    AfterClose = qyPatrimonioTipoPesqAfterClose
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t01.*'
      '  FROM ('
      '        SELECT pt.cdPatrimonioTipo,'
      '               pt.dePatrimonioTipo'
      '          FROM erp.patrimonioTipo pt'
      '       ) t01 '
      ' &filtro')
    Left = 131
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPatrimonio: TFDQuery
    BeforePost = qyPatrimonioBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT p.*,'
      '       CAST('
      '            CASE'
      '              WHEN p.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(p.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(p.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN p.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(p.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(p.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       pt.dePatrimonioTipo,'
      '       s.deSetor,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.patrimonio p'
      
        '  LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTipo = p.cd' +
        'PatrimonioTipo)'
      '  LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSetor)'
      
        '  LEFT JOIN erp.usuario        uc ON (uc.cdUsuario = p.cdUsuario' +
        'Cadastro)'
      
        '  LEFT JOIN erp.usuario        ua ON (ua.cdUsuario = p.cdUsuario' +
        'Alteracao)'
      ' &filtro'
      ' ORDER BY p.cdPatrimonio DESC')
    Left = 219
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPatrimonioPesq: TFDQuery
    AfterClose = qyPatrimonioPesqAfterClose
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t01.*'
      '  FROM ('
      '        SELECT p.cdPatrimonio,'
      '               p.nuPatrimonio,'
      '               p.dePatrimonio,'
      '               p.cdPatrimonioTipo,'
      '               pt.dePatrimonioTipo,'
      '               p.dtAquisicao,'
      '               p.cdSetor,'
      '               s.deSetor,'
      '               CAST(p.dePatrimonio || '#39' - N'#186' '#39' ||'
      '                    p.nuPatrimonio AS CHARACTER VARYING(250)'
      '                   ) AS deDescPatr '
      '          FROM erp.patrimonio p'
      
        '          LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTip' +
        'o = p.cdPatrimonioTipo)'
      
        '          LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSe' +
        'tor)'
      '       ) t01 '
      ' &filtro')
    Left = 298
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPatrimonioManut: TFDQuery
    BeforePost = qyPatrimonioManutBeforePost
    OnNewRecord = qyPatrimonioManutNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT pm.*,'
      '       CAST('
      '            CASE'
      '              WHEN pm.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(pm.hrCadastro/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(pm.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN pm.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(pm.hrAlteracao/60), '#39'00'#39')) ||' +
        ' '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(pm.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       p.nuPatrimonio,'
      '       p.dePatrimonio,'
      '       pt.dePatrimonioTipo,'
      '       s.deSetor,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.patrimonioManutencao pm'
      
        ' INNER JOIN erp.patrimonio     p  ON (pm.cdPatrimonio = p.cdPatr' +
        'imonio)'
      
        '  LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTipo = p.cd' +
        'PatrimonioTipo)'
      '  LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSetor)'
      
        '  LEFT JOIN erp.usuario        uc ON (uc.cdUsuario = pm.cdUsuari' +
        'oCadastro)'
      
        '  LEFT JOIN erp.usuario        ua ON (ua.cdUsuario = pm.cdUsuari' +
        'oAlteracao)'
      ' &filtro'
      ' ORDER BY pm.cdPatrimonioManutencao DESC')
    Left = 35
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPatrimonioManutPesq: TFDQuery
    AfterClose = qyPatrimonioManutPesqAfterClose
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t01.*'
      '  FROM ('
      '        SELECT pm.cdPatrimonioManutencao,'
      '               pm.cdSituacao,'
      '               CAST('
      '                    CASE'
      '                      WHEN pm.cdSituacao = 1 THEN'
      '                        '#39'Em Aberto'#39
      '                      WHEN pm.cdSituacao = 2 THEN'
      '                        '#39'Em Progresso'#39
      '                      WHEN pm.cdSituacao = 3 THEN'
      '                        '#39'Cancelada'#39
      '                      WHEN pm.cdSituacao = 4 THEN'
      '                        '#39'Finalizada'#39
      '                      ELSE'
      '                        NULL'
      '                    END AS CHARACTER VARYING(20)'
      '                   ) AS deSituacao,'
      '               pm.cdPatrimonio,               '
      '               p.nuPatrimonio,'
      '               p.dePatrimonio,'
      '               p.cdPatrimonioTipo,'
      '               pt.dePatrimonioTipo,'
      '               p.dtAquisicao,'
      '               p.cdSetor,'
      '               s.deSetor,'
      '               pm.dtManutencao,'
      '               pm.dtAvisarEm, '
      '               pm.deResponsavel,'
      '               pm.deManutencao,'
      '               pm.dtTermino'
      '          FROM erp.patrimonioManutencao pm'
      
        '          LEFT JOIN erp.patrimonio     p  ON (p.cdPatrimonio = p' +
        'm.cdPatrimonio)'
      
        '          LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTip' +
        'o = p.cdPatrimonioTipo)'
      
        '          LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSe' +
        'tor)'
      '       ) t01 '
      ' &filtro'
      ' ORDER BY t01.cdPatrimonioManutencao, t01.dtManutencao')
    Left = 149
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object dsPatrimonioSituacao: TDataSource
    AutoEdit = False
    DataSet = qyPatrimonioSituacao
    Left = 260
    Top = 249
  end
  object qyPatrimonioSituacao: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.cdSituacao,'
      '       t.deSituacao'
      '  FROM ('
      
        '        SELECT CAST(1 AS INTEGER) AS cdSituacao, CAST('#39'Em Aberto' +
        #39' AS CHARACTER VARYING(15)) AS deSituacao'
      '        UNION ALL'
      
        '        SELECT CAST(2 AS INTEGER) AS cdSituacao, CAST('#39'Em Progre' +
        'sso'#39' AS CHARACTER VARYING(15)) AS deSituacao'
      '        UNION ALL'
      
        '        SELECT CAST(3 AS INTEGER) AS cdSituacao, CAST('#39'Cancelada' +
        #39' AS CHARACTER VARYING(15)) AS deSituacao'
      '        UNION ALL'
      
        '        SELECT CAST(4 AS INTEGER) AS cdSituacao, CAST('#39'Finalizad' +
        'a'#39' AS CHARACTER VARYING(15)) AS deSituacao'
      '       ) t'
      ' &filtro'
      ' ORDER BY t.cdSituacao')
    Left = 367
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyFornecedor: TFDQuery
    BeforePost = qyFornecedorBeforePost
    AfterScroll = qyFornecedorAfterScroll
    OnNewRecord = qyFornecedorNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT f.*'
      '  FROM erp.fornecedor f'
      ' &filtro'
      ' ORDER BY f.cdFornecedor DESC')
    Left = 396
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyFornecedorTipo: TFDQuery
    BeforePost = qyFornecedorTipoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT ft.*'
      '  FROM erp.fornecedorTipo ft'
      ' &filtro'
      ' ORDER BY ft.cdFornecedorTipo DESC')
    Left = 458
    Top = 435
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyMotorista: TFDQuery
    BeforePost = qyMotoristaBeforePost
    AfterScroll = qyMotoristaAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT m.*'
      '  FROM erp.motorista m'
      ' &filtro'
      ' ORDER BY m.cdMotorista DESC')
    Left = 534
    Top = 434
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyDocumentoTipo: TFDQuery
    BeforePost = qyDocumentoTipoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT dt.*,'
      '       CAST('
      '            CASE'
      '              WHEN dt.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(dt.hrCadastro/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(dt.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN dt.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(dt.hrAlteracao/60), '#39'00'#39')) ||' +
        ' '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(dt.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.documentoTipo dt'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = dt.cdUsuarioCadast' +
        'ro)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = dt.cdUsuarioAltera' +
        'cao)'
      ' &filtro'
      ' ORDER BY dt.cdDocumentoTipo DESC')
    Left = 387
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyDespesaTipo: TFDQuery
    BeforePost = qyDespesaTipoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT dt.*,'
      '       CAST('
      '            CASE'
      '              WHEN dt.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(dt.hrCadastro/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(dt.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN dt.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(dt.hrAlteracao/60), '#39'00'#39')) ||' +
        ' '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(dt.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.despesaTipo dt'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = dt.cdUsuarioCadast' +
        'ro)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = dt.cdUsuarioAltera' +
        'cao)'
      ' &filtro'
      ' ORDER BY dt.cdDespesaTipo DESC')
    Left = 471
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyBordero: TFDQuery
    BeforePost = qyBorderoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT b.*,'
      '       CAST('
      '            CASE'
      '              WHEN b.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(b.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(b.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN b.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(b.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(b.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       m.nmMotorista,'
      '       v.dePlaca,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.bordero b'
      '  LEFT JOIN erp.motorista m  ON (m.cdMotorista = b.cdMotorista)'
      '  LEFT JOIN erp.veiculo   v  ON (v.cdVeiculo = b.cdVeiculo)'
      
        '  LEFT JOIN erp.usuario   uc ON (uc.cdUsuario = b.cdUsuarioCadas' +
        'tro)'
      
        '  LEFT JOIN erp.usuario   ua ON (ua.cdUsuario = b.cdUsuarioAlter' +
        'acao)'
      ' &filtro'
      ' ORDER BY b.cdBordero DESC')
    Left = 450
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyDocumento: TFDQuery
    BeforePost = qyDocumentoBeforePost
    OnNewRecord = qyDocumentoNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT d.*,'
      '       CAST('
      '            CASE'
      '              WHEN d.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(d.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(d.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN d.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(d.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(d.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       e.deRazaoSocial AS nmEmpresa,'
      '       f.deRazaoSocial AS nmFornecedor,'
      '       dt.deDocumentoTipo,'
      '       det.deDespesaTipo,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.documento d'
      '  LEFT JOIN erp.empresa       e   ON (e.cdEmpresa = d.cdEmpresa)'
      
        '  LEFT JOIN erp.fornecedor    f   ON (f.cdFornecedor = d.cdForne' +
        'cedor)'
      
        '  LEFT JOIN erp.documentoTipo dt  ON (dt.cdDocumentoTipo = d.cdD' +
        'ocumentoTipo)'
      
        '  LEFT JOIN erp.despesaTipo   det ON (det.cdDespesaTipo = d.cdDe' +
        'spesaTipo)'
      
        '  LEFT JOIN erp.usuario       uc  ON (uc.cdUsuario = d.cdUsuario' +
        'Cadastro)'
      
        '  LEFT JOIN erp.usuario       ua  ON (ua.cdUsuario = d.cdUsuario' +
        'Alteracao)'
      ' &filtro'
      ' ORDER BY d.cdDocumento DESC')
    Left = 514
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyBorderoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT b.cdBordero,'
      '               b.cdMotorista,'
      '               m.nmMotorista,'
      '               b.cdVeiculo,'
      
        '               CAST(REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
        #39'\1-\2'#39') AS CHARACTER VARYING(5)) AS dePlaca,'
      '               CAST('
      
        '                    REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
        #39'\1-\2'#39') || '#39' - '#39' ||'
      '                    CASE'
      '                      WHEN v.cdVeiculoTipo = 1 THEN'
      '                        '#39'Carro'#39' '
      '                      WHEN v.cdVeiculoTipo = 2 THEN'
      '                        '#39'Caminh'#227'o'#39
      '                      WHEN v.cdVeiculoTipo = 3 THEN'
      '                        '#39'Caminhonete'#39
      '                      WHEN v.cdVeiculoTipo = 4 THEN'
      '                        '#39'Carreta'#39
      '                      WHEN v.cdVeiculoTipo = 5 THEN'
      '                        '#39'Moto'#39' '
      '                    END AS CHARACTER VARYING(30)'
      '                   ) AS deVeiculo,'
      '               b.dtSaida,'
      '               b.dtRetorno,'
      '               b.nuKmInicial,'
      '               b.nuKmFinal,'
      '               d.dtCompetencia,'
      '               d.cdEmpresa,'
      '               e.deRazaoSocial AS nmEmpresa,'
      '               d.cdFornecedor,'
      
        '               COALESCE(f.deRazaoSocial, d.nmFornecedor) AS nmFo' +
        'rnecedor,'
      '               d.deNumDocumento,'
      '               d.dtEmissao,'
      '               d.vlDocumento,'
      '               d.cdDocumentoTipo,'
      '               doc.deDocumentoTipo,'
      '               d.cdDespesaTipo,'
      '               des.deDespesaTipo'
      '          FROM erp.bordero b'
      
        '          LEFT JOIN erp.motorista     m   ON (m.cdMotorista = b.' +
        'cdMotorista)'
      
        '          LEFT JOIN erp.veiculo       v   ON (v.cdVeiculo = b.cd' +
        'Veiculo)'
      
        '          LEFT JOIN erp.documento     d   ON (d.cdBordero = b.cd' +
        'Bordero)'
      
        '          LEFT JOIN erp.empresa       e   ON (e.cdEmpresa = d.cd' +
        'Empresa)'
      
        '          LEFT JOIN erp.fornecedor    f   ON (f.cdFornecedor = d' +
        '.cdFornecedor)'
      
        '          LEFT JOIN erp.documentoTipo doc ON (doc.cdDocumentoTip' +
        'o = d.cdDocumentoTipo)'
      
        '          LEFT JOIN erp.despesaTipo   des ON (des.cdDespesaTipo ' +
        '= d.cdDespesaTipo)'
      '       ) t'
      ' &filtro')
    Left = 586
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyDocumentoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT d.cdDocumento,'
      '               d.dtCompetencia,'
      
        '               CAST(TO_CHAR(d.dtCompetencia, '#39'mm/yyyy'#39') AS CHARA' +
        'CTER VARYING(10)) AS deComp,'
      '               d.cdEmpresa,'
      '               e.deRazaoSocial AS nmEmpresa,'
      '               d.cdFornecedor,'
      
        '               COALESCE(f.deRazaoSocial, d.nmFornecedor) AS nmFo' +
        'rnecedor,'
      '               d.deNumDocumento,'
      '               d.dtEmissao,'
      '               d.vlDocumento,'
      '               d.cdDocumentoTipo,'
      '               doc.deDocumentoTipo,'
      '               d.cdDespesaTipo,'
      '               des.deDespesaTipo,'
      '               d.flContabiliza, '
      '               d.deObservacoes'
      '          FROM erp.documento d   '
      
        '          LEFT JOIN erp.empresa       e   ON (e.cdEmpresa = d.cd' +
        'Empresa)'
      
        '          LEFT JOIN erp.fornecedor    f   ON (f.cdFornecedor = d' +
        '.cdFornecedor)'
      
        '          LEFT JOIN erp.documentoTipo doc ON (doc.cdDocumentoTip' +
        'o = d.cdDocumentoTipo)'
      
        '          LEFT JOIN erp.despesaTipo   des ON (des.cdDespesaTipo ' +
        '= d.cdDespesaTipo)'
      '       ) t '
      ' &filtro')
    Left = 670
    Top = 248
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntComPedidosAntigos: TFDQuery
    AfterScroll = qyIntComPedidosAntigosAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT p.*'
      '  FROM erp.intComPedidosAntigos p'
      ' &filtro'
      ' ORDER BY p.cdPedido')
    Left = 645
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntComItensPedAntigos: TFDQuery
    BeforeOpen = qyIntComItensPedAntigosBeforeOpen
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT ip.*'
      '  FROM erp.intComItensPedAntigos ip'
      ' WHERE ip.cdPedido = :cdPedido'
      ' ORDER BY ip.cdItem')
    Left = 773
    Top = 532
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object qyEstoqueProducaoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      #9'SELECT a.cdItem,'
      '               a.deItem,'
      
        '               CAST(a.cdSetor || '#39'-'#39' || t01.deSetor AS CHARACTER' +
        ' VARYING(100)) AS deGrupoSet, '
      #9'       a.cdSetor,'
      #9'       t01.deSetor,'
      '               a.cdTamanho,'
      '/*'
      '               CAST('
      '                    CASE'
      
        '                      WHEN POSITION('#39'CREMACAO'#39' IN UPPER(a.deTama' +
        'nho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'CREMACAO'#39', '#39'Crem.'#39 +
        ')'
      
        '                      WHEN POSITION('#39'SEMI GORDO'#39' IN UPPER(a.deTa' +
        'manho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'SEMI GORDO'#39', '#39'Semi' +
        ' G'#39')'
      
        '                      WHEN POSITION('#39'SUPER GORDO'#39' IN UPPER(a.deT' +
        'amanho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'SUPER GORDO'#39', '#39'Sup' +
        '. G'#39')'
      
        '                      WHEN POSITION('#39'EXTRA GORDO'#39' IN UPPER(a.deT' +
        'amanho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'EXTRA GORDO'#39', '#39'EG'#39 +
        ')'
      
        '                      WHEN POSITION('#39'GORDO'#39' IN UPPER(a.deTamanho' +
        ')) > 0 THEN'
      '                        REPLACE(a.deTamanho, '#39'GORDO'#39', '#39'G'#39')'
      '                      ELSE'
      '                        a.deTamanho'
      '                    END AS CHARACTER VARYING(250)'
      '                   ) AS deTamanho, */'
      '               CAST('
      '                    REPLACE('
      '                            REPLACE('
      '                                    REPLACE('
      '                                            REPLACE('
      '                                                    REPLACE('
      
        '                                                            REPL' +
        'ACE(a.deTamanho, '#39'CREMACAO'#39', '#39'Crem.'#39'),'
      
        '                                                            '#39'SEM' +
        'I GORDO'#39', '#39'Semi G'#39
      '                                                           ),'
      
        '                                                    '#39'SUPER GORDO' +
        #39', '#39'Super G'#39
      '                                                   ),'
      '                                            '#39'EXTRA GORDO'#39', '#39'EG'#39
      '                                           ),'
      '                                    '#39'GORDO'#39', '#39'G'#39
      '                                   ), '#39'Sem Tamanho'#39', '#39'Sem Tam.'#39
      '                           ) AS CHARACTER VARYING(250)'
      '                   ) AS deTamanho,'
      
        '               CAST(a.cdTamanho || '#39'-'#39' || a.deTamanho AS CHARACT' +
        'ER VARYING(100)) AS deGrupoTam,'
      #9'       COUNT(a.cdIdQtde) AS qtdEst'
      #9'  FROM erp.intIndBaixaProducao a'
      #9' INNER JOIN ('
      #9#9'     SELECT s.cdSetor As cdSet,'
      #9#9#9'    s.deSetor'
      #9#9'       FROM erp.setor s '
      #9#9'    ) t01 ON (t01.cdSet = a.cdSetor)'
      #9' WHERE a.flEmEstoque = '#39'S'#39
      '          &filtro'
      #9' GROUP BY a.cdItem,'
      '                  a.deItem,'
      #9#9'  a.cdSetor,'
      #9#9'  a.cdTamanho,'
      #9#9'  a.deTamanho,'
      #9#9'  t01.deSetor'
      #9' ORDER BY a.cdItem,'
      #9#9'  a.cdSetor'
      '       ) t ')
    Left = 887
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyClassifFiscal: TFDQuery
    BeforePost = qyClassifFiscalBeforePost
    AfterScroll = qyClassifFiscalAfterScroll
    OnNewRecord = qyClassifFiscalNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.classifFiscal a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdClassifFiscal DESC')
    Left = 555
    Top = 487
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyClasFisTaxaIbpt: TFDQuery
    BeforeOpen = qyClasFisTaxaIbptBeforeOpen
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.clasFisTaxaIbpt a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' WHERE a.cdClassifFiscal = :cdClassifFiscal'
      ' &filtro'
      ' ORDER BY a.sgEstado')
    Left = 639
    Top = 487
    ParamData = <
      item
        Name = 'CDCLASSIFFISCAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyUnidadeMedida: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.unidadeMedida a'
      ' &filtro'
      ' ORDER BY a.cdUnidadeMedida')
    Left = 34
    Top = 389
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemGrupo: TFDQuery
    BeforePost = qyItemGrupoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.itemGrupo a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdItemGrupo DESC')
    Left = 114
    Top = 389
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemSubGrupo: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.itemSubGrupo a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdItemGrupo, a.cdItemSubGrupo')
    Left = 191
    Top = 389
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemFamilia: TFDQuery
    BeforePost = qyItemFamiliaBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.itemFamilia a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdItemFamilia DESC')
    Left = 268
    Top = 389
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItem: TFDQuery
    OnNewRecord = qyItemNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.item a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdItem DESC')
    Left = 325
    Top = 389
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVariavel: TFDQuery
    BeforePost = qyVariavelBeforePost
    AfterScroll = qyVariavelAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.variavel a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdVariavel DESC')
    Left = 18
    Top = 200
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVariavelItens: TFDQuery
    BeforeOpen = qyVariavelItensBeforeOpen
    BeforePost = qyVariavelItensBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.variavelItens a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' WHERE a.cdVariavel = :cdVariavel'
      ' &filtro'
      ' ORDER BY a.cdVariavelItem')
    Left = 90
    Top = 200
    ParamData = <
      item
        Name = 'CDVARIAVEL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemVinculoVariavel: TFDQuery
    AfterOpen = qyItemVinculoVariavelAfterOpen
    BeforePost = qyItemVinculoVariavelBeforePost
    AfterPost = qyItemVinculoVariavelAfterPost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       t01.deItem,'
      '       t02.deVariavel,'
      '       t03.deVariavelItemPadrao,'
      '       t04.nmUsuCad'
      '  FROM erp.itemVinculoVariavel a'
      ' INNER JOIN ('
      '             SELECT b.cdItem AS codItem,'
      '                    b.deItem'
      '               FROM erp.item b'
      '            ) t01 ON (t01.codItem = a.cdItem) '
      ' INNER JOIN ('
      '             SELECT c.cdVariavel AS cdVar,'
      '                    c.deVariavel'
      '               FROM erp.variavel c'
      '            ) t02 ON (t02.cdVar = a.cdVariavel)'
      '  LEFT JOIN ('
      '             SELECT d.cdVariavel AS cdVarI,'
      '                    d.cdVariavelItem,'
      '                    d.deValor AS deVariavelItemPadrao'
      '               FROM erp.variavelItens d  '
      
        '            ) t03 ON (t03.cdVarI = a.cdVariavel AND t03.cdVariav' +
        'elItem = a.cdVariavelItemPadrao)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t04 ON (t04.cdUsuCad = a.cdUsuarioCadastro)'
      ' &filtro'
      ' ORDER BY a.cdItem, a.cdVariavel')
    Left = 186
    Top = 200
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyItemVinculoVariavelcditem: TWideStringField
      FieldName = 'cditem'
      Origin = 'cditem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object qyItemVinculoVariavelcdvariavel: TIntegerField
      FieldName = 'cdvariavel'
      Origin = 'cdvariavel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnValidate = qyItemVinculoVariavelcdvariavelValidate
    end
    object qyItemVinculoVariavelcdvariavelitempadrao: TIntegerField
      FieldName = 'cdvariavelitempadrao'
      Origin = 'cdvariavelitempadrao'
      OnValidate = qyItemVinculoVariavelcdvariavelitempadraoValidate
    end
    object qyItemVinculoVariaveldtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyItemVinculoVariavelhrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyItemVinculoVariavelcdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyItemVinculoVariaveldehrcadastro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrcadastro'
      Origin = 'dehrcadastro'
      ReadOnly = True
      Size = 5
    end
    object qyItemVinculoVariaveldeitem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'deitem'
      Origin = 'deitem'
      Size = 250
    end
    object qyItemVinculoVariaveldevariavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'devariavel'
      Origin = 'devariavel'
      Size = 250
    end
    object qyItemVinculoVariaveldevariavelitempadrao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'devariavelitempadrao'
      Origin = 'devariavelitempadrao'
      Size = 500
    end
    object qyItemVinculoVariavelnmusucad: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusucad'
      Origin = 'nmusucad'
      Size = 250
    end
  end
  object qyItemVarItensLib: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.cdVariavel,'
      '       a.cdVariavelItem,'
      '       a.deValor'
      '  FROM erp.variavelItens a'
      ' WHERE a.cdVariavel = :cdVariavel'
      '   AND NOT EXISTS ('
      '                   SELECT b.cdItem'
      '                     FROM erp.itemVariavelItensBloq b'
      '                    WHERE b.cdItem = :cdItem'
      '                      AND b.cdVariavel = a.cdVariavel'
      '                      AND b.cdVariavelItem = a.cdVariavelItem'
      '                  )')
    Left = 410
    Top = 200
    ParamData = <
      item
        Name = 'CDVARIAVEL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDITEM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qyItemVarItensLibcdvariavel: TIntegerField
      FieldName = 'cdvariavel'
      Origin = 'cdvariavel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemVarItensLibcdvariavelitem: TIntegerField
      FieldName = 'cdvariavelitem'
      Origin = 'cdvariavelitem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemVarItensLibdevalor: TWideStringField
      FieldName = 'devalor'
      Origin = 'devalor'
      Size = 500
    end
  end
  object qyItemVariavelItensBloq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       t01.deValor'
      '  FROM erp.itemVariavelItensBloq a'
      ' INNER JOIN ('
      '             SELECT b.cdVariavel     AS cdVar,'
      '                    b.cdVariavelItem AS cdVarItem,'
      '                    b.deValor '
      '               FROM erp.variavelItens b'
      
        '            ) t01 ON (t01.cdVar = a.cdVariavel AND t01.cdVarItem' +
        ' = a.cdVariavelItem)'
      ' &filtro')
    Left = 306
    Top = 200
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
    object qyItemVariavelItensBloqcditem: TWideStringField
      FieldName = 'cditem'
      Origin = 'cditem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object qyItemVariavelItensBloqcdvariavel: TIntegerField
      FieldName = 'cdvariavel'
      Origin = 'cdvariavel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemVariavelItensBloqcdvariavelitem: TIntegerField
      FieldName = 'cdvariavelitem'
      Origin = 'cdvariavelitem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemVariavelItensBloqdtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyItemVariavelItensBloqhrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyItemVariavelItensBloqcdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyItemVariavelItensBloqdevalor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'devalor'
      Origin = 'devalor'
      Size = 500
    end
  end
  object qyUsuarioMensagem: TFDQuery
    BeforePost = qyUsuarioMensagemBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.usuarioMensagem a'
      ' &filtro'
      ' ORDER BY a.cdUsuario DESC')
    Left = 470
    Top = 57
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColaborador: TFDQuery
    BeforePost = qyColaboradorBeforePost
    AfterPost = qyColaboradorAfterPost
    AfterScroll = qyColaboradorAfterScroll
    OnNewRecord = qyColaboradorNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt'
      '  FROM erp.colaborador a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' &filtro'
      ' ORDER BY a.cdColaborador DESC')
    Left = 187
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabSituacaoHst: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.colabSituacaoHst a'
      ' &filtro'
      ' ORDER BY a.cdColaborador, a.dtSituacao')
    Left = 385
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCargo: TFDQuery
    BeforePost = qyCargoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.cargo a'
      ' &filtro'
      ' ORDER BY a.cdCargo DESC')
    Left = 12
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabPonto: TFDQuery
    BeforePost = qyColabPontoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.colabPonto a'
      ' &filtro'
      ' ORDER BY a.cdColaborador, a.dtPonto, a.hrPonto')
    Left = 560
    Top = 57
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabPontoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT e.deRazaoSocial AS nmEmpresa,'
      '               CAST(REGEXP_REPLACE(e.deCnpj, '
      
        '                                   '#39'(\d{2})(\d{3})(\d{3})(\d{4})' +
        '(\d{2})'#39', '#39'\1.\2.\3/\4-\5'#39
      '                                  ) AS CHARACTER VARYING(30)'
      '                   ) AS deCnpj,'
      '               e.nuInscEst,'
      '               a.cdColaborador,'
      '               b.nmColaborador,'
      '               b.cdCodigoFolha,'
      '               b.nuPis,'
      '               b.nuCtps,'
      '               b.deCtpsSerie,'
      '               b.dtAdmissao,'
      '               c.deCargo,'
      '               s.deSetor,               '
      '               a.dtPonto,'
      '               CAST('
      '                    CASE '
      
        '                      WHEN TO_CHAR(a.hrPonto, '#39'hh24:mi'#39') BETWEEN' +
        ' '#39'07:10'#39' AND '#39'11:40'#39' THEN '
      '                        '#39'1-Matutino'#39
      
        '                      WHEN TO_CHAR(a.hrPonto, '#39'hh24:mi'#39') BETWEEN' +
        ' '#39'13:10'#39' AND '#39'18:10'#39' THEN '
      '                        '#39'2-Vespertino'#39
      '        '#9'      ELSE '
      '        '#9'        '#39'3-Extra'#39
      '        '#9'    END AS CHARACTER VARYING(20)'
      '        '#9'   ) AS dePeriodo,'
      '               a.hrPonto,'
      
        '               CAST(TO_CHAR(a.hrPonto, '#39'hh24:mi'#39') AS CHARACTER V' +
        'ARYING(5)) AS deHoraPonto,'
      '               a.flEntSai,'
      '               a.deObservacoes,'
      '               a.dtCadastro,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.hrCadastro > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00' +
        #39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39 +
        '))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrCadastro,'
      '               uc.nmUsuario AS nmUsuCad,'
      '               a.dtAlteracao,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.hrAlteracao > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'0' +
        '0'#39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00' +
        #39'))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrAlteracao,       '
      '               ua.nmUsuario AS nmUsuAlt'
      '          FROM erp.colabPonto a'
      
        '          LEFT JOIN erp.colaborador b  ON (b.cdColaborador = a.c' +
        'dColaborador)'
      
        '          LEFT JOIN erp.empresa     e  ON (e.cdEmpresa = b.cdEmp' +
        'resa)'
      
        '          LEFT JOIN erp.cargo       c  ON (c.cdCargo = b.cdCargo' +
        ')'
      
        '          LEFT JOIN erp.setor       s  ON (s.cdSetor = b.cdSetor' +
        ')'
      
        '          LEFT JOIN erp.usuario     uc ON (uc.cdUsuario = a.cdUs' +
        'uarioCadastro)'
      
        '          LEFT JOIN erp.usuario     ua ON (ua.cdUsuario = a.cdUs' +
        'uarioAlteracao)'
      '         ORDER BY a.cdColaborador, a.dtPonto, a.hrPonto'
      '       ) t'
      ' &filtro')
    Left = 640
    Top = 57
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntIndItemRelacionado: TFDQuery
    BeforePost = qyIntIndItemRelacionadoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.intIndItemRelacionado a'
      ' &filtro'
      ' ORDER BY a.cdItemRelacionado DESC')
    Left = 38
    Top = 578
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntIndItemRelacionadoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.intIndItemRelacionado a'
      ' &filtro'
      ' ORDER BY a.cdItemBase, a.cdTamanhoBase, a.cdItem')
    Left = 174
    Top = 578
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyProducaoDiariaRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      #9'SELECT a.dtBaixa,'
      '               a.cdItem,'
      '               a.deItem,'
      
        '               CAST(a.cdSetor || '#39'-'#39' || t01.deSetor AS CHARACTER' +
        ' VARYING(100)) AS deGrupoSet, '
      #9'       a.cdSetor,'
      #9'       t01.deSetor,'
      '               a.cdTamanho,'
      '/*'
      '               CAST('
      '                    CASE'
      
        '                      WHEN POSITION('#39'CREMACAO'#39' IN UPPER(a.deTama' +
        'nho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'CREMACAO'#39', '#39'Crem.'#39 +
        ')'
      
        '                      WHEN POSITION('#39'SEMI GORDO'#39' IN UPPER(a.deTa' +
        'manho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'SEMI GORDO'#39', '#39'Semi' +
        ' G'#39')'
      
        '                      WHEN POSITION('#39'SUPER GORDO'#39' IN UPPER(a.deT' +
        'amanho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'SUPER GORDO'#39', '#39'Sup' +
        '. G'#39')'
      
        '                      WHEN POSITION('#39'EXTRA GORDO'#39' IN UPPER(a.deT' +
        'amanho)) > 0 THEN'
      
        '                        REPLACE(a.deTamanho, '#39'EXTRA GORDO'#39', '#39'EG'#39 +
        ')'
      
        '                      WHEN POSITION('#39'GORDO'#39' IN UPPER(a.deTamanho' +
        ')) > 0 THEN'
      '                        REPLACE(a.deTamanho, '#39'GORDO'#39', '#39'G'#39')'
      '                      ELSE'
      '                        a.deTamanho'
      '                    END AS CHARACTER VARYING(250)'
      '                   ) AS deTamanho,'
      '*/'
      '               CAST('
      '                    REPLACE('
      '                            REPLACE('
      '                                    REPLACE('
      '                                            REPLACE('
      '                                                    REPLACE('
      
        '                                                            REPL' +
        'ACE(a.deTamanho, '#39'CREMACAO'#39', '#39'Crem.'#39'),'
      
        '                                                            '#39'SEM' +
        'I GORDO'#39', '#39'Semi G'#39
      '                                                           ),'
      
        '                                                    '#39'SUPER GORDO' +
        #39', '#39'Super G'#39
      '                                                   ),'
      '                                            '#39'EXTRA GORDO'#39', '#39'EG'#39
      '                                           ),'
      '                                    '#39'GORDO'#39', '#39'G'#39
      '                                   ), '#39'Sem Tamanho'#39', '#39'Sem Tam.'#39
      '                           ) AS CHARACTER VARYING(250)'
      '                   ) AS deTamanho,'
      
        '               CAST(a.cdTamanho || '#39'-'#39' || a.deTamanho AS CHARACT' +
        'ER VARYING(100)) AS deGrupoTam,'
      #9'       COUNT(a.cdIdQtde) AS qtdEst'
      #9'  FROM erp.intIndBaixaProducao a'
      #9' INNER JOIN ('
      #9#9'     SELECT s.cdSetor As cdSet,'
      #9#9#9'    s.deSetor'
      #9#9'       FROM erp.setor s '
      #9#9'    ) t01 ON (t01.cdSet = a.cdSetor)'
      '          &filtro'
      #9' GROUP BY a.dtBaixa,'
      '                  a.cdItem,'
      '                  a.deItem,'
      #9#9'  a.cdSetor,'
      #9#9'  a.cdTamanho,'
      #9#9'  a.deTamanho,'
      #9#9'  t01.deSetor'
      #9' ORDER BY a.dtBaixa,'
      '                  a.cdItem,'
      #9#9'  a.cdSetor'
      '       ) t ')
    Left = 999
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyExtratoViagem: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT x.*,'
      '       CAST('
      '            CASE'
      '              WHEN x.nuQtdKmPerc > 0 THEN'
      '                x.vlDespesaTot / x.nuQtdKmPerc'
      '              ELSE'
      '                0'
      '            END AS NUMERIC(15, 2)'
      '           ) AS vlCustoPorKm,'
      '       CAST('
      '            CASE'
      '              WHEN x.nuQtdeItens > 0 THEN'
      '                x.vlDespesaTot / x.nuQtdeItens'
      '              ELSE'
      '                0'
      '            END AS NUMERIC(15, 2)'
      '           ) AS vlCustoPorItens'
      '  FROM ('
      '        SELECT t.*,'
      '               CAST((COALESCE(t.vlDespesa, 0) + '
      
        '                    COALESCE(t.vlDespCombust, 0)) AS NUMERIC(15,' +
        ' 2)'
      '                   ) AS vlDespesaTot,'
      '               CAST('
      '                    CASE'
      '                      WHEN t.nuLitrosCombustivel > 0 THEN'
      '                        t.nuQtdKmPerc / t.nuLitrosCombustivel'
      '                      ELSE'
      '                        0'
      '                    END AS NUMERIC(15, 2)'
      '                   ) AS vlKmPorLitro'
      '          FROM ('
      '                SELECT b.cdBordero,'
      '                       b.cdMotorista,'
      '                       m.nmMotorista,'
      '                       b.nmAjudante,'
      '                       b.deRegiao,'
      '                       b.cdVeiculo,'
      
        '                       CAST(b.cdVeiculo || '#39'-'#39' || b.cdMotorista ' +
        'AS CHARACTER VARYING(15)) AS cdGrupoVeicMotor,'
      
        '                       REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})' +
        #39', '#39'\1-\2'#39') AS dePlaca,'
      '                       CAST('
      
        '                            REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\' +
        'd{4})'#39', '#39'\1-\2'#39') || '#39' - '#39' ||'
      '                            CASE'
      '                              WHEN v.cdVeiculoTipo = 1 THEN'
      '                                '#39'Carro'#39' '
      '                              WHEN v.cdVeiculoTipo = 2 THEN'
      '                                '#39'Caminh'#227'o'#39
      '                              WHEN v.cdVeiculoTipo = 3 THEN'
      '                                '#39'Caminhonete'#39
      '                              WHEN v.cdVeiculoTipo = 4 THEN'
      '                                '#39'Carreta'#39
      '                              WHEN v.cdVeiculoTipo = 5 THEN'
      '                                '#39'Moto'#39' '
      '                            END AS CHARACTER VARYING(30)'
      '                           ) AS deVeiculo,'
      '                       b.dtSaida,'
      '                       b.dtRetorno,'
      
        '                       (b.dtRetorno - b.dtSaida) + 1 AS nuQtdDia' +
        's,'
      '                       b.nuKmInicial,'
      '                       b.nuKmFinal,'
      
        '                       (b.nuKmFinal - b.nuKmInicial) AS nuQtdKmP' +
        'erc,'
      
        '                       COALESCE(b.nuQtdeItens, 0) AS nuQtdeItens' +
        ','
      
        '                       COALESCE(b.nuLitrosCombustivel, 0) AS nuL' +
        'itrosCombustivel,'
      '                       CAST('
      '                            COALESCE('
      '                                     ('
      '                                      SELECT SUM(d.vlDocumento)'
      '                                        FROM erp.documento d'
      
        '                                       WHERE d.cdBordero = b.cdB' +
        'ordero'
      
        '                                         AND d.cdDespesaTipo <> ' +
        '1 --Combust'#237'vel'
      '                                     ),'
      '                                     0'
      '                                    ) AS NUMERIC(15, 2)'
      '                            ) AS vlDespesa,'
      '                       CAST('
      '                            COALESCE('
      '                                     ('
      '                                      SELECT SUM(d.vlDocumento)'
      '                                        FROM erp.documento d'
      
        '                                       WHERE d.cdBordero = b.cdB' +
        'ordero'
      
        '                                         AND d.cdDespesaTipo = 1' +
        ' --Combust'#237'vel'
      '                                     ),'
      '                                     0'
      '                                    ) AS NUMERIC(15, 2)'
      '                           ) AS vlDespCombust'
      '                  FROM erp.bordero b'
      
        '                  LEFT JOIN erp.motorista m ON (m.cdMotorista = ' +
        'b.cdMotorista)'
      
        '                  LEFT JOIN erp.veiculo   v ON (v.cdVeiculo = b.' +
        'cdVeiculo)'
      '               ) t'
      '         &filtro'
      '       ) x'
      ' ORDER BY x.cdVeiculo, x.dtSaida')
    Left = 754
    Top = 249
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntIndMaterialMovEnt: TFDQuery
    BeforePost = qyIntIndMaterialMovEntBeforePost
    OnNewRecord = qyIntIndMaterialMovEntNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrSituacaoMov > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrSituacaoMov/60), '#39'00'#39')) |' +
        '| '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrSituacaoMov, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrSituacaoMov,'
      '       t01.nmFornecedor,'
      '       t02.cdSolicitante,'
      '       t02.nmSolicitante,'
      '       t03.nmUsuCad,'
      '       t04.nmUsuAlt,'
      '       t05.nmUsuSit       '
      '  FROM erp.intIndMaterialMovimento a'
      '  LEFT JOIN ('
      '             SELECT f.cdFornecedor AS cdFornec,'
      '                    f.nmFantasia AS nmFornecedor'
      '               FROM erp.fornecedor f'
      '            ) t01 ON (t01.cdFornec = a.cdFornecedor)'
      '  LEFT JOIN ('
      '             SELECT ms.cdMaterialSolicitacao AS cdMaterialSolic,'
      '                    ms.cdSolicitante,'
      '                    c.nmColaborador AS nmSolicitante'
      '               FROM erp.intIndMaterialSolicitacao ms'
      
        '              INNER JOIN erp.colaborador c ON (c.cdColaborador =' +
        ' ms.cdSolicitante)'
      
        '            ) t02 ON (t02.cdMaterialSolic = a.cdMaterialSolicita' +
        'cao)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t03 ON (t03.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t04 ON (t04.cdUsuAlt = a.cdUsuarioAlteracao)'
      '  LEFT JOIN ('
      '             SELECT u.cdUsuario AS cdUsuSit,'
      '                    u.nmUsuario AS nmUsuSit'
      '               FROM erp.usuario u '
      '            ) t05 ON (t05.cdUsuSit = a.cdUsuarioSituacaoMov)'
      ' WHERE a.flTipoMovimento = '#39'E'#39' '
      '&filtro'
      ' ORDER BY a.cdMaterialMovimento DESC')
    Left = 304
    Top = 578
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyMaterialMovSit: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.cdSituacaoMovimento,'
      '       t.deSituacaoMovimento'
      '  FROM ('
      
        '        SELECT CAST(1 AS INTEGER) AS cdSituacaoMovimento, CAST('#39 +
        'Cadastrado'#39' AS CHARACTER VARYING(20)) AS deSituacaoMovimento'
      '        UNION ALL'
      
        '        SELECT CAST(2 AS INTEGER) AS cdSituacaoMovimento, CAST('#39 +
        'Aprovado'#39' AS CHARACTER VARYING(20)) AS deSituacaoMovimento'
      '        UNION ALL'
      
        '        SELECT CAST(3 AS INTEGER) AS cdSituacaoMovimento, CAST('#39 +
        'Rejeitado'#39' AS CHARACTER VARYING(20)) AS deSituacaoMovimento'
      '       ) t'
      ' ORDER BY t.cdSituacaoMovimento')
    Left = 412
    Top = 577
  end
  object qyIntIndMaterialSolic: TFDQuery
    BeforePost = qyIntIndMaterialSolicBeforePost
    AfterScroll = qyIntIndMaterialSolicAfterScroll
    OnNewRecord = qyIntIndMaterialSolicNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmSolicitante,'
      '       t02.nmUsuCad,'
      '       t03.nmUsuAlt       '
      '  FROM erp.intIndMaterialSolicitacao a'
      '  LEFT JOIN ('
      '             SELECT c.cdColaborador,'
      '                    c.nmColaborador AS nmSolicitante'
      '               FROM erp.colaborador c'
      '            ) t01 ON (t01.cdColaborador = a.cdSolicitante)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t02 ON (t02.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t03 ON (t03.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' &filtro'
      ' ORDER BY a.cdMaterialSolicitacao DESC')
    Left = 508
    Top = 577
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntIndMaterialMovSai: TFDQuery
    BeforeOpen = qyIntIndMaterialMovSaiBeforeOpen
    BeforePost = qyIntIndMaterialMovSaiBeforePost
    OnNewRecord = qyIntIndMaterialMovSaiNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrSituacaoMov > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrSituacaoMov/60), '#39'00'#39')) |' +
        '| '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrSituacaoMov, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrSituacaoMov,'
      '       t01.nmFornecedor,'
      '       t02.cdSolicitante,'
      '       t02.nmSolicitante,'
      '       t03.nmUsuCad,'
      '       t04.nmUsuAlt,'
      '       t05.nmUsuSit       '
      '  FROM erp.intIndMaterialMovimento a'
      '  LEFT JOIN ('
      '             SELECT f.cdFornecedor AS cdFornec,'
      '                    f.nmFantasia AS nmFornecedor'
      '               FROM erp.fornecedor f'
      '            ) t01 ON (t01.cdFornec = a.cdFornecedor)'
      '  LEFT JOIN ('
      '             SELECT ms.cdMaterialSolicitacao AS cdMaterialSolic,'
      '                    ms.cdSolicitante,'
      '                    c.nmColaborador AS nmSolicitante'
      '               FROM erp.intIndMaterialSolicitacao ms'
      
        '              INNER JOIN erp.colaborador c ON (c.cdColaborador =' +
        ' ms.cdSolicitante)'
      
        '            ) t02 ON (t02.cdMaterialSolic = a.cdMaterialSolicita' +
        'cao)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t03 ON (t03.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t04 ON (t04.cdUsuAlt = a.cdUsuarioAlteracao)'
      '  LEFT JOIN ('
      '             SELECT u.cdUsuario AS cdUsuSit,'
      '                    u.nmUsuario AS nmUsuSit'
      '               FROM erp.usuario u '
      '            ) t05 ON (t05.cdUsuSit = a.cdUsuarioSituacaoMov)'
      ' WHERE a.flTipoMovimento = '#39'S'#39' '
      '   AND a.cdMaterialSolicitacao = :cdMaterialSolicitacao'
      '&filtro'
      ' ORDER BY a.cdMaterialMovimento DESC')
    Left = 624
    Top = 577
    ParamData = <
      item
        Name = 'CDMATERIALSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntIndMatEstoqueConsulta: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.cdMaterial,'
      '       SUM(t.nuQtdeEst) AS nuQtdeEst'
      '  FROM ('
      '        SELECT a.cdMaterial,'
      '               SUM(a.nuQtde) AS nuQtdeEst'
      '          FROM erp.intIndMaterialMovimento a'
      '         WHERE a.flTipoMovimento = '#39'E'#39
      '           AND a.cdSituacaoMovimento = 2'
      '           AND ('
      '                (a.cdMaterialMovimento <> :cdMatMovEnt) OR'
      '                (0 = :cdMatMovEnt)'
      '               )'
      '         GROUP BY a.cdMaterial'
      '         UNION ALL'
      '        SELECT a.cdMaterial,'
      '               SUM(a.nuQtde) * -1 AS nuQtdeEst'
      '          FROM erp.intIndMaterialMovimento a'
      '         WHERE a.flTipoMovimento = '#39'S'#39
      '         GROUP BY a.cdMaterial'
      '       ) t'
      ' &filtro'
      ' GROUP BY t.cdMaterial'
      'HAVING SUM(t.nuQtdeEst) > 0'
      ' ORDER BY t.cdMaterial')
    Left = 756
    Top = 577
    ParamData = <
      item
        Name = 'CDMATMOVENT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntIndMaterialMovConsulta: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*,'
      '       CASE'
      
        '         WHEN (t.flTipoMovimento = '#39'S'#39') AND (t.flTipoSolicitacao' +
        ' = '#39'I'#39') THEN'
      '           t.nuQtde * t.vlUnitES'
      '         ELSE'
      '           0'
      '       END AS vlCusto'
      '  FROM ('
      '        SELECT a.*,'
      '               CASE'
      '                 WHEN a.flTipoMovimento = '#39'S'#39' THEN'
      '                   ('
      '                    SELECT b.vlUnitario'
      '                      FROM erp.intIndMaterialMovimento b'
      '                     WHERE b.cdMaterialMovimento = ('
      
        '                                                    SELECT MIN(c' +
        '.cdMaterialMovimento)'
      
        '                                                      FROM erp.i' +
        'ntIndMaterialMovimento c'
      
        '                                                     WHERE c.cdM' +
        'aterial = a.cdMaterial'
      
        '                                                       AND c.flT' +
        'ipoMovimento = '#39'E'#39
      
        '                                                       AND c.cdS' +
        'ituacaoMovimento = 2'
      '                                                   )'
      '                   )'
      '                 ELSE'
      '                   a.vlUnitario'
      '               END AS vlUnitES,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.cdSituacaoMovimento = 1 THEN'
      '                        '#39'Cadastrado'#39
      '                      WHEN a.cdSituacaoMovimento = 2 THEN'
      '                        '#39'Aprovado'#39
      '                      WHEN a.cdSituacaoMovimento = 3 THEN'
      '                        '#39'Rejeitado'#39
      '                      ELSE'
      '                        '#39'Inv'#225'lido'#39
      '                    END AS CHARACTER VARYING(20)'
      '                   ) AS deSituacaoMovimento,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.hrCadastro > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00' +
        #39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39 +
        '))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrCadastro,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.hrAlteracao > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'0' +
        '0'#39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00' +
        #39'))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrAlteracao,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.hrMovimento > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(a.hrMovimento/60), '#39'0' +
        '0'#39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(a.hrMovimento, 60), '#39'00' +
        #39'))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrMovimento,'
      '               CAST('
      '                    CASE'
      '                      WHEN a.hrSituacaoMov > 0 THEN'
      
        '                        TRIM(TO_CHAR(TRUNC(a.hrSituacaoMov/60), ' +
        #39'00'#39')) || '#39':'#39' ||'
      
        '                        TRIM(TO_CHAR(MOD(a.hrSituacaoMov, 60), '#39 +
        '00'#39'))'
      '                    END AS CHARACTER VARYING(5)'
      '                   ) AS dehrSituacaoMov,'
      '               CASE '
      '                 WHEN a.flTipoMovimento = '#39'S'#39' THEN'
      '                   a.nuQtde * -1'
      '                 ELSE'
      '                   a.nuQtde'
      '               END AS nuQtdeMov,'
      '               t01.nmFornecedor,'
      '               t02.cdSolicitante,'
      '               t02.nmSolicitante,'
      '               t02.flTipoSolicitacao, '
      '               t02.deTipoSolicitacao,'
      '               t02.dtCadSolicitacao,'
      '               t03.nmUsuCad,'
      '               t04.nmUsuAlt,'
      '               t05.nmUsuSit       '
      '          FROM erp.intIndMaterialMovimento a'
      '          LEFT JOIN ('
      '                     SELECT f.cdFornecedor AS cdFornec,'
      '                            f.nmFantasia AS nmFornecedor'
      '                       FROM erp.fornecedor f'
      '                    ) t01 ON (t01.cdFornec = a.cdFornecedor)'
      '          LEFT JOIN ('
      
        '                     SELECT ms.cdMaterialSolicitacao AS cdMateri' +
        'alSolic,'
      '                            ms.flTipoSolicitacao,'
      '                            CAST('
      '                                 CASE'
      
        '                                   WHEN ms.flTipoSolicitacao = '#39 +
        'E'#39' THEN'
      '                                     '#39'Externa'#39
      '                                   ELSE'
      '                                     '#39'Interna'#39
      '                                 END AS CHARACTER VARYING(10)'
      '                                ) AS deTipoSolicitacao,'
      '                            ms.cdSolicitante,'
      '                            ms.nmSolicitante,'
      '                            ms.dtCadastro AS dtCadSolicitacao'
      '                       FROM erp.intIndMaterialSolicitacao ms'
      
        '                    ) t02 ON (t02.cdMaterialSolic = a.cdMaterial' +
        'Solicitacao)'
      '          LEFT JOIN ('
      '                     SELECT uc.cdUsuario AS cdUsuCad,'
      '                            uc.nmUsuario AS nmUsuCad'
      '                       FROM erp.usuario uc '
      
        '                    ) t03 ON (t03.cdUsuCad = a.cdUsuarioCadastro' +
        ')'
      '          LEFT JOIN ('
      '                     SELECT ua.cdUsuario AS cdUsuAlt,'
      '                            ua.nmUsuario AS nmUsuAlt'
      '                       FROM erp.usuario ua '
      
        '                    ) t04 ON (t04.cdUsuAlt = a.cdUsuarioAlteraca' +
        'o)'
      '          LEFT JOIN ('
      '                     SELECT u.cdUsuario AS cdUsuSit,'
      '                            u.nmUsuario AS nmUsuSit'
      '                       FROM erp.usuario u '
      
        '                    ) t05 ON (t05.cdUsuSit = a.cdUsuarioSituacao' +
        'Mov)'
      '       ) t'
      ' &filtro')
    Left = 899
    Top = 577
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyTransportadora: TFDQuery
    BeforePost = qyTransportadoraBeforePost
    AfterScroll = qyTransportadoraAfterScroll
    OnNewRecord = qyTransportadoraNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.transportadora a'
      ' &filtro'
      ' ORDER BY a.cdTransportadora DESC')
    Left = 476
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyBanco: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT b.*'
      '  FROM erp.banco b'
      ' &filtro'
      ' ORDER BY cdBanco')
    Left = 572
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyAgencia: TFDQuery
    BeforePost = qyAgenciaBeforePost
    AfterScroll = qyAgenciaAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.agencia a'
      ' &filtro'
      ' ORDER BY a.cdBanco, a.cdAgencia')
    Left = 621
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyConta: TFDQuery
    BeforePost = qyContaBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.conta a'
      ' &filtro'
      ' ORDER BY a.cdAgencia, a.cdConta')
    Left = 670
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCobrancaTipo: TFDQuery
    BeforePost = qyCobrancaTipoBeforePost
    OnNewRecord = qyCobrancaTipoNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT ct.*,'
      '       CAST('
      '            CASE'
      '              WHEN ct.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(ct.hrCadastro/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(ct.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN ct.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(ct.hrAlteracao/60), '#39'00'#39')) ||' +
        ' '#39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(ct.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.cobrancaTipo ct'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = ct.cdUsuarioCadast' +
        'ro)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = ct.cdUsuarioAltera' +
        'cao)'
      ' &filtro'
      ' ORDER BY ct.cdCobrancaTipo DESC')
    Left = 742
    Top = 296
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabDependentes: TFDQuery
    BeforePost = qyColabDependentesBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt,'
      '       t03.deGrauParentesco'
      '  FROM erp.colabDependentes a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      '  LEFT JOIN ('
      '             SELECT gp.cdGrauParentesco AS cdGrauParent,'
      '                    gp.deGrauParentesco'
      '               FROM erp.grauParentesco gp '
      '            ) t03 ON (t03.cdGrauParent = a.cdGrauParentesco)'
      ' WHERE a.cdColaborador = :cdColaborador'
      ' &filtro'
      ' ORDER BY a.cdColaborador, cdColabDependentes')
    Left = 280
    Top = 344
    ParamData = <
      item
        Name = 'CDCOLABORADOR'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyColabDependentescdcolaborador: TIntegerField
      FieldName = 'cdcolaborador'
      Origin = 'cdcolaborador'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyColabDependentescdcolabdependentes: TIntegerField
      FieldName = 'cdcolabdependentes'
      Origin = 'cdcolabdependentes'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyColabDependentesnmdependente: TWideStringField
      FieldName = 'nmdependente'
      Origin = 'nmdependente'
      Size = 250
    end
    object qyColabDependentescdgrauparentesco: TIntegerField
      FieldName = 'cdgrauparentesco'
      Origin = 'cdgrauparentesco'
    end
    object qyColabDependentesdtnascimento: TDateField
      FieldName = 'dtnascimento'
      Origin = 'dtnascimento'
    end
    object qyColabDependentesdtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyColabDependenteshrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyColabDependentescdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyColabDependentesdtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyColabDependenteshralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyColabDependentescdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyColabDependentesdehrcadastro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrcadastro'
      Origin = 'dehrcadastro'
      ReadOnly = True
      Size = 5
    end
    object qyColabDependentesdehralteracao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehralteracao'
      Origin = 'dehralteracao'
      ReadOnly = True
      Size = 5
    end
    object qyColabDependentesnmusucad: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusucad'
      Origin = 'nmusucad'
      Size = 250
    end
    object qyColabDependentesnmusualt: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusualt'
      Origin = 'nmusualt'
      Size = 250
    end
    object qyColabDependentesdegrauparentesco: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'degrauparentesco'
      Origin = 'degrauparentesco'
      Size = 250
    end
  end
  object qyEscala: TFDQuery
    BeforePost = qyEscalaBeforePost
    AfterScroll = qyEscalaAfterScroll
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt'
      '  FROM erp.escala a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' &filtro'
      ' ORDER BY a.cdEscala DESC')
    Left = 56
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabSetorHst: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.colabSetorHst a'
      ' &filtro'
      ' ORDER BY a.cdColaborador, a.dtHistorico')
    Left = 476
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabCargoHst: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.colabCargoHst a'
      ' &filtro'
      ' ORDER BY a.cdColaborador, a.dtHistorico')
    Left = 561
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabEscalaHst: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.colabEscalaHst a'
      ' &filtro'
      ' ORDER BY a.cdColaborador, a.dtHistorico')
    Left = 649
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyColabSalarioHst: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.colabSalarioHst a'
      ' &filtro'
      ' ORDER BY a.cdColaborador, a.dtHistorico')
    Left = 744
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyEscalaItem: TFDQuery
    BeforePost = qyEscalaItemBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt'
      '  FROM erp.escalaItem a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' WHERE a.cdEscala = :cdEscala'
      ' &filtro'
      ' ORDER BY a.cdEscala DESC, a.cdEscalaItem')
    Left = 112
    Top = 344
    ParamData = <
      item
        Name = 'CDESCALA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyEscalaItemcdescala: TIntegerField
      FieldName = 'cdescala'
      Origin = 'cdescala'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyEscalaItemcdescalaitem: TIntegerField
      FieldName = 'cdescalaitem'
      Origin = 'cdescalaitem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyEscalaItemdeescalaitem: TWideStringField
      FieldName = 'deescalaitem'
      Origin = 'deescalaitem'
      Size = 250
    end
    object qyEscalaItemdtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyEscalaItemhrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyEscalaItemcdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyEscalaItemdtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyEscalaItemhralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyEscalaItemcdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyEscalaItemdehrcadastro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrcadastro'
      Origin = 'dehrcadastro'
      Size = 5
    end
    object qyEscalaItemdehralteracao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehralteracao'
      Origin = 'dehralteracao'
      Size = 5
    end
    object qyEscalaItemnmusucad: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusucad'
      Origin = 'nmusucad'
      Size = 250
    end
    object qyEscalaItemnmusualt: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusualt'
      Origin = 'nmusualt'
      Size = 250
    end
  end
  object qyColaboradorRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.cdEmpresa,'
      '       t01.nmEmpresa,'
      '       t01.deCnpjEmpMasc,'
      '       t01.deEnderecoEmp,'
      '       t01.nuEnderecoEmp,'
      '       t01.deBairroEmp,'
      '       t01.nmCidadeEmp,'
      '       a.cdCodigoFolha,'
      '       a.cdColaborador,'
      '       a.nmColaborador,'
      '       a.cdColabSituacao,'
      '       t11.deColabSituacao,'
      '       a.dtNascimento,'
      '       a.flSexo,'
      '       a.dtAdmissao,'
      '       a.nmMae,'
      '       a.nmPai,'
      '       a.cdEstadoCivil,'
      '       t02.deEstadoCivil,'
      '       a.nmConjuge,'
      '       a.nuCep,'
      '       a.deEndereco,'
      '       a.nuEndereco,'
      '       a.deComplemento,'
      '       a.deBairro,'
      '       a.cdCidade,'
      '       t03.nmCidade,'
      '       t03.sgEstado,'
      '       a.deCpf,'
      '       CAST(REGEXP_REPLACE(a.deCpf, '
      
        '                           '#39'(\d{3})(\d{3})(\d{3})(\d{2})'#39', '#39'\1.\' +
        '2.\3-\4'#39
      '                          ) AS CHARACTER VARYING(20)'
      '           ) AS deCpfMasc,'
      '       a.nuRg,       '
      '       a.sgRgEstadoEmissor,'
      '       a.deRgOrgaoExp,'
      '       a.dtRgEmissao,'
      '       a.nuCtps,'
      '       a.deCtpsSerie,'
      '       a.nuPis,'
      '       a.sgCtpsEstado,'
      '       a.dtCtpsEmissao,'
      '       a.nuReservista,'
      '       a.nutituloeleitor,'
      '       a.nuTituloEleitorZona,'
      '       a.nuTituloEleitorSecao,'
      '       a.nuCnh,'
      '       a.deCnhCategoria,'
      '       t04.nmCidadeNat,'
      '       t04.sgEstadoNat,'
      '       a.deNacionalidade,'
      '       t05.deCorPele,'
      '       t06.deGrauInstrucao,'
      '       CAST('
      '            CASE'
      '              WHEN a.flEstudante = '#39'S'#39' THEN'
      '                '#39'Sim'#39
      '              ELSE'
      '                '#39'N'#227'o'#39
      '            END AS CHARACTER(3)'
      '           ) AS deEstudante,'
      '       CAST('
      '            CASE'
      '              WHEN LENGTH(a.nuFone) = 11 THEN'
      
        '                TO_CHAR(CAST(a.nuFone AS DOUBLE PRECISION),'#39'FM"(' +
        '"00")"0000"-"00000'#39')'
      '              WHEN LENGTH(a.nuFone) = 10 THEN'
      
        '                TO_CHAR(CAST(a.nuFone AS DOUBLE PRECISION),'#39'FM"(' +
        '"00")"0000"-"0000'#39') '
      '              ELSE'
      '                a.nuFone  '
      '            END AS CHARACTER VARYING(20)'
      '           ) AS deFone,'
      '       CAST('
      '            CASE'
      '              WHEN LENGTH(a.nuCelular) = 11 THEN'
      
        '                TO_CHAR(CAST(a.nuCelular AS DOUBLE PRECISION),'#39'F' +
        'M"("00")"00000"-"0000'#39')'
      '              ELSE'
      '                a.nuCelular  '
      '            END AS CHARACTER VARYING(20)'
      '           ) AS deCelular,'
      '       a.deEmail,'
      '       a.nuConta,'
      '       a.nuContaDigito,'
      '       a.cdAgencia,'
      '       t07.deAgencia,'
      '       t07.nuAgencia,'
      '       t07.nuDigitoAge,'
      '       t07.cdBanco,'
      '       t07.deBanco,'
      '       a.dtExameAdmissao,'
      '       a.nuDiasContratoExp,'
      '       a.nuDiasContratoExpExtra,'
      '       a.cdSetor,'
      '       t08.deSetor,'
      '       a.cdCargo,'
      '       t09.deCargo,'
      '       a.vlSalario,'
      '       a.flUsaValeTransp,'
      '       COALESCE(a.vlValeTransp, 0) AS vlValeTransp,'
      '       a.cdSalarioTipo,'
      '       t10.deSalarioTipo,'
      '       a.nuHorasJornada,'
      '       a.cdEscala,  '
      '       REPLACE('
      '               REPLACE('
      '                       REPLACE('
      '                               REPLACE('
      '                                       CAST('
      '                                            ARRAY('
      
        '                                                  SELECT b.deEsc' +
        'alaItem'
      
        '                                                    FROM erp.esc' +
        'alaItem b'
      
        '                                                   WHERE b.cdEsc' +
        'ala = a.cdEscala'
      '                                                 ) AS TEXT'
      '                                            ), '#39'{'#39', '#39#39
      '                                      ), '#39'}'#39', '#39#39
      '                              ), '#39'","'#39', '#39', '#39
      '                      ), '#39'"'#39', '#39#39
      '              ) AS deEscalaItem,'
      '       CAST('
      '            CASE'
      
        '              WHEN (a.vlPercAdicInsalub IS NULL) OR (a.vlPercAdi' +
        'cInsalub = 0) THEN'
      '                '#39'N'#227'o'#39
      '              ELSE'
      '                '#39'Sim'#39
      '            END AS CHARACTER(3)'
      '           ) AS flPercAdicInsalub,     '
      '       COALESCE(a.vlPercAdicInsalub, 0) AS vlPercAdicInsalub,'
      '       CAST('
      '            CASE'
      
        '              WHEN (a.vlPercAdicPeric IS NULL) OR (a.vlPercAdicP' +
        'eric = 0) THEN'
      '                '#39'N'#227'o'#39
      '              ELSE'
      '                '#39'Sim'#39
      '            END AS CHARACTER(3)'
      '           ) AS flPercAdicPeric, '
      '       COALESCE(a.vlPercAdicPeric, 0) AS vlPercAdicPeric,'
      '       t01.imLogoEmp,'
      '       t01.cdCidadeEmp'
      '  FROM erp.colaborador a'
      '  LEFT JOIN ('
      '             SELECT e.cdEmpresa     AS cdEmp,'
      '                    e.deRazaoSocial AS nmEmpresa,'
      '                    CAST(REGEXP_REPLACE(e.deCnpj, '
      
        '                                        '#39'(\d{2})(\d{3})(\d{3})(\' +
        'd{4})(\d{2})'#39', '#39'\1.\2.\3/\4-\5'#39
      
        '                                       ) AS CHARACTER VARYING(30' +
        ')'
      '                        ) AS deCnpjEmpMasc,'
      '                    e.deEndereco AS deEnderecoEmp,'
      '                    e.nuEndereco AS nuEnderecoEmp,'
      '                    e.deBairro   AS deBairroEmp,'
      
        '                    CAST(INITCAP(c.nmCidade) AS CHARACTER VARYIN' +
        'G(250)) AS nmCidadeEmp,'
      '                    e.imLogo AS imLogoEmp,'
      '                    e.cdCidade AS cdCidadeEmp'
      '               FROM erp.empresa e'
      
        '               LEFT JOIN erp.cidade c ON (c.cdCidade = e.cdCidad' +
        'e)'
      '            ) t01 ON (t01.cdEmp = a.cdEmpresa)'
      '  LEFT JOIN ('
      '             SELECT ec.cdEstadoCivil AS cdEstCivil,'
      '                    ec.deEstadoCivil'
      '               FROM erp.estadoCivil ec'
      '            ) t02 ON (t02.cdEstCivil = a.cdEstadoCivil)'
      '  LEFT JOIN ('
      '             SELECT c.cdCidade AS cdCid,'
      
        '                    CAST(INITCAP(c.nmCidade) AS CHARACTER VARYIN' +
        'G(250)) AS nmCidade,'
      '                    c.sgEstado'
      '               FROM erp.cidade c'
      '            ) t03 ON (t03.cdCid = a.cdCidade)'
      '  LEFT JOIN ('
      '             SELECT c.cdCidade AS cdCidNat,'
      
        '                    CAST(INITCAP(c.nmCidade) AS CHARACTER VARYIN' +
        'G(250)) AS nmCidadeNat,'
      '                    c.sgEstado AS sgEstadoNat'
      '               FROM erp.cidade c'
      '            ) t04 ON (t04.cdCidNat = a.cdCidadeNatural)'
      '  LEFT JOIN ('
      '             SELECT cp.cdCorPele AS cdCorP,'
      '                    cp.deCorPele'
      '               FROM erp.corPele cp'
      '            ) t05 ON (t05.cdCorP = a.cdCorPele)'
      '  LEFT JOIN ('
      '             SELECT gi.cdGrauInstrucao AS cdGrauInst,'
      '                    gi.deGrauInstrucao'
      '               FROM erp.grauInstrucao gi'
      '            ) t06 ON (t06.cdGrauInst = a.cdGrauInstrucao)'
      '  LEFT JOIN ('
      '             SELECT a.cdAgencia AS cdAgen,'
      '                    a.deAgencia,'
      '                    a.nuAgencia,'
      '                    a.nuDigito AS nuDigitoAge,'
      '                    a.cdBanco,'
      '                    b.deBanco'
      '               FROM erp.agencia a'
      '              INNER JOIN erp.banco b ON (b.cdBanco = a.cdBanco)'
      '            ) t07 ON (t07.cdAgen = a.cdAgencia)'
      '  LEFT JOIN ('
      '             SELECT s.cdSetor AS cdSet,'
      '                    s.deSetor'
      '               FROM erp.setor s'
      '            ) t08 ON (t08.cdSet = a.cdSetor)'
      '  LEFT JOIN ('
      '             SELECT c.cdCargo AS cdCar,'
      '                    c.deCargo'
      '               FROM erp.cargo c'
      '            ) t09 ON (t09.cdCar = a.cdCargo)'
      '  LEFT JOIN ('
      '             SELECT s.cdSalarioTipo AS cdSalTipo,'
      '                    s.deSalarioTipo'
      '               FROM erp.salarioTipo s'
      '            ) t10 ON (t10.cdSalTipo = a.cdSalarioTipo)'
      '  LEFT JOIN ('
      '             SELECT cs.cdColabSituacao AS cdColabSit,'
      '                    cs.deColabSituacao'
      '               FROM erp.colabSituacao cs'
      '            ) t11 ON (t11.cdColabSit = a.cdColabSituacao)'
      ' &filtro')
    Left = 834
    Top = 344
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyEmpresaLogo: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      
        'UPDATE erp.empresa SET imLogo = :imLogo WHERE cdEmpresa = :cdEmp' +
        'resa')
    Left = 83
    Top = 435
    ParamData = <
      item
        Name = 'IMLOGO'
        DataType = ftBlob
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qyIntIndBaixaProducao: TFDQuery
    BeforePost = qyIntIndBaixaProducaoBeforePost
    Connection = fdConnERP
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrBaixa > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrBaixa/60), '#39'00'#39')) || '#39':'#39' ' +
        '||'
      '                TRIM(TO_CHAR(MOD(a.hrBaixa, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(10)'
      '           ) AS dehrBaixa,'
      '       t01.deSetor,'
      '       t01.flEhSetorMontagem,'
      '       t01.flEhSetorEmbalagem, '
      '       t01.flEhSetorExpedicao,'
      '       t05.deSetorAnt,'
      '       t05.flEhSetAntMont,'
      '       t02.nmUsuBaixa,'
      '       t03.cdItemBase,'
      '       t03.deItemBase, '
      '       t03.cdTamanhoBase,'
      '       t03.deTamanhoBase,'
      '       t04.nmEmpresa,'
      '       CAST('#39'N'#39' AS CHARACTER(1)) AS flEhRevenda,'
      '       CAST('#39'N'#39' AS CHARACTER(1)) AS flEhAcessorio'
      '  FROM erp.intIndBaixaProducao a'
      ' INNER JOIN ('
      '             SELECT s.cdSetor AS cdSet,'
      '                    s.deSetor,'
      '                    s.flEhSetorMontagem, '
      '                    s.flEhSetorEmbalagem,'
      '                    s.flEhSetorExpedicao'
      '               FROM erp.setor s'
      
        '               LEFT JOIN erp.setor sa ON (sa.cdSetor = s.cdSetor' +
        'Anterior)'
      '            ) t01 ON (t01.cdSet = a.cdSetor)  '
      '  LEFT JOIN ('
      '             SELECT s.cdSetor AS cdSetAnt,'
      '                    s.deSetor AS deSetorAnt,'
      '                    s.flEhSetorMontagem AS flEhSetAntMont'
      '               FROM erp.setor s'
      
        '            ) t05 ON (t05.cdSetAnt = a.cdSetorAnterior)         ' +
        '   '
      '  LEFT JOIN ('
      '             SELECT ub.cdUsuario AS cdUsuBaixa,'
      '                    ub.nmUsuario AS nmUsuBaixa'
      '               FROM erp.usuario ub '
      '            ) t02 ON (t02.cdUsuBaixa = a.cdUsuarioBaixa)'
      '  LEFT JOIN ('
      '             SELECT ir.cdItemRelacionado AS cdItemRelac,'
      '                    ir.cdItemBase,'
      '                    ir.deItemBase, '
      '                    ir.cdTamanhoBase,'
      '                    ir.deTamanhoBase'
      '               FROM erp.intIndItemRelacionado ir'
      '            ) t03 ON (t03.cdItemRelac = a.cdItemRelacionado) '
      '  LEFT JOIN ('
      '             SELECT e.cdEmpresa AS cdEmp,'
      '                    e.deRazaoSocial AS nmEmpresa'
      '               FROM erp.empresa e '
      '            ) t04 ON (t04.cdEmp = a.cdEmpresa)'
      ' &filtro'
      
        ' ORDER BY a.dtBaixa DESC, a.hrBaixa DESC, a.cdItem, a.cdIdQtde, ' +
        'a.cdSetor')
    Left = 406
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyIntIndBaixaProducaocditem: TWideStringField
      FieldName = 'cditem'
      Origin = 'cditem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 30
    end
    object qyIntIndBaixaProducaocdsetor: TIntegerField
      FieldName = 'cdsetor'
      Origin = 'cdsetor'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyIntIndBaixaProducaocdidqtde: TIntegerField
      FieldName = 'cdidqtde'
      Origin = 'cdidqtde'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyIntIndBaixaProducaodeitem: TWideStringField
      FieldName = 'deitem'
      Origin = 'deitem'
      Size = 250
    end
    object qyIntIndBaixaProducaodtbaixa: TDateField
      FieldName = 'dtbaixa'
      Origin = 'dtbaixa'
    end
    object qyIntIndBaixaProducaohrbaixa: TIntegerField
      FieldName = 'hrbaixa'
      Origin = 'hrbaixa'
    end
    object qyIntIndBaixaProducaocdusuariobaixa: TIntegerField
      FieldName = 'cdusuariobaixa'
      Origin = 'cdusuariobaixa'
    end
    object qyIntIndBaixaProducaodehrbaixa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrbaixa'
      Origin = 'dehrbaixa'
      Size = 10
    end
    object qyIntIndBaixaProducaodesetor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'desetor'
      Origin = 'desetor'
      Size = 4000
    end
    object qyIntIndBaixaProducaonmusubaixa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusubaixa'
      Origin = 'nmusubaixa'
      Size = 250
    end
    object qyIntIndBaixaProducaoflemestoque: TWideStringField
      FieldName = 'flemestoque'
      Origin = 'flemestoque'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaodtcadpedido: TDateField
      FieldName = 'dtcadpedido'
      Origin = 'dtcadpedido'
    end
    object qyIntIndBaixaProducaocdpedido: TIntegerField
      FieldName = 'cdpedido'
      Origin = 'cdpedido'
    end
    object qyIntIndBaixaProducaocdseqped: TIntegerField
      FieldName = 'cdseqped'
      Origin = 'cdseqped'
    end
    object qyIntIndBaixaProducaocdidqtdeseqped: TIntegerField
      FieldName = 'cdidqtdeseqped'
      Origin = 'cdidqtdeseqped'
    end
    object qyIntIndBaixaProducaonuqtdtotalitem: TIntegerField
      FieldName = 'nuqtdtotalitem'
      Origin = 'nuqtdtotalitem'
    end
    object qyIntIndBaixaProducaocdcliente: TIntegerField
      FieldName = 'cdcliente'
      Origin = 'cdcliente'
    end
    object qyIntIndBaixaProducaocdcarga: TIntegerField
      FieldName = 'cdcarga'
      Origin = 'cdcarga'
    end
    object qyIntIndBaixaProducaodecarga: TWideStringField
      FieldName = 'decarga'
      Origin = 'decarga'
      Size = 200
    end
    object qyIntIndBaixaProducaoflehsetorexpedicao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'flehsetorexpedicao'
      Origin = 'flehsetorexpedicao'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaoflehsetorembalagem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'flehsetorembalagem'
      Origin = 'flehsetorembalagem'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaoflehsetormontagem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'flehsetormontagem'
      Origin = 'flehsetormontagem'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaocdtamanho: TIntegerField
      FieldName = 'cdtamanho'
      Origin = 'cdtamanho'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyIntIndBaixaProducaodetamanho: TWideStringField
      FieldName = 'detamanho'
      Origin = 'detamanho'
      Size = 250
    end
    object qyIntIndBaixaProducaocdcor: TIntegerField
      FieldName = 'cdcor'
      Origin = 'cdcor'
    end
    object qyIntIndBaixaProducaodecor: TWideStringField
      FieldName = 'decor'
      Origin = 'decor'
      Size = 250
    end
    object qyIntIndBaixaProducaocdalca: TIntegerField
      FieldName = 'cdalca'
      Origin = 'cdalca'
    end
    object qyIntIndBaixaProducaodealca: TWideStringField
      FieldName = 'dealca'
      Origin = 'dealca'
      Size = 250
    end
    object qyIntIndBaixaProducaocdadorno: TIntegerField
      FieldName = 'cdadorno'
      Origin = 'cdadorno'
    end
    object qyIntIndBaixaProducaodeadorno: TWideStringField
      FieldName = 'deadorno'
      Origin = 'deadorno'
      Size = 250
    end
    object qyIntIndBaixaProducaocdchaveta: TIntegerField
      FieldName = 'cdchaveta'
      Origin = 'cdchaveta'
    end
    object qyIntIndBaixaProducaodechaveta: TWideStringField
      FieldName = 'dechaveta'
      Origin = 'dechaveta'
      Size = 250
    end
    object qyIntIndBaixaProducaocdforracao: TIntegerField
      FieldName = 'cdforracao'
      Origin = 'cdforracao'
    end
    object qyIntIndBaixaProducaodeforracao: TWideStringField
      FieldName = 'deforracao'
      Origin = 'deforracao'
      Size = 250
    end
    object qyIntIndBaixaProducaocdimagem: TIntegerField
      FieldName = 'cdimagem'
      Origin = 'cdimagem'
    end
    object qyIntIndBaixaProducaodeimagem: TWideStringField
      FieldName = 'deimagem'
      Origin = 'deimagem'
      Size = 250
    end
    object qyIntIndBaixaProducaocditemrelacionado: TIntegerField
      FieldName = 'cditemrelacionado'
      Origin = 'cditemrelacionado'
    end
    object qyIntIndBaixaProducaocditembase: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cditembase'
      Origin = 'cditembase'
      Size = 30
    end
    object qyIntIndBaixaProducaodeitembase: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'deitembase'
      Origin = 'deitembase'
      Size = 250
    end
    object qyIntIndBaixaProducaocdtamanhobase: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cdtamanhobase'
      Origin = 'cdtamanhobase'
    end
    object qyIntIndBaixaProducaodetamanhobase: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'detamanhobase'
      Origin = 'detamanhobase'
      Size = 250
    end
    object qyIntIndBaixaProducaodesetorant: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'desetorant'
      Origin = 'desetorant'
      Size = 4000
    end
    object qyIntIndBaixaProducaoflehsetantmont: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'flehsetantmont'
      Origin = 'flehsetantmont'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaoflehrevenda: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'flehrevenda'
      Origin = 'flehrevenda'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaodtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyIntIndBaixaProducaohralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyIntIndBaixaProducaocdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyIntIndBaixaProducaoflehacessorio: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'flehacessorio'
      Origin = 'flehacessorio'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaocdempresa: TIntegerField
      FieldName = 'cdempresa'
      Origin = 'cdempresa'
    end
    object qyIntIndBaixaProducaonmempresa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmempresa'
      Origin = 'nmempresa'
      Size = 250
    end
    object qyIntIndBaixaProducaoflmovestsetorant: TWideStringField
      FieldName = 'flmovestsetorant'
      Origin = 'flmovestsetorant'
      FixedChar = True
      Size = 1
    end
    object qyIntIndBaixaProducaocdsetoranterior: TIntegerField
      FieldName = 'cdsetoranterior'
      Origin = 'cdsetoranterior'
    end
    object qyIntIndBaixaProducaocdidqtdeanterior: TIntegerField
      FieldName = 'cdidqtdeanterior'
      Origin = 'cdidqtdeanterior'
    end
  end
  object qyIntComCargaPesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       m.nmMotorista,'
      '       CAST('
      '            CASE'
      '              WHEN TRIM(a.deObsSistema) <> '#39#39' THEN'
      '                '#39'Sim'#39
      '              ELSE'
      '                '#39'N'#227'o'#39
      '            END AS CHARACTER VARYING(3)'
      '           ) AS flTemObsSis,'
      
        '       CAST(REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', '#39'\1-\2'#39')' +
        ' AS CHARACTER VARYING(10)) AS dePlaca,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.intComCarga a  '
      '  LEFT JOIN erp.motorista m  ON (m.cdMotorista = a.cdMotorista)'
      '  LEFT JOIN erp.veiculo   v  ON (v.cdVeiculo = a.cdVeiculo)'
      
        '  LEFT JOIN erp.usuario   uc ON (uc.cdUsuario = a.cdUsuarioCadas' +
        'tro)'
      
        '  LEFT JOIN erp.usuario   ua ON (ua.cdUsuario = a.cdUsuarioAlter' +
        'acao) '
      ' &filtro'
      ' ORDER BY a.dtSaida, a.cdCarga')
    Left = 133
    Top = 532
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyReciboAvulso: TFDQuery
    BeforePost = qyReciboAvulsoBeforePost
    AfterScroll = qyReciboAvulsoAfterScroll
    OnNewRecord = qyReciboAvulsoNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt'
      '  FROM erp.reciboAvulso a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' &filtro'
      ' ORDER BY a.cdReciboAvulso DESC')
    Left = 518
    Top = 152
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyReciboAvulsoRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.cdReciboAvulso,'
      '       a.deReciboAvulso,'
      '       a.vlReciboAvulso,'
      '       a.dtReciboAvulso,'
      '       a.nmRecebedor,'
      '       CAST(CASE'
      '              WHEN LENGTH(a.deCpfCnpj) = 14 THEN'
      '                REGEXP_REPLACE(a.deCpfCnpj, '
      
        '                               '#39'(\d{2})(\d{3})(\d{3})(\d{4})(\d{' +
        '2})'#39', '#39'\1.\2.\3/\4-\5'#39
      '                              )'
      '              ELSE'
      '                REGEXP_REPLACE(a.deCpfCnpj, '
      
        '                               '#39'(\d{3})(\d{3})(\d{3})(\d{2})'#39', '#39 +
        '\1.\2.\3.-\4'#39
      '                              ) '
      '            END AS CHARACTER VARYING(30)'
      '           ) AS deCpfCnpjMasc,'
      '       a.deEndereco,'
      '       a.cdEmpresa,'
      '       t01.nmEmpresa,'
      '       t01.imLogoEmp,'
      '       t02.nmCidade'
      '  FROM erp.reciboAvulso a'
      '  LEFT JOIN ('
      '             SELECT e.cdEmpresa     AS cdEmp,'
      '                    e.deRazaoSocial AS nmEmpresa,'
      '                    e.imLogo        AS imLogoEmp'
      '               FROM erp.empresa e'
      '            ) t01 ON (t01.cdEmp = a.cdEmpresa)'
      '  LEFT JOIN ('
      '             SELECT c.cdCidade AS cdCid,'
      
        '                    CAST(INITCAP(c.nmCidade) AS CHARACTER VARYIN' +
        'G(250)) AS nmCidade'
      '               FROM erp.cidade c'
      '            ) t02 ON (t02.cdCid = a.cdCidade)'
      ' &filtro')
    Left = 610
    Top = 152
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyIntIndMaterialEstoqueRel: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      #9'SELECT a.cdMaterial,'
      '               SUM('
      #9'           CAST('
      '                        CASE'
      '                          WHEN a.flTipoMovimento = '#39'S'#39' THEN'
      '                            a.nuQtde * -1'
      
        '                          WHEN (a.flTipoMovimento = '#39'E'#39') AND (a.' +
        'cdSituacaoMovimento = 2) THEN'
      '                            a.nuQtde'
      '                          ELSE'
      '                            0'
      '                        END AS NUMERIC(15,4)'
      '                       )'
      '                   ) AS nuQtdEst'
      #9'  FROM erp.intIndMaterialMovimento a'
      '          &filtro'
      #9' GROUP BY a.cdMaterial'
      #9' ORDER BY a.cdMaterial'
      '       ) t '
      ' WHERE t.nuQtdEst > 0')
    Left = 1045
    Top = 577
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyNatureza: TFDQuery
    OnNewRecord = qyNaturezaNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.natureza a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdNatureza DESC')
    Left = 158
    Top = 104
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCentroCusto: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.centrocusto a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdCentroCusto DESC')
    Left = 606
    Top = 434
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyUsuarioConexao: TFDQuery
    BeforePost = qyUsuarioConexaoBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT u.*,'
      '       CAST('
      '            CASE'
      '              WHEN u.hrConexao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(u.hrConexao/60), '#39'00'#39')) || '#39':' +
        #39' ||'
      '                TRIM(TO_CHAR(MOD(u.hrConexao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrConexao,'
      '       t01.nmUsuCon'
      '  FROM erp.usuarioConexao u'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCon,'
      '                    uc.nmUsuario AS nmUsuCon'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCon = u.cdUsuario)'
      ' &filtro'
      ' ORDER BY u.cdUsuarioConexao DESC')
    Left = 305
    Top = 8
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyUsuarioChat: TFDQuery
    BeforePost = qyUsuarioChatBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT u.*,'
      '       CAST('
      '            CASE'
      '              WHEN u.hrMensagem > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(u.hrMensagem/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(u.hrMensagem, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrMensagem,'
      '       t01.nmUsuChat,'
      '       t01.deLoginOri,'
      '       t02.nmUsuDestChat,'
      '       t02.deLoginDest'
      '  FROM erp.usuarioChat u'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuChat,'
      '                    uc.nmUsuario AS nmUsuChat,'
      '                    uc.deLogin   AS deLoginOri'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuChat = u.cdUsuario)'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuDestChat,'
      '                    uc.nmUsuario AS nmUsuDestChat,'
      '                    uc.deLogin   AS deLoginDest'
      '               FROM erp.usuario uc '
      '            ) t02 ON (t02.cdUsuDestChat = u.cdUsuario)'
      ' WHERE ('
      
        '        ((u.cdUsuario = :cdUsuario) AND (u.cdUsuarioDestino = :c' +
        'dUsuarioDestino)) OR'
      
        '        ((u.cdUsuario = :cdUsuarioDestino) AND (u.cdUsuarioDesti' +
        'no = :cdUsuario))'
      '       )'
      ' &filtro'
      ' ORDER BY u.cdUsuarioChat')
    Left = 392
    Top = 8
    ParamData = <
      item
        Name = 'CDUSUARIO'
        ParamType = ptInput
      end
      item
        Name = 'CDUSUARIODESTINO'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyPedido: TFDQuery
    BeforePost = qyPedidoBeforePost
    OnNewRecord = qyPedidoNewRecord
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           )           AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           )           AS dehrAlteracao,'
      '       b.deRazaoSocial AS nmCliente,'
      '       CAST('
      '            CASE'
      '              WHEN b.flFisJur = '#39'J'#39' THEN'
      '                REGEXP_REPLACE(b.deCpfCnpj, '
      
        '                               '#39'(\d{2})(\d{3})(\d{3})(\d{4})(\d{' +
        '2})'#39', '#39'\1.\2.\3/\4.\5'#39
      '                              )'
      '              ELSE'
      '                REGEXP_REPLACE(b.deCpfCnpj, '
      
        '                               '#39'(\d{3})(\d{3})(\d{3})(\d{2})'#39', '#39 +
        '\1.\2.\3-\4'#39
      '                              )'
      '            END AS CHARACTER VARYING(20)'
      '           ) AS deCpfCnpjMasc,'
      '       c.nmCidade,'
      '       c.sgEstado,'
      '       uc.nmUsuario    AS nmUsuCad,'
      '       ua.nmUsuario    AS nmUsuAlt'
      '  FROM erp.pedido a'
      ' INNER JOIN erp.cliente b  ON (b.cdCliente = a.cdCliente)'
      ' INNER JOIN erp.cidade  c  ON (c.cdCidade = b.cdCidade)'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao)'
      ' &filtro'
      ' ORDER BY a.cdPedido DESC')
    Left = 222
    Top = 104
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyCidadeDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'select * '
      '  from erp.dw_cidade'
      ' &filtro')
    Left = 791
    Top = 11
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyClienteDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT c.*'
      '  FROM erp.dw_cliente c'
      ' &filtro')
    Left = 858
    Top = 11
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyRepresentanteDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT r.*'
      '  FROM erp.dw_representante r'
      ' &filtro')
    Left = 788
    Top = 64
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVariavelDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*'
      '  FROM erp.dw_variavel a'
      ' &filtro')
    Left = 878
    Top = 63
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVariavelItensDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_variavelItens '
      ' WHERE cdVariavel = :cdVariavel'
      ' &filtro')
    Left = 882
    Top = 112
    ParamData = <
      item
        Name = 'CDVARIAVEL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemGrupoDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_itemGrupo '
      ' &filtro')
    Left = 778
    Top = 117
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemSubGrupoDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_itemSubGrupo'
      ' &filtro')
    Left = 887
    Top = 165
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_item'
      ' &filtro')
    Left = 781
    Top = 165
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyItemCombinacaoVendaDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_itemCombinacao'
      ' &filtro')
    Left = 885
    Top = 213
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyVendasDW: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_vendas'
      ' &filtro')
    Left = 941
    Top = 13
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyTempoDW: TFDQuery
    BeforePost = qyTempoDWBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT *'
      '  FROM erp.dw_tempo'
      ' &filtro')
    Left = 949
    Top = 63
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntComCotaFin: TFDQuery
    BeforePost = qyIntComCotaFinBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       uc.nmUsuario AS nmUsuCad,'
      '       ua.nmUsuario AS nmUsuAlt'
      '  FROM erp.intComCotaFinanceira a'
      
        '  LEFT JOIN erp.usuario uc ON (uc.cdUsuario = a.cdUsuarioCadastr' +
        'o)'
      
        '  LEFT JOIN erp.usuario ua ON (ua.cdUsuario = a.cdUsuarioAlterac' +
        'ao) '
      ' &filtro'
      ' ORDER BY a.dePeriodo, a.cdRepresentante')
    Left = 749
    Top = 484
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyIntComCargaAlerta: TFDQuery
    BeforePost = qyIntComCargaAlertaBeforePost
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt'
      '  FROM erp.intComCargaAlerta a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' WHERE a.cdCarga = :cdCarga'
      ' &filtro'
      ' ORDER BY a.cdCarga, a.cdCargaAlerta')
    Left = 856
    Top = 480
    ParamData = <
      item
        Name = 'CDCARGA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
    object qyIntComCargaAlertacdcarga: TIntegerField
      FieldName = 'cdcarga'
      Origin = 'cdcarga'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyIntComCargaAlertacdcargaalerta: TIntegerField
      FieldName = 'cdcargaalerta'
      Origin = 'cdcargaalerta'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyIntComCargaAlertadecargaalerta: TWideStringField
      FieldName = 'decargaalerta'
      Origin = 'decargaalerta'
      Size = 4000
    end
    object qyIntComCargaAlertadtcadastro: TDateField
      FieldName = 'dtcadastro'
      Origin = 'dtcadastro'
    end
    object qyIntComCargaAlertahrcadastro: TIntegerField
      FieldName = 'hrcadastro'
      Origin = 'hrcadastro'
    end
    object qyIntComCargaAlertacdusuariocadastro: TIntegerField
      FieldName = 'cdusuariocadastro'
      Origin = 'cdusuariocadastro'
    end
    object qyIntComCargaAlertadtalteracao: TDateField
      FieldName = 'dtalteracao'
      Origin = 'dtalteracao'
    end
    object qyIntComCargaAlertahralteracao: TIntegerField
      FieldName = 'hralteracao'
      Origin = 'hralteracao'
    end
    object qyIntComCargaAlertacdusuarioalteracao: TIntegerField
      FieldName = 'cdusuarioalteracao'
      Origin = 'cdusuarioalteracao'
    end
    object qyIntComCargaAlertadehrcadastro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehrcadastro'
      Origin = 'dehrcadastro'
      ReadOnly = True
      Size = 5
    end
    object qyIntComCargaAlertadehralteracao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dehralteracao'
      Origin = 'dehralteracao'
      ReadOnly = True
      Size = 5
    end
    object qyIntComCargaAlertanmusucad: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusucad'
      Origin = 'nmusucad'
      Size = 250
    end
    object qyIntComCargaAlertanmusualt: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmusualt'
      Origin = 'nmusualt'
      Size = 250
    end
  end
  object qyIntComCargaAlertaPesq: TFDQuery
    Connection = fdConnERP
    SQL.Strings = (
      'SELECT a.*,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrCadastro > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrCadastro/60), '#39'00'#39')) || '#39 +
        ':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrCadastro, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrCadastro,'
      '       CAST('
      '            CASE'
      '              WHEN a.hrAlteracao > 0 THEN'
      
        '                TRIM(TO_CHAR(TRUNC(a.hrAlteracao/60), '#39'00'#39')) || ' +
        #39':'#39' ||'
      '                TRIM(TO_CHAR(MOD(a.hrAlteracao, 60), '#39'00'#39'))'
      '            END AS CHARACTER VARYING(5)'
      '           ) AS dehrAlteracao,'
      '       t01.nmUsuCad,'
      '       t02.nmUsuAlt'
      '  FROM erp.intComCargaAlerta a'
      '  LEFT JOIN ('
      '             SELECT uc.cdUsuario AS cdUsuCad,'
      '                    uc.nmUsuario AS nmUsuCad'
      '               FROM erp.usuario uc '
      '            ) t01 ON (t01.cdUsuCad = a.cdUsuarioCadastro)'
      '  LEFT JOIN ('
      '             SELECT ua.cdUsuario AS cdUsuAlt,'
      '                    ua.nmUsuario AS nmUsuAlt'
      '               FROM erp.usuario ua '
      '            ) t02 ON (t02.cdUsuAlt = a.cdUsuarioAlteracao)'
      ' &filtro'
      ' ORDER BY a.cdCarga, a.cdCargaAlerta')
    Left = 976
    Top = 480
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
end
