class Matcher
	require 'set'

	def initialize(set1, set2)	
		@set1 = set1
		@set2 = set2
		@set1_index = {}
		@inverted_set1_index = {}
		@set2_index = {}
		@inverted_set2_index = {}
		@recommendations = {}
		@output = {}
	end

	def match
		create_indices
		create_inverted_indices
		match_by_inverted_indices
		lookup_output_values_by_index
		return @output 
	end

	private 

	def remove_extra_symbols(string)
	  alphabet = Set.new(('a'..'z').to_a)
	  newString = string.to_s.downcase.to_s
	  newString.gsub!('_', ' ')
	  newString.gsub!('.m4a', '')
	  newString.gsub!('.mp4', '')
	  words = newString.split(' ')
	  new_words = []
	  words.each do |word|
	    new_words << word.split('').keep_if {|s| alphabet.include?(s)}.join('')
	  end 
	  newString = new_words.join(' ')
	  newString
	end 

	def create_indices 
		@set1.each_with_index do |value_of_set_1, index| 
		  @set1_index[index] = value_of_set_1
		end 
		@set2.each_with_index do |value_of_set_2, index| 
		  @set2_index[index] = value_of_set_2
		end 
	end 
	def create_inverted_indices
		@set1_index.each do |index, value_of_set_1|
		  words = remove_extra_symbols(value_of_set_1).split(' ')
		  words.each do |word|
		    @inverted_set1_index[word] ||= Set.new
		    @inverted_set1_index[word] << index
		  end 
		end 
		@set2_index.each do |index, value_of_set_2|
		  words = remove_extra_symbols(value_of_set_2).split(' ')
		  words.each do |word|
		    @inverted_set2_index[word] ||= Set.new
		    @inverted_set2_index[word] << index
		  end 
		end 
	end

	def match_by_inverted_indices
		@inverted_set2_index.each do |word, value_of_set_2_ids|
		  Array(@inverted_set1_index[word]).each do |set_1_member_id|
		    @recommendations[set_1_member_id] ||= {}
		    value_of_set_2_ids.each do |id| 
		      @recommendations[set_1_member_id][id] ||= 0
		      @recommendations[set_1_member_id][id] += 1
		    end 
		  end 
		end 
	end

	def lookup_output_values_by_index
		@recommendations.each do |set_1_member_id, set_2_member_indices|
		  max_index = set_2_member_indices.max_by{|k,v| v}[0]
		  value_of_set_2 = @set2_index[max_index]
		  @output[value_of_set_2] = @set1_index[set_1_member_id]
		end 
	end

end