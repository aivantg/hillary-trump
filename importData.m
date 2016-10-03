function [hillary trump] = importData(filename)
filename = 'debate.txt';
M = importdata(filename, '\t');
hillary = '';
trump = '';
for i = 2:length(M)
    line = strsplit(char(M(i)), '\t');
    if strcmp(char(line(2)), 'Clinton')
        hillary = strcat(hillary, {' '}, char(line(3)));
    end
    if strcmp(char(line(2)), 'Trump')
        trump = strcat(trump, {' '}, char(line(3)));
    end
end
hillary = char(hillary);
trump = char(trump);
end