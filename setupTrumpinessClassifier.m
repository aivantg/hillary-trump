function setupTrumpinessClassifier(fileName)
  global wordContainer trumpTotal hillaryTotal;
  [hillaryString trumpString] = importData(fileName);
  wordContainer = processHillaryTrumpStrings(hillaryString, trumpString);
end