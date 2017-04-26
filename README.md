## Jacques

To get started:

- Add [ActiveModel Serializers](https://github.com/rails-api/active_model_serializers) to the Gemfile
- `bundle`
- `rails db:create`
- Generate away. Of note: Don't overwrite any test or factory files (it should prompt you as you go along)
  - If you goof this up, you can always `git checkout -- <filename>` to get back what was there before it was overwritten.

[![Build Status](https://travis-ci.org/lmoore154/jacques.svg?branch=master)](https://travis-ci.org/lmoore154/jacques)


Explorer Mode
- Help Jacques out and create the API he needs now.
- You'll know you have this complete when rake test is green and Travis CI gives you a checkmark.
- Use ActiveModelSerializers for the above.
- Ensure Jacques can access this API using CORS.

Adventure Mode
Jacques had a nice-to-have request.
- I'd like to be able to edit notes. If we have a sense of users, a user should only be able to edit their own notes.
  `PUT /api/notes/:id -d {data}`
- Write your own tests for the above in test/integration/adventure_test.rb

Epic Mode
- Notes should have comments. They should be included in the API response for notes#show but have their own create actions/controller
