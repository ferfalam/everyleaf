require 'rails_helper'

RSpec.describe Tag, type: :system do
  before do
    @user_admin = FactoryBot.create(:user_admin)
    @tag_a = FactoryBot.create(:tag)
    @tag_b = FactoryBot.create(:second_tag)

    visit new_session_path
    fill_in "Email",	with: "admin@gmail.com" 
    fill_in "Password",	with: "password" 
    click_on("Submit")
  end
  
    describe "CRUD on the tag" do
        context "can create tag" do
            it "create a tag" do
                visit new_admin_tag_path
                fill_in "Name",	with: "Tag test" 
                click_on("Create Tag")
                expect(page).to have_content "Tag created successfully"
            end

        end

        context "can show a tag" do
            it "on tag details page" do
                visit admin_tag_path(@tag_a)
                expect(page).to have_content @tag_a.name 
            end

        end

        context "can update tag" do
            it "update tag" do
                visit edit_admin_tag_path(@tag_b)
                fill_in "Name",	with: "tag update" 
                click_on("Update Tag")
                expect(page).to have_content "Tag updated successfully" 
            end   

        end

        context "can destroy tag" do
            it "destroy tag" do
                visit admin_users_path
                first(".delete").click
                expect(page).to have_content "Delete successfully" 
            end
        end
    end
end
