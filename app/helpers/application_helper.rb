# frozen_string_literal: true

module ApplicationHelper
  include AuthManagment

  def let(value)
    yield value
  end

  def nav_menu_item(name, path = '#', options = {})
    assembled_options = options.merge(class: "nav-link #{active?(path)}")
    tag.li class: 'nav-item' do
      link_to path, assembled_options do
        tag.div(name)
      end
    end
  end

  def active?(path, options = {})
    # raise options.inspect
    if options.key? :active_if
      'active' if options[:active_if]
    elsif current_page?(path)
      'active'
    end
  end

  def get_url_for_locale(locale)
    config_key = "app_url_#{locale}"
    Rails.configuration.hexlet_basics[config_key]
  end
end
