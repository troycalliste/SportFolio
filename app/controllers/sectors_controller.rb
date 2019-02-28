class SectorsController < ApplicationController
  def show
    @sector = Sector.find(params[:id])
    @sector.perf
  end
end
