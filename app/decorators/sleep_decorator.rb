class SleepDecorator < Draper::Base
  decorates :sleep

  def time_asleep
    Time.diff(sleep.slept_at, sleep.woke_at, '%H and %N')[:diff]
  end

  def seconds_asleep
    sleep.woke_at - sleep.slept_at
  end
end
