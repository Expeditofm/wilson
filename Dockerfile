# Use a imagem base do Python com Alpine Linux para um tamanho menor
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do Python a partir do arquivo requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Define o comando para iniciar a aplicação usando Uvicorn
# O host 0.0.0.0 permite que aplicação seja acessível externamente ao container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# Expõe a porta 8000 para acesso externo
EXPOSE 8000
