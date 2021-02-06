# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def evernote
      if update_user
        flash.notice = success_message
        sign_in_and_redirect user
      else
        flash.alert = failure_message(user)
        redirect_to new_user_session_url
      end
    end

    private

    def update_user
      user.update!(provider: auth.provider,
                   uid: auth.uid,
                   evernote_token: auth.credentials.token)
    end

    def user
      current_user
    end

    def auth
      request.env['omniauth.auth']
    end

    def success_message
      t('devise.omniauth_callbacks.success',
        kind: 'evernote',
        reason: 'you are not enabled')
    end

    def failure_message(user)
      t('devise.omniauth_callbacks.failure',
        kind: 'evernote',
        reason: user.errors.messages.to_s)
    end
  end
end
