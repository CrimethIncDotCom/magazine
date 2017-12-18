class ToChangeEverythingController < ApplicationController
  layout 'to_change_everything', only: [:show]

  TO_CHANGE_ANYTHING_YAMLS = ["english", "espanol"].freeze

  def show
    @locale = params[:lang]

    if TO_CHANGE_ANYTHING_YAMLS.include?(@locale)
      I18n.locale = @locale
      render "to_change_everything/show"
    else
      I18n.locale = @locale = I18n.default_locale
      redirect_to "/tce"
    end
  end
end
