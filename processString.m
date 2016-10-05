function [str] = processString(string)
  % Lower case
  str = lower(string);

  % Strip all HTML
  % Looks for any expression that starts with < and ends with > and replace
  % and does not have any < or > in the tag it with a space
  str = regexprep(string, '<[^<>]+>', ' ');

  % Handle Numbers
  % Look for one or more characters between 0-9
  str = regexprep(string, '[0-9]+', 'num');

  % Handle $ sign
  str = regexprep(string, '[$]+', 'dol');
end;
