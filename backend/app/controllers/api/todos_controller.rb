class Api::TodosController < ApplicationController
  before_action :set_todo, only: %i[ show update_completed destroy ]

  # GET /todos
  def index
    @todos = Todo.all # todo is a variable

    render json: @todos
  end

  # GET /todos/1 # 1 is the id
  def show
    render json: @todo # This sends the todo item as a JSON response to the client
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update_completed
    if @todo.update(complete: params[:complete])  
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end
  

  # DELETE /todos/1
  def destroy
    @todo.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:to_nam, :complete)
    end
end
