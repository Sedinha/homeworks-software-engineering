class AnagramsController < ApplicationController
  def check
    @words = params[:words]&.split(',')&.map(&:strip) || []
    @result = combine_anagrams(@words) if @words.any?
  end

  private

  def combine_anagrams(words)
    # Group words by their sorted lowercase letters
    words.group_by { |word| word.downcase.chars.sort.join }
         .values
         .select { |group| group.length > 1 }  # Only return groups with more than one word
  end
end