ActiveAdmin.register Product do
  permit_params :name, :description, :full_description, :image

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :full_description
    column :image
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :full_description
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :full_description
      f.input :image
    end
    f.actions
  end
end
