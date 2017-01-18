class CompaniesController < ApplicationController

 before_action :authenticate_user!


      def index
    		@companies = Company.all
    	end

      def new
        @message = "my new company"
      end

      def  create
        @company = Company.create(
        
        )


      end



      def show
        @company = Company.find(params[:id])
        # company has many boats
    		@company_boats = @company.boats
      end


      def edit

      end


      def update

      end

      def destroy

      end









end
