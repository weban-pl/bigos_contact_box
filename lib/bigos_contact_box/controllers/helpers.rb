module BigosContactBox
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      def bigos_contact_box_widget ()

        if Setting.use_widget_mailer_settings
          ActionMailer::Base.delivery_method = :smtp
          ActionMailer::Base.raise_delivery_errors = true
          ActionMailer::Base.perform_deliveries = true
          ActionMailer::Base.default :charset => "utf-8"
          ActionMailer::Base.default_url_options = { :host => Setting["#{BigosContactBox.name}.domain"] }

          ActionMailer::Base.smtp_settings = {
            :address              => Setting["#{BigosContactBox.name}.address_name"].to_s,
            :port                 => Setting["#{BigosContactBox.name}.port"].to_i,
            :user_name            => Setting["#{BigosContactBox.name}.user_name"].to_s,
            :password             => Setting["#{BigosContactBox.name}.password"].to_s,
            :authentication       => "plain",
            :enable_starttls_auto => true,
            :domain               => Setting["#{BigosContactBox.name}.domain"].to_s
          }
        end
        @message = BigosContactBox::Message.new
        render :partial=>"bigos_contact_box/module/widget", :locals=>{:message => @message}
      end
    end
  end
end
