class MultilineList < ActiveRecord::Base
  belongs_to :resume
  has_many :multiline_list_items, dependent: :destroy

  accepts_nested_attributes_for :multiline_list_items, update_only: true

  # short hand for multiline_list_items
  def items
    return self.multiline_list_items
  end

  # return the partial name, with which this list is rendered with 
  def tpl_name
    return self.class.name.underscore
  end

  # return the data to be rendered (items of this lists)
  def data
    return self.multiline_list_items
  end
end
