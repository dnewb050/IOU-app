class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :update_status]
  before_action :set_request_debtor, only: [:create]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(
              creditor_id:                 @current_user.id,
              debtor_id:                   @request_debtor.id,
              line_item_name:              request_params[:line_item_name],
              amount:                      request_params[:amount],
              comment:                     request_params[:comment],
              acknowledged_request_status: 0 )
    request_params[:creditor_id] = @current_user.id #### WTF is this here for ?
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
        RequestMailer.received(@request, @request_debtor).deliver
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def update_status
  @request.update_attribute(:acknowledged_request_status, 1)
  @request.save
  redirect_to @request
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:creditor_id, :debtor_id, :line_item_name, :amount, :comment, :acknowledged_request_status)
    end

    def set_request_debtor
      unless User.find_by(email:              params[:debtor_email])
        @user = User.new( email:              params[:debtor_email],
                          password:           SecureRandom.hex(10))               # until registration its a random password
        @user.save
      end
      @request_debtor = User.find_by(email: params[:debtor_email])
    end

end
