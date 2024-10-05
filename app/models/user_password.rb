class UserPassword < ApplicationRecord
  # View can only view the password
  # Editor can update the password
  # Owner can view, edit and destroy the password
  VIEWER_ROLE = "viewer"
  EDITOR_ROLE = "editor"
  OWNER_ROLE = "owner"
  ROLES = [ VIEWER_ROLE, EDITOR_ROLE, OWNER_ROLE ]

  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclusion: { in: ROLES }
  attribute :role, default: VIEWER_ROLE

  def editable?
    owner? || editor?
  end

  def shareable?
    owner?
  end

  def deletable?
    owner?
  end

  private

  def viewer?
    role == VIEWER_ROLE
  end

  def editor?
    role == EDITOR_ROLE
  end

  def owner?
    role == OWNER_ROLE
  end
end
