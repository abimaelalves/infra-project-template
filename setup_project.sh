#!/bin/bash

# Pergunta o nome do projeto (ou usa o diretório atual como padrão)
read -p "Digite o nome do projeto (ou pressione Enter para usar o diretório atual): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-$(basename "$PWD")}

echo "📂 Criando estrutura do projeto: $PROJECT_NAME ..."

# Criando estrutura de diretórios
mkdir -p $PROJECT_NAME/{app,k8s,docker-local,scripts}

# Criando arquivos básicos
touch $PROJECT_NAME/.gitignore
touch $PROJECT_NAME/README.md

# Criando estrutura da aplicação com Dockerfile
touch $PROJECT_NAME/app/Dockerfile

# Criando README.md dentro de app/ com instruções de build e push
cat <<EOL > $PROJECT_NAME/app/README.md
# 📦 Guia para Criar, Buildar e Fazer Push de uma Imagem Docker

Este guia explica o passo a passo para criar uma imagem Docker, buildá-la localmente e enviá-la para o Docker Hub.

## 🛠️ Pré-requisitos
Antes de começar, certifique-se de ter:
- Docker instalado ([Instalação do Docker](https://docs.docker.com/get-docker/))
- Uma conta no Docker Hub ([Criar conta](https://hub.docker.com/))
- Estar logado no Docker Hub via terminal

## 🚀 Passo a Passo

### **1️⃣ Criar um Dockerfile**
No diretório do seu projeto, crie um arquivo chamado \`Dockerfile\` e adicione as instruções para construir a imagem. Exemplo básico:

\`\`\`dockerfile
# Escolha uma imagem base adequada para seu projeto
FROM alpine:latest

# Definindo o diretório de trabalho dentro do container
WORKDIR /app

# Copiando os arquivos do projeto para dentro do container
COPY . .

# Comando de execução do container (ajuste conforme necessário)
CMD ["sh"]
\`\`\`

Se for uma aplicação específica (por exemplo, Node.js, Python, Go), adapte a imagem base e os comandos de instalação das dependências.

### **2️⃣ Fazer login no Docker Hub**
Para enviar a imagem ao Docker Hub, você precisa estar autenticado:
\`\`\`bash
docker login
\`\`\`
Digite seu **usuário** e **senha** quando solicitado.

### **3️⃣ Buildar a imagem Docker**
No diretório onde está o \`Dockerfile\`, execute o seguinte comando para construir a imagem:
\`\`\`bash
docker build -t <seu-usuario-docker>/<nome-da-imagem>:<tag> .
\`\`\`
Exemplo:
\`\`\`bash
docker build -t meuusuario/meu-projeto:latest .
\`\`\`

### **4️⃣ Verificar a imagem criada**
Após o build, verifique se a imagem foi criada corretamente:
\`\`\`bash
docker images
\`\`\`
Isso listará todas as imagens disponíveis localmente.

### **5️⃣ Criar uma tag (Opcional)**
Se precisar renomear ou versionar a imagem antes de enviar:
\`\`\`bash
docker tag meuusuario/meu-projeto:latest meuusuario/meu-projeto:v1.0
\`\`\`

### **6️⃣ Fazer push da imagem para o Docker Hub**
Agora, envie a imagem para o Docker Hub:
\`\`\`bash
docker push <seu-usuario-docker>/<nome-da-imagem>:<tag>
\`\`\`
Exemplo:
\`\`\`bash
docker push meuusuario/meu-projeto:latest
\`\`\`

### **7️⃣ Verificar a imagem no Docker Hub**
Acesse seu [Docker Hub](https://hub.docker.com/) e verifique se a imagem foi enviada corretamente.

### **8️⃣ Como puxar a imagem em outro ambiente**
Se precisar usar essa imagem em outro local (ex: servidor ou Kubernetes), basta rodar:
\`\`\`bash
docker pull <seu-usuario-docker>/<nome-da-imagem>:<tag>
\`\`\`
Exemplo:
\`\`\`bash
docker pull meuusuario/meu-projeto:latest
\`\`\`

## 📝 Conclusão
Agora você sabe como criar, buildar e enviar uma imagem Docker para o Docker Hub! 🚀
EOL

# Criando estrutura Kubernetes apenas com o essencial
touch $PROJECT_NAME/k8s/{app-deployment.yaml,app-service.yaml,app-ingress.yaml}

# Criando estrutura para containers locais
touch $PROJECT_NAME/docker-local/docker-compose.yml

# Mensagem final
echo "✅ Estrutura criada com sucesso em: $PROJECT_NAME"
echo "Agora basta adicionar seus arquivos dentro das pastas conforme necessário."
