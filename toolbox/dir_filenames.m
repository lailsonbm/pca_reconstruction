function [files] = dir_filenames(dirpath,expression,appendpath)
% DIR_FILENAMES Get filenames that matches filter
%               expression from a directory.
% usage: files = dir_filenames(path, filter)
%      dirpath - directory path
%   expression - regex expression to filter files
%        files - cell array containing matching filenames
%     

if nargin < 2
	expression = '.';
end

if nargin < 3
	appendpath = false;
end
	
all_files = dir(dirpath);
files = {};
j = 1;
for i = 1:size(all_files,1)
	if regexp(all_files(i).name, expression)
		if appendpath
			files{j} = sprintf('%s/%s',dirpath,all_files(i).name);
		else
			files{j} = all_files(i).name;
		end
		j = j + 1;
	end
end

end
