@echo off
if "%running%"=="" goto :EOF

%MSBuildPath%\MSBuild.exe %RepositoryPath%\%RepositoryName%\%solution% /p:Configuration=Release;VisualStudioVersion=13.0 > %BuildLog%
if ERRORLEVEL 1 set BuildSucceeded=false

for /F %%file in %FileList% do (
	if not exist %BuildLocation%\%%file (
		set BuildSucceeded=false
	)
) 