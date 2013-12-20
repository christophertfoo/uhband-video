class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
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
  # GET /media
  # GET /media.json
  def index
    @media = Medium.getAllMediaSortedByTime
  end

  # GET /media/1
  # GET /media/1.json
  def show
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # Author: Christopher Foo
  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(title: medium_params[:title], media_type_id: medium_params[:media_type_id], description: medium_params[:description], path: medium_params[:path])

    respond_to do |format|
      if @medium.save
        for tag in medium_params[:tags] do
          if tag[1][:id] && tag[1][:timestamp] && Tag.find(tag[1][:id])
            TagInstance.create(media_id: @medium.id, tags_id: tag[1][:id], timestamp: tag[1][:timestamp])            
          end
        end
        format.json { render action: 'show', status: :created, location: @medium }
      else
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.json { head :no_content }
      else
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.permit(:title, :description, :path, :media_type_id, tags: [:id, :timestamp] )
    end
end
