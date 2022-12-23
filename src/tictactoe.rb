# frozen_string_literal: true

require_relative 'game'

class Tictactoe
  def initialize
    @mode = ask_mode
    difficult = ask_difficult
    @game = Game.new(@mode, difficult)
  end

  def start_game
    while @game.ongoing?
      print_board
      ask_human_spot('O')
      if @game.ongoing? && @game.vs_hum?
        print_board
        ask_human_spot('X')
      end
      @game.eval_board if @game.ongoing? && @game.vs_com?
    end
    print_board
    puts 'Game over'
  end

  def ask_human_spot(player)
    spot = nil

    until spot
      puts "Player #{player}, Enter [0-8]:"
      spot = gets.chomp.to_i

      if @game.available_spaces.include?(spot.to_s)
        @game.board[spot] = player
      else
        spot = nil
      end
    end

    spot
  end

  def ask_mode
    input = nil

    until input
      puts "Choose the mode: \n vs hum: h \n vs com: c "
      input = gets.chomp.to_s

      if input != 'h' && input != 'c'
        puts 'Invalid value'
        input = nil
      end
    end

    input
  end

  def ask_difficult
    return nil if @mode == 'h'

    input = nil

    until input
      puts "Choose the difficult: \n hard: h \n easy: e "
      input = gets.chomp.to_s

      if input != 'h' && input != 'e'
        puts 'Invalid value'
        input = nil
      end
    end

    input
  end

  def print_board
    puts ''"
     #{@game.board[0]} | #{@game.board[1]} | #{@game.board[2]}
    ---+---+---
     #{@game.board[3]} | #{@game.board[4]} | #{@game.board[5]}
    ---+---+---
     #{@game.board[6]} | #{@game.board[7]} | #{@game.board[8]}
    "''
  end
end

tictactoe = Tictactoe.new
tictactoe.start_game
