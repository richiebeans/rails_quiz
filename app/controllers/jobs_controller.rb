class JobsController < ApplicationController
  def index
    jobs = Job.all

    render json: jobs
  end

  def create
    job = Job.new(job_params)
    if job.save
      render json: job, status:200
    else
      render json: {message: "400 bad request"}, status: :bad_request
    end
  end

  private
  # strong params
  def job_params
    params.require(:job).permit(:url, :employer_name, :employer_description)
  end

  public
  def show
    job = Job.find_by_id(params[:id])

    if job.nil?
      render :json => {
        :message => { :message => "Cannot find post" }
      }
    else
      render json: job, status:200
    end
  end
end

