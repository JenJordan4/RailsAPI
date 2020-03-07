class MyApp < ApplicationRecord

  def self.search(params)
    return {
        success: false, 
        message: "by is required"
    } unless params[:by].present?
    return {
      success: false,
      message: "Only id and name are permitted for by"
    } unless ["id", "name"].include?(params[:by])


    ##Order by the order param. If none specified, order by ascending
    ordered = params[:order]&.to_sym || :asc
    filter_query = select(:id, :name).order(params[:by] => ordered)
    #Set the start to the :start param
    filter_query = filter_query.offset(params[:start]) if params[:start]
    ##If there's no max, then max 50. 
    max = params[:max] || 50


    ##Show only the amount within the boundaries (end - start)
    if params[:end]
      range = params[:end].to_i - (params[:start].to_i || 0) 
      max = range > max ? max : range #If the boundaries is bigger than max, then show max
    end

    #Display the page max
    filter_query.limit(max)
  end
end
