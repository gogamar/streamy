json.user_id @user.id
json.user_email @user.email

json.active_purchases do
  json.array! @active_purchases, partial: 'purchases/purchase', as: :purchase
end
