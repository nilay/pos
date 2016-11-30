class DashboardsController < ApplicationController

  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    @homes = User.all
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @home = Home.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.fetch(:home, {})
    end
end
