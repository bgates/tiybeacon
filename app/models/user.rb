class User < ActiveRecord::Base
  #include NoBrainer::Document
  #include NoBrainer::Document::Timestamps
  has_many :attendances

  after_create :save_avatar

private

  def save_avatar
    gh = Github.new(basic_auth: ENV['gh'])
    self.avatar_url = gh.users.get(user: github).avatar_url
    save
  end
  #field :name, :type => String
  #field :github, :type => String
end
