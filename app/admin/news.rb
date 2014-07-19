ActiveAdmin.register News, as: "Newz" do
  menu :label => proc{ I18n.t("shared.labels.news") }
  permit_params :date, :title, :keywords, :description, :url, :head, :anounce, :body, :status
  # controller do
  #   def permitted_params
  #     params.permit(:newz => [:date, :title, :keywords, :description, :url, :head, :anounce, :body, :status])
  #   end
  # end

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
      f.input :head
      f.input :anounce, as: :ckeditor, label: false
      f.input :body, as: :ckeditor, label: false
      f.input :status
    end
    f.actions
  end
  
end
