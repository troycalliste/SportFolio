class StaticpagesController < ApplicationController
   skip_before_action :authenticate_user!
  rescue_from ActionView::Template::Error, with: :handle_timeout
  rescue_from Timeout::Error, with: :handle_timeout

  include ActionController::Live



  def index

  end
  def usearch
    if User.where(name: params[:name])
      @user = User.where(name: params[:name])
      redirect_to "https://sheltered-journey-51023.herokuapp.com/users/#{@user.first.id}"
      #redirect_to "http://localhost:3000/users/#{@user.first.id}"
    else
      flash[:notice] = 'Could not find user. Please try again. '
      redirect_to root_path
    end
  end
  def home
    News.save_data_from_api
    @companies = Company.all
    @bigcomp = @companies.order('changepercent DESC').limit(20)
    @company = Company.first
    # @company.delay.updatecurrentandvol
    # @company.delay.updatechanges
    @users = User.all
    @ranker = @users.order('wallet DESC').first
    @trader = @users.left_joins(:trades).group(:id).order('COUNT(trades.id) DESC').first
    @newest = @users.order('created_at DESC').first

    # @users.each do |u|
    #   u.totalprof
    # end

  end

  def help
    @companies = Company.all
  end
  def news
    @news = News.find(params[:id])
  end
  def rank
    n = params[:topnum]
    str = params[:topstr]


    User.order('wallet DESC').limit(n).each do |u|
      u.toprank = str
      u.save
    end
  end

  def leaderboard
    @users = User.order("totalprofit DESC").paginate(page: params[:page], per_page: 5)
    @numunrounded = User.count / 2
    @num = @numunrounded.round
    @total = User.count
    # @userspag = @users.limit(@num)   ?????
    # @offset = @users.offset(@num)
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
