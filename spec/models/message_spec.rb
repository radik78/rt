require 'spec_helper'

describe Message do
	before {@message = Message.new(:text=>'hello russian!!!')}

	subject {@message}
	it { should respond_to :text }
end