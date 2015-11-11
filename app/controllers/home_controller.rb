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
end
