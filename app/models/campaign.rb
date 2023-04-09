require "csv"

class Campaign < ApplicationRecord
  belongs_to :user
  has_one_attached :import_file
  validate :file_mime_type

  enum status: { active: 0, hold: 1, stop: 2 }

  private

  def file_mime_type
    if import_file.attached? && !import_file.content_type.in?(%w(application/vnd.oasis.opendocument.spreadsheet text/csv application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet text/tab-separated-values))
      errors.add(:document, 'Must be a .xlx, .xlsx, .csv or .tsv file')
    end
  end
end
