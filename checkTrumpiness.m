function checkTrumpiness(str)
  words = extractWords(str);
  fprintf("Printing Words and Word Container");
  disp(words);
  global wordContainer;
  disp(wordContainer(str));

  hillaryProbs = [];
  trumpProbs = [];

  for i = 1:length(words)
    word = words(i);
    countVector = wordContainer(word);
    total = countVector(1) + countVector(2);
    hillaryProbs(i) = countVector(1)/total;
    trumpProbs(i) = countVector(2)/total;
  end

  hillaryness = naiveBayes(hillaryProbs);
  trumpiness = naiveBayes(trumpProbs);

  fprintf("Trumpiness: %f\n Hillaryness: %f\n\n");
  if hillaryness > trumpiness
    fprintf("Hillary probably said this");
  else
    fprintf("Trump probably said this");
  end
end;
