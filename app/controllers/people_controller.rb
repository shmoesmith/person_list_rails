class PeopleController < ApplicationController


 def index
   @people = Person.all 
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
      if @person.update(person_params)
        redirect_to person_path(@person)
      else
        render :edit
      end
  end

def destroy
  @person = Person.find(params[:id])
  @person.destroy
  redirect_to people_path
end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

private

def person_params
  params.require(:person).permit(:name, :age, :hair_color, :eye_color, :gender, :alive)
  end
end
