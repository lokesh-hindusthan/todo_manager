class TodosController < ApplicationController
  def index
   # render plain: "Hello to rails and welcome! #{DateTime.now.to_s(:short)}"
    render plain: Todo.all.to_a
  end
end
