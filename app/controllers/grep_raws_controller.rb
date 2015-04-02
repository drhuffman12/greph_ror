class GrepRawsController < ApplicationController
  before_action :set_grep_raw, only: [:show, :edit, :update, :destroy]

  # GET /grep_raws
  # GET /grep_raws.json
  def index
    @grep_raws = GrepRaw.select('id, search_term, search_path, cmd, error_log').all
    # @grep_raws = GrepRaw.all
  end

  # GET /grep_raws/1
  # GET /grep_raws/1.json
  def show
  end

  # GET /grep_raws/new
  def new
    @grep_raw = GrepRaw.new
  end

  # GET /grep_raws/1/edit
  def edit
  end

  # POST /grep_raws
  # POST /grep_raws.json
  def create
    @grep_raw = GrepRaw.new(grep_raw_params)

    respond_to do |format|
      if @grep_raw.save
        format.html { redirect_to @grep_raw, notice: 'Grep raw was successfully created.' }
        format.json { render :show, status: :created, location: @grep_raw }
      else
        format.html { render :new }
        format.json { render json: @grep_raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grep_raws/1
  # PATCH/PUT /grep_raws/1.json
  def update
    respond_to do |format|
      if @grep_raw.update(grep_raw_params)
        format.html { redirect_to @grep_raw, notice: 'Grep raw was successfully updated.' }
        format.json { render :show, status: :ok, location: @grep_raw }
      else
        format.html { render :edit }
        format.json { render json: @grep_raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grep_raws/1
  # DELETE /grep_raws/1.json
  def destroy
    @grep_raw.destroy
    respond_to do |format|
      format.html { redirect_to grep_raws_url, notice: 'Grep raw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grep_raw
      @grep_raw = GrepRaw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grep_raw_params
      params.require(:grep_raw).permit(:search_term, :search_path, :result_set, :error_log)
    end
end
