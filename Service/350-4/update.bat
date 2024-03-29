@set caller=0
@set version2="60012462"
@set version3="6.0.0.12462"
@set sversion2c=1800341
@set sversion3c="1.8.0.0341"
@set tam7z=227328
CLS
if %code%==350-4 (
@set translationof="Dawn of War - Soulstorm"
@set tam="3,47"
@set totaltam=3643723
@set installedsize="61,21"
@set hash=D41828409DDCD882B44DCD3A211DE6CE8D8DACCA490C4B2C7DE0841C44011EBB
@set file=SSBR.7z
@set changelog=- Tradu��o: Algumas mudan�as.\n - Atualizador: Corre��es de erros.\n - Interface: Algumas mudan�as visuais, Corrigido um problema com escalas superiores a 100\p\ no Windows 10, a interface do atualizador se ajusta automaticamente � escala\in\Experimental\out\.\n - Instalador\Atualizador: Melhorias gerais.\n - Servidor: Melhorias gerais.
)
CLS
@set secundarysvr=https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Update/%file%
@set primarysvr=https://translategames.com.br/updater/download/%code%
@set secundarysvrS=https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Update/%file%
@set primarysvrS=https://translategames.com.br/updater/download/%code%
@set timer=%timer%%caller%
@set limiter=%limiter%%caller%
@set ERROS=%caller%
@set FATOR=1
@set sversion2=%sversion2c%%caller%
@set sversion=%sversion%%caller%
@set showcl=1%caller%
@set mode=%mode%2
@set silent=%silent%2
@set tamanho=%caller%
CLS
if %limiter%==Ilimitadot0 (
@set Slimit=
) else if %limiter%==50kt0 (
@set Slimit= --limit-rate=50k
) else if %limiter%==100kt0 (
@set Slimit= --limit-rate=100k
) else if %limiter%==300kt0 (
@set Slimit= --limit-rate=300k
) else if %limiter%==500kt0 (
@set Slimit= --limit-rate=500k
) else if %limiter%==1mt0 (
@set Slimit= --limit-rate=1m
) else if %limiter%==2mt0 (
@set Slimit= --limit-rate=2m
) else if %limiter%==5mt0 (
@set Slimit= --limit-rate=5m
) else (
@set Slimit=
)
if %mode%==install2 (
@set mode=install
) else (
@set mode=update
)
if %silent%==Silent2 (
CLS
goto VVCheckS
) else if %version% gtr "0" (
CLS
title Atualizador%code%t
del UpToDate.vbs
del ErroAOpened.vbs
del ErroDownload.vbs
del ErroHash.vbs
del ErroIConnection.vbs
del ErroInstall.vbs
del ErroVersion.vbs
del UpdateEncontrado.vbs
del UpdateFound.vbs
echo msgbox"A Tradu��o mais recente, j� est� instalada!",vbInformation,"A Tradu��o j� est� atualizada!" > "UpToDate.vbs"
echo msgbox"N�o foi poss�vel obter acesso de Administrador!",vbCritical,"Acesso Negado!" > "ErroAOpened.vbs"
echo msgbox"Ocorreu um erro ao tentar baixar a Atualiza��o!",vbCritical,"Falha ao Baixar" > "ErroDownload.vbs"
echo msgbox"Conex�o Interrompida durante o download da Atualiza��o!",vbCritical,"Conex�o Perdida" > "ErroIConnection.vbs"
echo msgbox"Arquivo necess�rio para iniciar a Instala��o, n�o foi encontrado!",vbCritical,"Falha na Instala��o" > "ErroInstall.vbs"
CLS
goto VVCheck
) else (
CLS
goto exit
)

:VVCheck
if %version% lss %version2% (
CLS
echo 1 > "ProgressBarS.log"
echo 0 > "ChangeLogIV.log"
echo 0 > "StatusPS.log"
goto initCheck
) else (
CLS
echo 100 > "ProgressBarS.log"
goto init
)

:ARCheck
CLS
timeout 2 > NUL
del %file%
echo 1 > "ProgressBarS.log"
echo -0-90- > "ProgressBar.log"
@set showcl=0%caller%
@set sversion=1%caller%
CLS
goto initCheck

