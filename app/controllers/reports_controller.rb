class ReportsController < ApplicationController

  def order
    render text: "woow'"
    return
  end

  def payment

  end

  def waiter

  end

  def dish
    @q = LineItem.select("line_items.dish_id, sum(line_items.total_price) as total_sale").joins(:dish).group('line_items.dish_id').ransack(params[:q])

    @line_items = @q.result.page(params[:page])
    @params = params

  end

  def pdfdish

    @q = LineItem.select("line_items.dish_id, sum(line_items.total_price) as total_sale").joins(:dish).group('line_items.dish_id').ransack(params[:q])

    @line_items = @q.result.page(params[:page])
    @params = params

    html = render_to_string(action: 'pdish', layout: false)
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf, :type => 'application/pdf', :disposition => "filename=dish.pdf")
  end
end