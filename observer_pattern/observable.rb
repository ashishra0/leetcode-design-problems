module Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers(event)
    @observers.each { |ob| ob.update(event) }
  end
end
