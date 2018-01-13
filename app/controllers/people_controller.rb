class PeopleController < ApplicationController
    protect_from_forgery :only => [:create, :update, :destroy]

  def index
      @people = Person.all
  end

  def new
      @person = Person.new
  end

  def create
      @person = Person.new(person_params)

      if @person.save
          redirect_to people_path, notice: "the person has been created" and return 
      end
      render 'new'
  end

  def edit
      @person = Person.find(params[:id])
  end

  def update
      @person = Person.find(params[:id])

      if @person.update_attributes(person_params)
          redirect_to people_path, notice: "@person.first_name @person.last_name has been update!" and return
      end
      render 'edit'
  end

  def destroy
      @person = Person.find(params[:id])
      @person.destroy
      redirect_to people_path, notice: "@person.first_name @person.last_name has been update!" and return
  end

  private
  def person_params 
      params.require(:person).permit(:first_name, :last_name, :email, :notes)
  end

end
