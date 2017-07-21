class AnimalsController < ApplicationController
  def index
  if params[:name]
    @animals = Animal.search(params[:name])
  elsif
    params[:random_animal]
    @animals = Animal.random_animal
  else
    @animals = Animal.all.paginate(:page => params[:page], :per_page => 10)
  end
  json_response(@animals)
end

 def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
       message: "Your animal has been updated successfully"
     }
   end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy!
      render status: 200, json: {
       message: "Your animal has been deleted successfully"
     }
   end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def animal_params
    params.permit(:name, :species)
  end

 private
 def json_response(object)
   render json: object, status: :ok
 end
end
