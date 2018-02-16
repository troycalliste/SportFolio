class CompaniesController < ApplicationController
  include ActionController::Live
  # rescue_from ActionView::Template::Error, with: :handle_timeout
  # before_action :authenticate_user!, only: [:show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.first(10)   #will show by Company.order('latestvolume DESC').limit(25)
    @test = Company.all
    @bigcomp = @test.order('changepercent DESC').limit(20)
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    render layout: false
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.create!(company_params)

  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.update(company_params)
    # $redis.publish('companies.update', @company.to_json)
    # render :action => 'show'
  end
  #
  def events
    response.headers['Content-Type'] = "text/event-stream"
    redis = Redis.new
    redis.subscribe('companies.update') do |on|
      on.message do |event, data|
        response.stream.write('data: #{data}\n\n')
      end
    end
  end

  #   def pub
  #       $redis.publish 'chat_event', params[:chat_data].to_json
  #       render json: {}, status: 200
  #   end
  #
  # def sub
  #       response.headers["Content-Type"] = "text/event-stream"
  #
  #       redis = Redis.new
  #       redis.subscribe(['chat_event', 'heartbeat']) do |on|
  #           on.message do |event, data|
  #               response.stream.write "event: #{event}\ndata: #{data}\n\n"
  #           end
  #       end
  #   rescue IOError
  #       logger.info "Stream Closed"
  #   ensure
  #       redis.quit
  #       response.stream.close
  #   end
  #

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  # def handle_timeout(exception)
  #   count = 0
  #   begin if count < 10
  #     retry
  #
  #
  #
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:change, :changepercent, :name, :ticker)
    end
end
