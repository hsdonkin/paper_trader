class ApiError < StandardError
  def initalize(msg="Bad Response from API", exception_type="API_Response")
    @exception_type = exception_type
    super(msg)
  end
end
