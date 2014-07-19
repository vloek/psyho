ActiveAdmin.register Page do
  menu :label => proc{ I18n.t("shared.labels.pages") }
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :parent, :url, :title, :keywords, :description, :head, :body, :status, :menu_id, :position, :menu_name



  

  index do
    selectable_column
    id_column
    column :head
    column :status
    column :created_at
    actions
  end


  form do |f|
    f.inputs "Детали новости" do
      f.input :menu_name
      f.input :head
      f.input :body, as: :ckeditor, label: false
      f.input :menu_id, as: :select, collection: { "Верхнее" => 1, "Левое" => 2}, label: 'Меню'
      f.input :position, as: :number, label: 'Расположение в меню'
      f.input :status
    end
    f.actions
  end

  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
