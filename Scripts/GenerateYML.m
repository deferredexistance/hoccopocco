GitHubOptions = padv.pipeline.GitHubOptions(GeneratorVersion=1)
GitHubOptions.MatlabInstallationLocation = "/usr/local/MATLAB/R2025b/bin";



GitHubOptions.MatlabLaunchCmd = '"C:\\Program Files\\MATLAB\\R2025b\\bin\\matlab.exe"';
GitHubOptions.PipelineArchitecture = "SerialStages";
padv.pipeline.generatePipeline(GitHubOptions)