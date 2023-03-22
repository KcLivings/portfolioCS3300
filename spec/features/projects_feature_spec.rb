require "rails_helper"

RSpec.feature "Projects", type: :feature do
    context "Update project" do
      let(:project) { Project.create(title: "Test title", description: "Test content") }
      before(:each) do
        visit edit_project_path(project)
      end
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Project"
        expect(page).to have_content("Project was successfully updated")
      end
 
      scenario "descript should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Description can't be blank")
      end
      
      scenario "title should fail" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Title can't be blank")
      end
    end

    context "create project" do
      before(:each) do
        visit new_project_path()#edit_project_path(project)
      end

      scenario "should be successful" do
        within("form") do
          fill_in "Title", with: "title stuff"
          fill_in "Description", with: "description content"
        end
        click_button "Create Project"
        expect(page).to have_content("Project was successfully created")
      end

      scenario "title should fail" do
        within("form") do
          fill_in "Title", with: ""
          fill_in "Description", with: "descript Stuff"
        end
        click_button "Create Project"
        expect(page).to have_content("Title can't be blank")
      end

      scenario "Descript should fail" do
        within("form") do
          fill_in "Title", with: "title stuff"
          fill_in "Description", with: ""
        end
        click_button "Create Project"
        expect(page).to have_content("Description can't be blank")
      end
    end
end