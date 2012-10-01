class TrackableDecorator < Draper::Base
  decorates :trackable

  def unit_plural
    trackable.unit.pluralize
  end
end
