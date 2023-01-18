class TodosController < ApplicationController
  def index
  end

  def new
    @todo=Todo.new
  end

  def create
    @todo=Todo.create(todo_params)
    if @todo.save
      # binding.pry
       flash[:notice]="Todo is created Sucessfully"
       redirect_to todo_path(@todo)
    else
    
      render 'new'
    end
  end

  def show
    @todo=Todo.find(params[:id]) 
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end

  end