:initCheck
CLS
echo 2 > "ProgressBarS.log"
del 7z.temp
del 7zdll.temp
del 7z.dll
FOR %%a in (dir "7z.exe") do (set /a tamanho=%%~za)
if not exist "7z.exe" (
echo 2 > "ProgressBarS.log"
echo %date%-%time% Atualiza��o do 7-Zip necess�ria! >> "UpdateLog.txt"
echo %date%-%time% Baixando... >> "UpdateLog.txt"
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
echo 90 > "ProgressBarS.log"
) else if %tamanho% lss %tam7z% (
echo 2 > "ProgressBarS.log"
echo %date%-%time% Atualiza��o do 7-Zip necess�ria! >> "UpdateLog.txt"
echo %date%-%time% Baixando... >> "UpdateLog.txt"
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
echo 90 > "ProgressBarS.log"
) else if %tamanho% gtr %tam7z% (
echo 2 > "ProgressBarS.log"
echo %date%-%time% Atualiza��o do 7-Zip necess�ria! >> "UpdateLog.txt"
echo %date%-%time% Baixando... >> "UpdateLog.txt"
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
echo 90 > "ProgressBarS.log"
)
FOR %%a in (dir "7z.temp") do (set /a tamanho=%%~za)
if exist "7z.temp" (
CLS
if %tamanho%==%tam7z% (
del 7z.exe
move 7z.temp 7z.exe
) else (
wget.exe http://translategames.com.br/updater/request/7z.temp --output-document=7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
del 7z.exe
move 7z.temp 7z.exe
CLS
)
echo %date%-%time% Atualiza��o Conclu�da! >> "UpdateLog.txt"
echo %date%-%time% Continuando... >> "UpdateLog.txt"
)
echo 90 > "ProgressBarS.log"
if %sversion% lss %sversion2% (
echo 90 > "ProgressBarS.log"
CLS
del UpScript.temp
del UpScript.7z
del UpScript*
CLS
echo %date%-%time% Atualiza��o de complementos do Atualizador encontrada! Vers�o: %sversion3c% >> "UpdateLog.txt"
echo Atualiza��o de complementos do Atualizador encontrada!
CLS
echo %date%-%time% Baixando... >> "UpdateLog.txt"
echo Baixando complementos...
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/UpScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
if not exist "UpScript.temp" (
CLS
wget.exe http://translategames.com.br/updater/request/UpScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
)
echo 95 > "ProgressBarS.log"
if exist "UpScript.temp" (
CLS
move UpScript.temp UpScript.7z
CLS
echo %date%-%time% Extraindo complementos... Vers�o: %sversion3c% >> "UpdateLog.txt"
echo Extraindo Pacotes...
CLS
del error.temp
del HashF.temp
del HashV.temp
del InterfaceMaintainer.temp
del PostInstall.temp
del ProgressData.temp
del ImageData.temp
del UpdaterUI.temp
if exist "error.png" (
move error.png error.temp
)
if exist "Hash.exe" (
move Hash.exe HashF.temp
)
if exist "InterfaceMaintainer.vbs" (
move InterfaceMaintainer.vbs InterfaceMaintainer.temp
)
if exist "PostInstall.vbs" (
move PostInstall.vbs PostInstall.temp
)
if exist "ProgressData.tgpd" (
move ProgressData.tgpd ProgressData.temp
)
if exist "ImageData.tgib64" (
move ImageData.tgib64 ImageData.temp
)
if exist "UpdaterUI.tgapp" (
move UpdaterUI.tgapp UpdaterUI.temp
)
del Progress.hta
del Progress.bat
del Progress.vbs
del ProgressData.tgpd
del Hash.vbs
del tg.png
del db.png
del App.tmp
del App.temp
del Hash.tmp
del ImageData.tmp
del UpdaterUI.tmp
CLS
7z.exe e UpScript.7z -o.\
CLS
title Atualizador%code%t
if not exist "error.png" (
set /a ERROS=ERROS+FATOR
move error.temp error.png
) else (
del error.temp
)
if not exist "Hash.tmp" (
set /a ERROS=ERROS+FATOR
move HashF.temp Hash.exe
) else (
move Hash.tmp Hash.exe
del HashF.temp
)
if not exist "InterfaceMaintainer.vbs" (
set /a ERROS=ERROS+FATOR
move InterfaceMaintainer.temp InterfaceMaintainer.vbs
) else (
del InterfaceMaintainer.temp
)
if not exist "PostInstall.vbs" (
set /a ERROS=ERROS+FATOR
move PostInstall.temp PostInstall.vbs
) else (
del PostInstall.temp
)
if not exist "ImageData.tmp" (
set /a ERROS=ERROS+FATOR
move ImageData.temp ImageData.tgib64
) else (
move ImageData.tmp ImageData.tgib64
del ImageData.temp
)
if not exist "UpdaterUI.tmp" (
set /a ERROS=ERROS+FATOR
move UpdaterUI.temp UpdaterUI.tgapp
) else (
move UpdaterUI.tmp UpdaterUI.tgapp
del UpdaterUI.temp
)
if not exist "App.exe" (
move App.tmp App.exe
) else (
del App.tmp
)
if %ERROS% gtr 0 (
CLS
echo %date%-%time% Extra��o Interrompida. Arquivo Corrompido. >> "UpdateLog.txt"
echo Extra��o Interrompida.
) else (
CLS
echo %date%-%time% Extra��o Conclu�da... >> "UpdateLog.txt"
echo Extra��o Conclu�da...
)
CLS
del UpScript.7z
CLS
echo 100 > "ProgressBarS.log"
timeout -m 500 > NUL
echo %date%-%time% Continuando... >> "UpdateLog.txt"
goto pProgress
) else (
CLS
del UpScript.temp
CLS
echo %date%-%time% Falha ao Baixar complementos! >> "UpdateLog.txt"
echo %date%-%time% Continuando sem Atualiza��o de complementos... >> "UpdateLog.txt"
echo Falha ao Baixar complementos!
goto init
)
) else (
CLS
echo 100 > "ProgressBarS.log"
timeout -m 500 > NUL
goto init
)

:pProgress
CLS
echo code = "%code%" > "PrepareProgress.vbs"
echo FileT= "UpdaterUI.tgapp" >> "PrepareProgress.vbs"
echo Set objFSO2 = CreateObject("Scripting.FileSystemObject") >> "PrepareProgress.vbs"
echo Set objRead2 = objFSO2.OpenTextFile(FileT, 1, True) >> "PrepareProgress.vbs"
echo D2 = objRead2.ReadAll >> "PrepareProgress.vbs"
echo D2 = Replace(D2,"|CODE|",code) >> "PrepareProgress.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "PrepareProgress.vbs"
echo Set objRead = objFSO.OpenTextFile(FileT, 2, True) >> "PrepareProgress.vbs"
echo objRead.WriteLine(D2) >> "PrepareProgress.vbs"
echo Set objFSO2 = Nothing >> "PrepareProgress.vbs"
echo Set objRead2 = Nothing >> "PrepareProgress.vbs"
echo Set objFSO = Nothing >> "PrepareProgress.vbs"
echo Set objRead = Nothing >> "PrepareProgress.vbs"
echo WScript.Quit >> "PrepareProgress.vbs"
CLS
PrepareProgress.vbs
del PrepareProgress.vbs
CLS
goto init

:uptodate
set /p firstline=<StatusIS.log
if %firstline%==ready (
echo updated > "StatusIS.log"
) else (
echo close>"StatusPS.log"
timeout -m 500 > NUL
echo forceclose>"StatusPS.log"
start wscript UpToDate.vbs
)
CLS
echo Atualizado!
goto exit

