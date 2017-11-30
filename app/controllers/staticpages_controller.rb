class StaticpagesController < ApplicationController
  rescue_from ActionView::Template::Error, with: :handle_timeout
  rescue_from Timeout::Error, with: :handle_timeout




  def home
  end

  def help
    @test = Company.all
  end

  def tour
  end

  def about
    @test = Company.all
  end

  protected

  def handle_timeout(exception)
    count = 0
    begin
        raise if count > 5
      rescue
        count += 1
      retry

    end
  end

end
