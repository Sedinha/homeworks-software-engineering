class RockPaperScissorsController < ApplicationController
  def check
    @input = params.fetch(:input, {}).permit!.to_h.values.map { |player| [player[:name], player[:strategy]] } || []
    if @input.length == 2
      @result = rps_game_winner(@input)
    else
      @result = "Error: Wrong number of players"
    end
  end

  private

  def rps_game_winner(game)
    raise WrongNumberOfPlayersError if game.nil? || game.length != 2

    valid_strategies = ['R', 'P', 'S']

    player1, player2 = game

    player1_name, player1_strategy = player1
    player2_name, player2_strategy = player2

    unless player1_strategy && player2_strategy && valid_strategies.include?(player1_strategy.upcase) && valid_strategies.include?(player2_strategy.upcase)
      raise NoSuchStrategyError, "Strategy must be one of R, P, S"
    end

    if player1_strategy == player2_strategy
      return player1
    end

    case player1_strategy
    when 'R'
      player2_strategy == 'S' ? player1 : player2
    when 'P'
      player2_strategy == 'R' ? player1 : player2
    when 'S'
      player2_strategy == 'P' ? player1 : player2
    end
  end

  def rps_tournament_winner(tournament)
    if tournament[0][0].is_a?(String)
      return rps_game_winner(tournament)
    end

    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
    # rps_game_winner([left_winner, right_winner])
  end

  class WrongNumberOfPlayersError < StandardError; end
  class NoSuchStrategyError < StandardError; end

end
