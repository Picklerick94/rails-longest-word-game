require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    # raise
    @results = []
    @word = ('a'..'z').to_a
    10.times {@results << @word.sample}
  end

  def score
    # raise
    #convert the input word into letters
    url = "https://wagon-dictionary.herokuapp.com/#{params[:new_word]}"
    @results = JSON.parse(open(url).read)
    @new_word = params[:new_word].chars
      if @new_word == params[:result].split
        @final = @new_word.join
        @answer = "Sorry but #{@final} can't be build!"
      elsif @results["found"] != true
        @answer = "Sorry but #{@final} is not a word!"
      else @answer = "Yeephie"
    end
  end
end
