class ActiveRecord::LogSubscriber
  def odd?
    @odd = !@odd
  end
end
