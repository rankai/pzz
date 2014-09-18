class PzzTermTaxonomy < ActiveRecord::Base

  # fields

  # validates


  # relationships
  has_one :pzz_term
  # self join
  has_many :subordinates, class_name: "PzzTermTaxonomy",
                          foreign_key: "taxnomy_parent_id"

  belongs_to :taxonomy_parent, class_name: "PzzTermTaxonomy"

end
