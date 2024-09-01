json.array! contents do |content|
  purchase = @current_user.purchases.find_by(content_type: content.class.name, content_id: content.id)
  json.partial! 'contents/content', locals: { content: content, purchase: purchase }
end
