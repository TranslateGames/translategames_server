@set caller=0
@set version2="60012377"
@set version3="6.0.0.12377"
@set sversion2c=1500314
@set tam7z=225280
CLS
if %code%==350-4 (
@set translationof="Dawn of War - Soulstorm"
@set tam="3,53"
@set totaltam=3703505
@set installedsize="61,29"
@set hash=40CD252AC7A455544B91C9A7BE1C9E195EC28175CFCB4C13EE20FFB4BB3BB8A9
@set file=SSBR.7z
@set changelog=- Tradução: Algumas Mudanças.\n - Atualizador: Melhorias gerais de estabilidade, Melhorias na velocidade da extração de inicialização, Atualizado: 7-Zip para a versão 18.05 e Wget para a versão 1.19.4, Adicionado: Verificação Inteligente de Arquivos.\n Interface: Unificação de Interfaces, Melhorias Gerais de estabilidade e Corrigido: Erro de compatibilidade com o Windows Vista.\n Instalador: Melhorias gerais de segurança e estabilidade.\n Servidor: Melhorias gerais.
)
CLS
@set secundarysvr=https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Update/%file%
@set primarysvr=http://translategames.tk/updater/download/%code%
@set secundarysvrS=https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Update/%file%
@set primarysvrS=http://translategames.tk/updater/download/%code%
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
echo msgbox"A Tradução mais recente, já está instalada!",vbInformation,"A Tradução já está atualizada!" > "UpToDate.vbs"
echo msgbox"Não foi possível obter acesso de Administrador!",vbCritical,"Acesso Negado!" > "ErroAOpened.vbs"
echo msgbox"Ocorreu um erro ao tentar baixar a Atualização!",vbCritical,"Falha ao Baixar" > "ErroDownload.vbs"
echo msgbox"Falha na validação da Atualização! O arquivo pode estar corrompido!",vbCritical,"Falha na validação" > "ErroHash.vbs"
echo msgbox"Conexão Interrompida durante o download da Atualização!",vbCritical,"Conexão Perdida" > "ErroIConnection.vbs"
echo msgbox"Arquivo necessário para iniciar a Instalação, não foi encontrado!",vbCritical,"Falha na Instalação" > "ErroInstall.vbs"
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
goto initCheck
) else (
CLS
echo 100 > "ProgressBarS.log"
goto init
)

