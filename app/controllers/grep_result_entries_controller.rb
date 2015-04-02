class GrepResultEntriesController < ApplicationController
  before_action :set_grep_result_entry, only: [:show, :edit, :update, :destroy]

  # GET /grep_result_entries
  # GET /grep_result_entries.json
  def index
    @grep_result_entries = GrepResultEntry.all
  end

  # GET /grep_result_entries/1
  # GET /grep_result_entries/1.json
  def show
  end

  # GET /grep_result_entries/new
  def new
    @grep_result_entry = GrepResultEntry.new
  end

  # GET /grep_result_entries/1/edit
  def edit
  end

  # POST /grep_result_entries
  # POST /grep_result_entries.json
  def create
    @grep_result_entry = GrepResultEntry.new(grep_result_entry_params)

    respond_to do |format|
      if @grep_result_entry.save
        format.html { redirect_to @grep_result_entry, notice: 'Grep result entry was successfully created.' }
        format.json { render :show, status: :created, location: @grep_result_entry }
      else
        format.html { render :new }
        format.json { render json: @grep_result_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grep_result_entries/1
  # PATCH/PUT /grep_result_entries/1.json
  def update
    respond_to do |format|
      if @grep_result_entry.update(grep_result_entry_params)
        format.html { redirect_to @grep_result_entry, notice: 'Grep result entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @grep_result_entry }
      else
        format.html { render :edit }
        format.json { render json: @grep_result_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grep_result_entries/1
  # DELETE /grep_result_entries/1.json
  def destroy
    @grep_result_entry.destroy
    respond_to do |format|
      format.html { redirect_to grep_result_entries_url, notice: 'Grep result entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grep_result_entry
      @grep_result_entry = GrepResultEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grep_result_entry_params
      params.require(:grep_result_entry).permit(:grep_raw_id, :found_file_path, :found_line_num, :found_line_string)
    end
end
