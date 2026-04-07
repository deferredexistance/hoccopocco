GitHubOptions = padv.pipeline.GitHubOptions(GeneratorVersion=2)
GitHubOptions.MatlabInstallationLocation = '"C:\\Program Files\\MATLAB\\R2025b\\bin\\"';
GitHubOptions.RunnerLabels = "cicd";
GitHubOptions.SupportPackageRoot = "C:\\ProgramData\\MATLAB\\SupportPackages\\R2025b";
GitHubOptions.GeneratedPipelineDirectory = ".github\workflows"	
GitHubOptions.RemoteBuildCacheName = "GitHub_MATLAB_Pipeline"
GitHubOptions.ArtifactServiceMode = "network";
GitHubOptions.NetworkStoragePath = "/artifactManagement/cacheStorage";
GitHubOptions.RelativeProjectPath = "";
GitHubOptions.UseMatlabPlugin = false;
% LaunchCommandString = ['C:\\Program Files\\MATLAB\\R2025b\\bin\\matlab.exe', ...
%     ' -nodesktop -logfile'];
% 
% GitHubOptions.MatlabLaunchCmd = LaunchCommandString;
%GitHubOptions.MatlabStartupOptions = "";
GitHubOptions.PipelineArchitecture = "SerialStages";
padv.pipeline.generatePipeline(GitHubOptions)
