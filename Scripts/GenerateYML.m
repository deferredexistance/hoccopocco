GitHubOptions = padv.pipeline.GitHubOptions(GeneratorVersion=1)
GitHubOptions.MatlabInstallationLocation = '"C:\\Program Files\\MATLAB\\R2025b\\bin\\"';

LaunchCommandString = ['C:\\Program Files\\MATLAB\\R2025b\\bin\\matlab.exe', ...
    ' -nodesktop -logfile'];

GitHubOptions.MatlabLaunchCmd = LaunchCommandString;
GitHubOptions.MatlabStartupOptions = "";
GitHubOptions.PipelineArchitecture = "SerialStages";
padv.pipeline.generatePipeline(GitHubOptions)