class TagInstancesController < ApplicationController
  before_action :set_tag_instance, only: [:show, :edit, :update, :destroy]
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

  # GET /tag_instances
  # GET /tag_instances.json
  def index
    @tag_instances = TagInstance.all
  end

  # GET /tag_instances/1
  # GET /tag_instances/1.json
  def show
  end

  # GET /tag_instances/new
  def new
    @tag_instance = TagInstance.new
  end

  # GET /tag_instances/1/edit
  def edit
  end

  # POST /tag_instances
  # POST /tag_instances.json
  def create
    @tag_instance = TagInstance.new(tag_instance_params)

    respond_to do |format|
      if @tag_instance.save
        format.html { redirect_to @tag_instance, notice: 'Tag instance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag_instance }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_instances/1
  # PATCH/PUT /tag_instances/1.json
  def update
    respond_to do |format|
      if @tag_instance.update(tag_instance_params)
        format.html { redirect_to @tag_instance, notice: 'Tag instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_instances/1
  # DELETE /tag_instances/1.json
  def destroy
    @tag_instance.destroy
    respond_to do |format|
      format.html { redirect_to tag_instances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_instance
      @tag_instance = TagInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_instance_params
      params.require(:tag_instance).permit(:timestamp, :media_id, :tags_id)
    end
end
