class PagesController < ApplicationController
  load_and_authorize_resource :user, :parent => false
  #skip_authorization_check

  # GET /pagess
  # GET /pagess.json
  def index
    @users = User.all
  end

  # GET /pagess/1
  # GET /pagess/1.json
  def show
    # @comments = @pages.comments
  end
  # GET /pagess/new
  def new
    #@page = Page.new
  end

  # GET /pagess/1/edit
  def edit
  end

  # pages /pagess
  # pages /pagess.json
  def create
    #@page = Page.new(pages_params)
    @page.user = current_user

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'pages was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagess/1
  # PATCH/PUT /pagess/1.json
  def update
    respond_to do |format|
      if @user.update(pages_params)
        format.html { redirect_to pages_path, notice: 'pages was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagess/1
  # DELETE /pagess/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pagess_url, notice: 'pages was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      #@page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:user).permit(:name, :email, :role)
    end
end
