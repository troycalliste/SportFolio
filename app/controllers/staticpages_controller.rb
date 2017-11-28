class StaticpagesController < ApplicationController


  def home
  end

  def help
    @test = Company.all
  end

  def tour
  end

  def about
  end

  protected

 def rescue_from_timeout(exception)

 end

end
