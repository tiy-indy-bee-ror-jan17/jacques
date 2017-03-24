require 'test_helper'

class AdventureTest < ActionDispatch::IntegrationTest
  def test_update_note
    user = FactoryGirl.create(:user, :with_notes)
    put '/api/notes/:id',
      params: {
        title: "New title",
        body: "new body"
      }
    assert response.ok?
    json = JSON.parse(response.body)
    assert_equal user.notes.count, json["notes"].length
    assert_equal "New title", json['note']['title']


  end
end
