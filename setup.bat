@echo off
REM ============================================
REM  AI Research Automation - Local Startup
REM  Starts Ollama and exposes it via ngrok
REM ============================================

echo Starting Ollama server...
start "Ollama" cmd /k "ollama serve"

echo Waiting for Ollama to boot...
timeout /t 5 /nobreak >nul

echo Pulling qwen2.5:0.5b model if not already present...
ollama pull qwen2.5:0.5b

echo Starting ngrok tunnel on port 11434...
start "ngrok" cmd /k "ngrok http 11434"

echo.
echo ============================================
echo  Both services are starting in separate windows.
echo  Copy the "Forwarding" HTTPS URL from the ngrok
echo  window (looks like https://xxxx.ngrok-free.dev)
echo  and paste it into your Make.com HTTP modules,
echo  followed by /api/chat
echo ============================================
pause
