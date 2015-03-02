class Person < ActiveRecord::Base
  include VirtualCereal

  serialize :survey, JSON

  after_find :create_virtual_attributes_for_survey
  after_initialize :create_virtual_attributes_for_survey

  def create_virtual_attributes_for_survey
    self.create_virtual_attributes_for_serialized_column("survey", [
      "cars_owned",
      "favorite_foods"
    ])
  end
end
