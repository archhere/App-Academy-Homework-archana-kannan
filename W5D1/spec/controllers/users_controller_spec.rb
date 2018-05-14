require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "redirects user to sign-in page" do
        post :create, params: {user: {email_address: "archanakannan19862gmail.com", password: "password"} }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "with invalid params" do
      it "validates the presence of email_address and password" do
        post :create, params: {user: {email_address: "wrong.gmail.com", password: "something"} }
        expect(response).render_template("new")
        expect(flash[:errors]).to be_present
      end
    end
  end
end



  
