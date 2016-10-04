function setupTrumpinessClassifier(fileName)
  global wordContainer;
  [hillaryString trumpString] = importData(fileName);
  wordContainer = processHillaryTrumpStrings(hillaryString, trumpString);
end