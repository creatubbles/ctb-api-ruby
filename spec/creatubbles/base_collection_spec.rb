require 'spec_helper'

RSpec.describe Creatubbles::BaseCollection do

  it "ignores deleted creation" do
    client = Creatubbles::Client.dummy

    expect{client.test_objects.find('non-existing-object-id')}.
      to raise_error(OAuth2::Error)

    expect{client.test_objects.find('non-existing-object-id', nil_404:true)}.
      not_to raise_error
  end
end
