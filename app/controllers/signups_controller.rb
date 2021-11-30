class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def create
        signup = Signup.create!(signup_params)
        # activity = Activity.find(signup.activity_id)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end

    def render_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
