class TodosController < ApplicationController

    def index
        @todos = Todo.all 
    end

    def new 
        @todo = Todo.new
    end


    def create 

        #En el controller todos crear el método create. Este método debe crear un nuevo ToDo a partir de
        #los parámetros recibidos del formulario bajo el scope de ToDo (params[:todo]).
        #Filtrar los parámetros recibidos bajo el scope de ToDos en un método privado llamado
        #todo_params para poder utilizar asignación masiva.
        #El método create después de almacenar el todo debe redireccionar al index de ToDos.

        @todo_Params = Todo.new(todo_params)

        @todo_Params.save

        redirect_to todos_path


    end


    def show
        #En el controller todos crear el método show. Este método debe buscar un ToDo en base al
        #parámetro 'id'. (Todo.find) y asignarlo a a la variable @todo
        #Crear la vista show.html.erb
        #La vista debe mostrar la descripción del ToDo y si se encuentra completado o no.
        #En la vista Index: agregar un link a Show a cada ToDo listado.
       
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

    
    private
    def todo_params
        params.require(:todo).permit(:description, :completed)
    end

end

