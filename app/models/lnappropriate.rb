class Lnappropriate < ApplicationRecord
  belongs_to :user
  belongs_to :describe

  counter_culture :describe
end
