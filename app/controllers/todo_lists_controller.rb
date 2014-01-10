class TodoListsController < ApplicationController
  def new
    @todo_list = TodoList.new
    @todo_list.todos.build
  end

  def create
    @todo_list = TodoList.new(todolist_params)

    if @todo_list.save
      flash[:success] = 'List created!'
      redirect_to @todo_list
    else
      flash[:error] = 'Unable to create list.'
      redirect_to todo_lists_path
    end
  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def index
    @todo_lists = TodoList.all
    @todo_list = TodoList.new
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update_attributes(todolist_params)
      flash[:success] = 'List updated!'
      redirect_to @todo_list
    else
      flash.now[:error] = 'Unable to update list.'
      render 'edit'
    end
  end

  def destroy
    Todo.find(params[:id]).delete
    redirect_to todo_lists_path
  end

  private
    def todolist_params
      params.require(:todo_list).permit(:name, :todos_attributes => :name)
    end
end
