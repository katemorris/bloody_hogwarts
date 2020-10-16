class StudentsController < ApplicationController
  def index
    @courses = Course.all
  end
end
