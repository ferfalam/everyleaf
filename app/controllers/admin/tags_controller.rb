class Admin::TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :show, :update, :destroy]
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "Tag created successfully"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "Tag updated successfully"
    else
      render :new
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path, notice: "tag deleted successfully"
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
