function [words] = extractWords(str)
  str = processString(str);
  numWords =  0;
  while ~isempty(str)

    % get the first word and set str to what remains
    [rawStr str] = strtok(str, ...
                [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
    % Stem the word
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try stemmedStr = porterStemmer(char(strtrim(rawStr)));
    catch stemmedStr = ''; continue;
    end

    disp(stemmedStr);

    if length(str) < 1
         continue;
    end

    % Remove any non alphanumeric characters
    numWords = numWords + 1;
    words(numWords) = regexprep(stemmedStr, '[^a-zA-Z0-9]', '');
  end
  fprintf('Words: ');
  disp(words);
end
