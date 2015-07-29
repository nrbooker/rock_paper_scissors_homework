class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  # Your code goes below.
  # From class

  def ropasc
    @user_move = params["your_move"]

    @computer_move =["rock","paper","scissors"].sample

      if @user_move == @computer_move
      @outcome = "Tie!"

    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "You won!"

    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "You lost!"

    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "You lost!"

    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "You won!"

    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "You lost!"

    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "You won!"
    end


    m = Move.new
    m.user_move = @user_move
    m.computer_move = @computer_move

    if @outcome == "You won!"

      m.user_wins = 1
      m.computer_wins = 0
      m.tie = 0
    elsif @outcome == "You lost!"

      m.user_wins = 0
      m.computer_wins = 1
      m.tie = 0
    else

      m.user_wins = 0
      m.computer_wins = 0
      m.tie = 1

      m.save


    end

      @all_moves = Move.all

      @db_count = Move.count

      @total_rock_wins = Move.where({ :user_move => "rock", :user_wins => 1 }).count

      @total_paper_wins = Move.where({ :user_move => "paper", :user_wins => 1 }).count

      @total_scissors_wins = Move.where({ :user_move => "scissors", :user_wins => 1 }).count

      @total_wins = Move.where({ :user_wins => 1 }).count

      @total_rock_losses = Move.where({ :user_move => "rock", :computer_wins => 1 }).count

      @total_paper_losses = Move.where({ :user_move => "paper", :computer_wins => 1 }).count

      @total_scissors_losses = Move.where({ :user_move => "scissors", :computer_wins => 1 }).count

      @total_losses = Move.where({ :computer_wins => 1 }).count


      @total_rock_ties = Move.where({ :user_move => "rock", :tie => 1 }).count

      @total_paper_ties = Move.where({ :user_move => "paper", :tie => 1 }).count

      @total_scissors_ties = Move.where({ :user_move => "scissors", :tie => 1 }).count

      @total_ties = Move.where({ :tie => 1 }).count

      render("ropasc.html.erb")
    end






end
