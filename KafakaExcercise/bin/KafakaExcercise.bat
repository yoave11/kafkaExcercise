@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  KafakaExcercise startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and KAFAKA_EXCERCISE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\KafakaExcercise.jar;%APP_HOME%\lib\akka-stream-kafka_2.11-0.18.jar;%APP_HOME%\lib\kafka-clients-0.11.0.1.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\akka-stream_2.12-2.5.8.jar;%APP_HOME%\lib\akka-stream_2.11-2.5.7.jar;%APP_HOME%\lib\akka-actor_2.12-2.5.8.jar;%APP_HOME%\lib\ssl-config-core_2.12-0.2.2.jar;%APP_HOME%\lib\akka-actor_2.11-2.5.7.jar;%APP_HOME%\lib\ssl-config-core_2.11-0.2.2.jar;%APP_HOME%\lib\scala-java8-compat_2.12-0.8.0.jar;%APP_HOME%\lib\scala-parser-combinators_2.12-1.0.4.jar;%APP_HOME%\lib\scala-java8-compat_2.11-0.7.0.jar;%APP_HOME%\lib\scala-parser-combinators_2.11-1.0.4.jar;%APP_HOME%\lib\scala-library-2.12.4.jar;%APP_HOME%\lib\reactive-streams-1.0.1.jar;%APP_HOME%\lib\lz4-1.3.0.jar;%APP_HOME%\lib\snappy-java-1.1.2.6.jar;%APP_HOME%\lib\config-1.3.2.jar

@rem Execute KafakaExcercise
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %KAFAKA_EXCERCISE_OPTS%  -classpath "%CLASSPATH%" yoav.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable KAFAKA_EXCERCISE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%KAFAKA_EXCERCISE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
