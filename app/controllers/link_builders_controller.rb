class LinkBuildersController < ApplicationController
  before_action :set_link_builder, only: :show

  # GET /link_builders/1 or /link_builders/1.json
  def show
  end

  # GET /link_builders/new
  def new
    @link_builder = LinkBuilder.new
  end

  # POST /link_builders or /link_builders.json
  def create
    @link_builder = LinkBuilder.new(link_builder_params)

    respond_to do |format|
      if @link_builder.save
        format.html { redirect_to @link_builder, notice: "Link builder was successfully created." }
        format.json { render :show, status: :created, location: @link_builder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link_builder.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_builder
      @link_builder = LinkBuilder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def link_builder_params
      params.require(:link_builder).permit(:commit, :file)
    end
end
