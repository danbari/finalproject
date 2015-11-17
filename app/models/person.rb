require 'bcrypt'

  class person < ActiveRecord::Base
    # users.password_hash in the database is a :string
    include BCrypt

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

    def create
      @person =Person.new(params[:user])
      @person.password = params[:password]
      @person.save!
    end

    def login
       @person = Person.find_by_username(params[:username])
       if @person.password == params[:password]
         give_token
       else
         redirect_to home_url
       end
     end

  end
