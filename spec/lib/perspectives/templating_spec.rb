# frozen_string_literal: true

require 'spec_helper'

describe Perspectives::Templating do
  module Users
    class SimpleInfo < Perspectives::Base
    end
  end

  subject { ::Users::SimpleInfo }

  it(:_template_key) { should == 'users/simple_info' }

  context 'backing mustache template' do
    subject { ::Users::SimpleInfo._mustache }
    it { should_not be_nil }
    it(:render) { should == "Simple info test\n" }
  end
end
