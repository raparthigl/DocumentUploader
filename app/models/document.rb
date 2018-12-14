class Document < ApplicationRecord
  belongs_to :project
  mount_uploader :attachment, AttachmentUploader
end
