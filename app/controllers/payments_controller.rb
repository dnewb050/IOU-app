class PaymentsController < ApplicationController
  before_action :set_request, only: [:mark_as_paid, :update_status]
  before_action :set_payment, only: [:show, :edit, :update, :destroy, :mark_as_paid, :update_status]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    # @payment = Payment.new(
    #                         request_id:              params[:request_id],
    #                         amount:                  @request.amount,
    #                         acknowledged_payment_status:    false)
    # respond_to do |format|
    #   if @payment.save
    #     format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
    #     format.json { render :show, status: :created, location: @payment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @payment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def mark_as_paid
    @payment = Payment.new(
                            request_id:              params[:request_id],
                            amount:                  @request.amount,
                            acknowledged_payment_status:    false)
    @payment.save
    redirect_to @request
  end

  def update_status
    @payment.update_attribute(:acknowledged_payment_status, 1)
    @payment.save
    redirect_to @request
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:request_id])
    end

    def set_payment
      @payment = Payment.find_by(request_id: @request.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:request_id, :amount, :acknowledged_payment_status)
    end

end
