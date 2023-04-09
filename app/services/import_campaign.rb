class ImportCampaign
  require "csv"
  TABLE_ATTRS = ["FirstName", "LastName", "PhoneNumber", "EmailAddress", "Notes"]

  def initialize(file)
    @file  = file
  end

  def import
    # for create records in database
  end

  def is_valid_file?
    csv_text = CSV.read(@file.path)
    headers = csv_text[0]
    count = 
    result = true
    TABLE_ATTRS.each do |value|
      result = false unless headers.include?(value&.strip)
    end

    result
  end

  def get_record_count
    count = CSV.read(@file.path).count

    count -= 1 if count > 0

    count
  end
end