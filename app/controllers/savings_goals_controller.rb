class SavingsGoalsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_savings_goal, only: [:show, :edit, :update, :destroy]
  
    def index
      @savings_goals = current_user.savings_goals
    end
  
    def show
    end
  
    def new
      @savings_goal = SavingsGoal.new
    end
  
    def create
      @savings_goal = current_user.savings_goals.build(savings_goal_params)
      if @savings_goal.save
        redirect_to savings_goals_path, notice: 'Savings goal was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @savings_goal.update(savings_goal_params)
        redirect_to savings_goals_path, notice: 'Savings goal was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @savings_goal.destroy
      redirect_to savings_goals_path, notice: 'Savings goal was successfully destroyed.'
    end
  
    private
  
    def set_savings_goal
      @savings_goal = current_user.savings_goals.find(params[:id])
    end
  
    def savings_goal_params
      params.require(:savings_goal).permit(:name, :target_amount, :current_amount, :end_date)
    end
end
  