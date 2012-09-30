json.array!(@sleeps) do |sleep|
  json.extract! sleep, :slept_at, :seconds_asleep
end
