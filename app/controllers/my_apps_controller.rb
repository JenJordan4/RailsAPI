class MyAppsController < AppliationController
    
  def index
    @myApps = MyApp.search(search_params)
    render json: @my_apps
  end

  private
  
  def search_params
    params
        .require(:range)
        .permit(
          :by,
          :start,
          :end,
          :max,
          :order
        )
  end
end
