function checkTrumpiness(str)
  global hillaryTotal trumpTotal;
  words = extractWords(str);
  %fprintf('Printing Words');
  %disp(words);
  global wordContainer trumpiness hillaryness;
  
  hillaryProbs = [];
  trumpProbs = [];
  counter = 0;
  
  for i = 1:length(words)
    word = words(i);
    if(isKey(wordContainer, word))
        counter = counter + 1;
        countVector = wordContainer(char(word));
        disp(countVector);
        if(countVector(1) == 0)
            countVector(1) = countVector(2)/10;
        end
        if(countVector(2) == 0)
            countVector(2) = countVector(1)/10;
        end
        total = countVector(1) + countVector(2);
        hillaryProbs(counter) = countVector(1)/total;
        trumpProbs(counter) = countVector(2)/total;
    end
  end

  disp(hillaryProbs);
  disp(trumpProbs)
  
  hillaryness = prod(hillaryProbs)/hillaryTotal;
  trumpiness = prod(trumpProbs)/trumpTotal;
  disp(trumpiness);
  disp(hillaryness);
  
  fprintf('Trumpiness: %f%%', 100*trumpiness/(trumpiness+hillaryness));
  fprintf('\nHillaryness: %f%%', 100*hillaryness/(trumpiness+hillaryness));
  fprintf('\n\n');
  if hillaryness > trumpiness
    fprintf('Hillary probably said this.');
  else
    fprintf('Trump probably said this.');
  end
end