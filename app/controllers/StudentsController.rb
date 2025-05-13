class StudentsController < ApplicationController
  def index
    @students = Student.all.order(:created_at => :desc)
    render({ :template => "students/index" })
  end

  def show
    @student = Student.find(params.fetch("path_id"))
    render({ :template => "students/show" })
  end

  def create
    @student = Student.new
    @student.first_name = params.fetch("query_first_name")
    @student.last_name = params.fetch("query_last_name")
    @student.email = params.fetch("query_email")

    if @student.save
      redirect_to("/students", { :notice => "Student created successfully." })
    else
      redirect_to("/students", { :alert => "Student failed to create successfully." })
    end
  end

  def update
    @student = Student.find(params.fetch("path_id"))

    @student.first_name = params.fetch("query_first_name")
    @student.last_name = params.fetch("query_last_name")
    @student.email = params.fetch("query_email")

    if @student.save
      redirect_to("/students/#{@student.id}", { :notice => "Student updated successfully." })
    else
      redirect_to("/students/#{@student.id}", { :alert => "Student failed to update successfully." })
    end
  end

  def destroy
    @student = Student.find(params.fetch("path_id"))
    @student.destroy

    redirect_to("/students", { :notice => "Student deleted successfully." })
  end
end
