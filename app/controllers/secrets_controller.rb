class SecretsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  def index
    @secrets = Secret.all

    @secret = Secret.new

  end

  def new
      @secret = current_user.secrets.new
  end

  def create
    @secret = current_user.secrets.new(secret_params)

    if @secret.save
        redirect_to root_path, notice: 'Secret posted successfully.'
    else 
        render :new
    end

  end
  
  def show
    @secret = Secret.find(params[:id])

  end

  def edit
    @secret = Secret.find(params[:id])
  end

  def update
    @secret = Secret.find(params[:id])

    if @secret.update(secret_params)
        redirect_to @secret
    else
        render :edit
    end

  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy

    redirect_to root_path

  end

  private
  def secret_params
    params.require(:secret).permit(:title, :body)
  end
end
