# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `omniauth-rails_csrf_protection` gem.
# Please instead update this file by running `bin/tapioca gem omniauth-rails_csrf_protection`.


# source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/version.rb#1
module OmniAuth
  class << self
    # source://omniauth/2.1.2/lib/omniauth.rb#134
    def config; end

    # source://omniauth/2.1.2/lib/omniauth.rb#138
    def configure; end

    # source://omniauth/2.1.2/lib/omniauth.rb#142
    def logger; end

    # source://omniauth/2.1.2/lib/omniauth.rb#146
    def mock_auth_for(provider); end

    # source://omniauth/2.1.2/lib/omniauth.rb#24
    def strategies; end
  end
end

# source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/version.rb#2
module OmniAuth::RailsCsrfProtection; end

# source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/railtie.rb#6
class OmniAuth::RailsCsrfProtection::Railtie < ::Rails::Railtie; end

# Provides a callable method that verifies Cross-Site Request Forgery
# protection token. This class includes
# `ActionController::RequestForgeryProtection` directly and utilizes
# `verified_request?` method to match the way Rails performs token
# verification in Rails controllers.
#
# If you like to learn more about how Rails generate and verify
# authenticity token, you can find the source code at
# https://github.com/rails/rails/blob/v5.2.2/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L217-L240.
#
# source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#15
class OmniAuth::RailsCsrfProtection::TokenVerifier
  include ::ActiveSupport::Configurable
  include ::ActiveSupport::Deprecation::DeprecatedConstantAccessor
  include ::AbstractController::Helpers
  include ::ActiveSupport::Callbacks
  include ::AbstractController::Callbacks
  include ::ActionController::RequestForgeryProtection
  extend ::ActiveSupport::Configurable::ClassMethods
  extend ::AbstractController::Helpers::Resolution
  extend ::AbstractController::Helpers::ClassMethods
  extend ::ActiveSupport::Callbacks::ClassMethods
  extend ::ActiveSupport::DescendantsTracker
  extend ::AbstractController::Callbacks::ClassMethods
  extend ::ActionController::RequestForgeryProtection::ClassMethods

  # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
  def __callbacks; end

  # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
  def __callbacks?; end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#34
  def _call(env); end

  # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
  def _helper_methods; end

  # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
  def _helper_methods=(_arg0); end

  # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
  def _helper_methods?; end

  # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#963
  def _process_action_callbacks; end

  # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#951
  def _run_process_action_callbacks(&block); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def allow_forgery_protection; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def allow_forgery_protection=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#30
  def call(env); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def csrf_token_storage_strategy; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def csrf_token_storage_strategy=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def default_protect_from_forgery; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def default_protect_from_forgery=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def forgery_protection_origin_check; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def forgery_protection_origin_check=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def forgery_protection_strategy; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def forgery_protection_strategy=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def log_warning_on_csrf_failure; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def log_warning_on_csrf_failure=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#45
  def params(*_arg0, **_arg1, &_arg2); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def per_form_csrf_tokens; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def per_form_csrf_tokens=(value); end

  # source://actionpack/7.1.3.4/lib/abstract_controller/callbacks.rb#36
  def raise_on_missing_callback_actions; end

  # source://actionpack/7.1.3.4/lib/abstract_controller/callbacks.rb#36
  def raise_on_missing_callback_actions=(val); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#25
  def request_forgery_protection_token; end

  # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
  def request_forgery_protection_token=(value); end

  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#45
  def session(*_arg0, **_arg1, &_arg2); end

  private

  # Returns the value of attribute request.
  #
  # source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#44
  def request; end

  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end

    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks?; end

    # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
    def _helper_methods; end

    # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
    def _helper_methods=(value); end

    # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
    def _helper_methods?; end

    # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#16
    def _helpers; end

    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#955
    def _process_action_callbacks; end

    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#959
    def _process_action_callbacks=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def allow_forgery_protection; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def allow_forgery_protection=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def csrf_token_storage_strategy; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def csrf_token_storage_strategy=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def default_protect_from_forgery; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def default_protect_from_forgery=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def forgery_protection_origin_check; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def forgery_protection_origin_check=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def forgery_protection_strategy; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def forgery_protection_strategy=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def log_warning_on_csrf_failure; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def log_warning_on_csrf_failure=(value); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def per_form_csrf_tokens; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def per_form_csrf_tokens=(value); end

    # source://actionpack/7.1.3.4/lib/abstract_controller/callbacks.rb#36
    def raise_on_missing_callback_actions; end

    # source://actionpack/7.1.3.4/lib/abstract_controller/callbacks.rb#36
    def raise_on_missing_callback_actions=(val); end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#115
    def request_forgery_protection_token; end

    # source://activesupport/7.1.3.4/lib/active_support/configurable.rb#116
    def request_forgery_protection_token=(value); end
  end
end

# source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/token_verifier.rb#0
module OmniAuth::RailsCsrfProtection::TokenVerifier::HelperMethods
  # source://actionpack/7.1.3.4/lib/action_controller/metal/request_forgery_protection.rb#101
  def form_authenticity_token(*args, **_arg1, &block); end

  # source://actionpack/7.1.3.4/lib/action_controller/metal/request_forgery_protection.rb#102
  def protect_against_forgery?(*args, **_arg1, &block); end
end

# source://omniauth-rails_csrf_protection//lib/omniauth/rails_csrf_protection/version.rb#3
OmniAuth::RailsCsrfProtection::VERSION = T.let(T.unsafe(nil), String)
