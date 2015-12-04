class Attendance < ActiveRecord::Base
  #include NoBrainer::Document
  #include NoBrainer::Document::Timestamps

  belongs_to :user
  delegate :name, to: :user
end
