require "rails_helper"

describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating project" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end
    it "should not be able to save project when title missing" do
      project = Project.new(description: "Some description content goes here")
      expect(project.save).to eq(false)
    end
    it "ensures the descritption is present when creating project" do
      project = Project.new(title: "Content of the title")
      expect(project.valid?).to eq(false)
    end
    it "should not be able to save project when description missing" do
      project = Project.new(title: "Content of the title")
      expect(project.save).to eq(false)
    end
    it "should be able to save project when have description and title" do
      project = Project.new(title: "Title", description: "Content of the description")
      expect(project.save).to eq(true)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @project = Project.create(title: "Title", description: "Content of the description")
 
      end
    it "ensures the title is present when editing project" do
      @project.update(:title => "New Title")
      expect(@project.title == "New Title")
    end
  end
end