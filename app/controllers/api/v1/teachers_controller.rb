module Api
    module V1
        class TeachersController < ApplicationController

            ##
            # Index Method
            # Method used by API to return a list of teachers from database
            # GET /api/v1/teachers
            def index
                teachers = Teacher.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded teacher list', data: teachers}, include:'school', status: :ok
            end

            ##
            # Show Method
            # Method used by API to return a teacher from database
            # GET /api/v1/teachers/[id]
            def show
                teacher = Teacher.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded teacher', data: teacher}, include:'school', status: :ok
            end

            ##
            # Create Method
            # Method used by API to create new teacher into database
            # POST /api/v1/teachers
            def create
                teacher = Teacher.new(teacher_params)
                if teacher.save
                    render json: {status: 'SUCCESS', message: 'Teacher has been saved.', data: teacher}, include:'school', status: :ok
                else
                    render json: {status: 'ERROR', message: 'Teacher has not been saved.', data: teacher.errors}, status: :unprocessable_entity
                end
            end

            ##
            # Update Method
            # Method used by API to update a teacher into database
            # PUT /api/v1/teachers/[id]
            def update
                teacher = Teacher.find(params[:id])
                if teacher.update_attributes(teacher_params)
                    render json: {status: 'SUCCESS', message: 'Teacher has been updated.', data: teacher}, include:'school', status: :ok
                else
                    render json: {status: 'ERROR', message: 'Teacher has not been updated.', data: teacher.errors}, status: :unprocessable_entity
            
                end
            end

            ##
            # Destroy Method
            # Method used by API to delete a teacher from database
            # DELETE /api/v1/teachers/[id]
            def destroy
                teacher = Teacher.find(params[:id])
                teacher.destroy
                render json: {status: 'SUCCESS', message: 'Teacher has been deleted.', data: teacher}, status: :ok
            end

            private

            ##
            # Method teacher_params 
            # Private params for Teacher
            def teacher_params
                params.permit(:name, :email, :phone, :subject, :school_id)
            end

        end
    end
end