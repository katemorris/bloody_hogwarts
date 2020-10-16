require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it "average_age" do
      harry = Student.create(name: 'Harry Potter', age: 14, house: 'Gryffindor')
      draco = Student.create(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
      luna = Student.create(name: 'Luna', age: 13, house: 'Ravenclaw')

      expect(Student.average_age).to eq(13.67)
    end
  end

  describe 'class methods' do
    it 'alpha' do
      harry = Student.create(name: 'Harry Potter', age: 14, house: 'Gryffindor')
      draco = Student.create(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
      luna = Student.create(name: 'Luna', age: 13, house: 'Ravenclaw')
      expect(Student.alpha).to eq([draco, harry, luna])
    end
  end
end
