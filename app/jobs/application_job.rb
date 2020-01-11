require 'sendgrid-ruby'
include SendGrid

class ApplicationJob < ActiveJob::Base
  queue_as :default

  def perform(emails)
    emails.each do |email|
      member = Member.where(email: email).take
      if member.nil?
        puts "Skipping. email does not exist " + email
      else
        from = Email.new(email: 'test2@alephz.com')
        to = Email.new(email: member.email)
        subject = 'Email from Mobilize!'
        content = Content.new(type: 'text/plain', value: 'Hi ' + member.name + ', welcome to mobilize!')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: "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")
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
      end

      sleep(4)
    end
  end
end
