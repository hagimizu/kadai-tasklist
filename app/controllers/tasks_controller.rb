class TasksController < ApplicationController

  def index
    @tasks = Task.all.page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクの追加に成功しました！"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの追加に失敗しました…"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスクの更新に成功しました！"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの更新に失敗しました…"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスクは削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

end