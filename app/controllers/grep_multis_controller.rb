class GrepMultisController < ApplicationController
  before_action :set_grep_multi, only: [:show, :edit, :update, :destroy]

  # GET /grep_multis
  # GET /grep_multis.json
  def index
    @grep_multis = GrepMulti.all
  end

  # GET /grep_multis/1
  # GET /grep_multis/1.json
  def show
  end

  # GET /grep_multis/new
  def new
    @grep_multi = GrepMulti.new
  end

  # GET /grep_multis/1/edit
  def edit
  end

  # POST /grep_multis
  # POST /grep_multis.json
  def create
    @grep_multi = GrepMulti.new(grep_multi_params)

    respond_to do |format|
      if @grep_multi.save
        format.html { redirect_to @grep_multi, notice: 'Grep multi was successfully created.' }
        format.json { render :show, status: :created, location: @grep_multi }
      else
        format.html { render :new }
        format.json { render json: @grep_multi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grep_multis/1
  # PATCH/PUT /grep_multis/1.json
  def update
    respond_to do |format|
      if @grep_multi.update(grep_multi_params)
        format.html { redirect_to @grep_multi, notice: 'Grep multi was successfully updated.' }
        format.json { render :show, status: :ok, location: @grep_multi }
      else
        format.html { render :edit }
        format.json { render json: @grep_multi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grep_multis/1
  # DELETE /grep_multis/1.json
  def destroy
    @grep_multi.destroy
    respond_to do |format|
      format.html { redirect_to grep_multis_url, notice: 'Grep multi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grep_multi
      @grep_multi = GrepMulti.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grep_multi_params
      params.require(:grep_multi).permit(:search_terms, :search_paths)
    end
end
