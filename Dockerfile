FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Moeda/Moeda.csproj", "Moeda/"]
RUN dotnet restore "Moeda/Moeda.csproj"
COPY . .
WORKDIR "/src/Moeda"
RUN dotnet build "Moeda.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Moeda.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Moeda.dll"]
