class ExceptionsController < ApplicationController
  def index
    ExceptionService.new.call
  end
end
