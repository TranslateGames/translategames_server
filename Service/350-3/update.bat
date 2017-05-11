@set caller=0
@set version2="60012309"
@set version3="6.0.0.12309"
@set sversion2c=1500277
@set tam7z=200192
CLS
if %code%==350-3 (
@set translationof="Dawn of War - Dark Crusade"
@set tam="2,73"
@set totaltam=2865648
@set installedsize="35,69"
@set file=DCBR.7z
@set changelog=- Tradução: Muitas Mudanças."^&Chr(13)^&"- Atualizador: Melhorias gerais de estabilidade, Imagens substituídas por códigos Base64 reduzidos, design geral melhorado, agora compatível com a API do Internet Explorer 9, Corrigido: Problemas de interface com o Windows XP, Adicionado: Verificação de Servidor Atual e melhorias na velocidade de carregamento."^&Chr(13)^&"Instalador: Melhorias gerais de segurança e estabilidade, Novo método de instalação em VBS, melhorias na velocidade de instalação e correções gerais."^&Chr(13)^&"Servidor: Adicionado Servidor GitHub e Removido Servidor DropBox.
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
del ErroIConnection.vbs
del ErroInstall.vbs
del ErroVersion.vbs
del UpdateEncontrado.vbs
del UpdateFound.vbs
echo msgbox"A Tradução mais recente, já está instalada!",vbInformation,"A Tradução já está atualizada!" > "UpToDate.vbs"
echo msgbox"Não foi possível obter acesso de Administrador!",vbCritical,"Acesso Negado!" > "ErroAOpened.vbs"
echo msgbox"Ocorreu um erro ao tentar baixar a Atualização!",vbCritical,"Falha ao Baixar" > "ErroDownload.vbs"
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
wget.exe http://translategames.tk/updater/request/7z --output-document=7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
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
wget.exe http://translategames.tk/updater/request/UpScript --output-document=UpScript.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
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
if exist "App.exe" (
move App.exe App.temp
)
if exist "error.png" (
move error.png error.temp
)
if exist "Progress.tgapp" (
move Progress.tgapp Progress.temp
)
if exist "functional.js" (
move functional.js functional.temp
)
if exist "ImageData.tgib64" (
move ImageData.tgib64 ImageData.temp
)
del Progress.hta
del Progress.bat
del Progress.vbs
del tg.png
del db.png
del App.tmp
del ImageData.tmp
CLS
7z.exe e UpScript.7z -o.\
CLS
title Atualizador%code%t
if not exist "Progress.tgapp" (
set /a ERROS=ERROS+FATOR
move Progress.temp Progress.tgapp
) else (
del Progress.temp
)
if not exist "App.tmp" (
set /a ERROS=ERROS+FATOR
move App.temp App.exe
) else (
move App.tmp App.exe
del App.temp
)
if not exist "error.png" (
set /a ERROS=ERROS+FATOR
del error.png
move error.temp error.png
) else (
del error.temp
)
if not exist "functional.js" (
set /a ERROS=ERROS+FATOR
move functional.temp functional.js
) else (
del functional.temp
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
echo 100 > "ProgressBarS.log"
if %ERROS% gtr 0 (
echo %date%-%time% Extração Interrompida. Arquivo Corrompido. >> "UpdateLog.txt"
echo Extração Interrompida.
) else (
echo %date%-%time% Extração Concluída... >> "UpdateLog.txt"
echo Extração Concluída...
)
CLS
del UpScript.7z
CLS
echo %date%-%time% Continuando... >> "UpdateLog.txt"
goto pProgress
) else (
CLS
echo %date%-%time% Falha ao Baixar Pacote! >> "UpdateLog.txt"
echo %date%-%time% Continuando sem Atualização de Pacotes... >> "UpdateLog.txt"
echo Falha ao Baixar Pacote!
goto init
)
) else (
CLS
echo 100 > "ProgressBarS.log"
goto init
)

:pProgress
CLS
echo code = %code% > "PrepareProgress.vbs"
echo FileT= "Progress.tgapp" >> "PrepareProgress.vbs"
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

