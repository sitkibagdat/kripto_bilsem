class SecretsController < ApplicationController
  before_filter :set_document, only: [:examine, :reveal]

  def examine
  end

  def reveal
    if params[:secret_key] != @document.encryption_broker_key
      redirect_to root_path, notice: "Girmiş olduğunuz anahtar değeri geçersizdir."
    end
  end

  private
  def set_document
    @document = Document.find_by(url: params[:url_id])
  end
end
