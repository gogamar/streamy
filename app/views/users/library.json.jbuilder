json.user_id @current_user.id
json.user_email @current_user.email

json.active_purchases do
  json.array! @active_purchases, partial: 'shared/purchase', as: :purchase
end
