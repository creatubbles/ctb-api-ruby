require 'spec_helper'

RSpec.describe Creatubbles::BaseCollection do

  it "ignores deleted creation" do
    client = Creatubbles::Client.dummy

    expect{client.test_objects.find('non-existing-object-id')}.
      to raise_error(Creatubbles::Error::RecordNotFound)

    begin
      client.test_objects.find('non-existing-object-id')
    rescue => e
      expect(e.original).to be_a(OAuth2::Error)
      expect(e.message).to include('non-existing-object-id')
    end

    expect(client.test_objects.find_by_id('non-existing-object-id')).
      to be_nil
  end
end
