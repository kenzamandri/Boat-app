class CompaniesController < ApplicationController

 before_action :authenticate_company!


      def index
    		@companies = Company.all
    	end

      def new
        @message = "my new company"
      end

      def create
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
