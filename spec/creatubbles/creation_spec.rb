require 'spec_helper'

describe Creatubbles::Creation do
  let(:client) { Creatubbles::Client.new }

  let(:connection) do
    token = { access_token: "sample", token_type: "bearer", created_at: 1479918313 }
    OAuth2::AccessToken.from_hash(client, token)
  end

  subject { Creatubbles::Creation.new(connection, creation_json['data']) }

  describe '.type_name' do
    it "should return proper type" do
      expect(Creatubbles::Creation.type_name).to eq 'creations'
    end
  end

  describe 'attributes' do
    it 'attributes list should be accessible from class and from object' do
      subject.attributes == Creatubbles::Creation.attributes
    end

    Creatubbles::Creation.attributes.each do |attr|
      it 'should return proper attributes' do
        expect(subject).to respond_to(attr)
        expect(subject.send(attr)).to eq(creation_json['data']['attributes'][attr.to_s])
      end
    end
  end

  describe 'relationships' do
    it 'should include user id' do
      expect(subject.user).to eq 'xUt6Feou'
    end

    it 'should include creator_ids' do
      expect(subject.creators).to eq ['xUt6Feou']
    end
  end

  describe 'add_tags' do
    it "should trigger post on connection with correct params" do
      expect(connection).to receive(:post).with(
        "creations/#{subject.id}/tags", {
          body: {
            data: [
              { type: "tags", id: "a" },
              { type: "tags", id: "b" }
            ]}})
      subject.add_tags(['a', 'b'])
    end
  end

  describe 'remove_tags' do
    it "should trigger post on connection with correct params" do
      expect(connection).to receive(:delete).with(
        "creations/#{subject.id}/tags", {
          body: {
            data: [
              { type: "tags", id: "a" },
              { type: "tags", id: "b" }
            ]}})
      subject.remove_tags(['a', 'b'])
    end
  end
end
