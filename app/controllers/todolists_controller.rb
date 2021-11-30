class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      #render :アクション名で、同じコントローラの別アクションのviewを表示できる
      render :new
    end
  end

  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])

  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end


  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)

  end

end
