require 'spec_helper'

describe Message do
	before {@message = Message.new(:text=>'hello russian!!!')}

	subject {@message}
	it { should respond_to :text }
end# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#

