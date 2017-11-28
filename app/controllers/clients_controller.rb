class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index
    if user_signed_in? && current_user.is_admin? then
      @clients = Client.all
    elsif user_signed_in? && current_user.is_caseworker? then
      @clients = current_user.caseworker.clients
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clients }
    end
  end

  # GET /clients
  # GET /clients.json
  def recent
    if current_user.is_admin?
      @clients = Client.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    authorize! :read, @client

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    authorize! :create, @client

    @client.date = DateTime.now
    if user_signed_in?
      @client.caseworker = current_user.caseworker
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    authorize! :update, @client
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    authorize! :create, @client

    respond_to do |format|
      if not @client.caseworker.can_add_clients?
        @client.errors[:base] << "You are past your limit.  Please come back later."
        format.html { render :action => "new" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      elsif @client.save
        format.html { redirect_to @client, :notice => 'Client was successfully created.' }
        format.json { render :json => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    authorize! :update, @client

    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to @client, :notice => 'Client was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    authorize! :update, @client
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :ok }
    end
  end

  private

  def client_params
    params.require(:client).permit(
       :date,
       :caseworker_id,
       :name,
       :sex,
       :weight,
       :age,
       :height,
       :biketype,
       :helmet,
       :lock,
       :reason,
       :ridden_before
    )
  end
end
