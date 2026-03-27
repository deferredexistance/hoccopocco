GitHubOptions = padv.pipeline.GitHubOptions(GeneratorVersion=2)
GitHubOptions.MatlabInstallationLocation = "/usr/local/MATLAB/R2025b/bin";
GitHubOptions.TemplatePath = "./.github/workflows/simulink_pipeline.yml";
GitHubOptions.NetworkStoragePath = "/artifactManagement/cacheStorage";
GitHubOptions.SupportPackageRoot = "C:\\ProgramData\\MATLAB\\SupportPackages\\R2025b";
GitHubOptions.MatlabLaunchCmd = "C:\Program Files\MATLAB\R20245b\bin\matlab.exe"
padv.pipeline.generatePipeline(GitHubOptions)