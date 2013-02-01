module BigosApp
  class BigosContactBoxElement < PageElement

    def self.class_name
      "Contact module"
    end

    def render
      "bigos_contact_box/item"
    end

    def admin_render
      nil
    end

  end
end
