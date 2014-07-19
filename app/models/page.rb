class Page < ActiveRecord::Base

  default_scope { order(:position) }
  scope :top_menu,   -> { where( menu_id: 1 ) }
  scope :left_menu,  -> { where( menu_id: 2 ) }




  def to_param
    [id, head.parameterize].join("-")
  end
end
