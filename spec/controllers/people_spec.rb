require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

    describe "GET #index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end

        it "sets the people instance variable" do
            get :index
            expect(assigns(:people).length).to eq(0)        
        end

        it "renders the index view" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        it "returns http success" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :show, params: { id: person.id }            
            expect(response).to have_http_status(:success)       
         end
         
        it "renders the show view" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :show, params: { id: person.id }    
            expect(response).to render_template(:show)
        end

        it "sets the person instance variable" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :show, params: { id: person.id } 
            expect(assigns(:person).name).to eq(person.name)
        end
    end

    describe "GET #new" do
        it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
        end
    
        it "renders the new template" do 
            get :new
            expect(response).to render_template(:new)
        end

        it "sets the person instance variable" do
            get :new
            expect(assigns(:person)).to be_a_new(Person)
        end
    end

    describe "POST #create" do
        
    end

    describe "GET #edit" do
        it "returns http success" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :edit, params: { id: person.id }
            expect(response).to have_http_status(:success)
        end

        it "sets the person instance variable" do
              person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :edit, params: { id: person.id }
            expect(assigns(:person).id).to eq(person.id)
        end

        it "renders the edit template" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :edit, params: { id: person.id }
            expect(response).to render_template(:edit)
        end
    end

    describe "PUT #update" do
        it "sets the person instance variable" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            put :update, params: { id: person.id, person: { eye_color: 'blue' } }
            expect(assigns(:person)).to eq(person)
        end

        it "updates the person in the database" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            put :update, params: { id: person.id, person: { eye_color: 'blue' } }
            expect(person.reload.eye_color).to eq('blue')
        end

        it "redirects to people path upon success" do
             person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            put :update, params: { id: person.id, person: { eye_color: 'blue' } }
            expect(response).to redirect_to(people_path)
        end

        it "renders edit page if unsuccesful" do 
             person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            put :update, params: { id: person.id, person: { eye_color: '' } }
            expect(response).to render_template(:edit)
        end
     
    end

    describe "DELETE #destroy" do
     it "returns http success" do
     
     end
    end

end