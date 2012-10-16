# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  content    :text
#  date       :date
#  distance   :decimal(, )
#  duration   :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
  attr_accessible :content, :date, :distance, :duration
  belongs_to :user

  validates :user_id, presence: true
  validates :content, length: { maximum: 500 }
  validates_numericality_of :distance

  VALID_DISTANCE_REGEX = /[0-2][0-3]:[0-5][0-9]:[0-5][0-9]/i
  validates :duration, presence: true, format: { with: VALID_DISTANCE_REGEX }

  default_scope order: 'entries.created_at DESC'

end
