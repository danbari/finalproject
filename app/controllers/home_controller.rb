class HomeController < ApplicationController
  def index
  	@title = "Home | Pacific Coffee"
  end

  def search
  	@title = "Search | Pacific Coffee"
  end

  def about
  	@title = "About | Pacific Coffee"
  end

  def contact
  	@title = "Contact | Pacific Coffee"
  end
end
