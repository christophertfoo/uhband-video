class MediaTypesController < ApplicationController
  before_action :set_media_type, only: [:show, :edit, :update, :destroy]
=begin 
   protect_from_forgery
   after_filter :set_csrf_cookie_for_ng
  
  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
  
  
  
  protected
   def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
=end

  # GET /media_types
  # GET /media_types.json
  def index
    @media_types = MediaType.all
  end

  # GET /media_types/1
  # GET /media_types/1.json
  def show
  end

  # GET /media_types/new
  def new
    @media_type = MediaType.new
  end

  # GET /media_types/1/edit
  def edit
  end

  # POST /media_types
  # POST /media_types.json
  def create
    @media_type = MediaType.new(media_type_params)

    respond_to do |format|
      if @media_type.save
        format.json { render action: 'show', status: :created, location: @media_type }
      else
        format.json { render json: @media_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_types/1
  # PATCH/PUT /media_types/1.json
  def update
    respond_to do |format|
      if @media_type.update(media_type_params)
        format.json { head :no_content }
      else
        format.json { render json: @media_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_types/1
  # DELETE /media_types/1.json
  def destroy
    @media_type.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_type
      @media_type = MediaType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_type_params
      params.require(:media_type).permit(:name)
    end
end
