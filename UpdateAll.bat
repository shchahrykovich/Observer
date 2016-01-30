@echo off

setlocal                                                                                    
set projects=(PerfDotNet/BenchmarkDotNet)

set gitex="C:\Program Files (x86)\Git\bin\git.exe"
if not exist gitex (
	set gitex="C:\Program Files\Git\bin\git.exe"
)

for %%p in %projects% do (
  if exist %%p (	
    echo Updating %%p
    cd %%p
    %gitex% pull 
    cd ..\..
  ) else (
    echo Creating %%p
    %gitex% clone https://github.com/%%p %%p
  )
  echo ===
)
