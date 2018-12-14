require 'rails_helper'

describe Search do
  it 'can be created' do
    search = 'Cheap football tickets'
    search_obj = Search.create(search: search)

    expect(search_obj.class).to be(Search)
  end
  it {should validate_uniqueness_of(:search) }
end
