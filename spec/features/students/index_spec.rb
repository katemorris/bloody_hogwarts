require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the index of students' do
    before(:each) do
      @harry = Student.create(name: 'Harry Potter', age: 14, house: 'Gryffindor')
      @draco = Student.create(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
      @luna = Student.create(name: 'Luna', age: 13, house: 'Ravenclaw')
    end
    it "I see a list of students with age and house" do
      visit '/students'

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@harry.age)
      expect(page).to have_content(@harry.house)
      expect(page).to have_content(@luna.name)
      expect(page).to have_content(@luna.house)
      expect(page).to have_content(@luna.age)
    end

    it "I see the average age of all students" do
      visit '/students'

      expect(page).to have_content("Average Age: 13.67")
    end

    it "I see the list of students alpabetically" do
      visit '/students'

      expect(page.all('li')[0]).to have_content(@draco.name)
      expect(page.all('li')[1]).to have_content(@harry.name)
      expect(page.all('li')[2]).to have_content(@luna.name)
    end
  end
end
