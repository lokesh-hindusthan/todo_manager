class TodosController < ApplicationController
  #def index
   # render plain: "Hello to rails and welcome! #{DateTime.now.to_s(:short)}"
   # render plain: Todo.all.to_a
  #end
  def index
    render plain: Todo.order(:due_date).map {|todo| todo.to_pleasant_string}.join("\n")
  end
  def show
    id = params[:id]
    #render plain: "The id you wanted was #{id}"
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end
  def create
    #render plain: "Hey, this is the the create action!"
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
      response_text = "Hey, your new todo is created with the id #{new_todo.id}"
      render plain: response_text
    #render plain: "hey, the params are: #{params.to_s}"
  end
end
