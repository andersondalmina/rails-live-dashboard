class ExceptionService
  def call
    raise StandardError, 'Test exception'
  end
end
