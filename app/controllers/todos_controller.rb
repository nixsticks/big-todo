class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todolist_params)
    if @todo.save
      flash[:success] = 'Item added!'
      redirect_to @todo
    else
      flash.now[:error] = 'Unable to create item.'
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def index
    @lists = Todo.all
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todolist_params)
      flash[:success] = 'Item updated!'
      redirect_to @todo
    else
      flash.now[:error] = 'Unable to update item.'
      render 'edit'
    end
  end

  def destroy
    parent_list = Todo.find(params[:id]).todo_list
    Todo.find(params[:id]).delete
    redirect_to parent_list
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :todolist_id)
    end
end
