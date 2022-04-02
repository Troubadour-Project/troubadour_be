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
  
  let(:invalid_query) {
    <<~GQL
    {
      getAdmin(id: 2) {
        id
        username
        email
      }
    }
    GQL
  }

  let(:invalid_field) {
    <<~GQL
    {
      getAdmin(id: 1) {
        id
        name
        email
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

    it 'returns an error if given an invalid admin id' do
      admin = create(:admin, id: 1)

      response = TroubadourBeSchema.execute(invalid_query)
      parsed = json_parse(response.to_json)
      
      expect(parsed.count).to eq(2)
      expect(parsed[:data][:getAdmin]).to eq(nil)
      expect(parsed[:errors][0][:message]).to eq('Admin does not exist')
      expect(parsed[:errors][0][:locations][0][:line]).to eq(2)
      expect(parsed[:errors][0][:locations][0][:column]).to eq(3)
      expect(parsed[:errors][0][:path][0]).to eq('getAdmin')
    end

    it 'returns an error if given an invalid field' do
      admin = create(:admin, id: 1)

      response = TroubadourBeSchema.execute(invalid_field)
      parsed = json_parse(response.to_json)[:errors][0]
      
      expect(parsed[:message]).to eq("Field 'name' doesn't exist on type 'Admin'")
      expect(parsed[:locations][0][:line]).to eq(4)
      expect(parsed[:locations][0][:column]).to eq(5)
      expect(parsed[:path][0]).to eq('query')
      expect(parsed[:path][1]).to eq('getAdmin')
      expect(parsed[:path][2]).to eq('name')
      expect(parsed[:extensions][:code]).to eq('undefinedField')
      expect(parsed[:extensions][:typeName]).to eq('Admin')
      expect(parsed[:extensions][:fieldName]).to eq('name')
    end
  end
end
