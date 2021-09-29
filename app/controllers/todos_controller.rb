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
end
