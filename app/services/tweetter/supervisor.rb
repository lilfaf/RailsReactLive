class Tweetter::Supervisor

  def initialize(user)
    @supervisor = Tweetter::Worker.supervise user
  end

  def current
    @supervisor.actors.first
  end

  def run
    current.run
  end

  def terminate
    current.terminate if current.try(:alive?)
  end
end
