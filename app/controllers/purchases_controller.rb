class PurchasesController < ApplicationController
  def create
    content = ContentFinder.find(params[:content_id], params[:content_type])
    purchase_option = content.purchase_options.find_by(id: params[:purchase_option_id])

    if content && purchase_option
      if @current_user.active_purchase?(content)
        render_content_in_library_error
      else
        create_purchase(@current_user, content, purchase_option)
      end
    else
      render json: { errors: 'Content or purchase option not found' }, status: :not_found
    end
  end

  private

  def render_content_in_library_error
    render json: {
      error: 'Content in Library',
      message: 'You have already purchased this content.',
      details: {
        content_type: params[:content_type],
        content_id: params[:content_id]
      }
    }, status: :unprocessable_entity
  end

  def create_purchase(user, content, purchase_option)
    @purchase = user.purchases.create(
      purchase_option: purchase_option,
      content: content,
      price: purchase_option.price,
      video_quality: purchase_option.video_quality,
      expiration_time: 2.days.from_now
    )

    if @purchase.persisted?
      render json: { message: 'Purchase created successfully' }, status: :created
    else
      render json: { errors: @purchase.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def purchase_params
    params.require(:purchase).permit(:price, :video_quality, :expiration_time, :user_id, :purchase_option_id, :content_type, :content_id)
  end
end
