@echo off
REM 🚀 Script para instalar e rodar o Forex Scanner Bot (Windows)

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║     🤖 Forex Scanner Bot - Setup Automático         ║
echo ╚══════════════════════════════════════════════════════╝
echo.

REM 1. Verificar se Node.js está instalado
echo 📦 Verificando Node.js...
where node >nul 2>nul
if errorlevel 1 (
    echo ❌ Node.js não está instalado!
    echo 📥 Baixe em: https://nodejs.org/
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo ✅ Node.js encontrado: %NODE_VERSION%
echo.

REM 2. Instalar dependências
echo 📦 Instalando dependências...
call npm install
if errorlevel 1 (
    echo ❌ Erro ao instalar dependências
    pause
    exit /b 1
)
echo ✅ Dependências instaladas com sucesso!
echo.

REM 3. Verificar se .env existe
echo 🔐 Configurando variáveis de ambiente...
if not exist "backend\config\.env" (
    echo ⚠️  Arquivo .env não encontrado. Criando cópia do .env.example...
    copy "backend\config\.env.example" "backend\config\.env"
    echo ✅ Arquivo .env criado!
    echo ⚠️  IMPORTANTE: Edite o arquivo backend\config\.env com suas credenciais reais
) else (
    echo ✅ Arquivo .env encontrado
)
echo.

REM 4. Exibir instruções finais
echo ╔══════════════════════════════════════════════════════╗
echo ║              ✅ Setup Concluído!                     ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo 📋 Próximos passos:
echo.
echo 1️⃣  Edite suas credenciais:
echo    Abra: backend\config\.env
echo.
echo 2️⃣  Inicie o bot em DESENVOLVIMENTO:
echo    npm run dev
echo.
echo 3️⃣  Ou inicie em PRODUÇÃO:
echo    npm start
echo.
echo 4️⃣  Teste a API em outro terminal:
echo    curl http://localhost:3000/health
echo.
echo 📱 Para enviar mensagens:
echo    curl -X POST http://localhost:3000/api/whatsapp/send ^
echo    -H "Content-Type: application/json" ^
echo    -d "{\"number\": \"258834802284\", \"message\": \"Olá!\"}"
echo.
echo 📚 Documentação: Veja README.md e SETUP_GUIDE.md
echo.
pause