:init
CLS
echo 0 > "Status.log"
echo 0 > "StatusP.log"
echo -0-0- > "ProgressBar.log"
echo 0 > "Server.log"
echo 0 > "DSize.log"
echo 0 > "ChangeLogIV.log"
echo 0 > "UpdateMode.log"
echo 0 > "ServerP.log"
echo -%sversion3%- > "UpCoreFCE.log"
echo 0 > "Result.txt"
if exist "InterfaceMaintainer.log" (
del InterfaceMaintainer.log
)
del ChangeLog.log
CLS
echo Dim Data > "ExtractSize.vbs"
echo On Error Resume Next >> "ExtractSize.vbs"
echo Set objArgs = WScript.Arguments.Named >> "ExtractSize.vbs"
echo If NOT (IsEmpty(objArgs.Item("file"))) Then >> "ExtractSize.vbs"
echo File = objArgs.Item("file") >> "ExtractSize.vbs"
echo Else >> "ExtractSize.vbs"
echo WScript.Quit >> "ExtractSize.vbs"
echo End If >> "ExtractSize.vbs"
echo Set objFSO2 = CreateObject("Scripting.FileSystemObject") >> "ExtractSize.vbs"
echo Set objRead2 = objFSO2.OpenTextFile("UpdateLog.txt", 1, False) >> "ExtractSize.vbs"
echo Data = objRead2.ReadAll >> "ExtractSize.vbs"
echo Set objFSO2 = Nothing >> "ExtractSize.vbs"
echo Set objRead2 = Nothing >> "ExtractSize.vbs"
echo D2r = Split(Data, "Saving to: '"^&File^&"'") >> "ExtractSize.vbs"
echo Filet = Ubound(D2r) >> "ExtractSize.vbs"
echo Filet = Filet - 1 >> "ExtractSize.vbs"
echo If NOT Filet = "-1" Then >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo D2r = Split(Filet2, "Length: ") >> "ExtractSize.vbs"
echo Filet = Ubound(D2r) >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo D2r = Split(Filet2, " [") >> "ExtractSize.vbs"
echo Filet = 0 >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo D2r = Split(Filet2, " (") >> "ExtractSize.vbs"
echo Filet = 0 >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo Else >> "ExtractSize.vbs"
echo Filet2 = "" >> "ExtractSize.vbs"
echo End If >> "ExtractSize.vbs"
echo D2dataR = Filet2 >> "ExtractSize.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "ExtractSize.vbs"
echo Set objRead = objFSO.OpenTextFile("DSize.log", 2, True) >> "ExtractSize.vbs"
echo If D2dataR = "" Then >> "ExtractSize.vbs"
echo objRead.WriteLine("NoData") >> "ExtractSize.vbs"
echo Else >> "ExtractSize.vbs"
echo objRead.WriteLine(D2dataR) >> "ExtractSize.vbs"
echo End If >> "ExtractSize.vbs"
echo Set objFSO = Nothing >> "ExtractSize.vbs"
echo Set objRead = Nothing >> "ExtractSize.vbs"
CLS
echo On Error Resume Next > "Hash.vbs"
echo Set fso = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objArgs = WScript.Arguments.Named >> "Hash.vbs"
echo Set objWsh = CreateObject("WScript.Shell") >> "Hash.vbs"
echo If NOT (IsEmpty(objArgs.Item("file"))) Then >> "Hash.vbs"
echo File = objArgs.Item("file") >> "Hash.vbs"
echo Else >> "Hash.vbs"
echo WScript.Quit >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo If NOT (IsEmpty(objArgs.Item("hash"))) Then >> "Hash.vbs"
echo Hash = objArgs.Item("hash") >> "Hash.vbs"
echo Hash = UCASE(Hash) >> "Hash.vbs"
echo Else >> "Hash.vbs"
echo WScript.Quit >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo If fso.Fileexists("output.txt") Then fso.DeleteFile "output.txt" >> "Hash.vbs"
echo If fso.Fileexists("hash.bat") Then fso.DeleteFile "hash.bat" >> "Hash.vbs"
echo If NOT fso.Fileexists("Hash.exe") Then >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("Hash.log", 2, True) >> "Hash.vbs"
echo objRead.WriteLine("MissingFile") >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
echo WScript.Quit >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo Dim clean(5) >> "Hash.vbs"
echo clean(0)="@echo off" >> "Hash.vbs"
echo clean(1)="@set verifica="^&Chr(37)^&"1t" >> "Hash.vbs"
echo clean(2)="if "^&Chr(37)^&"verifica"^&Chr(37)^&"==Initt (" >> "Hash.vbs"
echo clean(3)="Hash.exe "^&File^&" > output.txt" >> "Hash.vbs"
echo clean(4)=")" >> "Hash.vbs"
echo clean(5)="exit" >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("hash.bat", 2, True) >> "Hash.vbs"
echo For Each cleanT In clean >> "Hash.vbs"
echo objRead.WriteLine(cleanT) >> "Hash.vbs"
echo Next >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
echo If (fso.FileExists("hash.bat")) Then >> "Hash.vbs"
echo objWsh.Run "hash.bat Init", 0, 1 >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo Separator = Chr(32)^&Chr(32) >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("output.txt", 1, False) >> "Hash.vbs"
echo D1 = objRead.ReadLine >> "Hash.vbs"
echo D1c = Split(D1, Separator) >> "Hash.vbs"
echo For i = 1 to (Ubound(D1c)) >> "Hash.vbs"
echo D1 = D1c(0) >> "Hash.vbs"
echo Next >> "Hash.vbs"
echo D1 = UCASE(D1) >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
echo If fso.Fileexists("output.txt") Then fso.DeleteFile "output.txt" >> "Hash.vbs"
echo If fso.Fileexists("hash.bat") Then fso.DeleteFile "hash.bat" >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("Hash.log", 2, True) >> "Hash.vbs"
echo If D1 = Hash Then >> "Hash.vbs"
echo objRead.WriteLine("Valid") >> "Hash.vbs"
echo Else >> "Hash.vbs"
echo objRead.WriteLine("Invalid") >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
CLS
if %version%==%version2% (
title Atualizador%code%t
timeout -m 500 > NUL
CLS
echo %date%-%time% J� est� Atualizado! >> "UpdateLog.txt"
echo Atualizado!
goto uptodate
) else if %version% lss %version2% (
title Atualizador%code%t
del /Q /F /S UpInstalation\*
rd /Q /S UpInstalation
md UpInstalation
del UpdateFound.vbs
del %file%
echo close>"StatusPS.log"
CLS
if exist "%file%" (
CLS
echo %date%-%time% Sem permiss�o de Administrador! Abortando... >> "UpdateLog.txt"
echo Administrador negado! Abortando...
echo forceclose>"StatusPS.log"
ErroAOpened.vbs
goto exit
) else (
CLS
if %mode%==install (
goto initB
) else (
goto initC
)
)
) else (
title Atualizador%code%t
echo close>"StatusPS.log"
CLS
echo %date%-%time% Ocorreu um erro ao verificar a vers�o! >> "UpdateLog.txt"
echo %date%-%time% Solicitando instala��o... >> "UpdateLog.txt"
echo Aguardando...
goto promptEV
)

