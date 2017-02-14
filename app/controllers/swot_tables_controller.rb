class SwotTablesController < ApplicationController
  before_action :set_swot_table, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]
  
  # GET /swot_tables
  # GET /swot_tables.json
  def index
    if user_signed_in?
      @swot_tables = SwotTable.where(user_id: current_user).all
    end 
  end

  # GET /swot_tables/1
  # GET /swot_tables/1.json
  def show
    @number_of_strengths = @swot_table.strength.split(',').length
    @number_of_weakness = @swot_table.weakness.split(',').length
    @number_of_opportunities = @swot_table.opportunity.split(',').length
    @number_of_threats = @swot_table.threats.split(',').length

    if @number_of_strengths > 0 or @number_of_weakness > 0 or @number_of_opportunities > 0 or @number_of_threats > 0
      if ((@number_of_strengths + (@number_of_opportunities / 2)) - (@number_of_weakness + (@number_of_threats / 2))) > 0
          @swot_result = 2
        elsif ((@number_of_strengths + (@number_of_opportunities / 2)) - (@number_of_weakness + (@number_of_threats / 2))) == 0
          @swot_result = 1
        else @swot_result = 0
      end
    end
  end

  # GET /swot_tables/new
  def new
    @swot_table = SwotTable.new
  end

  # GET /swot_tables/1/edit
  def edit
  end

  # POST /swot_tables
  # POST /swot_tables.json
  def create
    @swot_table = SwotTable.new(swot_table_params)
    @swot_table.user = current_user
    respond_to do |format|
      if @swot_table.save
        format.html { redirect_to @swot_table, notice: 'Swot table was successfully created.' }
        format.json { render :show, status: :created, location: @swot_table }
      else
        format.html { render :new }
        format.json { render json: @swot_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swot_tables/1
  # PATCH/PUT /swot_tables/1.json
  def update
    respond_to do |format|
      if @swot_table.update(swot_table_params)
        format.html { redirect_to @swot_table, notice: 'Swot table was successfully updated.' }
        format.json { render :show, status: :ok, location: @swot_table }
      else
        format.html { render :edit }
        format.json { render json: @swot_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swot_tables/1
  # DELETE /swot_tables/1.json
  def destroy
    @swot_table.destroy
    respond_to do |format|
      format.html { redirect_to swot_tables_url, notice: 'Swot table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swot_table
      @swot_table = SwotTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swot_table_params
      params.require(:swot_table).permit(:title, :strength, :weakness, :opportunity, :threats)
    end
end
