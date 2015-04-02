class FoundFilesController < ApplicationController
  before_action :set_found_file, only: [:file_lines_details, :show, :edit, :update, :destroy]

  def file_lines_details
    set_found_file
    # render '_found_lines', :locals => {:found_lines => @found_file.found_lines}
    respond_to do |format|
      format.js
    end
  end

  # GET /found_files
  # GET /found_files.json
  def index
    @found_files = FoundFile.order('search_term_count DESC, file_line_count DESC, result_entry_count DESC').all
  end

  # GET /found_files/1
  # GET /found_files/1.json
  def show
  end

  # GET /found_files/new
  def new
    @found_file = FoundFile.new
  end

  # GET /found_files/1/edit
  def edit
  end

  # POST /found_files
  # POST /found_files.json
  def create
    @found_file = FoundFile.new(found_file_params)

    respond_to do |format|
      if @found_file.save
        format.html { redirect_to @found_file, notice: 'Found file was successfully created.' }
        format.json { render :show, status: :created, location: @found_file }
      else
        format.html { render :new }
        format.json { render json: @found_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /found_files/1
  # PATCH/PUT /found_files/1.json
  def update
    respond_to do |format|
      if @found_file.update(found_file_params)
        format.html { redirect_to @found_file, notice: 'Found file was successfully updated.' }
        format.json { render :show, status: :ok, location: @found_file }
      else
        format.html { render :edit }
        format.json { render json: @found_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /found_files/1
  # DELETE /found_files/1.json
  def destroy
    @found_file.destroy
    respond_to do |format|
      format.html { redirect_to found_files_url, notice: 'Found file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found_file
      @found_file = FoundFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def found_file_params
      params.require(:found_file).permit(:found_file_path)
    end
end
