module BigosContactBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosContactBox initializer."
      def copy_initializer
        template "bigos_contact_box.rb", "config/initializers/bigos_contact_box.rb"
      end

      def include_js
        insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require +['"]?jquery_ujs['"]?} do
		      "\n//= require 'bigos_contact_box/bigos_contact_box'"
		    end
      end

      def include_routes
        route 'mount BigosContactBox::Engine => "/bigos_contact_box"'
      end

      def create_settings
        Setting["#{BigosContactBox.name}.use_widget_mailer_settings"] = false
        Setting["#{BigosContactBox.name}.address_name"] = "smtp.gmail.com"
        Setting["#{BigosContactBox.name}.port"] = 587
        Setting["#{BigosContactBox.name}.domain"] = "yourdomain.dev"
        Setting["#{BigosContactBox.name}.user_name"] = "from@yourdomain.dev"
        Setting["#{BigosContactBox.name}.password"] = "Super-Secure-Password"
        Setting["#{BigosContactBox.name}.invalid_fields_error"] = "Invalid Fields"
        Setting["#{BigosContactBox.name}.success_message"] = "Message sent successfully"
        Setting["#{BigosContactBox.name}.redirect_path"] = ""
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosContactBox.name)
        im.page_element =  BigosApp::BigosContactBoxElement.name
        im.save
      end

    end
  end
end
