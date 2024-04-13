# app/controllers/api/comments_controller.rb

module Api
  class CommentsController < ApplicationController

    def index
      comments = Comment.all
      render json: comments, status: :ok
    end

    before_action :set_earthquake

    # POST /api/earthquakes/:earthquake_id/comments
  def create
  @earthquake = Earthquake.find(params[:earthquake_id])
  @comment = @earthquake.comments.build(comment_params)
  
  if @comment.save
    render json: { message: 'Comentario creado exitosamente', comment: @comment }, status: :created
  else
    render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
  end
end

    # PATCH/PUT /api/comments/:id
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        render json: { message: 'Comentario actualizado exitosamente', comment: @comment }, status: :ok
      else
        render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /api/comments/:id
    def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy
        render json: { message: 'Comentario eliminado con éxito' }, status: :ok
      else
        render json: { error: 'No se pudo eliminar el comentario' }, status: :unprocessable_entity
      end
    end

    private

    def set_earthquake
      @earthquake = Earthquake.find(params[:earthquake_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end