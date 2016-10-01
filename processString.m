function wordContainer = processTrumpHillaryStrings(trumpString, hillaryString)

% ========================== Preprocess Email ===========================

% Find the Headers ( \n\n and remove )
% Uncomment the following lines if you are working with raw emails with the
% full headers

% hdrstart = strfind(email_contents, ([char(10) char(10)]));
% email_contents = email_contents(hdrstart(1):end);

% Lower case
trumpString = lower(trumpString);
hillaryString = lower(hillaryString)

% Strip all HTML
% Looks for any expression that starts with < and ends with > and replace
% and does not have any < or > in the tag it with a space
trumpString = regexprep(trumpString, '<[^<>]+>', ' ');
hillaryString = regexprep(hillaryString, '<[^<>]+>', ' ');

% Handle Numbers
% Look for one or more characters between 0-9
trumpString = regexprep(trumpString, '[0-9]+', 'num');
hillaryString = regexprep(hillaryString, '[0-9]+', 'num');

% Handle $ sign
trumpString = regexprep(trumpString, '[$]+', 'dol');
hillaryString = regexprep(hillaryString, '[$]+', 'dol');

% Create empty word container
wordContainer = containers.map([], []);

% ========================== Tokenize Email ===========================

% Output the email to screen as well
fprintf('\n==== Processed String ====\n\n');

% Process file
l = 0;

while ~isempty(trumpString) || ~isempty(hillaryString)

    isTrump = ~isempty(trumpString);
    
    % Tokenize and also get rid of any punctuation
    if isTrump
        [str, trumpString] = ...
            strtok(trumpString, ...
                [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
    else
        [str, hillaryString] = ...
            strtok(hillaryString), ...
                [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
    end;

    % Remove any non alphanumeric characters
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = porterStemmer(strtrim(str));
    catch str = ''; continue;
    end;

    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end

    % Look up the word in the word container
    try countVector = wordContainer(str); % Slightly concerned whether this would work.
    catch countVector = [0, 0];
    end;

    % Update the Count
    if isTrump
        countVector = [countVector(1)++, countVector(2)];
    else
        countVector = [countVector(1), countVector(2)++];
    end;

    % Update the Container
    wordContainer(str) = countVector;

end

% Print footer
fprintf('\n\n=========================\n');

end
