# encoding: utf-8
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]




  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
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
     @trade = Trade.where(user_id: params[:id])
     @trade.first.tradeprices
     @comptrade = @trade.first      #we're talking about trade 2

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
    @tradeone = @user.trades.last
    if @tradeone.company_id
      @company = Company.find(@tradeone.company_id)
      @tradeone.stockprice = @company.currentprice
      @tradeone.tradeprices
      @tradeone.save
    elsif @tradeone.commodity_id
      @company = Commodity.find(@tradeone.commodity_id)
      @tradeone.stockprice = @company.currentprice
      @tradeone.tradeprices   #stockprice x volume
      @tradeone.save
    end

    render :action => "preview"
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

  end

  private
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
