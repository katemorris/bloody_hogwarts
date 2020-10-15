require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the each student page' do
    before(:each) do
      @harry = Student.create(
        name: 'Harry Potter',
        age: 14,
        house: 'Gryffindor')
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

    end
    it "I see a list of the student's courses" do
      visit "/students/#{@harry.id}"

      expect(page).to have_content(@dada.name)
      expect(page).to have_content(@potions.name)
    end
  end
end
