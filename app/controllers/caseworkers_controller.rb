class CaseworkersController < ApplicationController
  # GET /caseworkers
  # GET /caseworkers.json
  def sign_in
    @caseworkers = Caseworker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @caseworkers }
    end
  end

  # GET /caseworkers
  # GET /caseworkers.json
  def index
    @caseworkers = Caseworker.all
    authorize! :read, Caseworker

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @caseworkers }
    end
  end

  # GET /caseworkers/1
  # GET /caseworkers/1.json
  def show
    @caseworker = Caseworker.find(params[:id])
    authorize! :read, @caseworker

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @caseworker }
    end
  end

  # GET /caseworkers/new
  # GET /caseworkers/new.json
  def new
    @caseworker = Caseworker.new
    authorize! :create, @caseworker

    if user_signed_in?
      @caseworker.email = current_user.email
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @caseworker }
    end
  end

  # GET /caseworkers/1/edit
  def edit
    @caseworker = Caseworker.find(params[:id])
    authorize! :update, @caseworker
  end

  # POST /caseworkers
  # POST /caseworkers.json
  def create
    @caseworker = Caseworker.new(params[:caseworker])
    authorize! :create, @caseworker
    if user_signed_in?
      @caseworker.user_id = current_user.id
    end

    respond_to do |format|
      if @caseworker.save
        format.html { redirect_to @caseworker, :notice => 'Caseworker was successfully created.' }
        format.json { render :json => @caseworker, :status => :created, :location => @caseworker }
      else
        format.html { render :action => "new" }
        format.json { render :json => @caseworker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /caseworkers/1
  # PUT /caseworkers/1.json
  def update
    @caseworker = Caseworker.find(params[:id])
    authorize! :update, @caseworker

    respond_to do |format|
      if @caseworker.update_attributes(caseworker_params)
        format.html { redirect_to @caseworker, :notice => 'Caseworker was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @caseworker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /caseworkers/1
  # DELETE /caseworkers/1.json
  def destroy
    @caseworker = Caseworker.find(params[:id])
    authorize! :update, @caseworker
    @caseworker.destroy

    respond_to do |format|
      format.html { redirect_to caseworkers_url }
      format.json { head :ok }
    end
  end

  private

  def caseworker_params
    params.require(:caseworker).permit(:name, :organization, :address1, :address2, :phone, :email)
  end
end
