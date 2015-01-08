class WordsController < ApplicationController
	def new
	end

	def create
		@word = Word.find_by(word: params[:word])
		if @word.nil?
			redirect_to root_path 
		else
			redirect_to word_path(@word.word)
		end
	end

	def show
		@word = Word.find_by(word: params[:id])

		if @word.nil?
			redirect_to root_path 
		else
			@neighbors = @word.neighbors
		end
	end
end
