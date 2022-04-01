require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  let(:query) {
    <<~GQL
    {
      getAdmin(id: 1) {
        id
        username
        email
      }
    }
    GQL
  }

  let(:query_with_subs) {
    <<~GQL
    {
      getAdmin(id: 1) {
        id
        username
        email
        submissions {
          id
          name
        }
      }
    }
    GQL
  }

  context 'get_admin' do
    it 'returns a single admin when given a valid id' do
      admin = create(:admin, id: 1)
      admin_list = create_list(:admin, 3)

      response = TroubadourBeSchema.execute(query)
      parsed = json_parse(response.to_json)
      
      expect(parsed[:data][:getAdmin].count).to eq(3)
      expect(parsed[:data][:getAdmin][:id]).to eq(admin.id.to_s)
      expect(parsed[:data][:getAdmin][:username]).to eq(admin.username)
      expect(parsed[:data][:getAdmin][:email]).to eq(admin.email)
    end
    
    it "returns a single admin with it's submissions" do
      admin = create(:admin, id: 1)
      sub_admin1 = create(:submission_admin, admin_id: 1)
      sub_admin2 = create(:submission_admin, admin_id: 1)
      response = TroubadourBeSchema.execute(query_with_subs)
      parsed = json_parse(response.to_json)[:data][:getAdmin]

      expect(parsed[:id]).to eq(admin.id.to_s)
      expect(parsed[:username]).to eq(admin.username)
      expect(parsed[:email]).to eq(admin.email)

      expect(parsed[:submissions].count).to eq(2)
      expect(parsed[:submissions].first[:id]).to eq(sub_admin1.submission.id.to_s)
      expect(parsed[:submissions].first[:name]).to eq(sub_admin1.submission.name)
    end
  end
end
