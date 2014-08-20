class SkillsController < ApplicationController

  before_action :get_category

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to category_skills_path(@category)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_category
    @category = Category.where(:id => params[:category_id]).first
  end

  private
  def skill_params
    params.require(:skill).permit(:skill, :category_id)
  end
end
