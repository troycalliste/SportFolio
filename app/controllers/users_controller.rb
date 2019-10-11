class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  require 'openssl'
  require 'open-uri'
  require 'restclient'



  def index
    @users = User.all
  end
  # def newtrade
  #   # name = params[:name]
  #   # tick = params[:tick]
  #   # vol = params[:vol]
  #   # price = params[:price]
  #   # total = params[:total]
  #   @trade = Trade.find(2)
  #   name = "some thing"
  #   tick = "AARL"
  #   vol = 23
  #   price = 201.10
  #   total = 4029.90
  #   # if Trade.where(ticker: params[:tick])
  #   #   # dont create trade
  #   #   @trade = Trade.where(ticker: params[:tick])
  #   # else
  #     # @trade1 = Trade.create(stock: name,
  #     # ticker: tick,
  #     # tradeprice: total,
  #     # volume: vol,
  #     # stockprice: price)
  #
  #     # @currentuser.wallet = @currentuser.wallet - @trade.tradeprice
  #   # end
  # end
  def newtrade
    # @this = "this"
    # @this = Trade.find(2)
    name = params[:name]
    tick = params[:tick]
    vol = params[:vol]
    price = params[:price]
    total = params[:total]
    @currentuser = current_user
    if Trade.where(ticker: params[:tick]).exists?
      @trade = "This trade is here bro"
    else  #graduate to using first_or_create
      @trade = @currentuser.trades.create(stock: name,
        ticker: tick,
        tradeprice: total,
        volume: vol,
        stockprice: price)
      @currentuser.wallet -=  @trade.tradeprice
      @currentuser.save
    end
  end
  def showtrade
    #here i will get the company from ticker
    #to show you current price in that orange
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.find(params[:id])
    @trades = @user.trades.all
    if current_user.id == params[:id].to_i
      @iscurrentuser = true
    else
      @iscurrentuser = false
    end
    @idcurr = current_user.id
    @par = params[:id]
    @gain = @user.wallet - 10000
    @gainpercent = (@user.wallet.to_f / 100.0) - 100.0
    @us = User.order('wallet DESC').pluck(:id).index(@user.id)
    Trade.highall
    @order = @trades.order('change DESC')
    @high = @order.first.change * 100
    @low = @order.last.change * 100
    sumarr = []
    @trades.each do |t|
      sum = t.currentprice * t.volume.to_f
      sumarr << sum
    end
    @tp = (@user.wallet + sumarr.sum) - 10000.0
    @held =  @trades.where.not(volume: 0).order('created_at DESC')
    @oldest = @held.first.ticker
    @newest = @held.last.ticker
    # @trade = Trade.new
    # @test = Company.search(params[:search]).paginate(page: params[:page], per_page: 30)
    # @reg = Region.all
    # @exch = Exchange.all
    # @comp = Company.all + Commodity.all
    # @camp = Company.all.pluck(:currentprice)
    # @comm = Commodity.all.pluck(:id)  #trade the first one   make sure its right

    # @nokocomp = Company.first
    # @nokocomp.noko
    # @nokocomp.noko2
    # @nokocomp.noko3
    # @nokocomp.noko4
    # @nokocomp.noko5
    # @nokocomp.noko6
    #  @trades = Trade.where(nil) # creates an anonymous scope
    #  @trades = @trades.region_id(params[:region_id]) if params[:region_id].present?
    #  @tradelongs = @trades.where(tradetype: "Long")
    #  @tradeshorts = @trades.where(tradetype: "Short")
    #  # @trade = Trade.where(user_id: params[:id])
    #  # @trade.first.tradeprices   #going to do this for all
    #  # @trade.first.tradeset
     # @alltrades = Trade.where.not(volume: nil, stockprice: nil)
     # @alltrades.each do |t|
     #   t.tradeprices
     #  end
     # @comptrade = @trade.first      #we're talking about trade 2
     # @bigcomp = @test.order('changepercent DESC').limit(20)
     # respond_to do |format|
     #   format.js
     #   format.html
     # end

   end

   def show_online
     @users = User.online_now
   end
  # GET /users/new  going back to the first one i think so
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    userip = request.remote_ip
    results = Geocoder.search(userip)
    @user.country = results.first.country


    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      elsif params[:preview_button]
        format.html { render :new }
      elsif !@user.save
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user     # @trade = Trade.where(user_id: params[:id])
    @user.update(user_params)

    #im going to set one to two from here
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to :action => "show", :controller => "trades"}
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  def revise
    #delete it here
    @user = User.order(:updated_at).last
    @user.trades.last.destroy
    @user.save               #at this point it updates user
    redirect_back fallback_location: { action: "show", id: 18 }
  end

  def search
    begin

   @user = User.find_by_name params[:name]
   @alltrades = Trade.where.not(volume: nil, stockprice: nil)

   @trade = Trade.new
   @reg = Region.all
   @exch = Exchange.all
   @comp = Company.all + Commodity.all
   @camp = Company.all.pluck(:currentprice)
   @comm = Commodity.all.pluck(:id)  #trade the first one   make sure its right

   @nokocomp = Company.first
   @nokocomp.noko
   @nokocomp.noko2
   @nokocomp.noko3
   @nokocomp.noko4
   @nokocomp.noko5
   @nokocomp.noko6
    @trades = Trade.where(nil) # creates an anonymous scope
    @trades = @trades.region_id(params[:region_id]) if params[:region_id].present?
    @tradelongs = @trades.where(tradetype: "Long")
    @tradeshorts = @trades.where(tradetype: "Short")

      render action: 'show'
    rescue StandardError
     redirect_to "/admin"

      raise
     end

  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def preview
       @test = Company.search(params[:searched])
  end


    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :email, :avatar, :password, trades_attributes: [:id, :stock, :volume, :user_id, :region_id, :tradetype, :stockprice, :one, :company_id, :commodity_id])
    # dont vhange this or server will stall
    end
 end