:promptEV
CLS
echo translationof = %translationof% > "EVPrompt.vbs"
echo REM - Iniciando Configura��o... >> "EVPrompt.vbs"
echo Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "EVPrompt.vbs"
echo Set OTF = FSO.OpenTextFile("ResultEV.txt", 2, True) >> "EVPrompt.vbs"
echo OTF.WriteLine "" >> "EVPrompt.vbs"
echo Set OTF = Nothing >> "EVPrompt.vbs"
echo Set FSO = Nothing >> "EVPrompt.vbs"
echo resultado = msgbox("Deseja instalar a vers�o mais recente da Tradu��o de "^& translationof ^&"?"^&Chr(13)^&Chr(13)^&"Clique em 'Sim' para Baixar e Instalar ou 'N�o' para Sair.",vbYesNo,"Vers�o Inv�lida!") >> "EVPrompt.vbs"
echo If resultado = vbYes Then >> "EVPrompt.vbs"
echo     Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "EVPrompt.vbs"
echo     Set OTF = FSO.OpenTextFile("ResultEV.txt", 2, True) >> "EVPrompt.vbs"
echo     OTF.WriteLine "continuar" >> "EVPrompt.vbs"
echo     Set OTF = Nothing >> "EVPrompt.vbs"
echo     Set FSO = Nothing >> "EVPrompt.vbs"
echo Else >> "EVPrompt.vbs"
echo     Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "EVPrompt.vbs"
echo     Set OTF = FSO.OpenTextFile("ResultEV.txt", 2, True) >> "EVPrompt.vbs"
echo     OTF.WriteLine "cancelar" >> "EVPrompt.vbs"
echo     Set OTF = Nothing >> "EVPrompt.vbs"
echo     Set FSO = Nothing >> "EVPrompt.vbs"
echo End If >> "EVPrompt.vbs"
del App.temp
CLS
if %showcl% gtr 0 (
echo Aguardando...
wscript EVPrompt.vbs
)
set /p firstline=<ResultEV.txt
if %firstline%==cancelar (
CLS
echo forceclose>"StatusPS.log"
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
echo Cancelando...
goto exit
)
echo %date%-%time% O usu�rio aceitou a instala��o! >> "UpdateLog.txt"
@set mode=install
goto initB

:initB
CLS
if %mode%==install (
echo %date%-%time% Tradu��o Dispon�vel! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o Dispon�vel! Vers�o: %version3% >> "UpdateLog.txt"
)
CLS
echo %mode%>"UpdateMode.log
echo \\Tradu��o Dispon�vel\\Tradu��o de %translationof%\n Tamanho: %tam% MB (Instalado: %installedsize% MB) \/ Vers�o: %version3%\n \n �ltimas Mudan�as:\n %changelog%\n \n Clique em 'OK' para come�ar a Baixar ou 'Cancelar' para Sair.\n (Assim que baixar, a tradu��o ser� instalada automaticamente!) > "ChangeLog.log"
if %showcl% gtr 0 (
echo 1 > "ChangeLogIV.log"
) else (
echo 2 > "ChangeLogIV.log"
)
CLS
echo -%file%-%totaltam%- > "ProgressFile.log"
CLS
if exist "UpdaterUI.tgapp" (
cd .\
start App.exe "%CD%\UpdaterUI.tgapp" /:Init /:%mode% /:%code%
)
if not exist "InterfaceMaintainer.log" (
CLS
goto initCLCheck
)
CLS
echo Aguardando...
goto CLCheck

:initC
CLS
if %mode%==install (
echo %date%-%time% Tradu��o Dispon�vel! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o Dispon�vel! Vers�o: %version3% >> "UpdateLog.txt"
)
CLS
echo %mode%>"UpdateMode.log
echo \\Atualiza��o Dispon�vel\\Atualiza��o da Tradu��o de %translationof%\n Tamanho: %tam% MB (Instalado: %installedsize% MB) \/ Vers�o: %version3%\n \n Mudan�as:\n %changelog%\n \n Clique em 'OK' para come�ar a Baixar ou 'Cancelar' para Sair.\n (Assim que baixar, a tradu��o ser� atualizada automaticamente!) > "ChangeLog.log"
if %showcl% gtr 0 (
echo 1 > "ChangeLogIV.log"
) else (
echo 2 > "ChangeLogIV.log"
)
CLS
echo -%file%-%totaltam%- > "ProgressFile.log"
CLS
if exist "UpdaterUI.tgapp" (
cd .\
start App.exe "%CD%\UpdaterUI.tgapp" /:Init /:%mode% /:%code%
)
if not exist "InterfaceMaintainer.log" (
CLS
goto initCLCheck
)
CLS
echo Aguardando...
goto CLCheck

:initCLCheck
if exist "InterfaceMaintainer.vbs" (
echo not>"InterfaceMaintainer.log"
cd .\
start wscript "InterfaceMaintainer.vbs" /mode:%mode% /code:%code%
)
CLS
echo Aguardando...
goto CLCheck

