class SecretsController < ApplicationController
  before_filter :set_document, only: [:examine]

  def examine
    
  end

  private
  def set_document
    @document = Document.find_by(url: params[:url_id])
  end

  # def document_params
  #   params.require(:document).permit(:title, :data).
  # end
end
