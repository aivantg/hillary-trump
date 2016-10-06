function checkTrumpiness(str, showDebug)

  if ~exist('showDebug', 'var')
    showDebug = false;
  end

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
    try
      val = wordContainer(char(word));
    catch
      if showDebug
        fprintf('Could not find word:');
        disp(word);
      end
      continue;
    end
    counter = counter + 1;
    countVector = wordContainer(char(word));

    if showDebug
      fprintf('[Hillary Trump] Count: ');
      disp(countVector);
    end

    if(countVector(1) == 0)
        countVector(1) = countVector(2)/10;
    end
    if(countVector(2) == 0)
        countVector(2) = countVector(1)/10;
    end
    total = countVector(1) + countVector(2);

    hillaryProbs(counter) = countVector(1)/total;
    trumpProbs(counter) = countVector(2)/total;
    % end
  end

  if showDebug
    fprintf('Trump Probabilities:');
    disp(trumpProbs);
    fprintf('Hillary Probabilities:');
    disp(hillaryProbs);
  end

  hillaryness = prod(hillaryProbs)/hillaryTotal;
  trumpiness = prod(trumpProbs)/trumpTotal;

  if showDebug
    fprintf('Raw Trumpiness:');
    disp(trumpiness);
    fprintf('Raw Hillaryness:');
    disp(hillaryness);
  end

  fprintf('Trumpiness: %f%%', 100*trumpiness/(trumpiness+hillaryness));
  fprintf('\nHillaryness: %f%%', 100*hillaryness/(trumpiness+hillaryness));
  fprintf('\n\n');
  if hillaryness > trumpiness
    fprintf('Hillary probably said this.\n');
  else
    fprintf('Trump probably said this.\n');
  end
end
