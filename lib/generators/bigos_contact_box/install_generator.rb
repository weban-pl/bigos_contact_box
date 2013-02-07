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
        Setting["GS.use_widget_mailer_settings"] = false if Setting.find_by_var("GS.use_widget_mailer_settings").blank?
        Setting["GS.mailer_port"] = 587 if Setting.find_by_var("GS.mailer_port").blank?
        Setting["GS.mailer_domain"] = "yourdomain.dev" if Setting.find_by_var("GS.mailer_domain").blank?
        Setting["GS.mailer_address_name"] = "smtp.gmail.com" if Setting.find_by_var("GS.mailer_address_name").blank?
        Setting["GS.mailer_user_name"] = "from@yourdomain.dev" if Setting.find_by_var("GS.mailer_user_name").blank?
        Setting["GS.mailer_password"] = "Super-Secure-Password" if Setting.find_by_var("GS.mailer_password").blank?
        Setting["#{BigosContactBox.name}.recipient"] = "Your email address" if Setting.find_by_var("#{BigosContactBox.name}.recipient").blank?
        Setting["#{BigosContactBox.name}.invalid_fields_error"] = "Invalid Fields" if Setting.find_by_var("#{BigosContactBox.name}.invalid_fields_error").blank?
        Setting["#{BigosContactBox.name}.success_message"] = "Message sent successfully" if Setting.find_by_var("#{BigosContactBox.name}.success_message").blank?
        Setting["#{BigosContactBox.name}.redirect_path"] = "#{BigosContactBox.name}.redirect_path" if Setting.find_by_var("").blank?
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosContactBox.name)
        im.page_element =  BigosApp::BigosContactBoxElement.name
        im.save
      end

    end
  end
end
