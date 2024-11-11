class GamesController < ApplicationController
  def home
  end

  def new
    @letters = [];
    10.times {
      @letters.push(('A'..'Z').to_a.sample);
    }
  end

  def score
    @word = params[:word];
    @letters = params[:letters];
    res_valid = true;
    @word.chars.each do |i|
      res_valid = res_valid && ( @word.scan(i.downcase).size <= @letters.split.select { |j| j.downcase.to_s == i.downcase.to_s }.size )
    end
    # raise

    @message =  "'#{@word.upcase}' is your answer."

     # on accède à la page du dictionnaire du wagon du mot renseigné
    # url = "https://dictionary.lewagon.com/#{@word.downcase}"
    # user_serialized = URI.parse(url).read
    # user = JSON.parse(user_serialized)

    # # on affiche un message différent suivant le résultat
    # if user["found"] && res_valid # mot existe et toutes les lettres sont dans grid
    #   @message =  "Well Done! '#{@word.upcase}' is a valid english word"
    # elsif !user["found"] # si le mot n'est pas anglais
    #   @message =  "Your answer '#{@word.upcase}' is not an english word"
    # elsif !res_valid # si le mot n'est pas dans le grid
    #   @message =  "Your answer '#{@word.upcase}' is not in the grid"
    # else
    #   @message =  "Too bad! Try again!"
    # end
  end
end
