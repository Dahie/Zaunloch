class ApplicationController < ActionController::Base
  def evernote_service
    @evernote_service ||= EvernoteService.new(current_user.evernote_token)
  end
end
