# Etapa 1: Construção
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY . ./
RUN dotnet restore

# Compila a aplicação
RUN dotnet publish -c Release -o out

# Etapa 2: Execução
FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app

# Copia os binários da etapa de construção
COPY --from=build /app/out .

# Define o comando de entrada
ENTRYPOINT ["dotnet", "event-sync.dll"]
