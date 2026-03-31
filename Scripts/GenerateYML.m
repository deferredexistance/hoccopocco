GitHubOptions = padv.pipeline.GitHubOptions(GeneratedPipelineDirectory=1)
GitHubOptions.MatlabInstallationLocation = "/usr/local/MATLAB/R2025b/bin";



GitHubOptions.MatlabLaunchCmd = "/usr/local/MATLAB/R2025b/bin/matlab.exe";
GitHubOptions.PipelineArchitecture = "SerialStages";
padv.pipeline.generatePipeline(GitHubOptions)