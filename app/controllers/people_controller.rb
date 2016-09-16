class PeopleController < ApplicationController
  def index
    @people = Person.all
    render json: @people
  end

  def show
    render json: Person.find(params[:id])
  end

  def create
    require 'pry'; binding.pry;
    @person = Person.new(person_params[:person])
    if @person.save
      render json: @person, status: :created
    bpry
    else
      render json: @person.errors, status: :unproccesable_entity
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params['person'])
      render json: @person, status: :created
    else
      render json: @person.errors, status: :unproccesable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      head :no_content
    else
      render json: @person.errors, status: :unproccesable_entity
    end
  end

  def person_params
    params.permit!
  end
end
