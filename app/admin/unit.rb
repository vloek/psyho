ActiveAdmin.register Unit do
  
  menu :label => proc{ I18n.t("shared.labels.units") }

  directory = "public/data"
  
  after_create :upload
  after_update :upload
  after_destroy :drop
  
  member_action :upload do |unit|
    if params[:unit][:attachment]
        name = params[:unit][:attachment].original_filename
        path = File.join(directory, name)
        File.open(path, "wb") { |f| f.write(params[:unit][:attachment].read)}
        unit.size = File.size(path)
        unit.file = name
        unit.save!
      end
  end
  
  member_action :drop do |unit|
    file = File.join(directory, unit.file)
    File.delete(file) if File.exist?(file)
  end
  


  
  form html: { multipart: true } do |f|
    f.inputs I18n.t("shared.labels.units") do
      f.input :file
      f.input :name
      f.input :longname
      f.input :size 
      f.input :version 
      f.input :date, as: :datepicker
      f.input :holders
      f.input :description, as: :text
    end
    f.inputs "Вложения" do
      f.has_many :file_attaches, new_record: true, allow_destroy: true, heading: false, label: nil do |cf|
        cf.input :file, as: :file, label: cf.object.file_file_name
        cf.input :version, label: 'Версия'
      end
    end

    f.actions
  end
  
  permit_params :name, :id, :longname, :size, :version, :date, :editor, :file, :holders, :description, :category_id, file_attaches_attributes: [ :unit_id, :file, :_destroy, :id, :version ]

end
