class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action only: %i[show edit update destroy like external internal]
  respond_to :js, :html, :json

  # GET /projects or /projects.json
  def index
    @projects = Project.includes(:user, :course).references(:course).merge(Course.where.not(id: nil))
    @external_projects = Project.includes(:course).where(course: { id: nil }).references(:course)
    @page_title = 'Projects'
    @courses = Course.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @project = Project.find(params[:id])
    case params[:format]
    when 'like'
      @project.liked_by current_user
    when 'unlike'
      @project.unliked_by current_user
    end
  end

  def external
    @external_projects = Project.includes(:course).where(course: { id: nil }).references(:course)
  end

  def internal
    @projects = Project.includes(:user, :course).references(:course).merge(Course.where.not(id: nil))
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_project
  #   @project = Project.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:project, :hours, :course_id, :user_id)
  end
end
