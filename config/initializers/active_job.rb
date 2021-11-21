# Config before ActionMailer::Railtie.action_mailer.set_configs
#   config.action_mailer.delivery_job = ActionMailer::MailDeliveryJob

Rails.application.config.active_job.queue_adapter = :sidekiq
# Rails.application.config.active_job.queue_name_prefix = "workspace_production"
