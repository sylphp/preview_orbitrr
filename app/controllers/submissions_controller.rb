class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :not_authorized_submission, only: [:new, :create]
  before_action :not_authorized, only: [:edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    # Get Mission details from params url to be shown in new_submission_url/path
    @mission = Mission.find(params[:mission_id])
    @submission = current_user.submissions.build
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = current_user.submissions.build(submission_params)
    # Submission.create(:mission_id => params[:mission_id])
    # @submission.mission_id = params[:mission]

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { redirect_to missions_path, notice: "there is error in submission" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :story, :price, :image, :mission_id)
    end


    def not_authorized_submission
      if 0 == 1
        flash[:alert] = "You cannot submit on your own mission"
        redirect_to missions_url
      end
    end


    def not_authorized
      unless helpers.is_submission_owner
        flash[:alert] = "Cannot delete or edit submission that is not yours"
        redirect_to missions_url
      end
    end

end
