class PalindromeController < ApplicationController
  def check
    @input = params[:input]
    @result = palindrome?(@input)
  end

  private

  def palindrome?(str)
    return false if str.nil?
    cleaned_str = str.gsub(/\W/, '').downcase
    cleaned_str == cleaned_str.reverse
  end

end
