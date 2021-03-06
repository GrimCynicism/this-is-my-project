class NamesController < ApplicationController
  
  def index
  	@names = Name.all
  end

  def new
  	@name = Name.new
  end

  def create
  	@name = Name.new(name_params)
  	if @name.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private

  def name_params
  	params.require(:name).permit(:name)
  end

end
