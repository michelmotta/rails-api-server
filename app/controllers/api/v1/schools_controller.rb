module Api
    module V1
        class SchoolsController < ApplicationController
            
            ##
            # Index Method
            # Method used by API to return a list of schools from database
            # GET /api/v1/schools
            def index
                schools = School.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded school list', data: schools}, status: :ok
            end

            ##
            # Show Method
            # Method used by API to return a school from database
            # GET /api/v1/schools/[id]
            def show
                school = School.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded School', data: school}, status: :ok
            end

            ##
            # Create Method
            # Method used by API to create new school into database
            # POST /api/v1/schools
            def create
                school = School.new(school_params)
                if school.save
                    render json: {status: 'SUCCESS', message: 'School has been saved.', data: school}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'School has not been saved.', data: school.errors}, status: :unprocessable_entity
                end
            end

            ##
            # Update Method
            # Method used by API to update a school into database
            # PUT /api/v1/schools/[id]
            def update
                school = School.find(params[:id])
                if school.update_attributes(school_params)
                    render json: {status: 'SUCCESS', message: 'School has been updated.', data: school}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'School has not been updated.', data: school.errors}, status: :unprocessable_entity
            
                end
            end

            ##
            # Destroy Method
            # Method used by API to delete a school from database
            # DELETE /api/v1/schools/[id]
            def destroy
                school = School.find(params[:id])
                school.destroy
                render json: {status: 'SUCCESS', message: 'School has been deleted.', data: school}, status: :ok
            end

            private

            ##
            # Method school_params 
            # Private params for School
            def school_params
                params.permit(:name, :email, :phone)
            end
        end
    end
end