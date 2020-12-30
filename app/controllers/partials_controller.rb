class PartialsController < ApplicationController
  before_action :set_partial, only: [:show, :edit, :update, :destroy]

  # GET /partials
  # GET /partials.json
  def index
    @partials = Partial.all
  end

  # GET /partials/1
  # GET /partials/1.json
  def show
    render inline: @partial.content
  end

  # GET /partials/new
  def new
    @partial = Partial.new
  end

  # GET /partials/1/edit
  def edit
  end

  # POST /partials
  # POST /partials.json
  def create
    @partial = Partial.new(partial_params)

    respond_to do |format|
      if @partial.save
        format.html { redirect_to edit_partial_path(@partial), notice: 'Partial was successfully created.' }
        format.json { render :edit, status: :created, location: @partial }
      else
        format.html { render :index }
        format.json { render json: @partial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partials/1
  # PATCH/PUT /partials/1.json
  def update
    respond_to do |format|
      logger.info "Update: format: #{request.format}"
      if @partial.update(partial_params)
        format.html { redirect_to edit_partial_path(@partial), notice: 'Partial was successfully updated.' }
        format.json { render :edit, status: :ok, location: @partial }
      else
        format.html { render :edit }
        format.json { render json: @partial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partials/1
  # DELETE /partials/1.json
  def destroy
    @partial.destroy
    respond_to do |format|
      format.html { redirect_to partials_url, notice: 'Partial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partial
      @partial = Partial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partial_params
      params.require(:partial).permit(:name, :content)
    end
end
