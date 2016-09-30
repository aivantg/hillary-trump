function [trump hillary] = importData(filename)
M = importdata(filename, '\t');
trump = '';
hillary = '';
for i = 2:length(M)
    line = strsplit(char(M(i)), '\t');
    if strcmp(char(line(2)), 'Trump')
        trump = trump + char(line(3));
    end
    if strcmp(char(line(2)), 'Clinton')
        hillary = hillary + char(line(3));
    end
end
end