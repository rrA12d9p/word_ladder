module WordHelper
	def neighbors
		test_word = self.word
		neighbors = []
		test_word.split("").each_with_index do |c, i|
			pattern = test_word.dup
			pattern[i] = "."
			neighbors += Word.where('word ~* :pat', pat: "^#{pattern}$")
		end
		neighbors = neighbors.uniq.delete_if {|word| word.word == test_word}
		return neighbors
	end
end