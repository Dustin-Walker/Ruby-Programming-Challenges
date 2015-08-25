def lettersInOrder?(word)
  previousChar = ''
  word.chars do |newChar|
    if previousChar!= '' && newChar.ord < previousChar.ord
      return false
    end
    previousChar = newChar
  end
  return true
end

def lettersInReverseOrder?(word)
  return lettersInOrder?(word.reverse)
end

def letterOrderAnalyzer(word)
  if lettersInOrder?(word)
    p "The word #{word} in in forward order."
  else
    if lettersInReverseOrder?(word)
      p "The word #{word} in in reverse order."
    else
      p "The word #{word} is not in order."
    end
  end
end

wordList = ["billowy", "biopsy", "chinos", "defaced", "chintz", "sponged", "bijoux", "abhors", "fiddle", "begins", "chimps", "wronged"]

wordList.each do |word|
  letterOrderAnalyzer(word)
end