:init
echo 0 > "Status.log"
echo 0 > "StatusP.log"
echo 0 > "ProgressBar.log"
echo 0 > "Server.log"
if %version%==%version2% (
title Atualizador%code%t
echo close>"StatusPS.log"
CLS
echo %date%-%time% Já está Atualizado! >> "UpdateLog.txt"
echo Atualizado!
UpToDate.vbs
goto exit
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
echo %date%-%time% Solicitação de instalação... >> "UpdateLog.txt"
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
echo resultado = msgbox("Versão Inválida!"^&Chr(13)^&"Deseja instalar a versão mais recente da Tradução de "^& translationof ^&"?"^&Chr(13)^&Chr(13)^&"Clique em 'Sim' para Baixar e Instalar ou 'Não' para Sair.",vbYesNo,"Versão Inválida!") >> "EVPrompt.vbs"
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
echo Aguardando...
EVPrompt.vbs
set /p firstline=<ResultEV.txt
if %firstline%==cancelar (
CLS
echo %date%-%time% Instalação cancelada pelo usuário! >> "UpdateLog.txt"
echo Cancelando...
goto exit
)
echo %date%-%time% O usuário aceitou a instalação! >> "UpdateLog.txt"
@set mode=install
goto initB

:initB
CLS
echo translationof = %translationof% > "UpdateFound.vbs"
echo tam = %tam% >> "UpdateFound.vbs"
echo installedsize = %installedsize% >> "UpdateFound.vbs"
echo version = %version3% >> "UpdateFound.vbs"
echo REM - Iniciando Configuração... >> "UpdateFound.vbs"
echo Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "UpdateFound.vbs"
echo Set OTF = FSO.OpenTextFile("Result.txt", 2, True) >> "UpdateFound.vbs"
echo OTF.WriteLine "" >> "UpdateFound.vbs"
echo Set OTF = Nothing >> "UpdateFound.vbs"
echo Set FSO = Nothing >> "UpdateFound.vbs"
echo resultado = msgbox("Tradução de "^& translationof ^&""^&Chr(13)^&"Tamanho: " ^& tam ^& " MB "^&Chr(40)^&"Instalado: " ^& installedsize ^& " MB"^&Chr(41)^&" | Versão: " ^& version ^& ""^&Chr(13)^&Chr(13)^&"Últimas Mudanças:"^&Chr(13)^&"%changelog%"^&Chr(13)^&Chr(13)^&"Clique em 'OK' para começar a Baixar ou 'Cancelar' para Sair."^&Chr(13)^&"(Assim que estiver concluído, a tradução será instalada automáticamente!)",vbOKCancel,"Tradução Disponível!") >> "UpdateFound.vbs"
echo If resultado = vbOK Then >> "UpdateFound.vbs"
echo     Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "UpdateFound.vbs"
echo     Set OTF = FSO.OpenTextFile("Result.txt", 2, True) >> "UpdateFound.vbs"
echo     OTF.WriteLine "continuar" >> "UpdateFound.vbs"
echo     Set OTF = Nothing >> "UpdateFound.vbs"
echo     Set FSO = Nothing >> "UpdateFound.vbs"
echo Else >> "UpdateFound.vbs"
echo     Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "UpdateFound.vbs"
echo     Set OTF = FSO.OpenTextFile("Result.txt", 2, True) >> "UpdateFound.vbs"
echo     OTF.WriteLine "cancelar" >> "UpdateFound.vbs"
echo     Set OTF = Nothing >> "UpdateFound.vbs"
echo     Set FSO = Nothing >> "UpdateFound.vbs"
echo End If >> "UpdateFound.vbs"
goto initD

:initC
CLS
echo translationof = %translationof% > "UpdateFound.vbs"
echo tam = %tam% >> "UpdateFound.vbs"
echo installedsize = %installedsize% >> "UpdateFound.vbs"
echo version = %version3% >> "UpdateFound.vbs"
echo REM - Iniciando Configuração... >> "UpdateFound.vbs"
echo Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "UpdateFound.vbs"
echo Set OTF = FSO.OpenTextFile("Result.txt", 2, True) >> "UpdateFound.vbs"
echo OTF.WriteLine "" >> "UpdateFound.vbs"
echo Set OTF = Nothing >> "UpdateFound.vbs"
echo Set FSO = Nothing >> "UpdateFound.vbs"
echo resultado = msgbox("Atualização da Tradução de "^& translationof ^&""^&Chr(13)^&"Tamanho: " ^& tam ^& " MB "^&Chr(40)^&"Instalado: " ^& installedsize ^& " MB"^&Chr(41)^&" | Versão: " ^& version ^& ""^&Chr(13)^&Chr(13)^&"Mudanças:"^&Chr(13)^&"%changelog%"^&Chr(13)^&Chr(13)^&"Clique em 'OK' para começar a Baixar ou 'Cancelar' para Sair."^&Chr(13)^&"(Assim que estiver concluído, a tradução será instalada automáticamente!)",vbOKCancel,"Atualização Disponível!") >> "UpdateFound.vbs"
echo If resultado = vbOK Then >> "UpdateFound.vbs"
echo     Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "UpdateFound.vbs"
echo     Set OTF = FSO.OpenTextFile("Result.txt", 2, True) >> "UpdateFound.vbs"
echo     OTF.WriteLine "continuar" >> "UpdateFound.vbs"
echo     Set OTF = Nothing >> "UpdateFound.vbs"
echo     Set FSO = Nothing >> "UpdateFound.vbs"
echo Else >> "UpdateFound.vbs"
echo     Set FSO = WScript.CreateObject("Scripting.FileSystemObject") >> "UpdateFound.vbs"
echo     Set OTF = FSO.OpenTextFile("Result.txt", 2, True) >> "UpdateFound.vbs"
echo     OTF.WriteLine "cancelar" >> "UpdateFound.vbs"
echo     Set OTF = Nothing >> "UpdateFound.vbs"
echo     Set FSO = Nothing >> "UpdateFound.vbs"
echo End If >> "UpdateFound.vbs"
goto initD

:initD
CLS
title Atualizador%code%t
CLS
if %mode%==install (
echo %date%-%time% Tradução Disponível! >> "UpdateLog.txt"
) else (
echo %date%-%time% Atualização Disponível! Versão: %version2% >> "UpdateLog.txt"
)
del PrepareProgress.vbs
del App.temp
del %file%
CLS
echo Update Encontrado!
UpdateFound.vbs
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
CLS
if exist "App.exe" (
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
ErroDownload.vbs
goto exit
)
)