:CLCheck
title Atualizador%code%t
set /p firstline=<ChangeLogIV.log
if %firstline%==1 (
goto CLCheck2
)
set /p firstline=<Result.txt
if %firstline%==cancelar (
CLS
if %mode%==install (
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o cancelada pelo usu�rio! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
goto initD

:CLCheck2
title Atualizador%code%t
set /p firstline=<Result.txt
if %firstline%==cancelar (
CLS
if %mode%==install (
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o cancelada pelo usu�rio! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
timeout 1 > NUL
goto CLCheck

:initD
CLS
title Atualizador%code%t
CLS
del %file%
echo 0 > "Hash.log"
CLS
echo -%file%-%totaltam%- > "ProgressFile.log"
echo %mode%>"UpdateMode.log
CLS
if exist "UpdaterUI.tgapp" (
cd .\
start App.exe "%CD%\UpdaterUI.tgapp" /:Init /:%mode% /:%code%
) else if exist "Progress.tgapp" (
cd .\
start App.exe "%CD%\Progress.tgapp" /:Init /:%file% /:%totaltam% /:%mode%
) else if exist "Progress.vbs" (
cd .\
start Progress.vbs /total:%totaltam% /file:%file%
) else if exist "Progress.hta" (
cd .\
start Progress.hta /:Init /:%file% /:%totaltam% /:%mode%
)
if %mode%==install (
echo %date%-%time% Baixando Tradu��o... >> "UpdateLog.txt"
echo Baixando Translation...
) else (
echo %date%-%time% Baixando Atualiza��o... >> "UpdateLog.txt"
echo Baixando Update...
)
echo 1 > "ServerP.log"
wget.exe -c %primarysvr% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=1
title Atualizador%code%t
set /p firstline=<Status.log
if %firstline%==cancelar (
CLS
del %file%
CLS
if %mode%==install (
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o cancelada pelo usu�rio! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
CLS
if exist "%file%" (
CLS
echo 0 > "DSize.log"
if exist "ExtractSize.vbs" (
cd .\
ExtractSize.vbs /file:%file%
)
set /p firstline=<DSize.log
if %firstline%==NoData (
@set totaltam2=%totaltam%
) else if %firstline%==unspecified (
@set totaltam2=%totaltam%
) else if %firstline%==0 (
@set totaltam2=%totaltam%
) else (
@set totaltam2=%firstline%
)
CLS
goto check
) else (
CLS
echo %date%-%time% Falha ao baixar do servidor prim�rio! >> "UpdateLog.txt"
CLS
timeout 1 > NUL
CLS
echo %date%-%time% Baixando de outro Servidor... >> "UpdateLog.txt"
echo Baixando de outro Servidor...
echo 2 > "ServerP.log"
wget.exe -c %secundarysvr% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=15 --tries=1
title Atualizador%code%t
set /p firstline=<Status.log
if %firstline%==cancelar (
CLS
del %file%
CLS
if %mode%==install (
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o cancelada pelo usu�rio! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
CLS
if exist "%file%" (
CLS
echo 0 > "DSize.log"
if exist "ExtractSize.vbs" (
cd .\
ExtractSize.vbs /file:%file%
)
set /p firstline=<DSize.log
if %firstline%==NoData (
@set totaltam2=%totaltam%
) else if %firstline%==unspecified (
@set totaltam2=%totaltam%
) else if %firstline%==0 (
@set totaltam2=%totaltam%
) else (
@set totaltam2=%firstline%
)
CLS
goto check
) else (
CLS
echo fail>"StatusPS.log"
echo fail>"StatusP.log"
if %mode%==install (
echo %date%-%time% Falha ao tentar baixar tradu��o! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha ao tentar baixar atualiza��o! >> "UpdateLog.txt"
)
echo Falha ao tentar baixar!
wscript ErroDownload.vbs
goto exit
)
)

:check
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam2% (
CLS
echo stsvr>"StatusP.log"
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDT
) else (
goto checkHash
)

:initDT
CLS
title Atualizador%code%t
CLS
timeout 1 > NUL
echo 0 > "StatusP.log"
CLS
echo %date%-%time% Baixando Atualiza��o... >> "UpdateLog.txt"
echo Baixando Update...
echo 2 > "ServerP.log"
wget.exe -c %secundarysvr% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=2
title Atualizador%code%t
set /p firstline=<Status.log
if %firstline%==cancelar (
CLS
del %file%
CLS
if %mode%==install (
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o cancelada pelo usu�rio! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
CLS
if exist "%file%" (
CLS
echo 0 > "DSize.log"
if exist "ExtractSize.vbs" (
cd .\
ExtractSize.vbs /file:%file%
)
set /p firstline=<DSize.log
if %firstline%==NoData (
@set totaltam2=%totaltam%
) else if %firstline%==unspecified (
@set totaltam2=%totaltam%
) else if %firstline%==0 (
@set totaltam2=%totaltam%
) else (
@set totaltam2=%firstline%
)
CLS
goto checkB
) else (
CLS
echo fail>"StatusPS.log"
echo fail>"StatusP.log"
if %mode%==install (
echo %date%-%time% Falha ao tentar baixar tradu��o! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha ao tentar baixar atualiza��o! >> "UpdateLog.txt"
)
echo Falha ao tentar baixar!
wscript ErroDownload.vbs
goto exit
)

:checkB
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam2% (
CLS
echo stsvr>"StatusP.log"
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDAG
) else (
goto checkHash
)

:initDAG
CLS
title Atualizador%code%t
CLS
timeout 1 > NUL
echo 0 > "StatusP.log"
CLS
echo %date%-%time% Baixando Atualiza��o... >> "UpdateLog.txt"
echo Baixando Update...
echo 1 > "ServerP.log"
wget.exe -c %primarysvr% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=2
title Atualizador%code%t
set /p firstline=<Status.log
if %firstline%==cancelar (
CLS
del %file%
CLS
if %mode%==install (
echo %date%-%time% Instala��o cancelada pelo usu�rio! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualiza��o cancelada pelo usu�rio! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
CLS
if exist "%file%" (
CLS
echo 0 > "DSize.log"
if exist "ExtractSize.vbs" (
cd .\
ExtractSize.vbs /file:%file%
)
set /p firstline=<DSize.log
if %firstline%==NoData (
@set totaltam2=%totaltam%
) else if %firstline%==unspecified (
@set totaltam2=%totaltam%
) else if %firstline%==0 (
@set totaltam2=%totaltam%
) else (
@set totaltam2=%firstline%
)
CLS
goto check
) else (
CLS
echo fail>"StatusPS.log"
echo fail>"StatusP.log"
if %mode%==install (
echo %date%-%time% Falha ao tentar baixar tradu��o! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha ao tentar baixar atualiza��o! >> "UpdateLog.txt"
)
echo Falha ao tentar baixar!
wscript ErroDownload.vbs
goto exit
)

:checkHash
echo -0-0- > "ProgressBar.log"
echo 0 > "Hash.log"
if exist "Hash.vbs" (
CLS
echo %date%-%time% Iniciando Verifica��o Hash... >> "UpdateLog.txt"
echo Iniciando Verifica��o Hash...
Hash.vbs /file:%file% /hash:%hash%
CLS
echo %date%-%time% Verificando Arquivo... >> "UpdateLog.txt"
echo Verificando Arquivo...
goto checkHash2
) else (
CLS
goto ARCheck
)

:checkHash2
set /p firstline=<Hash.log
if %firstline%==Valid (
CLS
echo -0-1- > "ProgressBar.log"
echo %date%-%time% Arquivo V�lido: %hash% >> "UpdateLog.txt"
echo Arquivo V�lido: %hash%
goto initInstall
) else if %firstline%==Invalid (
CLS
echo %date%-%time% Arquivo Inv�lido! >> "UpdateLog.txt"
echo Arquivo Inv�lido!
echo -%sversion3%- > "UpCoreFCE.log"
echo fail>"StatusPS.log"
echo checkerror>"StatusP.log"
if %mode%==install (
echo %date%-%time% Falha na valida��o da tradu��o! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha na valida��o da atualiza��o! >> "UpdateLog.txt"
)
goto exit
) else if %firstline%==MissingFile (
CLS
echo %date%-%time% Arquivo necess�rio n�o encontrado! Reiniciando... >> "UpdateLog.txt"
goto ARCheck
) else (
timeout 1 > NUL
goto checkHash2
)

:initInstall
CLS
echo %date%-%time% Extraindo... >> "UpdateLog.txt"
echo Extraindo...
echo -5-1- > "ProgressBar.log"
7z.exe x %file% -y -o./UpInstalation
if exist "UpInstalation\InstallCore-%code%.temp" (
echo -20-1- > "ProgressBar.log"
move UpInstalation\InstallCore-%code%.temp UpInstalation\InstallCore-%code%.7z
echo -30-1- > "ProgressBar.log"
7z.exe x UpInstalation\InstallCore-%code%.7z -y -o./UpInstalation
echo -50-1- > "ProgressBar.log"
del UpInstalation\InstallCore-%code%.7z
) else (
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instala��o! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
wscript ErroInstall.vbs
exit
)
if exist "UpInstalation\Updater-%code%.temp" (
echo -70-1- > "ProgressBar.log"
move UpInstalation\Updater-%code%.temp UpInstalation\Updater-%code%.7z
echo -80-1- > "ProgressBar.log"
7z.exe x UpInstalation\Updater-%code%.7z -y -o./UpInstalation
echo -100-1- > "ProgressBar.log"
del UpInstalation\Updater-%code%.7z
CLS
echo %date%-%time% Extra��o conclu�da! >> "UpdateLog.txt"
echo Extra��o conclu�da!
) else (
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instala��o! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
wscript ErroInstall.vbs
exit
)
CLS
del %file%
CLS
echo %date%-%time% Iniciando Instala��o... >> "UpdateLog.txt"
echo Iniciando Instalacao...
cd UpInstalation
if exist "install.exe" (
cd ..\
echo -%sversion3%- > "UpCoreFCE.log"
cd UpInstalation
start Install.exe /Q /T:"%TEMP%\Installer-%code%-%random%.tmp" /C:"wscript Install.vbs /Init:Start"
) else (
cd ..\
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instala��o! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
timeout 1 > NUL
start wscript ErroInstall.vbs
)
goto exit

CLS
echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
CLS

:VVCheckS
if %version% lss %version2% (
CLS
echo 1 > "ProgressBarS.log"
title UpSilent%code%t
goto initCheckS
) else (
CLS
echo 100 > "ProgressBarS.log"
title UpSilent%code%t
goto initS
)

:ARCheckS
CLS
del %file%
title UpSilent%code%t
echo 1 > "ProgressBarS.log"
echo -0-90- > "ProgressBar.log"
@set sversion=1%caller%
CLS
goto initCheckS

:initCheckS
del 7z.temp
del 7zdll.temp
del 7z.dll
FOR %%a in (dir "7z.exe") do (set /a tamanho=%%~za)
if not exist "7z.exe" (
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --output-document=7z.temp --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
) else if %tamanho% lss %tam7z% (
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --output-document=7z.temp --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
) else if %tamanho% gtr %tam7z% (
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --output-document=7z.temp --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
)
FOR %%a in (dir "7z.temp") do (set /a tamanho=%%~za)
if exist "7z.temp" (
CLS
if %tamanho%==%tam7z% (
del 7z.exe
move 7z.temp 7z.exe
) else (
wget.exe http://translategames.tk/updater/request/7z.temp --output-document=7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
del 7z.exe
move 7z.temp 7z.exe
CLS
)
)
if %sversion% lss %sversion2% (
CLS
del SilentScript.temp
del SilentScript.7z
CLS
echo %date%-%time% Atualiza��o de Pacotes do Atualizador encontrada! Vers�o: %sversion2c% >> "UpdateLog.txt"
echo Atualiza��o de Pacotes do Atualizador encontrada!
CLS
echo %date%-%time% Baixando Pacote... >> "UpdateLog.txt"
echo Baixando Pacote...
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/SilentScript.temp --output-document=SilentScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title UpSilent%code%t
if not exist "SilentScript.temp" (
CLS
wget.exe http://translategames.tk/updater/request/SilentScript.temp --output-document=SilentScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title UpSilent%code%t
)
if exist "SilentScript.temp" (
CLS
move SilentScript.temp SilentScript.7z
CLS
echo %date%-%time% Extraindo Pacotes... Vers�o: %sversion2c% >> "UpdateLog.txt"
echo Extraindo Pacotes...
CLS
del HashF.temp
del HashV.temp
del ..\PostInstall.temp
if exist "Hash.exe" (
move Hash.exe HashF.temp
)
if exist "..\PostInstall.vbs" (
move ..\PostInstall.vbs ..\PostInstall.temp
)
del PostInstall.vbs
del ExtractSize.vbs
del Hash.vbs
del Hash.tmp
CLS
7z.exe e SilentScript.7z -o.\
CLS
title UpSilent%code%t
if not exist "Hash.tmp" (
set /a ERROS=ERROS+FATOR
move HashF.temp Hash.exe
) else (
move Hash.tmp Hash.exe
del HashF.temp
)
if not exist "PostInstall.vbs" (
set /a ERROS=ERROS+FATOR
move ..\PostInstall.temp ..\PostInstall.vbs
) else (
move PostInstall.vbs ..\PostInstall.vbs
del ..\PostInstall.temp
)
if %ERROS% gtr 0 (
CLS
echo %date%-%time% Extra��o Interrompida. Arquivo Corrompido. >> "UpdateLog.txt"
echo Extra��o Interrompida.
) else (
CLS
echo %date%-%time% Extra��o Conclu�da... >> "UpdateLog.txt"
echo Extra��o Conclu�da...
)
CLS
del SilentScript.7z
CLS
echo %date%-%time% Continuando... >> "UpdateLog.txt"
echo 100 > "ProgressBarS.log"
goto initS
) else (
CLS
echo %date%-%time% Falha ao Baixar Pacote! >> "UpdateLog.txt"
echo %date%-%time% Continuando sem Atualiza��o de Pacotes... >> "UpdateLog.txt"
echo Falha ao Baixar Pacote!
echo 100 > "ProgressBarS.log"
goto initS
)
) else (
CLS
echo 100 > "ProgressBarS.log"
goto initS
)

:initS
CLS
echo Dim Data > "ExtractSize.vbs"
echo On Error Resume Next >> "ExtractSize.vbs"
echo Set objArgs = WScript.Arguments.Named >> "ExtractSize.vbs"
echo If NOT (IsEmpty(objArgs.Item("file"))) Then >> "ExtractSize.vbs"
echo File = objArgs.Item("file") >> "ExtractSize.vbs"
echo Else >> "ExtractSize.vbs"
echo WScript.Quit >> "ExtractSize.vbs"
echo End If >> "ExtractSize.vbs"
echo Set objFSO2 = CreateObject("Scripting.FileSystemObject") >> "ExtractSize.vbs"
echo Set objRead2 = objFSO2.OpenTextFile("UpdateLog.txt", 1, False) >> "ExtractSize.vbs"
echo Data = objRead2.ReadAll >> "ExtractSize.vbs"
echo Set objFSO2 = Nothing >> "ExtractSize.vbs"
echo Set objRead2 = Nothing >> "ExtractSize.vbs"
echo D2r = Split(Data, "Saving to: '"^&File^&"'") >> "ExtractSize.vbs"
echo Filet = Ubound(D2r) >> "ExtractSize.vbs"
echo Filet = Filet - 1 >> "ExtractSize.vbs"
echo If NOT Filet = "-1" Then >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo D2r = Split(Filet2, "Length: ") >> "ExtractSize.vbs"
echo Filet = Ubound(D2r) >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo D2r = Split(Filet2, " [") >> "ExtractSize.vbs"
echo Filet = 0 >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo D2r = Split(Filet2, " (") >> "ExtractSize.vbs"
echo Filet = 0 >> "ExtractSize.vbs"
echo Filet2 = D2r(Filet) >> "ExtractSize.vbs"
echo Else >> "ExtractSize.vbs"
echo Filet2 = "" >> "ExtractSize.vbs"
echo End If >> "ExtractSize.vbs"
echo D2dataR = Filet2 >> "ExtractSize.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "ExtractSize.vbs"
echo Set objRead = objFSO.OpenTextFile("DSize.log", 2, True) >> "ExtractSize.vbs"
echo If D2dataR = "" Then >> "ExtractSize.vbs"
echo objRead.WriteLine("NoData") >> "ExtractSize.vbs"
echo Else >> "ExtractSize.vbs"
echo objRead.WriteLine(D2dataR) >> "ExtractSize.vbs"
echo End If >> "ExtractSize.vbs"
echo Set objFSO = Nothing >> "ExtractSize.vbs"
echo Set objRead = Nothing >> "ExtractSize.vbs"
CLS
echo On Error Resume Next > "Hash.vbs"
echo Set fso = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objArgs = WScript.Arguments.Named >> "Hash.vbs"
echo Set objWsh = CreateObject("WScript.Shell") >> "Hash.vbs"
echo If NOT (IsEmpty(objArgs.Item("file"))) Then >> "Hash.vbs"
echo File = objArgs.Item("file") >> "Hash.vbs"
echo Else >> "Hash.vbs"
echo WScript.Quit >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo If NOT (IsEmpty(objArgs.Item("hash"))) Then >> "Hash.vbs"
echo Hash = objArgs.Item("hash") >> "Hash.vbs"
echo Hash = UCASE(Hash) >> "Hash.vbs"
echo Else >> "Hash.vbs"
echo WScript.Quit >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo If fso.Fileexists("output.txt") Then fso.DeleteFile "output.txt" >> "Hash.vbs"
echo If fso.Fileexists("hash.bat") Then fso.DeleteFile "hash.bat" >> "Hash.vbs"
echo If NOT fso.Fileexists("Hash.exe") Then >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("Hash.log", 2, True) >> "Hash.vbs"
echo objRead.WriteLine("MissingFile") >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
echo WScript.Quit >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo Dim clean(5) >> "Hash.vbs"
echo clean(0)="@echo off" >> "Hash.vbs"
echo clean(1)="@set verifica="^&Chr(37)^&"1t" >> "Hash.vbs"
echo clean(2)="if "^&Chr(37)^&"verifica"^&Chr(37)^&"==Initt (" >> "Hash.vbs"
echo clean(3)="Hash.exe "^&File^&" > output.txt" >> "Hash.vbs"
echo clean(4)=")" >> "Hash.vbs"
echo clean(5)="exit" >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("hash.bat", 2, True) >> "Hash.vbs"
echo For Each cleanT In clean >> "Hash.vbs"
echo objRead.WriteLine(cleanT) >> "Hash.vbs"
echo Next >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
echo If (fso.FileExists("hash.bat")) Then >> "Hash.vbs"
echo objWsh.Run "hash.bat Init", 0, 1 >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo Separator = Chr(32)^&Chr(32) >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("output.txt", 1, False) >> "Hash.vbs"
echo D1 = objRead.ReadLine >> "Hash.vbs"
echo D1c = Split(D1, Separator) >> "Hash.vbs"
echo For i = 1 to (Ubound(D1c)) >> "Hash.vbs"
echo D1 = D1c(0) >> "Hash.vbs"
echo Next >> "Hash.vbs"
echo D1 = UCASE(D1) >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
echo If fso.Fileexists("output.txt") Then fso.DeleteFile "output.txt" >> "Hash.vbs"
echo If fso.Fileexists("hash.bat") Then fso.DeleteFile "hash.bat" >> "Hash.vbs"
echo Set objFSO = CreateObject("Scripting.FileSystemObject") >> "Hash.vbs"
echo Set objRead = objFSO.OpenTextFile("Hash.log", 2, True) >> "Hash.vbs"
echo If D1 = Hash Then >> "Hash.vbs"
echo objRead.WriteLine("Valid") >> "Hash.vbs"
echo Else >> "Hash.vbs"
echo objRead.WriteLine("Invalid") >> "Hash.vbs"
echo End If >> "Hash.vbs"
echo Set objFSO = Nothing >> "Hash.vbs"
echo Set objRead = Nothing >> "Hash.vbs"
CLS
if %version%==%version2% (
CLS
title UpSilent%code%t
echo %date%-%time% J� est� Atualizado! >> "UpdateLog.txt"
echo Atualizado!
if %timer%==10800t0 (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Pr�xima verifica��o em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Pr�xima verifica��o em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Pr�xima verifica��o em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
)
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
goto exit
) else if %version% lss %version2% (
CLS
cd ..\
del /Q /F /S UpInstalation\*
rd /Q /S UpInstalation
md UpInstalation
cd UpSilent
del %file%
CLS
if exist "%file%" (
CLS
echo %date%-%time% Sem permiss�o de Administrador! Abortando... >> "UpdateLog.txt"
echo Administrador negado! Abortando...
echo %date%-%time% Pr�xima verifica��o em 30 Minutos... >> "UpdateLog.txt"
timeout 1800 > NUL
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
goto exit
) else (
CLS
goto initDS
)
) else (
CLS
title UpSilent%code%t
echo %date%-%time% Vers�o Inv�lida! Iniciando download da vers�o mais recente... >> "UpdateLog.txt"
echo Ocorreu um erro ao verificar a versao...
goto initDS
)

:initDS
del %file%
CLS
echo %date%-%time% Atualiza��o Dispon�vel! Vers�o: %version2% >> "UpdateLog.txt"
echo Update Encontrado!
CLS
echo %date%-%time% Baixando Atualiza��o... >> "UpdateLog.txt"
echo Baixando Update...
wget.exe -c %primarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=1
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckS
) else (
goto secundaryDS
)

:secundaryDS
CLS
echo %date%-%time% Falha ao baixar do servidor prim�rio! >> "UpdateLog.txt"
CLS
timeout 1 > NUL
CLS
echo %date%-%time% Baixando de outro Servidor... >> "UpdateLog.txt"
echo Baixando de outro Servidor...
wget.exe -c %secundarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=15 --tries=1
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckS
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualiza��o! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Pr�xima verifica��o em 30 Minutos... >> "UpdateLog.txt"
timeout 1800 > NUL
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
goto exit
)

:finishckeckS
CLS
echo 0 > "DSize.log"
if exist "ExtractSize.vbs" (
cd .\
ExtractSize.vbs /file:%file%
)
set /p firstline=<DSize.log
if %firstline%==NoData (
@set totaltam2=%totaltam%
) else if %firstline%==unspecified (
@set totaltam2=%totaltam%
) else if %firstline%==0 (
@set totaltam2=%totaltam%
) else (
@set totaltam2=%firstline%
)
CLS
goto checkS

:checkS
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam2% (
CLS
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDST
) else (
goto checkHashS
)

:initDST
CLS
title UpSilent%code%t
CLS
timeout 1 > NUL
CLS
echo %date%-%time% Baixando Atualiza��o... >> "UpdateLog.txt"
echo Baixando Update...
wget.exe -c %secundarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=2
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckSB
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualiza��o! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Pr�xima verifica��o em 30 Minutos... >> "UpdateLog.txt"
timeout 1800 > NUL
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
goto exit
)

:finishckeckSB
CLS
echo 0 > "DSize.log"
if exist "ExtractSize.vbs" (
cd .\
ExtractSize.vbs /file:%file%
)
set /p firstline=<DSize.log
if %firstline%==NoData (
@set totaltam2=%totaltam%
) else if %firstline%==unspecified (
@set totaltam2=%totaltam%
) else if %firstline%==0 (
@set totaltam2=%totaltam%
) else (
@set totaltam2=%firstline%
)
CLS
goto checkSB

:checkSB
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam2% (
CLS
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDSAG
) else (
goto checkHashS
)

:initDSAG
CLS
title UpSilent%code%t
CLS
timeout 1 > NUL
CLS
echo %date%-%time% Baixando Atualiza��o... >> "UpdateLog.txt"
echo Baixando Update...
wget.exe -c %primarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=2
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckS
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualiza��o! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Pr�xima verifica��o em 30 Minutos... >> "UpdateLog.txt"
timeout 1800 > NUL
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
goto exit
)

:checkHashS
echo -0-0- > "ProgressBar.log"
echo 0 > "Hash.log"
if exist "Hash.vbs" (
CLS
echo %date%-%time% Iniciando Verifica��o Hash... >> "UpdateLog.txt"
echo Iniciando Verifica��o Hash...
Hash.vbs /file:%file% /hash:%hash%
CLS
echo %date%-%time% Verificando Arquivo... >> "UpdateLog.txt"
echo Verificando Arquivo...
goto checkHashS2
) else (
CLS
goto ARCheckS
)

:checkHashS2
set /p firstline=<Hash.log
if %firstline%==Valid (
CLS
echo -0-1- > "ProgressBar.log"
echo %date%-%time% Arquivo V�lido: %hash% >> "UpdateLog.txt"
echo Arquivo V�lido: %hash%
goto initInstallS
) else if %firstline%==Invalid (
CLS
echo %date%-%time% Arquivo Inv�lido! >> "UpdateLog.txt"
echo Arquivo Inv�lido!
echo %date%-%time% Falha na valida��o da atualiza��o! >> "UpdateLog.txt"
echo Falha na valida��o!
if %timer%==10800t0 (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Pr�xima verifica��o em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Pr�xima verifica��o em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Pr�xima verifica��o em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
)
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
exit
) else if %firstline%==MissingFile (
CLS
echo %date%-%time% Arquivo necess�rio n�o encontrado! Reiniciando... >> "UpdateLog.txt"
goto ARCheckS
) else (
goto checkHashS2
)

:initInstallS
CLS
echo %date%-%time% Extraindo... >> "UpdateLog.txt"
echo Extraindo...
7z.exe x %file% -y -o../UpInstalation
if exist "..\UpInstalation\InstallCore-%code%.temp" (
move ..\UpInstalation\InstallCore-%code%.temp ..\UpInstalation\InstallCore-%code%.7z
7z.exe x ..\UpInstalation\InstallCore-%code%.7z -y -o../UpInstalation
del ..\UpInstalation\InstallCore-%code%.7z
) else (
echo %date%-%time% Falha ao tentar iniciar a instala��o! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
if %timer%==10800t0 (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Pr�xima verifica��o em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Pr�xima verifica��o em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Pr�xima verifica��o em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
)
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
exit
)
if exist "..\UpInstalation\Updater-%code%.temp" (
move ..\UpInstalation\Updater-%code%.temp ..\UpInstalation\Updater-%code%.7z
7z.exe x ..\UpInstalation\Updater-%code%.7z -y -o../UpInstalation
del ..\UpInstalation\Updater-%code%.7z
CLS
echo %date%-%time% Extra��o conclu�da! >> "UpdateLog.txt"
echo Extra��o conclu�da!
) else (
echo %date%-%time% Falha ao tentar iniciar a instala��o! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
if %timer%==10800t0 (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Pr�xima verifica��o em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Pr�xima verifica��o em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Pr�xima verifica��o em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
)
cd ..\
if exist "RoutineRestart.vbs" (
start RoutineRestart.vbs /Init:Start /code:%code% /upcore:%sversion3%
) else (
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
)
exit
)
CLS
del %file%
CLS
echo %date%-%time% Iniciando Instala��o... >> "UpdateLog.txt"
echo Iniciando Instalacao...
cd ..\
cd UpInstalation
if exist "install.exe" (
start Install.exe /Q /T:"%TEMP%\Installer-%code%-%random%.tmp" /C:"wscript Install.vbs /SInit:Start"
cd ..\
) else (
cd ..\
echo %date%-%time% Falha ao tentar iniciar a instala��o! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
)
cd UpSilent
if %timer%==10800t0 (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Pr�xima verifica��o em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Pr�xima verifica��o em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Pr�xima verifica��o em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Pr�xima verifica��o em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
)
cd ..\
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
goto exit

:exit
exit
