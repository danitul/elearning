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

end

