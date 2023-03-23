class TenantsController < ApplicationController

    def create 
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :ok
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant 
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    def update 
        tenant = Tenant.find(params[:id])
        tenant.update!(tenant_params)
        render json: tenant, status: :accepted
    end

    private

    def tenant_params 
        params.permit(:name, :age, :id)
    end

end
