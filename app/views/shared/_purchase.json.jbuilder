json.purchase_id purchase.id
json.video_quality purchase.video_quality
json.expiration_time purchase.expiration_time
json.content_type purchase.content_type
json.content_id purchase.content_id

json.partial! 'contents/content', locals: { purchase: purchase, content: purchase.content }
