class NamesController < ApplicationController
  
  def index
  	@names = Name.all
  end

  def new
  	@name = Name.new
  end

  def create
  	@name = Name.new(name_params)
  	puts "saving #{@name.inspect}"
  	if @name.save
  	puts "saved ok"
  		redirect_to root_path
  	else
  		render :new
  	end
  rescue Exception => e
    puts "#{e.message}"
    puts "#{e.backtrace.inspect}"
  end

  private

  def name_params
  	params.require(:name).permit(:name)
  end

end
