GitHubOptions = padv.pipeline.GitHubOptions(GeneratorVersion=1)
GitHubOptions.MatlabInstallationLocation = "C:\Program Files\MATLAB\R2025b\bin\";
GitHubOptions.TemplatePath = "./.github/workflows/simulink_pipeline.yml";
GitHubOptions.NetworkStoragePath = "/artifactManagement/cacheStorage";
GitHubOptions.SupportPackageRoot = "C:\\ProgramData\\MATLAB\\SupportPackages\\R2025b";
GitHubOptions.MatlabLaunchCmd = "C:\Program Files\MATLAB\R2025b\bin\matlab.exe"
padv.pipeline.generatePipeline(GitHubOptions)