require 'test_helper'

class AdventureTest < ActionDispatch::IntegrationTest

  test 'notes#update' do
    note = FactoryGirl.create(:note)
    put "/api/notes/#{note.id}",
    params: { body: "new body", api_token: note.user.api_token }
    assert response.ok?
    json = JSON.parse(response.body)
    assert_equal "new body", json["note"]["body"]
  end

  test 'notes#update does not update without api token' do
    note = FactoryGirl.create(:note)
    put "/api/notes/#{note.id}",
    params: { body: "new body" }
    refute response.ok?
  end

end
