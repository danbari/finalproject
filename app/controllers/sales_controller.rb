class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
	@customer_choice = Person.order("lastname").collect do |c| [c.lastname + ", " + c.firstname, c.id] end
	@product_choice = Product.order("proudctname").collect do |p| [p.proudctname + " - " + p.price.to_s, p.id] end
	@sale.product_id = params["product_id"] #Product ID received as parameter
	@sale.person_id = session[:user_id] #Person ID obtained from session ID - person's ID who's logged-in
	@sale.saledate = Time.now # Today's date
	@sale.saleprice = Product.find_by_id(params["product_id"]).price #Getting cost from Product's table
  end

  # GET /sales/1/edit
  def edit
	@customer_choice = Person.order("lastname").collect do |c| [c.lastname + ", " + c.firstname, c.id] end
	@product_choice = Product.order("proudctname").collect do |p| [p.proudctname + " - " + p.price.to_s, p.id] end
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:person_id, :product_id, :saledate, :saleprice)
    end
end
