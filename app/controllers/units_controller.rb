class UnitsController < ApplicationController
  before_action :set_unit, only: [:show]

  # GET /units
  # GET /units.json
  def index
    if params[:search]
     @units = Unit.search(params[:search]).order("created_at DESC").page(params[:page])
    else
      @units = Unit.where(:category_id => params[:cat]).page(params[:page])
    end
  end
  
  def download
    send_file 'public/data/'+params[:file], :filename => params[:file],:type => "application/octet-stream"
  end

  # GET /units/1
  # GET /units/1.json
  def show
    if params[:file]
      return download
    end 
  end

  # GET /units/new
  # def new
  #   @unit = Unit.new
  # end

  # # GET /units/1/edit
  # def edit
  # end

  # POST /units
  # POST /units.json
  # def create
  #    @unit = Unit.new(unit_params)
  #    if unit_params[:attachment]
  #        p 'bullshit bingo!'
  #        directory = "public/data"
  #        path = File.join(directory, unit_params[:file])
  #        File.open(path, "wb") { |f| f.write(params[:attachment].read) }
  #        # flash[:notice] = "File uploaded"
  #    end
  # 
  #    respond_to do |format|
  #      if @unit.save
  #        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
  #        format.json { render :show, status: :created, location: @unit }
  #      else
  #        format.html { render :new }
  #        format.json { render json: @unit.errors, status: :unprocessable_entity }
  #      end
  #    end
  #  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  # def update
  #   respond_to do |format|
  #     if @unit.update(unit_params)
  #       format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @unit }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @unit.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /units/1
  # DELETE /units/1.json
  # def destroy
  #   @unit.destroy
  #   respond_to do |format|
  #     format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def unit_params
    #   # params.require(:unit).permit(:name, :longname, :size, :version, :date, :editor, :holders, :description)
    # end
end