:ARCheck
CLS
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
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
echo 90 > "ProgressBarS.log"
) else if %tamanho% lss %tam7z% (
echo 2 > "ProgressBarS.log"
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
echo 90 > "ProgressBarS.log"
) else if %tamanho% gtr %tam7z% (
echo 2 > "ProgressBarS.log"
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
wget.exe http://translategames.tk/updater/request/7z.temp --output-document=7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
del 7z.exe
move 7z.temp 7z.exe
CLS
)
)
echo 90 > "ProgressBarS.log"
if %sversion% lss %sversion2% (
echo 90 > "ProgressBarS.log"
CLS
del UpScript.temp
del UpScript.7z
del UpScript*
CLS
echo %date%-%time% Atualização de Pacotes do Atualizador encontrada! Versão: %sversion2c% >> "UpdateLog.txt"
echo Atualização de Pacotes do Atualizador encontrada!
CLS
echo %date%-%time% Baixando Pacote... >> "UpdateLog.txt"
echo Baixando Pacote...
wget.exe https://raw.githubusercontent.com/TranslateGames/translategames_server/master/Service/UpScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
if not exist "UpScript.temp" (
CLS
wget.exe http://translategames.tk/updater/request/UpScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
title Atualizador%code%t
)
echo 95 > "ProgressBarS.log"
if exist "UpScript.temp" (
CLS
move UpScript.temp UpScript.7z
CLS
echo %date%-%time% Extraindo Pacotes... Versão: %sversion2c% >> "UpdateLog.txt"
echo Extraindo Pacotes...
CLS
if exist "error.png" (
move error.png error.temp
)
if exist "ExtractSize.vbs" (
move ExtractSize.vbs ExtractSize.temp
)
if exist "Hash.exe" (
move Hash.exe HashF.temp
)
if exist "Hash.vbs" (
move Hash.vbs HashV.temp
)
del Progress.hta
del Progress.bat
del Progress.vbs
del ProgressData.tgpd
del tg.png
del db.png
del App.tmp
del Hash.exe
del ImageData.tmp
CLS
7z.exe e UpScript.7z -o.\
CLS
title Atualizador%code%t
if not exist "error.png" (
set /a ERROS=ERROS+FATOR
del error.png
move error.temp error.png
) else (
del error.temp
)
if not exist "ExtractSize.vbs" (
set /a ERROS=ERROS+FATOR
del ExtractSize.vbs
move ExtractSize.temp ExtractSize.vbs
) else (
del ExtractSize.temp
)
if not exist "Hash.exe" (
set /a ERROS=ERROS+FATOR
move HashF.temp Hash.exe
) else (
del HashF.temp
)
if not exist "Hash.vbs" (
set /a ERROS=ERROS+FATOR
move HashV.temp Hash.vbs
) else (
del HashV.temp
)
if exist "ImageData.tgib64" (
move ImageData.tgib64 ImageData.temp
)
del ImageData.tgib64
if not exist "App.exe" (
move App.tmp App.exe
)
if not exist "UpdaterUI.tgapp" (
move UpdaterUI.tmp UpdaterUI.tgapp
)
if not exist "ImageData.tgib64" (
set /a ERROS=ERROS+FATOR
del ImageData.tgib64
move ImageData.temp ImageData.tgib64
) else (
del ImageData.tgib64
move ImageData.tmp ImageData.tgib64
del ImageData.temp
)
del App.tmp
del App.temp
del UpdaterUI.tmp
del ImageData.tmp
if %ERROS% gtr 0 (
CLS
echo %date%-%time% Extração Interrompida. Arquivo Corrompido. >> "UpdateLog.txt"
echo Extração Interrompida.
) else (
CLS
echo %date%-%time% Extração Concluída... >> "UpdateLog.txt"
echo Extração Concluída...
)
CLS
del UpScript.7z
CLS
echo 100 > "ProgressBarS.log"
timeout -m 500 > NUL
echo close>"StatusPS.log"
echo %date%-%time% Continuando... >> "UpdateLog.txt"
goto pProgress
) else (
CLS
del UpScript.temp
CLS
echo %date%-%time% Falha ao Baixar Pacote! >> "UpdateLog.txt"
echo %date%-%time% Continuando sem Atualização de Pacotes... >> "UpdateLog.txt"
echo Falha ao Baixar Pacote!
goto init
)
) else (
CLS
echo 100 > "ProgressBarS.log"
timeout -m 500 > NUL
echo close>"StatusPS.log"
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
CLS
goto init

:uptodate
set /p firstline=<StatusIS.log
if %firstline%==ready (
echo updated > "StatusIS.log"
) else (
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
echo -0-90- > "ProgressBar.log"
echo 0 > "Server.log"
echo 0 > "DSize.log"
echo 0 > "ChangeLogIV.log"
echo 0 > "UpdateMode.log
del ChangeLog.log
if %version%==%version2% (
title Atualizador%code%t
timeout -m 500 > NUL
CLS
echo %date%-%time% Já está Atualizado! >> "UpdateLog.txt"
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
echo %date%-%time% Sem permissão de Administrador! Abortando... >> "UpdateLog.txt"
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
echo %date%-%time% Ocorreu um erro ao verificar a versão! >> "UpdateLog.txt"
echo %date%-%time% Solicitando instalação... >> "UpdateLog.txt"
echo Aguardando...
goto promptEV
)

:promptEV
CLS
echo translationof = %translationof% > "EVPrompt.vbs"
echo REM - Iniciando Configuração... >> "EVPrompt.vbs"
echo Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "EVPrompt.vbs"
echo Set OTF = FSO.OpenTextFile("ResultEV.txt", 2, True) >> "EVPrompt.vbs"
echo OTF.WriteLine "" >> "EVPrompt.vbs"
echo Set OTF = Nothing >> "EVPrompt.vbs"
echo Set FSO = Nothing >> "EVPrompt.vbs"
echo resultado = msgbox("Deseja instalar a versão mais recente da Tradução de "^& translationof ^&"?"^&Chr(13)^&Chr(13)^&"Clique em 'Sim' para Baixar e Instalar ou 'Não' para Sair.",vbYesNo,"Versão Inválida!") >> "EVPrompt.vbs"
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
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
echo Cancelando...
goto exit
)
echo %date%-%time% O usuário aceitou a instalação! >> "UpdateLog.txt"
@set mode=install
goto initB

:initB
CLS
if %mode%==install (
echo %date%-%time% Tradução Disponível! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização Disponível! Versão: %version2% >> "UpdateLog.txt"
)
CLS
echo %mode%>"UpdateMode.log
echo \\Tradução Disponível\\Tradução de %translationof%\n Tamanho: %tam% MB (Instalado: %installedsize% MB) \/ Versão: %version3%\n \n Últimas Mudanças:\n %changelog%\n \n Clique em 'OK' para começar a Baixar ou 'Cancelar' para Sair.\n (Assim que estiver concluído, a tradução será instalada automáticamente!) > "ChangeLog.log"
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
goto CLCheck

:initC
CLS
if %mode%==install (
echo %date%-%time% Tradução Disponível! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização Disponível! Versão: %version2% >> "UpdateLog.txt"
)
CLS
echo %mode%>"UpdateMode.log
echo \\Atualização Disponível\\Atualização da Tradução de %translationof%\n Tamanho: %tam% MB (Instalado: %installedsize% MB) \/ Versão: %version3%\n \n Mudanças:\n %changelog%\n \n Clique em 'OK' para começar a Baixar ou 'Cancelar' para Sair.\n (Assim que estiver concluído, a tradução será instalada automáticamente!) > "ChangeLog.log"
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
goto CLCheck

:CLCheck
CLS
echo Aguardando...
title Atualizador%code%t
set /p firstline=<ChangeLogIV.log
if %firstline%==1 (
timeout 1 > NUL
goto CLCheck
)
CLS
set /p firstline=<Result.txt
if %firstline%==cancelar (
CLS
if %mode%==install (
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização cancelada pelo usuário! >> "UpdateLog.txt"
)
echo Cancelando...
goto exit
)
goto initD

:initD
CLS
title Atualizador%code%t
CLS
del PrepareProgress.vbs
del App.temp
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
echo %date%-%time% Baixando Tradução... >> "UpdateLog.txt"
echo Baixando Translation...
) else (
echo %date%-%time% Baixando Atualização... >> "UpdateLog.txt"
echo Baixando Update...
)
echo 1 > "ServerP.log"
wget.exe %primarysvr% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=1
title Atualizador%code%t
set /p firstline=<Status.log
if %firstline%==cancelar (
CLS
del %file%
CLS
if %mode%==install (
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização cancelada pelo usuário! >> "UpdateLog.txt"
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
echo %date%-%time% Falha ao baixar do servidor primário! >> "UpdateLog.txt"
echo %date%-%time% Baixando de outro Servidor... >> "UpdateLog.txt"
echo Baixando de outro Servidor...
echo 2 > "ServerP.log"
wget.exe %secundarysvr% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=15 --tries=1
title Atualizador%code%t
set /p firstline=<Status.log
if %firstline%==cancelar (
CLS
del %file%
CLS
if %mode%==install (
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização cancelada pelo usuário! >> "UpdateLog.txt"
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
echo %date%-%time% Falha ao tentar baixar tradução! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
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
echo 0 > "StatusP.log"
CLS
echo %date%-%time% Baixando Atualização... >> "UpdateLog.txt"
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
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização cancelada pelo usuário! >> "UpdateLog.txt"
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
echo %date%-%time% Falha ao tentar baixar tradução! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
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
echo 0 > "StatusP.log"
CLS
echo %date%-%time% Baixando Atualização... >> "UpdateLog.txt"
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
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização cancelada pelo usuário! >> "UpdateLog.txt"
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
echo %date%-%time% Falha ao tentar baixar tradução! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
)
echo Falha ao tentar baixar!
wscript ErroDownload.vbs
goto exit
)

:checkHash
echo -0-1- > "ProgressBar.log"
echo 0 > "Hash.log"
if exist "Hash.vbs" (
CLS
echo %date%-%time% Iniciando Verificação Hash... >> "UpdateLog.txt"
echo Iniciando Verificação Hash...
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
echo %date%-%time% Arquivo Válido: %hash% >> "UpdateLog.txt"
echo Arquivo Válido: %hash%
goto initInstall
) else if %firstline%==Invalid (
CLS
echo %date%-%time% Arquivo Inválido! >> "UpdateLog.txt"
echo Arquivo Inválido!
echo fail>"StatusPS.log"
echo fail>"StatusP.log"
if %mode%==install (
echo %date%-%time% Falha na validação da tradução! >> "UpdateLog.txt"
) else (
echo %date%-%time% Falha na validação da atualização! >> "UpdateLog.txt"
)
echo Falha na validação!
timeout 1 > NUL
start wscript ErroHash.vbs
goto exit
) else if %firstline%==MissingFile (
CLS
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
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
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
echo %date%-%time% Extração concluída! >> "UpdateLog.txt"
echo Extração concluída!
) else (
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
wscript ErroInstall.vbs
exit
)
CLS
del %file%
CLS
echo %date%-%time% Iniciando Instalação... >> "UpdateLog.txt"
echo Iniciando Instalacao...
cd UpInstalation
if exist "install.exe" (
start Install.exe /Q /T:"%TEMP%\Installer-%code%-%random%.tmp" /C:"wscript Install.vbs /Init:Start"
) else (
cd ..\
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
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
echo %date%-%time% Atualização de Pacotes do Atualizador encontrada! Versão: %sversion2c% >> "UpdateLog.txt"
echo Atualização de Pacotes do Atualizador encontrada!
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
echo %date%-%time% Extraindo Pacotes... Versão: %sversion2c% >> "UpdateLog.txt"
echo Extraindo Pacotes...
CLS
if exist "ExtractSize.vbs" (
move ExtractSize.vbs ExtractSize.temp
)
if exist "Hash.exe" (
move Hash.exe HashF.temp
)
if exist "Hash.vbs" (
move Hash.vbs HashV.temp
)
del Hash.exe
CLS
7z.exe e SilentScript.7z -o.\
CLS
title UpSilent%code%t
if not exist "ExtractSize.vbs" (
set /a ERROS=ERROS+FATOR
move ExtractSize.temp ExtractSize.vbs
) else (
del ExtractSize.temp
)
if not exist "Hash.exe" (
set /a ERROS=ERROS+FATOR
move HashF.temp Hash.exe
) else (
del HashF.temp
)
if not exist "Hash.vbs" (
set /a ERROS=ERROS+FATOR
move HashV.temp Hash.vbs
) else (
del HashV.temp
)
if %ERROS% gtr 0 (
CLS
echo %date%-%time% Extração Interrompida. Arquivo Corrompido. >> "UpdateLog.txt"
echo Extração Interrompida.
) else (
CLS
echo %date%-%time% Extração Concluída... >> "UpdateLog.txt"
echo Extração Concluída...
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
echo %date%-%time% Continuando sem Atualização de Pacotes... >> "UpdateLog.txt"
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
if %version%==%version2% (
CLS
title UpSilent%code%t
echo %date%-%time% Já está Atualizado! >> "UpdateLog.txt"
echo Atualizado!
if %timer%==10800t0 (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Próxima verificação em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Próxima verificação em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Próxima verificação em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
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
echo %date%-%time% Sem permissão de Administrador! Abortando... >> "UpdateLog.txt"
echo Administrador negado! Abortando...
echo %date%-%time% Próxima verificação em 30 Minutos... >> "UpdateLog.txt"
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
echo %date%-%time% Versão Inválida! Iniciando download da versão mais recente... >> "UpdateLog.txt"
echo Ocorreu um erro ao verificar a versao...
goto initDS
)

:initDS
del %file%
CLS
echo %date%-%time% Atualização Disponível! Versão: %version2% >> "UpdateLog.txt"
echo Update Encontrado!
CLS
echo %date%-%time% Baixando Atualização... >> "UpdateLog.txt"
echo Baixando Update...
wget.exe %primarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=1
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckS
) else (
goto secundaryDS
)

:secundaryDS
CLS
echo %date%-%time% Falha ao baixar do servidor primário! >> "UpdateLog.txt"
echo %date%-%time% Baixando de outro Servidor... >> "UpdateLog.txt"
echo Baixando de outro Servidor...
wget.exe %secundarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=15 --tries=1
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckS
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Próxima verificação em 30 Minutos... >> "UpdateLog.txt"
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
echo %date%-%time% Baixando Atualização... >> "UpdateLog.txt"
echo Baixando Update...
wget.exe -c %secundarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=2
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckSB
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Próxima verificação em 30 Minutos... >> "UpdateLog.txt"
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
echo %date%-%time% Baixando Atualização... >> "UpdateLog.txt"
echo Baixando Update...
wget.exe -c %primarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=20 --tries=2
title UpSilent%code%t
CLS
if exist "%file%" (
goto finishckeckS
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Próxima verificação em 30 Minutos... >> "UpdateLog.txt"
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
echo -0-1- > "ProgressBar.log"
echo 0 > "Hash.log"
if exist "Hash.vbs" (
CLS
echo %date%-%time% Iniciando Verificação Hash... >> "UpdateLog.txt"
echo Iniciando Verificação Hash...
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
echo %date%-%time% Arquivo Válido: %hash% >> "UpdateLog.txt"
echo Arquivo Válido: %hash%
goto initInstallS
) else if %firstline%==Invalid (
CLS
echo %date%-%time% Arquivo Inválido! >> "UpdateLog.txt"
echo Arquivo Inválido!
echo %date%-%time% Falha na validação da atualização! >> "UpdateLog.txt"
echo Falha na validação!
if %timer%==10800t0 (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Próxima verificação em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Próxima verificação em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Próxima verificação em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
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
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
if %timer%==10800t0 (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Próxima verificação em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Próxima verificação em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Próxima verificação em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
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
echo %date%-%time% Extração concluída! >> "UpdateLog.txt"
echo Extração concluída!
) else (
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
if %timer%==10800t0 (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Próxima verificação em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Próxima verificação em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Próxima verificação em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
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
echo %date%-%time% Iniciando Instalação... >> "UpdateLog.txt"
echo Iniciando Instalacao...
cd ..\
cd UpInstalation
if exist "install.exe" (
start Install.exe /Q /T:"%TEMP%\Installer-%code%-%random%.tmp" /C:"wscript Install.vbs /SInit:Start"
cd ..\
) else (
cd ..\
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
)
cd UpSilent
if %timer%==10800t0 (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
timeout 10800 > NUL
) else if %timer%==14400t0 (
echo %date%-%time% Próxima verificação em 4 Horas... >> "UpdateLog.txt"
timeout 14400 > NUL
) else if %timer%==18000t0 (
echo %date%-%time% Próxima verificação em 5 Horas... >> "UpdateLog.txt"
timeout 18000 > NUL
) else if %timer%==21600t0 (
echo %date%-%time% Próxima verificação em 6 Horas... >> "UpdateLog.txt"
timeout 21600 > NUL
) else (
echo %date%-%time% Próxima verificação em 3 Horas... >> "UpdateLog.txt"
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
