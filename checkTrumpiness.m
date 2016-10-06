function checkTrumpiness(str)
  words = extractWords(str);
  fprintf('Printing Words');
  disp(words);
  global wordContainer trumpiness hillaryness;
  
  hillaryProbs = zeros(length(words),1);
  trumpProbs = zeros(length(words),1);

  for i = 1:length(words)
    word = words(i);
    if(isKey(wordContainer, word))
        countVector = wordContainer(char(word));
        disp(countVector);
        total = countVector(1) + countVector(2);
        hillaryProbs(i) = countVector(1)/total;
        trumpProbs(i) = countVector(2)/total;
    end
  end

  hillaryness = prod(hillaryProbs);
  trumpiness = prod(trumpProbs);
  disp(trumpiness);
  disp(hillaryness);
  
  fprintf('Trumpiness: %f', trumpiness/(trumpiness+hillaryness));
  fprintf('\nHillaryness: %f', hillaryness/(trumpiness+hillaryness));
  fprintf('\n\n');
  if hillaryness > trumpiness
    fprintf('Hillary probably said this.');
  else
    fprintf('Trump probably said this.');
  end
end