class ReportsController < ApplicationController

  def order
    @q = Sale.report_data.ransack(params[:q])
    @sales = @q.result.page(params[:page])
    @params = params
  end

  def pdforder
    @sales =Sale.report_data

    html = render_to_string(action: 'pdforder', layout: false)
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf, :type => 'application/pdf', :disposition => "filename=sales.pdf")

  end


  def waiter
    @q = Waiter.get_report_data.ransack(params[:q])
    @waiters = @q.result.page(params[:page])
    @params = params
  end

  def pdfwaiter

    @waiters =Waiter.get_report_data

    html = render_to_string(action: 'pdfwaiters', layout: false)
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf, :type => 'application/pdf', :disposition => "filename=waiters.pdf")
  end



  def dish
    @q = LineItem.select("line_items.dish_id, sum(line_items.total_price) as total_sale, sum(quantity) as total_quantity").joins(:dish).group('line_items.dish_id').ransack(params[:q])

    @line_items = @q.result.page(params[:page])
    @params = params

  end

  def pdfdish

    @line_items = LineItem.select("line_items.dish_id, sum(line_items.total_price) as total_sale, sum(quantity) as total_quantity").joins(:dish).group('line_items.dish_id')

    html = render_to_string(action: 'pdish', layout: false)
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf, :type => 'application/pdf', :disposition => "filename=dish.pdf")
  end
end