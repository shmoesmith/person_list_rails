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
        end
    end

    describe "GET #show" do
        it "returns http success" do
            person = Person.create(name: "george", age:28, hair_color: "brown", 
                                    eye_color: 'orange', gender: 'male', alive: true)
            get :show, params: { id: person.id }            
            expect(response).to have_http_status(:success)        
        end
    
    end

    describe "GET #new" do
        it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
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
    end

    describe "PUT #update" do
     
    end

    describe "DELETE #destroy" do
     it "returns http success" do
     
     end
    end

end