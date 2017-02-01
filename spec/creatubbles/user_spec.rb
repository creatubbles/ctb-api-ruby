require 'helper'

describe Creatubbles::User do
  let(:client) { Creatubbles::Client.new }

  let(:connection) do
    token = { access_token: "sample", token_type: "bearer", created_at: 1479918313 }
    OAuth2::AccessToken.from_hash(client, token)
  end

  subject { Creatubbles::User.new(connection, creation_json['data']) }

  describe '.type_name' do
    it "should return proper type" do
      expect(Creatubbles::User.type_name).to eq 'users'
    end
  end

  describe 'attributes' do
    it 'attributes list should be accessible from class and from object' do
      subject.attributes == Creatubbles::User.attributes
    end

    Creatubbles::User.attributes.each do |attr|
      it 'should return proper attributes' do
        expect(subject).to respond_to(attr)
        expect(subject.send(attr)).to eq(creation_json['data']['attributes'][attr.to_s])
      end
    end
  end

  describe 'relationships' do
    it 'should include user id' do
      expect(subject.school).to be_nil
    end

    it 'should include creator_ids' do
      expect(subject.custom_style).to be_nil
    end
  end
end
