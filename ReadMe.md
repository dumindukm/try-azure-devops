# Add code coverage to repo

# create manifest file , so pipeline can install when run in azure pipeline
dotnet new tool-manifest

dotnet tool install dotnet-reportgenerator-globaltool

add package coverlet.msbuild in test project

dotnet test --no-build --configuration Release /p:CollectCoverage=true /p:CoverletOutputFormat=cobertura /p:CoverletOutput=TestResults/Coverage/

dotnet tool run reportgenerator -reports:./TestResults/Coverage/coverage.cobertura.xml -targetdir:./CodeCoverage -reporttypes:HtmlInline_AzurePipelines