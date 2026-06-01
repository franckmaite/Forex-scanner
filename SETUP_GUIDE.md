# 📖 Guia Completo de Setup do Forex Scanner Bot

## 🎯 Objetivo
Este guia ajudará você a:
1. Configurar e ativar o bot WhatsApp
2. Enviar mensagens para o número **+258834802284**
3. Fazer deploy do projeto

---

## 1️⃣ **Como Obter Suas Credenciais de WhatsApp**

### Passo 1: Acesse o Meta Developers
1. Vá para [Meta Developers](https://developers.facebook.com/)
2. Faça login com sua conta Meta/Facebook
3. Crie um novo App (ou use um existente)

### Passo 2: Configure o WhatsApp
1. No seu App, vá em **Produtos** → **WhatsApp**
2. Clique em **Começar**
3. Selecione a opção de **WhatsApp Business**

### Passo 3: Obtenha o Phone ID e Token
1. Vá em **WhatsApp Business** → **Teste seu app**
2. Você verá um número de telefone de teste
3. Copie:
   - **Phone ID** (ID do telefone)
   - **Access Token** (Token de acesso)

Exemplo:
```
Phone ID: 123456789012345
Token: EAABs1234567890abcdefghijklmnop...
```

### Passo 4: Configure seus números
1. Vá em **Configurações do WhatsApp**
2. Em **Destinatários de teste**, adicione os números (com código do país)
   - **258834802284** ← SEU NÚMERO (Moçambique)
   - Outros números que quiser testar

---

## 2️⃣ **Como Configurar o Arquivo `.env`**

### Abra o arquivo `.env`
```bash
backend/config/.env
```

### Preencha com suas credenciais
```env
# === OpenAI API ===
OPENAI_API_KEY=sk-proj-COLE-SUA-CHAVE-AQUI

# === WhatsApp Business API ===
WHATSAPP_BUSINESS_PHONE_ID=123456789012345
WHATSAPP_BUSINESS_TOKEN=EAABs1234567890abcdefghijklmnop
WHATSAPP_ADMIN_NUMBER=258834802284
WHATSAPP_VERIFY_TOKEN=seu-token-verificacao-aleatorio

# === Server ===
PORT=3000
NODE_ENV=production
JWT_SECRET=sua-chave-super-secreta-aleatoria-aqui
```

---

## 3️⃣ **Instalar Dependências**

```bash
# Abra o terminal na pasta do projeto
cd forex-scanner

# Instale as dependências
npm install
```

Espere terminar a instalação...

---

## 4️⃣ **Iniciar o Bot**

### Modo Desenvolvimento
```bash
npm run dev
```

Você verá:
```
╔══════════════════════════════════════╗
║   🤖 Forex Scanner Bot iniciado!     ║
║   📍 http://localhost:3000           ║
╚══════════════���═══════════════════════╝
```

### Testar o Bot Localmente

**Abra outra aba do terminal** e teste:

```bash
# Test Health Check
curl http://localhost:3000/health

# Enviar mensagem para seu número
curl -X POST http://localhost:3000/api/whatsapp/send \
  -H "Content-Type: application/json" \
  -d '{
    "number": "258834802284",
    "message": "Olá! Teste do bot funcionando!"
  }'
```

---

## 5️⃣ **Enviar Mensagens para seu Número**

### ✅ Seu número de WhatsApp: **258834802284**

### Método 1: Via Terminal (cURL)
```bash
curl -X POST http://localhost:3000/api/whatsapp/send \
  -H "Content-Type: application/json" \
  -d '{
    "number": "258834802284",
    "message": "🤖 Bot Forex Scanner funcionando perfeitamente!"
  }'
```

### Método 2: Usar o Insomnia ou Postman
1. Abra [Insomnia](https://insomnia.rest/) ou [Postman](https://postman.com)
2. Crie uma requisição **POST** para: `http://localhost:3000/api/whatsapp/send`
3. Adicione no header: `Content-Type: application/json`
4. Adicione no body (JSON):
```json
{
  "number": "258834802284",
  "message": "Testando o bot de Forex Scanner!"
}
```
5. Clique em **Send**

### Método 3: Python (Script)
```python
import requests
import json

url = "http://localhost:3000/api/whatsapp/send"
data = {
    "number": "258834802284",
    "message": "Análise de Forex: USD em alta!"
}

response = requests.post(url, json=data)
print(response.json())
```

### Resultado esperado:
```json
{
  "success": true,
  "data": {
    "messages": [
      {
        "id": "wamid.xxx",
        "message_status": "accepted"
      }
    ]
  }
}
```

---

## 6️⃣ **Enviar Diferentes Tipos de Mensagens**

### 📸 Enviar Imagem
```bash
curl -X POST http://localhost:3000/api/whatsapp/send-media \
  -H "Content-Type: application/json" \
  -d '{
    "number": "258834802284",
    "type": "image",
    "url": "https://example.com/grafico-forex.jpg",
    "caption": "📊 Gráfico de USD/EUR"
  }'
```

### 🎥 Enviar Vídeo
```bash
curl -X POST http://localhost:3000/api/whatsapp/send-media \
  -H "Content-Type: application/json" \
  -d '{
    "number": "258834802284",
    "type": "video",
    "url": "https://example.com/analise.mp4",
    "caption": "📹 Análise do mercado"
  }'
```

### 📄 Enviar Documento
```bash
curl -X POST http://localhost:3000/api/whatsapp/send-media \
  -H "Content-Type: application/json" \
  -d '{
    "number": "258834802284",
    "type": "document",
    "url": "https://example.com/relatorio.pdf"
  }'
```

---

## 7️⃣ **Criar um ZIP para Compartilhar**

### No Windows:
1. Clique direito na pasta `forex-scanner`
2. Selecione **Enviar para** → **Pasta compactada**
3. Renomeie para `forex-scanner.zip`

### No Mac/Linux:
```bash
zip -r forex-scanner.zip forex-scanner/ \
  -x "forex-scanner/node_modules/*" \
  "forex-scanner/.env" \
  "forex-scanner/.git/*"
```

### O que fica de fora (segurança):
- ❌ `node_modules/` (muito grande, outro dev reinstala)
- ❌ `.env` (credenciais sensíveis)
- ❌ `.git/` (histórico desnecessário)

### O que fica incluído:
- ✅ Código fonte completo
- ✅ `.env.example` (template)
- ✅ `package.json` (dependências)
- ✅ `README.md` (instruções)
- ✅ `SETUP_GUIDE.md` (este guia)

---

## 8️⃣ **Para Outro Desenvolvedor Usar**

1. **Baixar o ZIP** → `forex-scanner.zip`
2. **Extrair** a pasta
3. **Abrir terminal** na pasta
4. **Instalar dependências**:
   ```bash
   npm install
   ```
5. **Criar o `.env`**:
   ```bash
   cp backend/config/.env.example backend/config/.env
   ```
6. **Editar o `.env`** com suas credenciais
7. **Iniciar o bot**:
   ```bash
   npm run dev
   ```

---

## 🔐 **Checklist de Segurança**

- ✅ `.env` nunca é commitado (está no `.gitignore`)
- ✅ `.env.example` é compartilhado (sem valores sensíveis)
- ✅ Tokens são rotacionados regularmente
- ✅ `node_modules/` não é commitado
- ✅ Credenciais não aparecem em logs

---

## 🐛 **Problemas Comuns**

### ❌ "Cannot find module 'express'"
```bash
npm install
```

### ❌ "WHATSAPP_BUSINESS_TOKEN is undefined"
- Verifique se o `.env` existe
- Verifique se as variáveis estão corretas
- Reinicie o bot: `Ctrl+C` e `npm run dev`

### ❌ "401 Unauthorized"
- Token expirado ou inválido
- Gere um novo token no Meta Developers

### ❌ "The recipient is not part of the testing participants"
- **Adicione 258834802284** em **Destinatários de teste** no Meta Developers
- Aguarde alguns minutos
- Tente novamente

### ❌ Mensagem não chega no WhatsApp
1. Certifique-se que **258834802284** está nos destinatários de teste
2. Verifique o token de acesso (pode ter expirado)
3. Verifique os logs do servidor
4. Tente usando o Postman/Insomnia (UI é mais fácil para debug)

---

## 📞 **Contato & Suporte**

Desenvolvido por: **franckmaite**

Para dúvidas:
- 📧 Email: antoniotembe070@gmail.com
- 💬 GitHub: @franckmaite
- 📱 WhatsApp: +258834802284

---

## 📋 **Próximos Passos (Checklist)**

- [ ] Obter credenciais do Meta Developers
- [ ] Copiar `Phone ID` e `Token`
- [ ] Adicionar **258834802284** aos destinatários de teste
- [ ] Editar `.env` com suas credenciais
- [ ] Executar `npm install`
- [ ] Iniciar com `npm run dev`
- [ ] Testar enviando mensagem
- [ ] Criar o ZIP para compartilhar
- [ ] Compartilhar com seu time! 🎉

---

**Status**: 🟢 Pronto para uso

**Última atualização**: Junho de 2026

Happy coding! 🚀
