
@echo off
setlocal
set "ROOT=%~dp0"

set "MODEL=%ROOT%models\qwen2.5-1.5b-instruct-q4_k_m.gguf"
set "MEMORY=%ROOT%memory\MEMORY.md"
set "LLAMA=%ROOT%runtime\llama-cli.exe"

if not exist "%MODEL%" (
    echo Model not found: "%MODEL%"
    pause
    exit /b 1
)

if not exist "%MEMORY%" (
    echo Memory not found: "%MEMORY%"
    pause
    exit /b 1
)

if not exist "%LLAMA%" (
    echo Runtime not found: "%LLAMA%"
    pause
    exit /b 1
)

echo.
echo ===================================
echo       PORTABLE AI - OFFLINE
echo ===================================
echo.

"%LLAMA%" -m "%MODEL%" -c 4096 -n 512 --system-prompt-file "%MEMORY%" --simple-io

pause

