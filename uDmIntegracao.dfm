object DmIntegracao: TDmIntegracao
  OldCreateOrder = False
  Height = 332
  Width = 599
  object fdConnInteg: TFDConnection
    Params.Strings = (
      'User_Name=db2admin'
      'Password=@db2urnas'
      'MetaDefSchema=db2admin'
      'Database=URNRIGON'
      'ODBCDriver=IBM DB2 ODBC DRIVER - DB2CLIENTE'
      'DriverID=DB2'
      'Port=50000'
      'Protocol=TCPIP'
      'Server=192.168.100.100')
    LoginPrompt = False
    OnError = fdConnIntegError
    Left = 24
    Top = 8
  end
  object dlPhysDB2: TFDPhysDB2DriverLink
    Left = 104
    Top = 8
  end
  object qyCliente: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT c.codigo_cliente AS cdCliente,'
      '               c.cliente_ativo  AS flAtivo,'
      '               CASE'
      '                 WHEN c.tipo_cliente = '#39'I'#39' THEN'
      '                   '#39'J'#39
      '                 ELSE'
      '                   c.tipo_cliente'
      '               END              AS flFisJur,'
      
        '               c.cgc            AS deCpfCnpj, --REMOVER CARACTER' +
        'ES ESPECIAIS'
      '               TRIM(c.razao_social) AS deRazaoSocial,'
      '               TRIM(c.fantasia)     AS nmFantasia,  '
      '               CASE'
      '                 WHEN c.tipo_cliente = '#39'I'#39' THEN'
      '                   '#39'S'#39
      '                 ELSE'
      '                   '#39'N'#39
      '               END            AS flIsentoInscEst,  '
      '               c.inscr_estadual AS nuInscEst,'
      '               c.ind_ie_dest    AS  nuIndInscEst,'
      
        '               c.telefone_1     AS nuFone1, --REMOVER CARACTER E' +
        'SPECIAL'
      
        '               c.telefone_2     AS nuFone2, --REMOVER CARACTER E' +
        'SPECIAL'
      
        '               c.celular        AS nuCelular, --REMOVER CARACTER' +
        ' ESPECIAL'
      
        '               c.fax            AS nuFax, --REMOVER CARACTER ESP' +
        'ECIAL'
      '               c.e_mail         AS deEmail,'
      '               c.e_mail_nfe     AS deEmailNfe,'
      '               c.contato        AS nmPessoaContato,'
      '               c.observacoes    AS deObservacoes,'
      
        '               c.cep            AS nuCep, --REMOVER CARACTER ESP' +
        'ECIAL'
      '               c.end            AS deEndereco,'
      
        '               c.end_nro        AS nuEndereco,  --REMOVER CARACT' +
        'ER ESPECIAL'
      '               c.compl_end      AS deComplemento,'
      '               c.bairro         AS deBairro,'
      '               c.sigla_estado   AS sgEstado,'
      '               c.cidade         AS nmCidade, --cidade DESCRITIVO'
      '               c.dt_cadastro    AS dtCadastro,'
      '               c.codigo_repres  AS cdRepresentante,'
      '               r.fantasia       AS nmRepresentante,'
      '               c.codigo_grCli   AS cdGrupoCli'
      '          FROM cliente c'
      
        '          LEFT JOIN repres r ON (r.codigo_repres = c.codigo_repr' +
        'es)'
      '       ) t'
      '  &filtro')
    Left = 30
    Top = 64
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyCidade: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT c.codigo_cidade AS cdCidade,'
      '               c.nome_cidade   AS nmcidade,'
      '               c.sigla_estado  AS sgestado,'
      '               c.cod_cid_ibge  AS cdcidadeibge'
      '          FROM cidade c'
      '       ) t'
      '&filtro'
      ' ORDER BY t.cdCidade')
    Left = 30
    Top = 120
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyItens: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT --a.prx_roteiro,'
      '               --a.est_item_conf,'
      '               a.item,'
      '               a.descricao,'
      '               a.tipo_item AS tpItem,'
      '               a.item_ativo AS flAtivo,'
      '               CASE'
      '                 WHEN ('
      '                       (SUBSTR(item, 1, 1) = '#39'8'#39') AND'
      '                       (SUBSTR(item, 2, 1) = SUBSTR(item, 5, 1))'
      '                      ) OR'
      '                      ('
      '                       (LENGTH(item) > 5) AND'
      '                       (SUBSTR(item, 3, 1) = '#39'7'#39') AND'
      '                       (SUBSTR(item, 1, 1) = SUBSTR(item, '
      '                                                    CASE '
      
        '                                                      WHEN SUBST' +
        'R(item, LENGTH(item)-1, 1) = '#39'.'#39' THEN'
      
        '                                                        LENGTH(i' +
        'tem)-2'
      '                                                      ELSE'
      
        '                                                        LENGTH(i' +
        'tem)'
      '                                                    END, '
      '                                                    1'
      '                                                   )'
      '                       )'
      '                      ) THEN'
      '                   '#39'N'#39
      '                 ELSE'
      '                   '#39'S'#39
      '               END AS flEhItemPad '
      '          FROM item a'
      '         WHERE a.codigo_familia = 30'
      '--           AND a.item_ativo = '#39'S'#39
      '           AND a.flag_tipo_prod <> '#39'R'#39
      '           AND a.item NOT LIKE '#39'%.12%'#39
      '         --  AND a.item LIKE '#39'2075%'#39
      
        '           AND ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
        '))'
      '         ORDER BY a.item'
      '       ) t'
      '&filtro')
    Left = 102
    Top = 64
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyItensVarItens: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT codigo_variavel,'
      '       valor,'
      '       mascara,'
      '       recNum,'
      '       seq '
      '  FROM valorVar '
      ' WHERE codigo_variavel IN(15, 19, 20, 25) '
      ' ORDER BY codigo_variavel, valor')
    Left = 166
    Top = 64
  end
  object qyPedido: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT p.dt_emissao       AS dtEmissao,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao, '#39'MM/YYYY'#39') AS V' +
        'ARCHAR(7)) AS deCompEmissao,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao, '#39'YYYY/MM'#39') AS V' +
        'ARCHAR(7)) AS deOrdCompEmis,'
      '               p.nro_pedido       AS nuPedido,'
      '               p.tipo_pedido      AS tpPedido,'
      '               p.status_pedido,'
      '               p.dt_reg,'
      '               p.dcto_1           AS vlPercDesc,'
      '               p.periodo          AS dePeriodo,'
      '               p.codigo_grFat     AS cdGrupoFat,'
      '               gf.descricao       AS deGrupoFat,'
      '               ip.seq,'
      '               ip.item,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 5'
      '               ), '#39#39') AS deMascTam,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 10  '
      '               ), '#39#39') AS deMascCor,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 10  '
      '               ), '#39#39') AS deVarSeqCor,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 15  '
      '               ), '#39#39') AS deMascAlca,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 15  '
      '               ), '#39#39') AS deVarSeqAlca,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 19  '
      '               ), '#39#39') AS deMascAdorno,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 19  '
      '               ), '#39#39') AS deVarSeqAdorno,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 20  '
      '               ), '#39#39') AS deMascChaveta,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 20  '
      '               ), '#39#39') AS deVarSeqChaveta,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 25  '
      '               ), '#39#39') AS deMascForracao,'
      '               COALESCE(('
      '                SELECT z.valor '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 25  '
      '               ), '#39#39') AS deVarSeqForracao,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 30  '
      '               ), '#39#39') AS deMascImagem,'
      '               COALESCE(('
      '                SELECT z.valor '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 30  '
      '               ), '#39#39') AS deVarSeqImagem,'
      '            /*   CAST('
      '               TRIM(SUBSTR(ip.item, '
      '                           1, '
      '                           CASE'
      '                             WHEN EXISTS ('
      '                                          SELECT vi.recNum'
      '                                            FROM vincItem vi'
      
        '                                           WHERE vi.item = ip.it' +
        'em'
      
        '                                         ) AND LENGTH(TRIM(ip.it' +
        'em)) - 5 >= 0 THEN'
      '                               LENGTH(TRIM(ip.item)) - 5'
      '                             ELSE'
      '                               LENGTH(TRIM(ip.item))'
      '                           END'
      '                          )'
      '                   ) AS VARCHAR(20)) AS cdItem,*/'
      
        '               CAST(TRIM(i.ref_comercial) AS VARCHAR(20)) AS cdI' +
        'tem,'
      '               CAST('
      '                    /*               '
      '                    CASE'
      
        '                      WHEN (POSITION('#39'.12'#39', i.ref_comercial, OCT' +
        'ETS) > 0) OR'
      '                           ('
      
        '                            (SUBSTR(i.ref_comercial, 1, 1) = '#39'8'#39 +
        ') AND'
      
        '                            (SUBSTR(i.ref_comercial, 2, 1) = SUB' +
        'STR(i.ref_comercial, 5, 1))'
      '                           ) OR'
      '                           ('
      '                            (LENGTH(i.ref_comercial) > 5) AND'
      
        '                            (SUBSTR(i.ref_comercial, 3, 1) = '#39'7'#39 +
        ') AND'
      
        '                            (SUBSTR(i.ref_comercial, 1, 1) = SUB' +
        'STR(i.ref_comercial, '
      
        '                                                                ' +
        '    CASE '
      
        '                                                                ' +
        '      WHEN SUBSTR(i.ref_comercial, LENGTH(i.ref_comercial)-1, 1)' +
        ' = '#39'.'#39' THEN'
      
        '                                                                ' +
        '        LENGTH(i.ref_comercial)-2'
      
        '                                                                ' +
        '      ELSE'
      
        '                                                                ' +
        '        LENGTH(i.ref_comercial)'
      
        '                                                                ' +
        '    END, '
      
        '                                                                ' +
        '    1'
      
        '                                                                ' +
        '   )'
      '                            )'
      '                      ) THEN'
      '                        '#39'S'#39
      '                      ELSE'
      '                        '#39'N'#39
      '                    END */'
      '                    CASE'
      
        '                      WHEN COALESCE(p.codigo_tab, '#39'0'#39') IN ('#39'2'#39','#39 +
        '4'#39','#39'6'#39','#39'8'#39','#39'10'#39','#39'12'#39','#39'21'#39','#39'23'#39','#39'25'#39','#39'27'#39','#39'29'#39','#39'31'#39','#39'33'#39') THEN'
      '                        '#39'S'#39
      '                      ELSE'
      '                        CASE'
      '                          WHEN p.codigo_grFat = 1 THEN'
      '                            '#39'N'#39
      '                          ELSE'
      '                            '#39'S'#39
      '                        END'
      '                    END '
      '                    AS CHAR(1)'
      '                   ) AS flEhPontoDoze,'
      '               i.descricao,'
      '               ip.codigo_repres   AS cdRep,'
      '               r.razao_social     AS deRep,'
      '               ip.codigo_cliente,'
      '               c.razao_social     AS deRazaoSocial,'
      '               c.fantasia         AS deFantasia,'
      '               c.cgc,'
      '               COALESCE('
      '                        ('
      '                         SELECT cid.codigo_cidade'
      '                           FROM cidade cid'
      '                          WHERE cid.nome_cidade = c.cidade'
      
        '                            AND cid.sigla_estado = c.sigla_estad' +
        'o'
      '                        ), 0'
      '                       )          AS cdCidade,'
      '               c.cidade           AS deCidade,'
      '               c.bairro,'
      '               c.cep,'
      '               c.end,'
      '               c.end_nro          AS nuEndereco,'
      '               c.sigla_estado     AS sgUf,'
      '               c.compl_end        AS deComplEnd,'
      '               c.cep              AS nuCep,'
      '               c.e_mail           AS deEmail,'
      '               COALESCE(p.vl_dcto_vp, 0) +'
      '               COALESCE(p.vl_dcto_nfs, 0) AS vlDescNfs,'
      '               ip.qtde_solicitada AS nuQtd,'
      '               ip.vl_unitario,'
      '               ip.vl_bruto,'
      '               ip.vl_lucro,'
      '               ip.vl_margem, '
      
        '               ip.vl_total - COALESCE((p.vl_dcto_nfs/p.total_ite' +
        'ns), 0) AS vlTotalItem,'
      '               p.vl_total,'
      '               p.total_itens AS nuQtdDeItens,'
      
        '               COALESCE((ip.vl_bruto - ip.vl_unitario) * ip.qtde' +
        '_solicitada, 0) +'
      '               COALESCE(((COALESCE(p.vl_dcto_vp, 0) +'
      
        '               COALESCE(p.vl_dcto_nfs, 0))/p.total_itens), 0) AS' +
        ' vlDesc,'
      '               ip.vl_bruto * '
      '               ip.qtde_solicitada AS vlTotBruto,'
      '               CASE'
      
        '                 WHEN (ip.vl_bruto * ip.qtde_solicitada)*70/100 ' +
        '= (COALESCE((ip.vl_bruto - ip.vl_unitario) * ip.qtde_solicitada,' +
        ' 0) +'
      
        '                       COALESCE((p.vl_dcto_nfs/p.total_itens), 0' +
        ')) then'
      '                   (ip.vl_bruto * ip.qtde_solicitada)'
      '                 ELSE'
      
        '                   ip.vl_total - COALESCE((p.vl_dcto_nfs/p.total' +
        '_itens), 0)'
      '               END AS vlFaturado,'
      '               CAST('
      '                    CASE'
      
        '                      WHEN ROUND((ip.vl_bruto * ip.qtde_solicita' +
        'da)*70/100, 2) = ROUND((COALESCE((ip.vl_bruto - ip.vl_unitario) ' +
        '* ip.qtde_solicitada, 0) +'
      
        '                            COALESCE((p.vl_dcto_nfs/p.total_iten' +
        's), 0)), 2) then'
      '                        '#39'S'#39
      '                      ELSE'
      '                        '#39'N'#39
      '                    END AS CHAR(1)'
      '                   ) AS flDesc70,'
      '               p.codigo_banco,'
      '               b.razao_social     AS nmBanco,'
      '               p.tipo_cobranca,'
      '               CASE'
      '                 WHEN p.tipo_cobranca IN(1, 2) THEN'
      '                   '#39'DUPLICATAS'#39
      '                 ELSE'
      '                   tc.descricao '
      '               END AS deCobranca,'
      '               CASE'
      
        '                 WHEN p.prazo_1 > 0 OR p.prazo_2 > 0 OR p.prazo_' +
        '3 > 0 OR p.prazo_4 > 0 OR p.prazo_5 > 0 OR '
      
        '                      p.prazo_6 > 0 OR p.prazo_7 > 0 OR p.prazo_' +
        '8 > 0 OR p.prazo_9 > 0 OR p.prazo_10 > 0 OR '
      '                      p.prazo_11 > 0 OR p.prazo_12 > 0 THEN'
      '                   CAST('#39'Prazo: '#39' AS VARCHAR(10))'
      '                 ELSE'
      '                   '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_1 > 0 THEN'
      '                   CAST(p.prazo_1 AS VARCHAR(10))'
      '                 ELSE'
      '                   '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_2 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_2 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_3 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_3 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_4 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_4 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_5 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_5 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_6 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_6 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_7 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_7 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_8 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_8 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_9 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_9 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_10 > 0 THEN'
      
        '                   CAST('#39'-'#39' || p.prazo_10 AS VARCHAR(10)) ELSE '#39 +
        #39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_11 > 0 THEN'
      
        '                   CAST('#39'-'#39' || p.prazo_11 AS VARCHAR(10)) ELSE '#39 +
        #39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_12 > 0 THEN'
      
        '                   CAST('#39'-'#39' || p.prazo_12 AS VARCHAR(10)) ELSE '#39 +
        #39
      '               END AS dePrazo, '
      '/*               COALESCE('
      '                        ('
      '                         SELECT SUM(t.vl_total - t.vl_pgto)'
      
        #9#9'                  --select * FROM titulo t where  codigo_clien' +
        'te=80'
      '                           FROM titulo t '
      
        '        '#9#9'   LEFT OUTER JOIN nfs n ON (n.nro_titulo = t.nro_titu' +
        'lo AND n.nro_nfs <> p.nro_nfs)'
      #9#9'          WHERE t.codigo_cliente = p.codigo_cliente'
      #9#9'            AND t.situacao_titulo NOT IN('#39'P'#39', '#39'C'#39')'
      #9#9'            AND t.codigo_tipoDoc <> 4'
      #9#9'            --AND t.dt_emissao <= CURRENT_DATE'
      #9#9'            AND t.dt_vcto <= CURRENT_DATE'
      '                        ),'
      '                        0'
      '                       ) AS vlDevido,'
      '               COALESCE('
      '                        ('
      
        '                         SELECT SUM(ad.valor_adiantado - ad.valo' +
        'r_abatido)'
      #9#9'                   FROM adianta ad  '
      #9#9'                  WHERE ad.cliente_fornec = p.codigo_cliente'
      #9#9'                    AND ad.data <= CURRENT_DATE'
      '                        ),'
      '                        0'
      '                       ) AS vlCredito,'
      '*/'
      '               p.observacao_3 AS deObs3,'
      '               p.observacao_4 AS deObs4,'
      
        '               TRIM(COALESCE(TRIM(p.observacao_1), '#39#39') || '#39' '#39' ||' +
        ' '
      '               COALESCE(TRIM(p.observacao_2), '#39#39'))  AS deObsPed,'
      
        '               TRIM(COALESCE(TRIM(p.observacao_3), '#39#39') || '#39' '#39' ||' +
        ' '
      '               COALESCE(TRIM(p.observacao_4), '#39#39'))  AS deObs,'
      '               c.observacoes                        AS deObsCli,'
      
        '               CAST(TRIM(COALESCE(TRIM(p.observacao_1), '#39#39') || '#39 +
        ' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_2), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_3), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_4), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_5), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_6), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_7), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_8), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_9), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_10), '#39#39')'
      #9'           ) AS CHARACTER VARYING(4000)) AS deObsCompleta,'
      '               COALESCE(gp.codigo_grupoPed, 0)      AS cdCarga,'
      '               COALESCE(gp.observacao, '#39'Sem Carga'#39') AS deCarga,'
      '               p.codigo_usuarioD                    AS cdUsuCad,'
      '               uc.nome                              AS deUsuCad,'
      
        '               p.qtde_total                         AS nuTotIten' +
        's,'
      
        '               p.codigo_natureza                    AS deNaturez' +
        'a,'
      
        '               p.nro_volumes                        AS nuTotVolu' +
        'mes,'
      
        '               p.dt_emissao_nfs                     AS dtEmissao' +
        'Nfs,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao_nfs, '#39'MM/YYYY'#39') ' +
        'AS VARCHAR(7)) AS deCompEmisNfs,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao_nfs, '#39'YYYY/MM'#39') ' +
        'AS VARCHAR(7)) AS deOrdCompEmisNfs,'
      
        '               i.codigo_grItem                      AS cdItemGru' +
        'po,'
      
        '               gi.descricao                         AS deItemGru' +
        'po,'
      
        '               i.codigo_subItem                     AS cdItemSub' +
        'Grupo,'
      
        '               sgi.descricao                        AS deItemSub' +
        'Grupo,'
      
        '               c.inscr_estadual                     AS nuInscEst' +
        ','
      '               p.nro_nfs                            AS nuNfs,'
      '               ('
      '                SELECT x.imagem'
      '                  FROM item x'
      '                 WHERE x.item = i.ref_comercial'
      
        '               )                                    AS dePathImg' +
        'Item,'
      
        '               i.flag_tipo_prod                     AS flTipoPro' +
        'duto,'
      '               p.valor_frete                        AS vlFrete,'
      '               CAST(COALESCE('
      '                             ('
      '                              SELECT COALESCE(tip.linha_01, '#39#39')'
      '                                FROM textoPed tip '
      
        '                               WHERE tip.nro_pedido = p.nro_pedi' +
        'do '
      '                                 AND tip.seq = ip.seq'
      '                             ), '#39#39
      '                            ) AS VARCHAR(500)'
      '                   ) AS deItemTexto01,'
      '               CAST(COALESCE('
      '                             ('
      '                              SELECT COALESCE(tip.linha_02, '#39#39')'
      '                                FROM textoPed tip '
      
        '                               WHERE tip.nro_pedido = p.nro_pedi' +
        'do '
      '                                 AND tip.seq = ip.seq'
      '                             ), '#39#39
      '                            ) AS VARCHAR(500)'
      '                   ) AS deItemTexto02,'
      '               CAST(COALESCE('
      '                             ('
      '                              SELECT COALESCE(tip.linha_03, '#39#39')'
      '                                FROM textoPed tip '
      
        '                               WHERE tip.nro_pedido = p.nro_pedi' +
        'do '
      '                                 AND tip.seq = ip.seq'
      '                             ), '#39#39
      '                            ) AS VARCHAR(500)'
      '                   ) AS deItemTexto03,'
      '               c.codigo_grCli   AS cdGrupoCli,'
      '               r.e_mail         AS deEmailRep'
      '          FROM pedido p '
      
        '         INNER JOIN itemPed        ip  ON (ip.nro_pedido = p.nro' +
        '_pedido)'
      
        '         INNER JOIN cliente        c   ON (c.codigo_cliente = p.' +
        'codigo_cliente)'
      
        '         INNER JOIN repres         r   ON (r.codigo_repres = p.c' +
        'odigo_repres)'
      
        '         INNER JOIN grFat          gf  ON (gf.codigo = p.codigo_' +
        'grFat)'
      '         INNER JOIN item           i   ON (i.item = ip.item)'
      
        '          LEFT OUTER JOIN banco    b   ON (b.codigo_banco = p.co' +
        'digo_banco)'
      
        '          LEFT OUTER JOIN tipoCob  tc  ON (tc.codigo_tipocob = p' +
        '.tipo_cobranca)'
      
        '          LEFT OUTER JOIN grupoPed gp  ON (gp.nro_pedido = p.nro' +
        '_pedido)'
      
        '          LEFT OUTER JOIN usuario  uc  ON (uc.codigo_usuario = p' +
        '.codigo_usuarioD)'
      
        '          LEFT OUTER JOIN grItem   gi  ON (gi.codigo_grItem = i.' +
        'codigo_grItem)'
      
        '          LEFT OUTER JOIN sgrItem  sgi ON (sgi.codigo_grItem = i' +
        '.codigo_grItem AND sgi.codigo_sgrItem = i.codigo_subItem)'
      '      ) t  '
      '  &filtro')
    Left = 94
    Top = 120
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyClientesSemPed: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT c.codigo_cliente AS cdCliente, '
      '               c.razao_social   AS deRazaoSocialCliente,'
      '               c.fantasia       AS deFantasiaCliente,'
      '               c.codigo_repres  AS cdRep,'
      '               r.razao_social   AS deRazaoSocialRep,'
      '               c.cidade         AS deCidade,'
      '               c.sigla_estado   AS sgUf,'
      '               c.bairro,'
      '               c.cep,'
      '               c.end,'
      '               c.cgc,'
      '               c.observacoes    AS deObsCli,'
      '               c.codigo_grCli   AS cdGrupoCli'
      '          FROM cliente c'
      
        '         INNER JOIN repres r ON (r.codigo_repres = c.codigo_repr' +
        'es)  '
      '         WHERE c.cliente_ativo = '#39'S'#39
      '           AND NOT EXISTS ('
      '                           SELECT p.recNum'
      '                             FROM pedido p'
      
        '                            WHERE p.codigo_cliente = c.codigo_cl' +
        'iente'
      '                               &data'
      '                          )'
      '       ) t '
      '&filtro')
    Left = 126
    Top = 176
    MacroData = <
      item
        Value = Null
        Name = 'DATA'
      end
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyPedAgrup: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT pa.pedido_ori'
      '  FROM pedAgrup pa'
      ' WHERE pa.pedido_novo = :nuPed'
      ' ORDER BY pa.pedido_ori')
    Left = 158
    Top = 120
    ParamData = <
      item
        Name = 'NUPED'
        ParamType = ptInput
      end>
  end
  object qyCargaPesq: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT DISTINCT '
      '               gp.codigo_grupoPed AS cdCarga,'
      '               gp.observacao      AS deCarga'
      '          FROM grupoPed gp'
      '         WHERE gp.observacao <> '#39#39
      '         UNION'
      '        SELECT DISTINCT '
      '               gp.codigo_grupoPed AS cdCarga,'
      '                '#39'SEM DESCRI'#199#195'O'#39'      AS deCarga'
      '          FROM grupoPed gp'
      '         WHERE gp.observacao = '#39#39
      '           AND gp.codigo_grupoPed NOT IN ('
      
        '                                          SELECT gp2.codigo_grup' +
        'oPed'
      '                                            FROM grupoPed gp2'
      
        '                                           WHERE gp2.observacao ' +
        '<> '#39#39
      '                                         )'
      '      ) t '
      '  &filtro'
      ' ORDER BY t.cdCarga DESC')
    Left = 222
    Top = 176
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
    object qyCargaPesqcdCarga: TIntegerField
      FieldName = 'cdCarga'
    end
    object qyCargaPesqdeCarga: TStringField
      FieldName = 'deCarga'
      Size = 200
    end
  end
  object qyListaPreco: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT t.codigo_tab                  AS cdTab,'
      '               t.descricao                   AS deTab,'
      #9'       TRIM(it.item)                     AS cdItem,'
      #9'       TRIM(i.descricao)                 AS deItem,'
      #9'       50                                AS cdTam,'
      #9'       '#39'TAM.: 1,90'#39'                      AS deTam,        '
      #9'       it.vl AS vlUrna'
      '          FROM tab t'
      #9'     INNER JOIN itemTab it ON (it.codigo_tab = t.codigo_tab)'
      '         INNER JOIN item    i  ON (i.item = it.item)'
      '         WHERE it.vl > 0'
      '         UNION ALL'
      '        SELECT t.codigo_tab                  AS cdTab,'
      '               t.descricao                   AS deTab,'
      '               TRIM(it.item)                 AS cdItem,'
      '               TRIM(i.descricao)             AS deItem,'
      '               MAX(vi.valorVar)              AS cdTam,'
      '               '#39'TODAS AS IMGs.: '#39'            AS deTam,        '
      '               COALESCE(vi.preco_agregar, 0) AS vlUrna'
      '          FROM tab t'
      
        '         INNER JOIN itemTab  it ON (it.codigo_tab = t.codigo_tab' +
        ')'
      '         INNER JOIN item     i  ON (i.item = it.item)'
      
        '         INNER JOIN vlVarItb vi ON (vi.codigo_tab = it.codigo_ta' +
        'b AND vi.item = it.item)'
      '         WHERE it.vl = 0'
      '           AND vi.codigo_variavel = 30'
      '           AND vi.preco_agregar > 0'
      '           AND it.item = '#39'SOBTAMP01'#39
      '         GROUP BY t.codigo_tab,'
      '                  t.descricao,'
      '                  TRIM(it.item),'
      '                  TRIM(i.descricao),'
      '                  COALESCE(vi.preco_agregar, 0)'
      '         UNION ALL'
      '        SELECT t.codigo_tab                  AS cdTab,'
      '               t.descricao                   AS deTab,'
      '               TRIM(it.item)                 AS cdItem,'
      '               TRIM(i.descricao)             AS deItem,'
      '               vi.valorVar                   AS cdTam,'
      '               CASE'
      '                 WHEN vi.codigo_variavel = 5 THEN'
      '                   '#39'TAM.: '#39
      '                 WHEN vi.codigo_variavel = 19 THEN'
      '                   '#39'ADO.: '#39
      '                 WHEN vi.codigo_variavel = 20 THEN'
      '                   '#39'CHA.: '#39
      '                 WHEN vi.codigo_variavel = 30 THEN'
      '                   '#39'IMG.: '#39' '
      '               END || vv.valor               AS deTam,        '
      '               COALESCE(vi.preco_agregar, 0) AS vlUrna'
      '          FROM tab t'
      
        '         INNER JOIN itemTab  it ON (it.codigo_tab = t.codigo_tab' +
        ')'
      '         INNER JOIN item     i  ON (i.item = it.item)'
      
        '         INNER JOIN vlVarItb vi ON (vi.codigo_tab = it.codigo_ta' +
        'b AND vi.item = it.item)'
      
        '         INNER JOIN valorVar vv ON (vv.codigo_variavel = vi.codi' +
        'go_variavel AND vv.seq = vi.valorVar)'
      '         WHERE it.vl = 0'
      '           AND vi.codigo_variavel IN(5, 19, 20, 30)'
      '           AND vi.preco_agregar > 0'
      '           AND ('
      
        '                ((it.item NOT LIKE '#39'INF%'#39') AND (vi.codigo_variav' +
        'el <> 5)) OR'
      
        '                ((it.item LIKE '#39'INF%'#39') AND (vi.codigo_variavel =' +
        ' 5)) OR'
      
        '                ((it.item LIKE '#39'ZINCO%'#39') AND (vi.codigo_variavel' +
        ' = 5))'
      '               )'
      '           AND it.item <> '#39'SOBTAMP01'#39
      '       ) t      '
      ' WHERE t.vlUrna > 0'
      ' &filtro'
      ' ORDER BY t.cdTab, t.cdItem DESC, t.cdTam')
    Left = 230
    Top = 120
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 200
    Top = 8
  end
  object qyRepresentante: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      
        '        SELECT r.codigo_repres                AS cdRepresentante' +
        ', '
      '               r.repres_ativo                 AS flAtivo,'
      '               CASE'
      '                 WHEN r.tipo_repres = '#39'I'#39' THEN'
      '                   '#39'J'#39
      '                 ELSE'
      '                   r.tipo_repres'
      '               END                            AS flFisJur,'
      
        '               r.cgc                          AS deCpfCnpj, --RE' +
        'MOVER CARACTERES ESPECIAIS'
      '               r.razao_social                 AS deRazaoSocial,'
      '               r.fantasia                     AS nmFantasia,  '
      
        '               r.telefone_1                   AS nuFone1, --REMO' +
        'VER CARACTER ESPECIAL'
      
        '               r.telefone_2                   AS nuFone2, --REMO' +
        'VER CARACTER ESPECIAL'
      
        '               r.fax                          AS nuFax, --REMOVE' +
        'R CARACTER ESPECIAL'
      '               r.e_mail                       AS deEmail,'
      
        '               r.contato                      AS nmPessoaContato' +
        ','
      '               r.per_comis                    AS vlPercComissao,'
      
        '               r.observacoes                  AS deObservacoes, ' +
        '              '
      
        '               r.cep                          AS nuCep, --REMOVE' +
        'R CARACTER ESPECIAL'
      '               r.end                          AS deEndereco,'
      
        '               r.end_nro                      AS nuEndereco,  --' +
        'REMOVER CARACTER ESPECIAL'
      '               r.compl_end                    AS deComplemento,'
      '               r.bairro                       AS deBairro,'
      '               r.sigla_estado                 AS sgEstado,'
      
        '               r.cidade                       AS nmCidade, --cid' +
        'ade DESCRITIVO               '
      '               TO_CHAR(r.codigo_repres, '#39'00'#39') AS cdRep,'
      '               r.tipo_repres     '
      '          FROM repres r'
      '       ) t'
      '&filtro'
      ' ORDER BY t.cdRepresentante')
    Left = 30
    Top = 176
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qyFornecedor: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT f.codigo_fornec AS cdFornecedor,'
      '               f.ativo         AS flAtivo,'
      '               f.codigo_grForn AS cdFornecedorTipo,'
      '               CASE'
      '                 WHEN f.tipo_fornec = '#39'I'#39' THEN'
      '                   '#39'J'#39
      '                 ELSE'
      '                   f.tipo_fornec'
      '               END              AS flFisJur,'
      
        '               f.cgc            AS deCpfCnpj, --REMOVER CARACTER' +
        'ES ESPECIAIS'
      '               f.razao_social   AS deRazaoSocial,'
      '               f.fantasia       AS nmFantasia,  '
      '               CASE'
      '                 WHEN f.tipo_fornec = '#39'I'#39' THEN'
      '                   '#39'S'#39
      '                 ELSE'
      '                   '#39'N'#39
      '               END              AS flIsentoInscEst,  '
      '               f.inscr_estadual AS nuInscEst,'
      '               f.ind_ie_dest    AS nuIndInscEst,'
      '               f.cod_cidade     AS cdMunicipio,'
      
        '               f.telefone_1     AS nuFone1, --REMOVER CARACTER E' +
        'SPECIAL'
      
        '               f.telefone_2     AS nuFone2, --REMOVER CARACTER E' +
        'SPECIAL'
      
        '               f.fax            AS nuFax, --REMOVER CARACTER ESP' +
        'ECIAL'
      '               f.e_mail         AS deEmail,'
      '               f.e_mail_nfe     AS deEmailNfe,'
      '               f.home_page      AS deHomePage,'
      '               f.contato        AS nmPessoaContato,'
      '               f.observacoes    AS deObservacoes,'
      
        '               f.cep            AS nuCep, --REMOVER CARACTER ESP' +
        'ECIAL'
      '               f.endereco       AS deEndereco,'
      
        '               f.nro_end        AS nuEndereco,  --REMOVER CARACT' +
        'ER ESPECIAL'
      '               f.compl_end      AS deComplemento,'
      '               f.bairro         AS deBairro,'
      '               f.sigla_estado   AS sgEstado,'
      
        '               f.cidade         AS nmCidade --cidade DESCRITIVO ' +
        '              '
      '          FROM fornec f'
      '       ) t'
      ' ORDER BY t.cdFornecedor')
    Left = 254
    Top = 64
  end
  object qyFornecedorTipo: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT f.codigo_grForn AS cdFornecedorTipo,'
      '               f.descricao     AS deFornecedorTipo             '
      '          FROM grForn f'
      '       ) t'
      ' ORDER BY t.cdFornecedorTipo')
    Left = 342
    Top = 64
  end
  object qyClassifFiscal: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT codigo_clasFisc AS cdClassifFiscal,'
      '       clasFisc        AS nuClassifFiscal,'
      '       descricao       AS deClassifFiscal,'
      '       valor_ipi       AS vlIpi,'
      '       enquad_ipi      AS deIpiClasse,'
      '       tipo_ipi        AS cdIpiTipo,'
      '       cod_ipi         AS cdIpiCodigo,       '
      '       cod_enq_ipi     AS cdIpiEnquadramento,'
      '       cod_pis         AS cdPisCodigo,'
      '       cod_cofins      AS cdCofinsCodigo, '
      '       perc_mva        AS vlPercMva,'
      '       CASE'
      '         WHEN TRIM(calc_st_cnae) = '#39'S'#39' THEN'
      '           TRIM(calc_st_cnae)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flCalculaStCnae,'
      '       cest            AS nuCest,    '
      '       per_ipi         AS vlPercIpi, '
      '       per_red_icms    AS vlPercIcmsReducao, '
      '       per_pis         AS vlPercPis,'
      '       per_cofins      AS vlPercCofins, '
      '       CASE'
      '         WHEN TRIM(abat_pis_cofins) = '#39'S'#39' THEN'
      '           TRIM(abat_pis_cofins)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flAbatePisCofins,    '
      '       CASE'
      '         WHEN TRIM(imprime_nota) = '#39'S'#39' THEN'
      '           TRIM(imprime_nota)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flImprimeNota,       '
      '       CASE'
      '         WHEN TRIM(utiliza_dnf) = '#39'S'#39' THEN'
      '           TRIM(utiliza_dnf)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flUtilizaDnf,         '
      '       exTipi          AS deExTipi,'
      '       CASE'
      '         WHEN TRIM(flag_red_pf) = '#39'S'#39' THEN'
      '           TRIM(flag_red_pf)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flIcmsReducaoPF,'
      '       CASE'
      '         WHEN TRIM(faz_reducao) = '#39'1'#39' THEN'
      '           '#39'S'#39
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flIcmsReducaoIndustria,   '
      '       CASE'
      '         WHEN TRIM(entra_desonera) = '#39'S'#39' THEN'
      '           TRIM(entra_desonera)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flEntraDesoneracao,'
      '       perc_desonera   AS vlPercDesoneracao,'
      '       CASE'
      '         WHEN TRIM(utiliza_ibpt) = '#39'S'#39' THEN'
      '           TRIM(utiliza_ibpt)'
      '         ELSE'
      '           '#39'N'#39
      '       END             AS flUtilizaIbpt,  '
      '       observacoes     AS deObservacoes  '
      '  FROM clasFisc  ')
    Left = 310
    Top = 128
  end
  object qyClasFisTaxaIbpt: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT codigo_clasFisc AS cdClassifFiscal,'
      '       sigla_estado    AS sgEstado,'
      '       per_nacional    AS vlPercNacional,'
      '       per_importacao  AS vlPercImportacao,'
      '       per_estadual    AS vlPercEstadual,'
      '       per_municipal   AS vlPercMunicipal,'
      '       dt_validade     AS dtValidade,'
      '       dt_vigencia_ini AS dtVigenciaIni,'
      '       dt_vigencia_fim AS dtVigenciaFim,'
      '       versao          AS deVersao'
      '  FROM aliqIbpt'
      ' WHERE codigo_clasFisc = :cdClassifFiscal '
      ' ORDER BY sigla_estado')
    Left = 393
    Top = 127
    ParamData = <
      item
        Name = 'CDCLASSIFFISCAL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qyItem: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT TRIM(a.item)      AS cdItem,'
      '       TRIM(a.descricao) AS deItem,'
      '       a.item_ativo      AS flAtivo,'
      '       CASE'
      '         WHEN TRIM(a.tipo_item) = '#39'T'#39' THEN'
      '           3'
      '         WHEN TRIM(a.tipo_item) = '#39'F'#39' THEN'
      '           2'
      '         ELSE'
      '           1       '
      
        '       END               AS cdItemTipo, --C=Compra | F=Faturado ' +
        '| T=Terceirizado'
      '       a.sigla_unidade   AS cdUnidadeMedida,'
      '       a.codigo_grItem   AS cdItemGrupo,'
      '       a.codigo_subItem  AS cdItemSubGrupo,'
      '       a.codigo_familia  AS cdItemFamilia,'
      '       a.codigo_item_ean AS cdEan,'
      '       a.origem_item     AS cdItemOrigem, '
      '       a.codigo_clasfisc AS cdClassifFiscal,'
      '       a.tipo_icms       AS cdIcmsSitTrib,      '
      '       a.per_red_icms    AS vlPercIcmsReducao,'
      '       a.per_icms        AS vlPercIcms,'
      '       b.cst_icms_entra  AS cdIcmsSitTribCstEnt,'
      '       a.tipo_ipi        AS cdIpiTipo,'
      '       a.per_ipi         AS vlPercIpi,     '
      '       a.tipo_pis        AS cdPisTipo,'
      '       a.tipo_cofins     AS cdCofinsTipo,'
      '       CASE'
      '         WHEN TRIM(a.flag_tipo_prod) = '#39'R'#39' THEN'
      '           '#39'S'#39
      '         ELSE'
      '           '#39'N'#39'       '
      
        '       END               AS flItemRevenda, -- P=Produ'#231#227'o Pr'#243'pria' +
        ' | R=Revenda'
      '       a.codigo_cCusto   AS cdCentroCusto,'
      '       c.descricao       AS deCentroCusto,'
      
        '       CAST(TRIM(a.ref_comercial) AS VARCHAR(20)) AS cdItemComer' +
        'cial'
      '  FROM item a'
      '  LEFT JOIN itemE  b ON (b.item = a.item)'
      '  LEFT JOIN cCusto c ON (c.codigo_cCusto = a.codigo_cCusto)'
      '   &filtro'
      ' ORDER BY a.tipo_item, a.item')
    Left = 313
    Top = 183
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyVariavelItens: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT codigo_variavel AS cdVariavel,'
      '       seq             AS cdVariavelItem,'
      '       valor           AS deValor,'
      '       mascara         AS deMascara'
      '  FROM valorVar'
      ' &filtro '
      ' ORDER BY codigo_variavel, seq')
    Left = 398
    Top = 184
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyVinculoItem: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT a.item,'
      '               SUBSTR(a.item, 1, LENGTH(a.item) - 5) AS cdItem,'
      '               a.codigo_variavel AS cdVariavel,'
      '               c.nome            AS deVariavel,'
      '               a.valorVar        AS cdVariavelSeq,'
      '               b.valor           AS deVariavelSeq,'
      '               b.mascara         AS deMascara '
      '          FROM vincItem a '
      
        '         INNER JOIN valorVar b ON (b.codigo_variavel = a.codigo_' +
        'variavel AND b.seq = a.valorVar) '
      
        '         INNER JOIN variavel c ON (c.codigo_variavel = a.codigo_' +
        'variavel) '
      '         ORDER BY a.item,'
      '                  a.codigo_variavel'
      '       ) t'
      ' &filtro')
    Left = 294
    Top = 8
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyTitulo: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT d.* --SUM(d.vlTotal - d.vlPagto)'
      '  FROM ('
      '        SELECT t.nro_titulo       AS nuTitulo,'
      '               t.serie_titulo     AS nuSerie,'
      '               t.codigo_tipoDoc   AS cdTipoDoc,'
      '               td.descricao       AS deTipoDoc,'
      '               t.situacao_titulo  AS flSituacao,'
      '               t.codigo_cliente   AS cdCliente,'
      '               c.razao_social     AS deRazaoSocialCli,'
      '               c.fantasia         AS nmFantasiaCli,'
      '               c.sigla_estado     AS sgEstadoCli,'
      '               c.cidade           AS nmCidadeCli,'
      '               t.codigo_repres    AS cdRepresentante,'
      '               r.razao_social     AS deRazaoSocialRep,'
      '               r.fantasia         AS nmFantasiaRep,'
      '               t.codigo_banco     AS cdBanco,'
      '               b.fantasia         AS deBanco,'
      '               t.codigo_tipoCob   AS cdTipoCobranca,'
      '               tc.sigla_cobranca  AS deSiglaCobranca,'
      '               tc.descricao       AS deTipoCobranca,'
      '               t.dt_emissao       AS dtEmissao,'
      '               DAYS(:dtDiaVcto) - '
      '               DAYS(t.dt_vcto)    AS nuDiasVect,'
      '               t.dt_vcto          AS dtVencto,'
      '               t.vl_total         AS vlTotal,'
      '               t.vl_total - '
      '               t.vl_pgto          AS vlSaldoReceb,'
      '               t.vl_pgto          AS vlPagto,'
      '               t.vl_juros         AS vlJuros,'
      '               t.vl_dcto          AS vlDocto,'
      '               t.vl_base_comiss   AS vlBaseComissao,'
      '               t.vl_comissao      AS vlComissao'
      '          FROM titulo t'
      
        '         INNER JOIN cliente c  ON (c.codigo_cliente = t.codigo_c' +
        'liente) '
      
        '         INNER JOIN repres  r  ON (r.codigo_repres = t.codigo_re' +
        'pres) '
      
        '          LEFT JOIN tipoCob tc ON (tc.codigo_tipoCob = t.codigo_' +
        'tipoCob)'
      
        '          LEFT JOIN tipoDoc td ON (td.codigo_tipoDoc = t.codigo_' +
        'tipoDoc)'
      
        '          LEFT JOIN banco   b  ON (b.codigo_banco = t.codigo_ban' +
        'co)'
      '       ) d'
      ' &filtro')
    Left = 430
    Top = 8
    ParamData = <
      item
        Name = 'DTDIAVCTO'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyTransportadora: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT x.*'
      '  FROM ('
      'SELECT t.codigo_transp   AS cdTransportadora,'
      '       CASE'
      
        '         WHEN (t.ativa = '#39#39') OR (t.ativa IS NULL) OR (t.ativa = ' +
        #39'S'#39') THEN'
      '           '#39'S'#39
      '         ELSE'
      '           '#39'N'#39
      '       END               AS flAtivo,'
      '       CASE'
      '         WHEN t.tipo_transp = '#39'F'#39' THEN'
      '           t.tipo_transp'
      '         ELSE'
      '           '#39'J'#39
      '       END               AS flFisJur,'
      '       t.cgc             AS deCpfCnpj, --Deixar somente n'#250'meros'
      '       t.razao_social    AS deRazaoSocial,'
      '       t.fantasia        AS nmFantasia,'
      '       CASE'
      '         WHEN t.tipo_transp = '#39'I'#39' THEN'
      '           '#39'S'#39
      '         ELSE'
      '           '#39'N'#39
      '       END               AS flIsentoInscEst,'
      '       t.inscr_estadual  AS nuInscEst,  '
      '       t.telefone_1      AS nuFone1, --Deixar somente n'#250'meros'
      '       t.telefone_2      AS nuFone2, --Deixar somente n'#250'meros'
      '       t.fax             AS nuFax,   --Deixar somente n'#250'meros'
      '       t.e_mail          AS deEmail,'
      '       t.e_mail_nfe      AS deEmailNfe,'
      '       t.contato         AS nmPessoaContato,'
      '       t.observacoes     AS deObservacoes,  '
      '       t.cep             AS nuCep, --Deixar somente n'#250'meros'
      '       t.end             AS deEndereco,'
      '       t.end_nro         AS nuEndereco, --Deixar somente n'#250'meros'
      '       t.compl_end       AS deComplemento,'
      '       t.bairro          AS deBairro,'
      '       t.sigla_estado    AS sgEstado,'
      '       t.cidade          AS nmCidade'
      '  FROM transp t'
      '       ) x'
      ' ORDER BY x.cdTransportadora')
    Left = 430
    Top = 72
  end
  object qyNatureza: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT n.codigo_natureza   AS cdNatureza,'
      '       n.descricao         AS deNatureza,'
      '       n.descricao_fisc    AS deNaturezaFiscal,'
      
        '       n.tipo              AS flNaturezaTipo,       -- E=Entrada' +
        ' | S=Sa'#237'da'
      
        '       n.dentro_estado     AS flDentroEstado,       -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_exportacao = '#39'S'#39' THEN'
      '                n.flag_exportacao'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flExportacao,         -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.possui_drowback = '#39'S'#39' THEN'
      '                n.possui_drowback'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flDrawback,           -- S=Sim | N' +
        '=N'#227'o'
      
        '       n.devolucao         AS flDevolucao,          -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.oper_devolucao = '#39'S'#39' THEN'
      '                n.oper_devolucao'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flDevolucaoOutraOper, -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.consignacao IN('#39'F'#39', '#39'R'#39', '#39'D'#39') THEN'
      '                n.consignacao'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flConsignacao,        -- D=Devolu'#231 +
        #227'o | F=Faturamento | N=N'#227'o | R=Remessa'
      '       CAST('
      '            CASE'
      '              WHEN n.venda_futura = '#39'S'#39' THEN'
      '                n.venda_futura'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flVendaFutura,        -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.oper_triangular = '#39'S'#39' THEN'
      '                n.oper_triangular'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flOperacaoTriangular, -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_bonif = '#39'S'#39' THEN'
      '                n.flag_bonif'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flBonificacao,        -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_servico = '#39'S'#39' THEN'
      '                n.flag_servico'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flNaturezaServico,    -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.nat_transporte = '#39'S'#39' THEN'
      '                n.nat_transporte'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flNaturezaTransporte, -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.vend_ord_zerada = '#39'S'#39' THEN'
      '                n.vend_ord_zerada'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flVendaOrdemSemValor, -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.venda_org_publ = '#39'S'#39' THEN'
      '                n.venda_org_publ'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flVendaOrgaoPublico,  -- S=Sim | N' +
        '=N'#227'o'
      '       n.tipo_ipi          AS cdIpiTipo,'
      '       CAST('
      '            CASE'
      '              WHEN n.icms_incide_ipi = '#39'S'#39' THEN'
      '                n.icms_incide_ipi'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIpiIncideIcms,      -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.ipi_incide_pc = '#39'S'#39' THEN'
      '                n.ipi_incide_pc'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIpiIncidePisCofins, -- S=Sim | N' +
        '=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.cred_ipi_50 = '#39'S'#39' THEN'
      '                n.cred_ipi_50'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIpiCred50Perc,      -- S=Sim | N' +
        '=N'#227'o'
      
        '       n.tipo_icms         AS cdIcmsTipo,           -- 0=Tributa' +
        'do | 1=Isento | 2=Outros'
      '       n.tipo_sit_trib     AS cdIcmsSitTrib,'
      '       n.sit_trib_simp     AS cdIcmsSitTribSimples,'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_partilha = '#39'S'#39' THEN'
      '                n.flag_partilha'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsCalcPartSimples, -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_ap_cr_icms = '#39'S'#39' THEN'
      '                n.flag_ap_cr_icms'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsMsgAprovCred,    -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.calc_subst IN('#39'S'#39', '#39'C'#39', '#39'P'#39') THEN'
      '                n.calc_subst'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsCalcSubstTrib,   -- C=Consum' +
        'idor Final | N=N'#227'o | P=Calcula S.T. para pessoa f'#237'sica | S=Sim'
      '       n.perc_red_subst    AS vlIcmsPercReducaoSubst,'
      '       CAST('
      '            CASE'
      '              WHEN n.tipo_reducao IN('#39'D'#39', '#39'I'#39', '#39'V'#39') THEN'
      '                n.tipo_reducao'
      '              ELSE'
      '                NULL'
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsReducaoTipo,     -- D=Diferi' +
        'mento | I=Isen'#231#227'o | V=Apenas no valor do ICMS'
      '       n.per_red_icms      AS vlIcmsReducaoPerc,'
      '       CAST('
      '            CASE'
      '              WHEN n.calc_reducao = '#39'S'#39' THEN'
      '                n.calc_reducao'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsReducaoCalc,     -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.calc_st_uso_con IN('#39'S'#39', '#39'1'#39') THEN'
      '                n.calc_st_uso_con'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsCalcStUsoCon,    -- 1=Sim(DI' +
        'FAL RS) | S=Sim | N=N'#227'o'
      '       n.per_desc_icms     AS vlIcmsDesconto,'
      '       CAST('
      '            CASE'
      '              WHEN n.credita_icms = '#39'S'#39' THEN'
      '                n.credita_icms'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIcmsDebCreLivros,    -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.gera_financeiro = '#39'S'#39' THEN'
      '                n.gera_financeiro'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flMovFinanceiro,       -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.gera_mv_fiscal = '#39'S'#39' THEN'
      '                n.gera_mv_fiscal'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flMovFiscal,           -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.gera_fatur = '#39'S'#39' THEN'
      '                n.gera_fatur'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flFaturamento,         -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.gera_mv_estoque = '#39'S'#39' THEN'
      '                n.gera_mv_estoque'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flMovEstoque,          -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.gera_est_terc = '#39'S'#39' THEN'
      '                n.gera_est_terc'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flEstoqueTerceiros,    -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.estoq_armazem = '#39'S'#39' THEN'
      '                n.estoq_armazem'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flEstoqueArmazenagem,  -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.entra_calc_rent = '#39'S'#39' THEN'
      '                n.entra_calc_rent'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flEntraCalcRentab,     -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.abate_rentab = '#39'S'#39' THEN'
      '                n.abate_rentab'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flAbateRentab,         -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.cons_sisDeclara = '#39'S'#39' THEN'
      '                n.cons_sisDeclara'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flConsideraSisDec,     -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.msg_lei_transp = '#39'S'#39' THEN'
      '                n.msg_lei_transp'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flMsgLeiTransp,        -- S=Sim | ' +
        'N=N'#227'o'
      '       n.tipo_pis          AS cdPisTipo,'
      '       n.tipo_cofins       AS cdCofinsTipo,'
      
        '       n.tipo_cont_soc     AS cdContribSocialTipo,   -- 0=Tribut' +
        'ado | 1=Isento | 2=Outros'
      
        '       n.tipo_ir           AS cdImpostoRendaTipo,    -- 0=Tribut' +
        'ado | 1=Isento | 2=Outros'
      '       CAST('
      '            CASE'
      '              WHEN n.utl_cont_terc = '#39'S'#39' THEN'
      '                n.utl_cont_terc'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flUtilizaControleTerc, -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.gera_vl_bonif = '#39'S'#39' THEN'
      '                n.gera_vl_bonif'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flGeraValorCalcBonif,  -- S=Sim | ' +
        'N=N'#227'o'
      
        '       n.codigo_operacao   AS cdOperSisDeclara,      -- Nas comp' +
        'ras de fornecedores com N'#250'mero de Produtor, deixar este campo em' +
        ' branco.'
      '       CAST('
      '            CASE'
      '              WHEN n.movimenta_selos = '#39'S'#39' THEN'
      '                n.movimenta_selos'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flMovSelos,            -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_usoConsumo = '#39'S'#39' THEN'
      '                n.flag_usoConsumo'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flOperSemCredSt,       -- S=Sim | ' +
        'N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.usoConsumo_ipi = '#39'S'#39' THEN'
      '                n.usoConsumo_ipi'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flOperSemCredIpi,      -- S=Sim | ' +
        'N=N'#227'o'
      
        '       n.base_pis          AS cdPisBase,             -- 1=Soma |' +
        ' 2=Abate | 3=N'#227'o Considera'
      
        '       n.base_cofins       AS cdCofinsBase,          -- 1=Soma |' +
        ' 2=Abate | 3=N'#227'o Considera'
      
        '       n.base_simples      AS cdSimplesBase,         -- 1=Soma |' +
        ' 2=Abate | 3=N'#227'o Considera'
      '       CAST('
      '            CASE'
      '              WHEN n.flag_pis_cofins = '#39'S'#39' THEN'
      '                n.flag_pis_cofins'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flIsencaoPisCofins,    -- S=Sim | ' +
        'N=N'#227'o'
      '       n.per_pis           AS vlPercPis,'
      '       n.per_cofins        AS vlPercCofins,'
      '       CAST('
      '            CASE'
      '              WHEN n.retem_servico = '#39'S'#39' THEN'
      '                n.retem_servico'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flRetencaoPisCofinsCsll, -- S=Sim ' +
        '| N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.abat_pisCof_tit = '#39'S'#39' THEN'
      '                n.abat_pisCof_tit'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flAbatePisCofinsTitNf,   -- S=Sim ' +
        '| N=N'#227'o'
      '       n.per_abate_pis     AS vlPercAbatPisTitNf,'
      '       n.per_abat_cofins   AS vlPercAbatCofinsTitNf,'
      '       CAST('
      '            CASE'
      '              WHEN n.monof_simples = '#39'S'#39' THEN'
      '                n.monof_simples'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flProdMonofasSn,         -- S=Sim ' +
        '| N=N'#227'o'
      '       CAST('
      '            CASE'
      '              WHEN n.abate_465_tit IN('#39'S'#39', '#39'R'#39', '#39'T'#39') THEN'
      '                n.abate_465_tit'
      '              ELSE'
      '                NULL'
      '            END AS CHAR(1)'
      
        '           )               AS flAbateRetencao, -- R=N'#227'o abate no' +
        's t'#237'tulos/nota, mas ret'#233'm no recebimento | S=Sim (abate na nota ' +
        'e nos t'#237'tulos) | T=Abate somente nos t'#237'tulos'
      '       n.per_icms          AS vlPercIcms,'
      '       CAST('
      '            CASE'
      '              WHEN n.dif_icms = '#39'S'#39' THEN'
      '                n.dif_icms'
      '              ELSE'
      '                '#39'N'#39
      '            END AS CHAR(1)'
      
        '           )               AS flDiferencaIcms,         -- S=Sim ' +
        '| N=N'#227'o'
      '       n.cod_ipi           AS cdIpiCodigo,'
      '       n.cod_enq_ipi       AS cdIpiEnquadramento,'
      '       n.cod_pis           AS cdPisCodigo,'
      '       n.cod_cofins        AS cdCofinsCodigo'
      '  FROM natureza n'
      ' ORDER BY n.codigo_natureza')
    Left = 366
    Top = 8
  end
  object qyCentroCusto: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT codigo_cCusto AS cdCentroCusto,'
      '               descricao     AS deCentroCusto'
      '          FROM cCusto '
      '         ORDER BY codigo_cCusto'
      '       ) t'
      ' &filtro')
    Left = 25
    Top = 247
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyItemGrupo: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT codigo_grItem AS cdItemGrupo,'
      '               descricao     AS deItemGrupo'
      '          FROM grItem '
      '         ORDER BY codigo_grItem'
      '       ) t'
      ' &filtro')
    Left = 97
    Top = 247
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyItemSubGrupo: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT codigo_grItem  AS cdItemGrupo,'
      '               codigo_sgrItem AS cdItemSubGrupo,'
      '               descricao      AS deItemSubGrupo'
      '          FROM sgrItem '
      '         ORDER BY codigo_grItem, codigo_sgrItem'
      '       ) t'
      ' &filtro')
    Left = 174
    Top = 247
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyVariavel: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT codigo_variavel AS cdVariavel,'
      '       nome AS deVariavel'
      '  FROM variavel'
      ' &filtro')
    Left = 265
    Top = 247
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyItemCombinacaoVenda: TFDQuery
    Connection = fdConnInteg
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT x.item AS cdItem,'
      '       x.codigo_variavel AS cdVariavel,'
      '       z.seq AS cdVariavelItem,'
      '       z.valor AS deVariavelItem'
      '  FROM vincItem x '
      
        ' INNER JOIN valorVar z ON (z.codigo_variavel = x.codigo_variavel' +
        ' AND z.seq = x.valorVar) '
      ' --WHERE --x.codigo_variavel = 10'
      '   --and x.item = '#39'1001.0001'#39' '
      ' &filtro'
      ' ORDER BY x.item, x.codigo_variavel, z.seq')
    Left = 438
    Top = 247
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyVendasDW: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.cdCliente,'
      '       t.cdRepresentante,'
      '       t.cdCidade,'
      '       t.dtEmissaoNfs,'
      '       t.cdItem,'
      '       t.nuPedido,'
      '       t.tpPedido,'
      '       SUM(t.nuQtd)          AS nuQtdItem,'
      '       SUM(t.vlBrutoItem)    AS vlBrutoItem,'
      '       SUM(t.vlFaturadoItem) AS vlFaturadoItem'
      '  FROM ('
      '        SELECT ip.codigo_cliente  AS cdCliente,'
      '               p.codigo_repres    AS cdRepresentante,'
      '               COALESCE('
      '                        ('
      '                         SELECT cid.codigo_cidade'
      '                           FROM cidade cid'
      '                          WHERE cid.nome_cidade = c.cidade'
      
        '                            AND cid.sigla_estado = c.sigla_estad' +
        'o'
      '                        ), 0'
      '                       )          AS cdCidade,'
      
        '               p.dt_emissao_nfs   AS dtEmissaoNfs,              ' +
        ' '
      '               TRIM(ip.item)      AS cdItem,'
      '               p.nro_pedido       AS nuPedido,'
      '               p.tipo_pedido      AS tpPedido,'
      '               ip.qtde_solicitada AS nuQtd,'
      
        '               COALESCE((ip.vl_bruto - ip.vl_unitario) * ip.qtde' +
        '_solicitada, 0) +'
      
        #9'                      COALESCE((p.vl_dcto_nfs/p.total_itens), 0' +
        ') AS vlDesc,'
      #9'                      ip.vl_bruto * '
      '               ip.qtde_solicitada AS vlBrutoItem,'
      '               CASE'
      
        '                 WHEN (ip.vl_bruto * ip.qtde_solicitada)*70/100 ' +
        '= (COALESCE((ip.vl_bruto - ip.vl_unitario) * ip.qtde_solicitada,' +
        ' 0) +'
      
        '                       COALESCE((p.vl_dcto_nfs/p.total_itens), 0' +
        ')) then'
      '                   (ip.vl_bruto * ip.qtde_solicitada)'
      '                 ELSE'
      
        '                   ip.vl_total - COALESCE((p.vl_dcto_nfs/p.total' +
        '_itens), 0)'
      '               END                AS vlFaturadoItem'
      '          FROM pedido p '
      '         INNER JOIN itemPed ip ON (ip.nro_pedido = p.nro_pedido)'
      
        '         INNER JOIN cliente c  ON (c.codigo_cliente = p.codigo_c' +
        'liente)'
      '         WHERE p.status_pedido = '#39'T'#39
      '           AND p.dt_emissao_nfs BETWEEN :dtIni AND :dtFim'
      '      ) t'
      ' GROUP BY t.cdCliente,'
      '          t.cdRepresentante,'
      '          t.cdCidade,'
      '          t.dtEmissaoNfs,'
      '          t.cdItem,'
      '          t.nuPedido,'
      '          t.tpPedido')
    Left = 502
    Top = 184
    ParamData = <
      item
        Name = 'DTINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object qyPedidoAgrup: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      ' SELECT t.*'
      '  FROM ('
      '        SELECT p.dt_emissao       AS dtEmissao,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao, '#39'MM/YYYY'#39') AS V' +
        'ARCHAR(7)) AS deCompEmissao,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao, '#39'YYYY/MM'#39') AS V' +
        'ARCHAR(7)) AS deOrdCompEmis,'
      '               pa.pedido_ori      AS nuPedido,'
      '               p.tipo_pedido      AS tpPedido,'
      
        '               CAST('#39'L'#39' AS VARCHAR(1)) AS status_pedido, --p.sta' +
        'tus_pedido,'
      '               p.dt_reg,'
      '               p.dcto_1           AS vlPercDesc,'
      '               p.periodo          AS dePeriodo,'
      '               p.codigo_grFat     AS cdGrupoFat,'
      '               gf.descricao       AS deGrupoFat,'
      '               ip.seq,'
      '               ip.item,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 5'
      '               ), '#39#39') AS deMascTam,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 10  '
      '               ), '#39#39') AS deMascCor,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 10  '
      '               ), '#39#39') AS deVarSeqCor,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 15  '
      '               ), '#39#39') AS deMascAlca,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 15  '
      '               ), '#39#39') AS deVarSeqAlca,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 19  '
      '               ), '#39#39') AS deMascAdorno,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 19  '
      '               ), '#39#39') AS deVarSeqAdorno,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 20  '
      '               ), '#39#39') AS deMascChaveta,'
      '               COALESCE(('
      '                SELECT z.valor  '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 20  '
      '               ), '#39#39') AS deVarSeqChaveta,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 25  '
      '               ), '#39#39') AS deMascForracao,'
      '               COALESCE(('
      '                SELECT z.valor '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 25  '
      '               ), '#39#39') AS deVarSeqForracao,'
      '               COALESCE(('
      '                SELECT z.mascara '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 30  '
      '               ), '#39#39') AS deMascImagem,'
      '               COALESCE(('
      '                SELECT z.valor '
      '                  FROM vincItem x '
      
        '                 INNER JOIN valorVar z ON (z.codigo_variavel = x' +
        '.codigo_variavel AND z.seq = x.valorVar) '
      '                 WHERE x.item = ip.item '
      '                   AND x.codigo_variavel = 30  '
      '               ), '#39#39') AS deVarSeqImagem,'
      '            /*   CAST('
      '               TRIM(SUBSTR(ip.item, '
      '                           1, '
      '                           CASE'
      '                             WHEN EXISTS ('
      '                                          SELECT vi.recNum'
      '                                            FROM vincItem vi'
      
        '                                           WHERE vi.item = ip.it' +
        'em'
      
        '                                         ) AND LENGTH(TRIM(ip.it' +
        'em)) - 5 >= 0 THEN'
      '                               LENGTH(TRIM(ip.item)) - 5'
      '                             ELSE'
      '                               LENGTH(TRIM(ip.item))'
      '                           END'
      '                          )'
      '                   ) AS VARCHAR(20)) AS cdItem,*/'
      
        '               CAST(TRIM(i.ref_comercial) AS VARCHAR(20)) AS cdI' +
        'tem,'
      '               CAST('
      '                    CASE'
      
        '                      WHEN (POSITION('#39'.12'#39', i.ref_comercial, OCT' +
        'ETS) > 0) OR'
      '                           ('
      
        '                            (SUBSTR(i.ref_comercial, 1, 1) = '#39'8'#39 +
        ') AND'
      
        '                            (SUBSTR(i.ref_comercial, 2, 1) = SUB' +
        'STR(i.ref_comercial, 5, 1))'
      '                           ) OR'
      '                           ('
      
        '                            (SUBSTR(i.ref_comercial, 3, 1) = '#39'7'#39 +
        ') AND'
      
        '                            (SUBSTR(i.ref_comercial, 1, 1) = SUB' +
        'STR(i.ref_comercial, '
      
        '                                                                ' +
        '    CASE '
      
        '                                                                ' +
        '      WHEN SUBSTR(i.ref_comercial, LENGTH(i.ref_comercial)-1, 1)' +
        ' = '#39'.'#39' THEN'
      
        '                                                                ' +
        '        LENGTH(i.ref_comercial)-2'
      
        '                                                                ' +
        '      ELSE'
      
        '                                                                ' +
        '        LENGTH(i.ref_comercial)'
      
        '                                                                ' +
        '    END, '
      
        '                                                                ' +
        '    1'
      
        '                                                                ' +
        '   )'
      '                            )'
      '                      ) THEN'
      '                        '#39'S'#39
      '                      ELSE'
      '                        '#39'N'#39
      '                    END AS CHAR(1)'
      '                   ) AS flEhPontoDoze,'
      '               i.descricao,'
      '               ip.codigo_repres   AS cdRep,'
      '               r.razao_social     AS deRep,'
      '               ip.codigo_cliente,'
      '               c.razao_social     AS deRazaoSocial,'
      '               c.fantasia         AS deFantasia,'
      '               c.cgc,'
      '               COALESCE('
      '                        ('
      '                         SELECT cid.codigo_cidade'
      '                           FROM cidade cid'
      '                          WHERE cid.nome_cidade = c.cidade'
      
        '                            AND cid.sigla_estado = c.sigla_estad' +
        'o'
      '                        ), 0'
      '                       )          AS cdCidade,'
      '               c.cidade           AS deCidade,'
      '               c.bairro,'
      '               c.cep,'
      '               c.end,'
      '               c.end_nro          AS nuEndereco,'
      '               c.sigla_estado     AS sgUf,'
      '               c.compl_end        AS deComplEnd,'
      '               c.cep              AS nuCep,'
      '               c.e_mail           AS deEmail,'
      '               COALESCE(p.vl_dcto_vp, 0) +'
      '               COALESCE(p.vl_dcto_nfs, 0) AS vlDescNfs,'
      '               ip.qtde_solicitada AS nuQtd,'
      '               ip.vl_unitario,'
      '               ip.vl_bruto,'
      '               ip.vl_lucro,'
      '               ip.vl_margem, '
      
        '               ip.vl_total - COALESCE((p.vl_dcto_nfs/p.total_ite' +
        'ns), 0) AS vlTotalItem,'
      '               p.vl_total,'
      '               p.total_itens AS nuQtdDeItens,'
      
        '               COALESCE((ip.vl_bruto - ip.vl_unitario) * ip.qtde' +
        '_solicitada, 0) +'
      '               COALESCE(((COALESCE(p.vl_dcto_vp, 0) +'
      
        '               COALESCE(p.vl_dcto_nfs, 0))/p.total_itens), 0) AS' +
        ' vlDesc,'
      '               ip.vl_bruto * '
      '               ip.qtde_solicitada AS vlTotBruto,'
      '               CASE'
      
        '                 WHEN (ip.vl_bruto * ip.qtde_solicitada)*70/100 ' +
        '= (COALESCE((ip.vl_bruto - ip.vl_unitario) * ip.qtde_solicitada,' +
        ' 0) +'
      
        '                       COALESCE((p.vl_dcto_nfs/p.total_itens), 0' +
        ')) then'
      '                   (ip.vl_bruto * ip.qtde_solicitada)'
      '                 ELSE'
      
        '                   ip.vl_total - COALESCE((p.vl_dcto_nfs/p.total' +
        '_itens), 0)'
      '               END AS vlFaturado,'
      '               CAST('
      '                    CASE'
      
        '                      WHEN ROUND((ip.vl_bruto * ip.qtde_solicita' +
        'da)*70/100, 2) = ROUND((COALESCE((ip.vl_bruto - ip.vl_unitario) ' +
        '* ip.qtde_solicitada, 0) +'
      
        '                            COALESCE((p.vl_dcto_nfs/p.total_iten' +
        's), 0)), 2) then'
      '                        '#39'S'#39
      '                      ELSE'
      '                        '#39'N'#39
      '                    END AS CHAR(1)'
      '                   ) AS flDesc70,'
      '               p.codigo_banco,'
      '               b.razao_social     AS nmBanco,'
      '               p.tipo_cobranca,'
      '               CASE'
      '                 WHEN p.tipo_cobranca IN(1, 2) THEN'
      '                   '#39'DUPLICATAS'#39
      '                 ELSE'
      '                   tc.descricao '
      '               END AS deCobranca,'
      '               CASE'
      
        '                 WHEN p.prazo_1 > 0 OR p.prazo_2 > 0 OR p.prazo_' +
        '3 > 0 OR p.prazo_4 > 0 OR p.prazo_5 > 0 OR '
      
        '                      p.prazo_6 > 0 OR p.prazo_7 > 0 OR p.prazo_' +
        '8 > 0 OR p.prazo_9 > 0 OR p.prazo_10 > 0 OR '
      '                      p.prazo_11 > 0 OR p.prazo_12 > 0 THEN'
      '                   CAST('#39'Prazo: '#39' AS VARCHAR(10))'
      '                 ELSE'
      '                   '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_1 > 0 THEN'
      '                   CAST(p.prazo_1 AS VARCHAR(10))'
      '                 ELSE'
      '                   '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_2 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_2 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_3 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_3 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_4 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_4 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_5 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_5 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_6 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_6 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_7 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_7 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_8 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_8 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_9 > 0 THEN'
      '                   CAST('#39'-'#39' || p.prazo_9 AS VARCHAR(10)) ELSE '#39#39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_10 > 0 THEN'
      
        '                   CAST('#39'-'#39' || p.prazo_10 AS VARCHAR(10)) ELSE '#39 +
        #39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_11 > 0 THEN'
      
        '                   CAST('#39'-'#39' || p.prazo_11 AS VARCHAR(10)) ELSE '#39 +
        #39
      '               END ||       '
      '               CASE'
      '                 WHEN p.prazo_12 > 0 THEN'
      
        '                   CAST('#39'-'#39' || p.prazo_12 AS VARCHAR(10)) ELSE '#39 +
        #39
      '               END AS dePrazo, '
      '/*               COALESCE('
      '                        ('
      '                         SELECT SUM(t.vl_total - t.vl_pgto)'
      
        #9#9'                  --select * FROM titulo t where  codigo_clien' +
        'te=80'
      '                           FROM titulo t '
      
        '        '#9#9'   LEFT OUTER JOIN nfs n ON (n.nro_titulo = t.nro_titu' +
        'lo AND n.nro_nfs <> p.nro_nfs)'
      #9#9'          WHERE t.codigo_cliente = p.codigo_cliente'
      #9#9'            AND t.situacao_titulo NOT IN('#39'P'#39', '#39'C'#39')'
      #9#9'            AND t.codigo_tipoDoc <> 4'
      #9#9'            --AND t.dt_emissao <= CURRENT_DATE'
      #9#9'            AND t.dt_vcto <= CURRENT_DATE'
      '                        ),'
      '                        0'
      '                       ) AS vlDevido,'
      '               COALESCE('
      '                        ('
      
        '                         SELECT SUM(ad.valor_adiantado - ad.valo' +
        'r_abatido)'
      #9#9'                   FROM adianta ad  '
      #9#9'                  WHERE ad.cliente_fornec = p.codigo_cliente'
      #9#9'                    AND ad.data <= CURRENT_DATE'
      '                        ),'
      '                        0'
      '                       ) AS vlCredito,'
      '*/'
      '               p.observacao_3 AS deObs3,'
      '               p.observacao_4 AS deObs4,'
      
        '               TRIM(COALESCE(TRIM(p.observacao_1), '#39#39') || '#39' '#39' ||' +
        ' '
      '               COALESCE(TRIM(p.observacao_2), '#39#39'))  AS deObsPed,'
      
        '               TRIM(COALESCE(TRIM(p.observacao_3), '#39#39') || '#39' '#39' ||' +
        ' '
      '               COALESCE(TRIM(p.observacao_4), '#39#39'))  AS deObs,'
      '               c.observacoes                        AS deObsCli,'
      
        '               CAST(TRIM(COALESCE(TRIM(p.observacao_1), '#39#39') || '#39 +
        ' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_2), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_3), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_4), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_5), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_6), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_7), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_8), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_9), '#39#39') || '#39' '#39' || '
      #9'            COALESCE(TRIM(p.observacao_10), '#39#39')'
      #9'           ) AS CHARACTER VARYING(4000)) AS deObsCompleta,'
      '               COALESCE(gp.codigo_grupoPed, 0)      AS cdCarga,'
      '               COALESCE(gp.observacao, '#39'Sem Carga'#39') AS deCarga,'
      '               p.codigo_usuarioD                    AS cdUsuCad,'
      '               uc.nome                              AS deUsuCad,'
      
        '               p.qtde_total                         AS nuTotIten' +
        's,'
      
        '               p.codigo_natureza                    AS deNaturez' +
        'a,'
      
        '               p.nro_volumes                        AS nuTotVolu' +
        'mes,'
      
        '               p.dt_emissao_nfs                     AS dtEmissao' +
        'Nfs,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao_nfs, '#39'MM/YYYY'#39') ' +
        'AS VARCHAR(7)) AS deCompEmisNfs,'
      
        '               CAST(VARCHAR_FORMAT(p.dt_emissao_nfs, '#39'YYYY/MM'#39') ' +
        'AS VARCHAR(7)) AS deOrdCompEmisNfs,'
      
        '               i.codigo_grItem                      AS cdItemGru' +
        'po,'
      
        '               gi.descricao                         AS deItemGru' +
        'po,'
      
        '               i.codigo_subItem                     AS cdItemSub' +
        'Grupo,'
      
        '               sgi.descricao                        AS deItemSub' +
        'Grupo,'
      
        '               c.inscr_estadual                     AS nuInscEst' +
        ','
      '               p.nro_nfs                            AS nuNfs,'
      '               ('
      '                SELECT x.imagem'
      '                  FROM item x'
      '                 WHERE x.item = i.ref_comercial'
      
        '               )                                    AS dePathImg' +
        'Item,'
      
        '               i.flag_tipo_prod                     AS flTipoPro' +
        'duto,'
      '               p.valor_frete                        AS vlFrete,'
      '               CAST(COALESCE('
      '                             ('
      '                              SELECT COALESCE(tip.linha_01, '#39#39') '
      '                                FROM textoPed tip '
      
        '                               WHERE tip.nro_pedido = p.nro_pedi' +
        'do '
      '                                 AND tip.seq = ip.seq'
      '                             ), '#39#39
      '                            ) AS VARCHAR(500)'
      '                   ) AS deItemTexto01,'
      '               CAST(COALESCE('
      '                             ('
      '                              SELECT COALESCE(tip.linha_02, '#39#39')'
      '                                FROM textoPed tip '
      
        '                               WHERE tip.nro_pedido = p.nro_pedi' +
        'do '
      '                                 AND tip.seq = ip.seq'
      '                             ), '#39#39
      '                            ) AS VARCHAR(500)'
      '                   ) AS deItemTexto02,'
      '               CAST(COALESCE('
      '                             ('
      '                              SELECT COALESCE(tip.linha_03, '#39#39')'
      '                                FROM textoPed tip '
      
        '                               WHERE tip.nro_pedido = p.nro_pedi' +
        'do '
      '                                 AND tip.seq = ip.seq'
      '                             ), '#39#39
      '                            ) AS VARCHAR(500)'
      '                   ) AS deItemTexto03,'
      '               c.codigo_grCli   AS cdGrupoCli,'
      '               r.e_mail         AS deEmailRep'
      '          FROM pedAgrup pa'
      
        '         INNER JOIN pedido         p   ON (p.nro_pedido = pa.ped' +
        'ido_ori) '
      
        '         INNER JOIN itemPed        ip  ON (ip.nro_pedido = p.nro' +
        '_pedido)'
      
        '         INNER JOIN cliente        c   ON (c.codigo_cliente = p.' +
        'codigo_cliente)'
      
        '         INNER JOIN repres         r   ON (r.codigo_repres = p.c' +
        'odigo_repres)'
      
        '         INNER JOIN grFat          gf  ON (gf.codigo = p.codigo_' +
        'grFat)'
      '         INNER JOIN item           i   ON (i.item = ip.item)'
      
        '          LEFT OUTER JOIN banco    b   ON (b.codigo_banco = p.co' +
        'digo_banco)'
      
        '          LEFT OUTER JOIN tipoCob  tc  ON (tc.codigo_tipocob = p' +
        '.tipo_cobranca)'
      
        '          LEFT OUTER JOIN grupoPed gp  ON (gp.nro_pedido = p.nro' +
        '_pedido)'
      
        '          LEFT OUTER JOIN usuario  uc  ON (uc.codigo_usuario = p' +
        '.codigo_usuarioD)'
      
        '          LEFT OUTER JOIN grItem   gi  ON (gi.codigo_grItem = i.' +
        'codigo_grItem)'
      
        '          LEFT OUTER JOIN sgrItem  sgi ON (sgi.codigo_grItem = i' +
        '.codigo_grItem AND sgi.codigo_sgrItem = i.codigo_subItem)'
      '      ) t  '
      '  &filtro')
    Left = 542
    Top = 8
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyCotaFin: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT cf.codigo_repres AS cdRepresentante,'
      '               r.razao_social   AS deRep,'
      '               cf.periodo       AS dePeriodo,'
      '               cf.vl_prev       AS vlPrevisto'
      '          FROM cotaFina cf'
      
        '         INNER JOIN repres r ON (r.codigo_repres = cf.codigo_rep' +
        'res)'
      '      ) t  '
      '  &filtro')
    Left = 534
    Top = 72
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyCarga: TFDQuery
    Connection = fdConnInteg
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT gp.codigo_grupoPed AS cdCarga,'
      '               gp.observacao      AS deCarga,'
      '               gp.nro_pedido      AS nuPedido'
      '          FROM grupoPed gp'
      '      ) t '
      '  &filtro'
      ' ORDER BY t.cdCarga DESC')
    Left = 526
    Top = 128
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'cdCarga'
    end
    object StringField1: TStringField
      FieldName = 'deCarga'
      Size = 200
    end
    object qyCarganuPedido: TIntegerField
      FieldName = 'nuPedido'
    end
  end
end
