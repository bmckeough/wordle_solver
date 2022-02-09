# frozen_string_literal: true

require_relative "wordle_solver/version"

module WordleSolver
  class Error < StandardError; end

  class Puzzle
    def initialize(seed_file: "./wordle_data/allowed_words.txt")
      @available_words = File.readlines(seed_file).map do |word|
        word.strip.downcase
      end.filter {|word| word.size == 5}
    end

    def filter(positional, non_positional, unmatched)
      available_words.filter! do |word|
        positional.all? do |letter, index|
          word[index] == letter
        end && non_positional.all? do |letter, index|
          word_letters = word.split("")
          word_letters.include?(letter) && word_letters[index] != letter
        end && !unmatched.any? do |letter|
          word_letters = word.split("")
          word_letters.include?(letter)
        end
      end
    end

    def recommend_guess
      # NOTE: The 3Blue1Brown video referenced in the README discusses how to
      # optimize guesses based on information theory. Using #shuffle leads to
      # non-deterministic performance.
      available_words.shuffle.take(1)
    end

    attr_reader :available_words
  end
end
