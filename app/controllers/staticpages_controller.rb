class StaticpagesController < ApplicationController
  rescue_from ActionView::Template::Error, with: :handle_timeout
  rescue_from Timeout::Error, with: :handle_timeout
  include ActionController::Live



  def index

  end
  def home
    @companies = Company.all
    @bigcomp = @companies.order('changepercent DESC').limit(20)
    @company = Company.first
    # @company.delay.updatecurrentandvol
    # @company.delay.updatechanges
    @users = User.all
    @users.each do |u|
      u.totalprof
    end
  end

  def help
    @companies = Company.all
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
