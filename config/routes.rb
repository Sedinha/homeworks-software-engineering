Rails.application.routes.draw do
  get 'anagrams/check'
  root 'pages#home'
  
  get 'palindrome/check', to: 'palindrome#check'
  
  get 'rock_paper_scissors/check', to: 'rock_paper_scissors#check'

  get 'anagrams/check', to: 'anagrams#check'
  
end
