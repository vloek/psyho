class Category < ActiveRecord::Base
  acts_as_ordered_tree
  paginates_per 10
  has_many :units
  # gem introduces new ActiveRecord callbacks:
  # *_reorder - fires when position (but not parent node) is changed
  # *_move - fires when parent node is changed
  
  # before_reorder :do_smth
  # before_move :do_smth_else


  def to_param
    [id, name.parameterize].join("-")
  end
end