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

      expect(page).to have_content("#{dada.name}: 3")
      expect(page).to have_content("#{potions.name}: 2")
    end
  end
end
