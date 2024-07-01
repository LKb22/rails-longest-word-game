class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join
  end
  def included_letters?(answer, grid)
    answer.downcase.chars.all? { |letter| answer.count(letter) <= grid.downcase.count(letter) }
  end
  def english_word?(answer)
    "https://dictionary.lewagon.com/#{answer}"
  end
  def score
    if included_letters?(params[:answer], params[:grid])
      if english_word?(params[:answer])
        @response = "Congratulations! #{params[:answer]} is a valid English word!"
      else
        @response = "Sorry, but #{params[:answer]} doesn't seem to be a valid English word."
      end
    else
      @response = "Sorry, but #{params[:answer]} can't be built out of #{params[:grid]}."
    end
  end
end
