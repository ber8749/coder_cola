module LineItemsHelper
  def line_items_quantity_total
    LineItem.all.sum(:quantity)
  end
end
