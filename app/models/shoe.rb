# == Schema Information
#
# Table name: shoes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  distance   :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Shoe < ActiveRecord::Base
  attr_accessible :name, :user_id, :distance
  belongs_to :user

  validates :name,  presence: true, length: { maximum: 30 }
  validates :user_id, presence: true

  def shoe_info
  	"#{name} (#{distance})"
  end

end
