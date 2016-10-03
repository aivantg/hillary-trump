function setupTrumpinessClassifier(fileName)
  [hillaryString trumpString] = importData(fileName);
  wordContainer = processHillaryTrumpStrings(hillaryString, trumpString);
end;
