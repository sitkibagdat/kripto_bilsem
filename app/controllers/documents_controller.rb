class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :destroy, :publish, :unpublish]

  def new
    @document = Document.new
  end

  def edit
  end

  def publish
    @document.toggle!(:published)
    redirect_to dashboard_index_url, notice: 'Veri yayınlanmaya başladı.'
  end

  def unpublish
    @document.toggle!(:published)
    redirect_to dashboard_index_url, notice: 'Veri yayından kaldırıldı.'
  end


  def create
    @document = current_user.documents.build(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to dashboard_index_url, notice: 'Girdiğiniz veri başarıyla şifrelendi.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Veri başarıyla güncellendi.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_url, notice: 'Veri başarıyla silindi.' }
    end
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:title, :data).
        merge({
          url: create_custom_key,
          encryption_broker_key: create_custom_key,
          algorithms: OpenSSL::Cipher.ciphers.sample(3)})
    end

    def create_custom_key
      SecureRandom.urlsafe_base64
    end
end
