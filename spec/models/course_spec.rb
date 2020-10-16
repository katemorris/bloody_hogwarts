require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :student_courses }
    it { should have_many(:students).through(:student_courses) }
  end

  describe 'instance methods' do
    it "num_students" do
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

      expect(@dada.num_students).to eq(3)
      expect(@potions.num_students).to eq(2)
    end
  end
end
