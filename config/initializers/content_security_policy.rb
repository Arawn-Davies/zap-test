# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self
    policy.font_src    :self
    policy.img_src     :self, :data
    policy.object_src  :none
    # Allow inline styles (required for the Turbo progress bar)
    policy.style_src   :self, :unsafe_inline
    # Inline scripts (importmap, Turbo bootstrap) are covered by nonces below
    policy.script_src  :self
    policy.base_uri    :self
    policy.form_action :self
    policy.frame_ancestors :self
  end

  # Generate a cryptographically random nonce per request for inline scripts (importmap tags, Turbo).
  config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }
  config.content_security_policy_nonce_directives = %w[script-src]

  # Automatically add `nonce` to script tags emitted by Rails helpers.
  config.content_security_policy_nonce_auto = true
end