:check
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam% (
CLS
echo stsvr>"StatusP.log"
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDT
) else (
echo %date%-%time% Iniciando Instalação... >> "UpdateLog.txt"
echo Iniciando Instalacao...
echo -0-1- > "ProgressBar.log"
CLS
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
ErroInstall.vbs
exit
)
if exist "UpInstalation\Updater-%code%.temp" (
echo -70-1- > "ProgressBar.log"
move UpInstalation\Updater-%code%.temp UpInstalation\Updater-%code%.7z
echo -80-1- > "ProgressBar.log"
7z.exe x UpInstalation\Updater-%code%.7z -y -o./UpInstalation
echo -100-1- > "ProgressBar.log"
del UpInstalation\Updater-%code%.7z
) else (
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
ErroInstall.vbs
exit
)
CLS
cd UpInstalation
if exist "install.exe" (
start Install.exe /Q /T:"%TEMP%\Installer-%code%-%random%.tmp" /C:"wscript Install.vbs /Init:Start"
) else (
cd ..\
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
ErroInstall.vbs
)
goto exit
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
ErroDownload.vbs
goto exit
)

:checkB
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam% (
CLS
echo stsvr>"StatusP.log"
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDAG
) else (
echo %date%-%time% Iniciando Instalação... >> "UpdateLog.txt"
echo Iniciando Instalacao...
echo -0-1- > "ProgressBar.log"
CLS
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
ErroInstall.vbs
exit
)
if exist "UpInstalation\Updater-%code%.temp" (
echo -70-1- > "ProgressBar.log"
move UpInstalation\Updater-%code%.temp UpInstalation\Updater-%code%.7z
echo -80-1- > "ProgressBar.log"
7z.exe x UpInstalation\Updater-%code%.7z -y -o./UpInstalation
echo -100-1- > "ProgressBar.log"
del UpInstalation\Updater-%code%.7z
) else (
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
ErroInstall.vbs
exit
)
CLS
cd UpInstalation
if exist "install.exe" (
start Install.exe /Q /T:"%TEMP%\Installer-%code%-%random%.tmp" /C:"wscript Install.vbs /Init:Start"
) else (
cd ..\
echo fail>"StatusP.log"
echo %date%-%time% Falha ao tentar iniciar a instalação! >> "UpdateLog.txt"
echo Falha ao tentar iniciar a instalacao!
ErroInstall.vbs
)
goto exit
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
ErroDownload.vbs
goto exit
)

CLS
echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
CLS

