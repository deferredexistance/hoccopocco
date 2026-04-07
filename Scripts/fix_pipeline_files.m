% fix_pipeline_files.m
% Fixes simulink_pipeline.yml and ir_dag.json for CI pipeline

%% Paths
workflowsDir    = '.github/workflows';
ymlFile         = fullfile(workflowsDir, 'simulink_pipeline.yml');
dagFile         = fullfile(workflowsDir, 'ir_dag.json');

fprintf('=== Fix Pipeline Files ===\n');

%% ---------------------------------------------------------------
%  Task 1: Edit simulink_pipeline.yml
%  - Replace "/path/to/ir_dag.json"         -> ".github/workflows/ir_dag.json"
%  - Replace "/path/to/simulink_pipeline.yml" -> ".github/workflows/simulink_pipeline.yml"
%  - Replace cp source paths accordingly
%% ---------------------------------------------------------------
fprintf('\n[Task 1] Editing simulink_pipeline.yml ...\n');

fid = fopen(ymlFile, 'r');
assert(fid ~= -1, 'Cannot open %s', ymlFile);
ymlContent = fread(fid, '*char')';
fclose(fid);

ymlContent = strrep(ymlContent, ...
    '"/path/to/ir_dag.json"', ...
    '".github/workflows/ir_dag.json"');

ymlContent = strrep(ymlContent, ...
    '"/path/to/simulink_pipeline.yml"', ...
    '".github/workflows/simulink_pipeline.yml"');

ymlContent = strrep(ymlContent, ...
    'cp "/path/to/ir_dag.json"', ...
    'cp ".github/workflows/ir_dag.json"');

ymlContent = strrep(ymlContent, ...
    'cp "/path/to/simulink_pipeline.yml"', ...
    'cp ".github/workflows/simulink_pipeline.yml"');

fid = fopen(ymlFile, 'w');
assert(fid ~= -1, 'Cannot write to %s', ymlFile);
fwrite(fid, ymlContent, 'char');
fclose(fid);

fprintf('  Done: %s updated.\n', ymlFile);

%% ---------------------------------------------------------------
%  Task 2 & 3: Edit ir_dag.json
%  - Rename key "NetworkStoragePath" -> "NETWORK_STORAGE_PATH"
%  - Remove blank "" entries from all OutputsPaths arrays
%% ---------------------------------------------------------------
fprintf('\n[Task 2 & 3] Editing ir_dag.json ...\n');

fid = fopen(dagFile, 'r');
assert(fid ~= -1, 'Cannot open %s', dagFile);
dagContent = fread(fid, '*char')';
fclose(fid);

% --- Task 2: Rename key ---
dagContent = strrep(dagContent, '"NetworkStoragePath"', '"NETWORK_STORAGE_PATH"');
fprintf('  Done: Renamed NetworkStoragePath -> NETWORK_STORAGE_PATH.\n');

% --- Task 3: Remove blank "" from OutputsPaths arrays ---
% Parse as JSON to safely manipulate arrays
dagStruct = jsondecode(dagContent);

% Fix root-level OutputsPaths
if isfield(dagStruct, 'OutputsPaths')
    dagStruct.OutputsPaths = removeBlankEntries(dagStruct.OutputsPaths);
    fprintf('  Done: Cleaned root OutputsPaths: %s\n', strjoin(dagStruct.OutputsPaths, ', '));
end

% Fix each Job's OutputsPaths
if isfield(dagStruct, 'Jobs')
    jobNames = fieldnames(dagStruct.Jobs);
    for i = 1:numel(jobNames)
        job = dagStruct.Jobs.(jobNames{i});
        if isfield(job, 'OutputsPaths')
            dagStruct.Jobs.(jobNames{i}).OutputsPaths = removeBlankEntries(job.OutputsPaths);
            fprintf('  Done: Cleaned Jobs.%s.OutputsPaths: %s\n', ...
                jobNames{i}, strjoin(dagStruct.Jobs.(jobNames{i}).OutputsPaths, ', '));
        end
    end
end

% Fix each Branch's OutputsPaths
if isfield(dagStruct, 'Branches')
    branchNames = fieldnames(dagStruct.Branches);
    for i = 1:numel(branchNames)
        branch = dagStruct.Branches.(branchNames{i});
        if isfield(branch, 'OutputsPaths')
            dagStruct.Branches.(branchNames{i}).OutputsPaths = removeBlankEntries(branch.OutputsPaths);
            fprintf('  Done: Cleaned Branches.%s.OutputsPaths: %s\n', ...
                branchNames{i}, strjoin(dagStruct.Branches.(branchNames{i}).OutputsPaths, ', '));
        end
    end
end

% Write back as formatted JSON
dagJson = jsonencode(dagStruct, 'PrettyPrint', true);

fid = fopen(dagFile, 'w');
assert(fid ~= -1, 'Cannot write to %s', dagFile);
fwrite(fid, dagJson, 'char');
fclose(fid);

fprintf('  Done: %s updated.\n', dagFile);
fprintf('\n=== All tasks completed successfully ===\n');

%% ---------------------------------------------------------------
%  Helper: Remove blank string entries from a cell array
%% ---------------------------------------------------------------
function cleaned = removeBlankEntries(arr)
    % jsondecode returns string arrays or cell arrays depending on content
    if ischar(arr) || isstring(arr)
        arr = cellstr(arr);
    end
    cleaned = arr(~cellfun(@(x) isempty(strtrim(x)), arr));
end