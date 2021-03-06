class User < ActiveRecord::Base
  has_secure_password
  acts_as_follower
  acts_as_followable

  has_many :invitations
  has_many :invited_events, through: :invitations, source: :event
  has_many :created_events, class_name: "Event", foreign_key: :user_id

  def attending_events
    self.invitations.where(status: "in").map { |invite| Event.find(invite.event_id) }
  end
end
