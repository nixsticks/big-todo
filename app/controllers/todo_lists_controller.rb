class TodoListsController < ApplicationController
  def new
    @list = TodoList.new
  end

  def create
    @list = TodoList.new(todolist_params)
    if @list.save
      flash[:success] = 'List created!'
      redirect_to @list
    else
      flash.now[:error] = 'Unable to create list.'
      render 'new'
    end
  end

  def show
    @list = TodoList.find(params[:id])
  end

  def index
    @lists = TodoList.all
  end

  def edit
    @list = TodoList.find(params[:id])
  end

  def update
    @list = TodoList.find(params[:id])
    if @list.update_params(todolist_params)
      flash[:success] = 'List updated!'
      redirect_to @list
    else
      flash.now[:error] = 'Unable to update list.'
      render 'edit'
    end
  end

  def destroy
    TodoList.find(params[:id]).delete
    redirect_to todolists_path
  end

  private
    def todolist_params
      params.require(:todolist).permit(:name, :todo_ids)
    end
end
