ActiveAdmin.register Category, as: "Categoree" do
  menu :label => proc{ I18n.t("shared.labels.categories") }
  controller do
    def permitted_params
      params.permit(:categoree => [:name, :url, :description, :parent_id, :position, :depth, :children_count])
    end
  end
  # permit_params :name, :url, :description, :parent_id, :position, :depth, :children_count
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs "Детали категории" do

      f.input :parent
      f.input :name
      f.input :description
      f.input :position
      f.input :depth
    end
    f.actions
  end
  
end
