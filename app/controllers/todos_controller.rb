class TodosController < ApplicationController

    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end


    def create
        @todo_Params = Todo.new(todo_params)
        @todo_Params.save
        redirect_to todos_path
    end

    def lista
      
        @todos = Todo.all

    end

    def show

        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todo_params)
        redirect_to todos_path
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to todos_path
    end



    def complete

          @todo = Todo.find(params[:id])
          #@todo = Todo.update(params[:completed])
          @todo.completed = true
            #if @todo.completed == false
            #    @todo.completed == true
            #end
          @todo.save
          redirect_to todos_path
    end

    private
    def todo_params
        params.require(:todo).permit(:description, :completed)
    end

end
