# frozen_string_literal: true

require 'spec_helper'

describe Perspectives::Properties do
  module ::Users
    class Properties < Perspectives::Base
      param :user

      property(:name) { user.name }

      nested 'profile'
    end
  end

  module ::Users
    class Profile < Perspectives::Base
      delegate_property :blog_url, to: :user
    end
  end

  let(:context) { {} }
  let(:name) { 'Andrew Warner' }
  let(:blog_url) { 'a-warner.github.io' }
  let(:user) { OpenStruct.new name: name }

  let(:params) { { user: user } }

  subject { ::Users::Properties.new(context, params) }

  it(:name) { should == 'Andrew Warner' }
  it(:profile) { should_not be_nil }
end
