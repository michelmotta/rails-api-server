module Api
    module V1
        class SchoolsController < ApplicationController
            def index
                schools = School.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Schools List', data: schools}, status: :ok
            end
        end
    end
end