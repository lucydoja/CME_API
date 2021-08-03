class Api::V1::CmeController < ApplicationController
  before_action :set_specialty, only: [:show, :update, :destroy]
  # GET /specialties list
  def specialties
    @specialties = Scraper.new().specialties()
    render json: {specialties: @specialties}, status: 200
  end

  # GET /states list
  def states
    @states = Scraper.new().states()
    render json: {states: @states}, status: 200
  end

  # GET /cme information
  def cme
    @cme = Scraper.new().cme(params[:specialty], params[:state])
    render json: @cme, status: 200
  end

end
