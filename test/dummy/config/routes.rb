Rails.application.routes.draw do
  mount BigosContactBox::Engine => "/bigos_contact_box"
  root :to=>"test#index"

end
