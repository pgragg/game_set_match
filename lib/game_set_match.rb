require "game_set_match/version"

module GameSetMatch
  def match(set1, set2)
  	raise ArgumentError unless set1 && set2 
  	Matcher.new(set1, set2).match
  end
end
