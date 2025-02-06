# Infra Project Template 🚀

Este repositório contém um **script shell (`setup_project.sh`)** que gera automaticamente a estrutura básica para um projeto de infraestrutura e aplicações containerizadas.

## 📂 Estrutura Criada
Após a execução do script, a seguinte estrutura será gerada:

```
📦 SEU_PROJETO/
├── app/                     # Diretório da aplicação
│   ├── Dockerfile           # Arquivo para criação da imagem da aplicação
│   ├── README.md            # Instruções para build e push da imagem Docker
├── k8s/                     # Arquivos essenciais do Kubernetes
│   ├── app-deployment.yaml  # Deployment da aplicação
│   ├── app-service.yaml     # Service para expor a aplicação
│   ├── app-ingress.yaml     # (Opcional) Ingress para expor externamente
├── docker-local/            # Configuração de containers locais (ex: LocalStack, MinIO)
│   ├── docker-compose.yml   # Configuração do Docker Compose
├── scripts/                 # Diretório para scripts auxiliares (se necessário)
├── .gitignore               # Arquivo Git para ignorar arquivos desnecessários
├── README.md                # Documentação do projeto
```

## 🛠️ **Como Usar**
1️⃣ **Dê permissão de execução ao script**:
```bash
chmod +x setup_project.sh
```

2️⃣ **Execute o script** e escolha o nome do projeto:
```bash
./setup_project.sh
```
💡 Se não informar um nome, ele usará o **diretório atual**.

3️⃣ **Adicione seus arquivos** dentro das pastas conforme necessário.

## 🎯 **Objetivo**
Esse script serve como um **template genérico**, permitindo inicializar projetos com Kubernetes e infraestrutura rapidamente, sem precisar criar diretórios e arquivos manualmente.

## 📌 **Contribuições**
Sinta-se à vontade para **customizar e melhorar** o script conforme suas necessidades! 🚀

