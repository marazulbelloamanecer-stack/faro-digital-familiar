Rails.application.routes.draw do
  root "pages#home"

  # === AUTENTICACIÓN ===
  get "/signup", to: "parents#new"
  post "/signup", to: "parents#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # === PANEL DE PADRES ===
  get "/panel", to: "parents#panel"
  get "/panel/children/new", to: "children#new", as: :new_child
  post "/panel/children", to: "children#create", as: :children

  # === ZONA DE NIÑOS ===
  get "/zona_ninos", to: "children#zone", as: :zone
  get "/zona_ninos/jugar/:id", to: "children#play", as: :play_child
  get "/zona_ninos/juego_memoria", to: "games#memory", as: :memory_game

  # === CUENTOS ===
  get "/cuentos/:id", to: "children#cuento", as: :cuento

  # === CHATBOT ===
get "/chatbot", to: "chatbot#ask", as: :chatbot
post "/chatbot", to: "chatbot#answer", as: :answer_chatbot
end