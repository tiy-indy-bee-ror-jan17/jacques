Rails.application.routes.draw do

#User Controller Actions
post 'api/users' => 'user#create'




#Note Controller Actions
get 'api/notes' => 'note#index'
post 'api/notes' => 'note#create'
get 'api/notes/tag/:name' => 'note#by_tag_name'




#Tag Controller Actions





#Tagging Controller Actions



end
