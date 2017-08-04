class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :destroy, :update, :creditor, :debtor]
  skip_before_action :authorize, only: [:create, :new, :activation, :edit, :update]
  skip_before_action :set_current_user, only: [:new, :create, :activation]
  after_action :remove_acivation_token, only: [:update, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @owe_requests= Request.where(creditor_id: @current_user.id)
    @owed_requests= Request.where(debtor_id: @current_user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/activation
  def activation
    if session[:user_id]
      redirect_to user_url(session[:user_id])
    elsif User.find(params[:id]).activation_token != params[:activation_token]
      redirect_to login_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to login_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def creditor
    @requests = Request.where(creditor_id: @current_user.id)
  end

  def debtor
    @requests= Request.where(creditor_id: @current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end

    # removes acivation_token from user after #update or #create
    def remove_acivation_token
      @user.activation_token = nil
      @user.save
    end

end
