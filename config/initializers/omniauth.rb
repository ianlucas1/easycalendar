OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '6889202643-emivcl25lr5805gdeq7rn86pno6241em.apps.googleusercontent.com.apps.googleusercontent.com', '_Wo3HCp88ZjUdsRiimGJwNLs', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end