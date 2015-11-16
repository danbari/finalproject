class HomeController < ApplicationController
  def index
  	@title = "Home | Pacific Coffee"
  end

  def search
  	@title = "Search | Pacific Coffee"
    @results=0
    if !params[:searchinput].nil?
      @results=1
      @searchinput = params[:searchinput]
      @searchcriteria="%#{params[:searchinput]}%"
      @productlist = Product.where("description like ?",@searchcriteria)
    end
  end

  def about
  	@title = "About | Pacific Coffee"
  end

  def contact
  	@title = "Contact | Pacific Coffee"
  end


 def new_sale
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


    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:person_id, :product_id, :saledate, :saleprice)
    end


end
