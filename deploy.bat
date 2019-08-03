@echo off
chcp 65001
setlocal
REM 定义基础参数,DONTKILLME(在windows中不会随着jenkins声明周期结束而将任务中启动的进程kill掉)
set BUILD_ID=DONTKILLME
set PRO_PATH=D:\souce_code\hello_source\Jenkins_Demo
set TOMCAT_BASE_PATH=D:\home_tomcat\apache-tomcat-8.0.48-80
set CATALINA_HOME=%TOMCAT_BASE_PATH%

title 启动jenkins案例应用
echo %PRO_PATH%
call %TOMCAT_BASE_PATH%\bin\shutdown.bat
if ERRORLEVEL 1 (goto tomcat_not_startup) else (goto tomcat_is_startup)

echo 1.启动tomcat前尝试停止tocat服务
:tomcat_not_startup
echo WARN:tomcat服务未启动，无需停止服务。

:tomcat_is_startup
echo WARN:tomcat已停止，将进行持续更新准备工作。


echo 2.开始拉取github代码
git pull origin master
echo 3.开始编译打包代码
call mvn clean compile package

echo 4.移动war包到tomcat目录
xcopy %PRO_PATH%\target\Jenkins_Demo.war %TOMCAT_BASE_PATH%\webapps\Jenkins_Demo.war /y

echo 5。启动tomcat服务
call %TOMCAT_BASE_PATH%\bin\startup.bat

endlocal

