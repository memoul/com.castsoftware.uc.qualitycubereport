@echo off

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SET LOOKUPEXTENSIONS=-lookupExtensionsDetails 
::SET LOOKUPQRDETAILS=-lookupQualityRuleDetails 
SET LOOKUPQRDETAILS=
::SET AIPVERSION=-AIPVersion 8.2.5_1598
SET AIPVERSION=

SET JAVA_HOME=C:\Program Files\Java\jre1.8.0_181

For /F "tokens=1* delims==" %%A IN (version.properties) DO (
    IF "%%A"=="version" set VERSION=%%B
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Check JRE Installation
IF NOT EXIST "%JAVA_HOME%\bin" GOTO JREPathNotSet

SET CMD="%JAVA_HOME%\bin\java" -jar QualityCubeReport-%VERSION%.jar %LOOKUPEXTENSIONS% %LOOKUPQRDETAILS% %AIPVERSION%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO running %CMD%
%CMD%
ECHO ========================================
SET RETURNCODE=%ERRORLEVEL%
IF NOT %RETURNCODE%==0 GOTO execError
GOTO end


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:JREPathNotSet
ECHO The JRE Path %JAVA_HOME% is not correct
GOTO end

:execError
ECHO Error executing the command line
GOTO end

:end

PAUSE