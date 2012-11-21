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
#  shoe_id    :integer
#

require 'spec_helper'

describe Entry do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @entry = Entry.new(content: "Lorem ipsum")

  end

  subject { @entry }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  its(:user) { should == user }
end
