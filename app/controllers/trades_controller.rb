class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session
  # GET /trades
  # GET /trades.json

  def index
     @user = User.find(params[:user_id])
     @trades = if params[:term]
      @user.trades.where('region_id LIKE ?', "%#{params[:term]}%")
    else
       Trade.all
    end
     @reg = Region.all
     @regs = Trade.all.where(region_id: params[:id])


  end



  # GET /trades/1
  # GET /trades/1.json\
  def show
    @trade = Trade.order("id DESC").offset(1).first
    @company = Company.find(@trade.company_id)
    @user = User.find(params[:id])
    @reg = Region.all
    @regs= Trade.all.where(region_id: params[:id])



  end

  # GET /trades/new
  def new
    @trade = Trade.new
    @user = User.find(params[:user_id])     # all that params[:user_id] is  is a number    like User.find(2), it comes from the new trade's user_id column
    @trade = @user.trades.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    # @trade = Trade.new(trade_params)
    @user = User.find(params[:user_id])
    @trade= @user.trades.build(trade_params)
    
    @trade.tradeprices
    respond_to do |format|
      if @trade.tradeprice < @user.wallet
        @trade.save

        @user.wallet = @user.wallet - @trade.tradeprice
        @user.save
        format.html { redirect_to "https://localhost:3000", notice: 'Trade was successfully created.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { redirect_to "https://localhost:3000", notice: 'Trade was not saved.' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @user = User.find(params[:user_id])
    @trade = @user.trades.find(params[:id])
    @user.wallet = @user.wallet + @trade.currenttradeprice
    @trade.destroy
    redirect_to user_path(@user)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:id, :stock, :volume, :user_id, :region_id, :tradetype, :stockprice, :one, :company_id, :commodity_id)
    end
end