:VVCheckS
if %version% lss %version2% (
CLS
echo 1 > "ProgressBarS.log"
goto initCheckS
) else (
CLS
echo 100 > "ProgressBarS.log"
goto initS
)

:initCheckS
del 7z.temp
del 7zdll.temp
del 7z.dll
FOR %%a in (dir "7z.exe") do (set /a tamanho=%%~za)
if not exist "7z.exe" (
wget.exe https://dl.dropboxusercontent.com/u/57685514/Update/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
) else if %tamanho% lss %tam7z% (
wget.exe https://dl.dropboxusercontent.com/u/57685514/Update/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
) else if %tamanho% gtr %tam7z% (
wget.exe https://dl.dropboxusercontent.com/u/57685514/Update/7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
)
FOR %%a in (dir "7z.temp") do (set /a tamanho=%%~za)
if exist "7z.temp" (
CLS
if %tamanho%==%tam7z% (
del 7z.exe
move 7z.temp 7z.exe
) else (
wget.exe https://www.cubbyusercontent.com/pl/7z.temp/_12c71e88677140498dc358a8295dceb5 --output-document=7z.temp --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=10 --tries=2
del 7z.exe
move 7z.temp 7z.exe
CLS
)
)
CLS
goto initS

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
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
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
echo %date%-%time% Próxima verificação em 5 Minutos... >> "UpdateLog.txt"
timeout 300 > NUL
cd ..\
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
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
CLS
goto checkS
) else (
CLS
echo %date%-%time% Falha ao baixar do servidor primário! >> "UpdateLog.txt"
echo %date%-%time% Baixando de outro Servidor... >> "UpdateLog.txt"
echo Baixando de outro Servidor...
wget.exe %secundarysvrS% --output-document=%file% --user-agent=%useragentstring% --no-check-certificate%Slimit% --append-output=UpdateLog.txt --timeout=15 --tries=1
title UpSilent%code%t
CLS
if exist "%file%" (
CLS
goto checkS
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Próxima verificação em 5 Minutos... >> "UpdateLog.txt"
timeout 300 > NUL
cd ..\
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
goto exit
)
)

:checkS
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam% (
CLS
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDST
) else (
echo %date%-%time% Iniciando Instalação... >> "UpdateLog.txt"
echo Iniciando Instalacao...
CLS
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
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
exit
)
if exist "..\UpInstalation\Updater-%code%.temp" (
move ..\UpInstalation\Updater-%code%.temp ..\UpInstalation\Updater-%code%.7z
7z.exe x ..\UpInstalation\Updater-%code%.7z -y -o../UpInstalation
del ..\UpInstalation\Updater-%code%.7z
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
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
exit
)
CLS
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
CLS
goto checkSB
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Próxima verificação em 5 Minutos... >> "UpdateLog.txt"
timeout 300 > NUL
cd ..\
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
goto exit
)

:checkSB
CLS
FOR %%a in (dir "%file%") do (set /a tamanho=%%~za)
CLS
if %tamanho% lss %totaltam% (
CLS
echo %date%-%time% Download Interrompido! Tentando Novamente... >> "UpdateLog.txt"
echo Download Interrompido! Tentando Novamente...
goto initDSAG
) else (
echo %date%-%time% Iniciando Instalação... >> "UpdateLog.txt"
echo Iniciando Instalacao...
CLS
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
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
exit
)
if exist "..\UpInstalation\Updater-%code%.temp" (
move ..\UpInstalation\Updater-%code%.temp ..\UpInstalation\Updater-%code%.7z
7z.exe x ..\UpInstalation\Updater-%code%.7z -y -o../UpInstalation
del ..\UpInstalation\Updater-%code%.7z
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
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
exit
)
CLS
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
CLS
goto checkS
) else (
CLS
echo %date%-%time% Falha ao tentar baixar atualização! >> "UpdateLog.txt"
echo Falha ao tentar baixar update!
echo %date%-%time% Próxima verificação em 5 Minutos... >> "UpdateLog.txt"
timeout 300 > NUL
cd ..\
cd ..\
if exist "Update.exe" (
start Update.exe /Q /T:"%TEMP%\Update%code%-%random%.tmp" /C:"wscript InitUpdate.vbs /silent:silent"
) else if exist "InitUpdate.vbs" (
start InitUpdate.vbs /silent:silent
)
goto exit
)

:exit
exit
