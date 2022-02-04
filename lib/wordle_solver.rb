# frozen_string_literal: true

require_relative "wordle_solver/version"

module WordleSolver
  class Error < StandardError; end

  class Puzzle
    def initialize
      @available_words = File.readlines("/usr/share/dict/words").map do |word|
        word.strip.downcase
      end.filter {|word| word.size == 5}
    end

    def filter(positional, non_positional)
      available_words.filter! do |word|
        positional.all? do |letter, index|
          word[index] == letter
        end && non_positional.all? do |letter, index|
          word_letters = word.split("")
          word_letters.include?(letter) && word_letters[index] != letter
        end
      end
    end

    def recommend_guess
      available_words.shuffle.take(1)
    end

    attr_reader :available_words
  end
end
