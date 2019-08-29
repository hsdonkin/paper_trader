class NoStockError < StandardError
  def initalize(msg="No Stock Exists", exception_type="NoStock")
    @exception_type = exception_type
    super(msg)
  end
end
