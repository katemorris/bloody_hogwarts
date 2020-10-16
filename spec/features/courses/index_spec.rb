require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the index of courses' do
    before(:each) do
      @harry = Student.create(name: 'Harry Potter', age: 14, house: 'Gryffindor')
      @draco = Student.create(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
      @luna = Student.create(name: 'Luna', age: 13, house: 'Ravenclaw')
      @dada = Course.create(name: 'Defense Against the Dark Arts')
      @potions = Course.create(name: 'Potions')
      harry_dada = StudentCourse.create(
        student_id: @harry.id,
        course_id: @dada.id
      )
      harry_potions = StudentCourse.create(
        student_id: @harry.id,
        course_id: @potions.id
      )
      draco_dada = StudentCourse.create(
        student_id: @draco.id,
        course_id: @dada.id
      )
      draco_potions = StudentCourse.create(
        student_id: @draco.id,
        course_id: @potions.id
      )
      luna_dada = StudentCourse.create(
        student_id: @luna.id,
        course_id: @dada.id
      )
    end

    it "I see a list of students with age and house" do
      visit '/courses'

      expect(page).to have_content("#{@dada.name}: 3")
      expect(page).to have_content("#{@potions.name}: 2")
    end

    it "I see the list of courses alpabetically with students alphabetically" do
      visit '/courses'

      expect(page.all('p')[0]).to have_content(@dada.name)
      expect(page.all('p')[1]).to have_content(@potions.name)
      within("#students-#{@dada.name}") do
        expect(page.all('li')[0]).to have_content(@draco.name)
        expect(page.all('li')[1]).to have_content(@harry.name)
        expect(page.all('li')[2]).to have_content(@luna.name)
      end
      within("#students-#{@potions.name}") do
        expect(page.all('li')[0]).to have_content(@draco.name)
        expect(page.all('li')[1]).to have_content(@harry.name)
      end

    end
  end
end
