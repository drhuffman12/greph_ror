class FoundLinesController < ApplicationController
  before_action :set_found_line, only: [:show, :edit, :update, :destroy]

  # GET /found_lines
  # GET /found_lines.json
  def index
    @found_lines = FoundLine.order('search_term_count DESC, result_entry_count DESC, found_line_num').all
  end

  # GET /found_lines/1
  # GET /found_lines/1.json
  def show
  end

  # GET /found_lines/new
  def new
    @found_line = FoundLine.new
  end

  # GET /found_lines/1/edit
  def edit
  end

  # POST /found_lines
  # POST /found_lines.json
  def create
    @found_line = FoundLine.new(found_line_params)

    respond_to do |format|
      if @found_line.save
        format.html { redirect_to @found_line, notice: 'Found line was successfully created.' }
        format.json { render :show, status: :created, location: @found_line }
      else
        format.html { render :new }
        format.json { render json: @found_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /found_lines/1
  # PATCH/PUT /found_lines/1.json
  def update
    respond_to do |format|
      if @found_line.update(found_line_params)
        format.html { redirect_to @found_line, notice: 'Found line was successfully updated.' }
        format.json { render :show, status: :ok, location: @found_line }
      else
        format.html { render :edit }
        format.json { render json: @found_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /found_lines/1
  # DELETE /found_lines/1.json
  def destroy
    @found_line.destroy
    respond_to do |format|
      format.html { redirect_to found_lines_url, notice: 'Found line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found_line
      @found_line = FoundLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def found_line_params
      params.require(:found_line).permit(:found_file_id, :found_line_num)
    end
end
