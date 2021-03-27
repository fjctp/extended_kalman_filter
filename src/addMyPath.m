function addMyPath(varargin)

ip = inputParser;
addOptional(ip, 'root', '.', @isstring);
addOptional(ip, 'skip_folder', ["slprj", "cache"], @(x) isvector(x) && isstring(x));
parse(ip, varargin{:});

root = ip.Results.root;
skip_folder = ip.Results.skip_folder;

p = genpath(root);
p = split(p, ';');

% remove empty element
ind = cellfun(@(x) ~isempty(x), p);
p = p(ind);

% remove ignored folder
p = string(p);
for ii = 1:length(skip_folder)
    ind = arrayfun(@(x) isempty(regexp(x, skip_folder(ii), 'once')), p);
    p = p(ind);
end

p = join(p, ';');

addpath(p);

end

