@echo off
REM 声明采用UTF-8编码
chcp 65001
setlocal
set TOMCAT_BASE_PATH=D:\home_tomcat\apache-tomcat-8.0.48-80
set CATALINA_HOME=%TOMCAT_BASE_PATH%
echo %TOMCAT_BASE_PATH%
call %TOMCAT_BASE_PATH%\bin\startup.bat
Pause

@echo off
start /wait ping www.sina.com.cn
start /wait ping www.baidu.com
endlocal