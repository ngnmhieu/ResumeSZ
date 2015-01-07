class Workitem < ActiveRecord::Base
  belongs_to :worklist
  liquid_methods :line1, :line2, :desc, :start, :end

  after_initialize :default_attributes

  def default_attributes
    self.line1 ||= ''
    self.line2 ||= ''
    self.desc  ||= ''
    self.start ||= DateTime.now 
    self.end   ||= DateTime.now 
    self.order ||= self.worklist.items.size + 1
  end
end