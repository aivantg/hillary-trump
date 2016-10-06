function [words] = extractWords(str)
  str = processString(str);
  rawWords = strsplit(str);
  numWords =  0;
  words = [];

  for i = 1:length(rawWords)

    % Stem the word
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try stemmedStr = porterStemmer(strtrim(char(rawWords(i))));
    catch stemmedStr = ''; continue;
    end

    disp(stemmedStr);
    
    if length(str) < 1
         continue;
    end

    % Remove any non alphanumeric characters
    numWords = numWords + 1;
    words(numWords) = char(regexprep(stemmedStr, '[^a-zA-Z0-9]', ''));
  end
  fprintf('Words: ');
  disp(words);
end