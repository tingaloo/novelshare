class BookPresenter < SimpleDelegator
  def css_classes
    classes = []

    if available?
      classes << 'available'
    else
      classes << 'unavailable'
    end

    if just_added?
      classes << 'just_added'
    else
      classes << 'used'
    end

    classes.join(' ')
  end

  def just_added? #TODO: improve
    created_at + 4.days > Time.zone.now
  end
end
