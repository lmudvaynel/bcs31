class InvoicesController < ApplicationController
  def search
    number = params[:invoice] ? params[:invoice][:number].to_i : 0
    @invoice = Invoice.find_by_number(number) || Invoice.new
    render :index
  end
end
