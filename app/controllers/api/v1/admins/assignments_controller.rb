# Here Customers have access to actions related to matching partners
class Api::V1::Admins::AssignmentsController < ApplicationController
  def show
    if user_is_admin?
      assignment = Assignment.find_by(id: params[:id], lesson_id: params[:lesson_id], content_type: params[:content_type].to_i)

      if assignment
        render json: assignment, status: 200
      else
        render json: { errors: "Assignment with id #{params[:id]} was not found"}, status: 404
      end
    else
      render json: { errors: "Not enough access rights" }, status: 401
    end
  end

  def user_is_admin?
    true
  end

  def create
    if user_is_admin?
      assignment = Assignment.create(
        lesson_id: params[:lesson_id],
        content_type: assignment_params[:content_type].to_i,
        content_url: assignment_params[:content_url]
      )

      if assignment.save
        render json: assignment, status: 201
      else
        render json: { errors: assignment.errors }, status: 422
      end
    else
      render json: { errors: "Not enough access rights" }, status: 401
    end
  end

  def assignment_params
    params.require(:assignment).permit(:name, :content_type, :content_url, :lesson_id).to_h
  end

end

