require 'spec_helper'

describe LinearPerspective::Templating do
  module ::Users
    class SimpleInfo < LinearPerspective::Base
    end
  end

  subject { ::Users::SimpleInfo }

  its(:_template_key) { should == 'users/simple_info' }

  context 'backing mustache template' do
    subject { ::Users::SimpleInfo._mustache }
    it { should_not be_nil }
    its(:render) { should == "Simple info test\n" }
  end
end
