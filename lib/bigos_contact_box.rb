require "bigos_contact_box/engine"
require "bigos_settings"

module BigosContactBox

  module Controllers
    autoload :Helpers, 'bigos_contact_box/controllers/helpers'
  end

  def self.setup
    include_helpers
    yield self
  end

  # Include helpers to AC and AV.
  def self.include_helpers
    ActiveSupport.on_load(:action_controller) do
    end

    ActiveSupport.on_load(:action_view) do
      include BigosContactBox::Controllers::Helpers
    end
  end

end


