# build stage/image
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY AarhusSpaceProgram.Api/*.csproj ./api/
WORKDIR /source/api
RUN dotnet restore

# copy everything else and build app
COPY AarhusSpaceProgram.Api/. .
RUN dotnet publish -c release -o /app

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "AarhusSpaceProgram.Api.dll"]