module SalesHelper
  def active_sale?
    Sale.active
  end

  def sale
    Sale.type[0] 
  end
end
