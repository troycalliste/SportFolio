class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  scope :online, -> { where("updated_at > ?", 10.minutes.ago) }
  has_many :trades
  accepts_nested_attributes_for :trades
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "30x30!"}, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.provider = auth.provider
    user.uid = auth.uid
    user.password = Devise.friendly_token[0,20]
    user.token = auth.credentials.token
    user.expires = auth.credentials.expires
    user.expires_at = auth.credentials.expires_at
    user.refresh_token = auth.credentials.refresh_token




   end
  end


  def totalprof
    self.longprofit = self.trades.where(tradetype: "Long").sum(:currentprice) - self.trades.where(tradetype: "Long").sum(:stockprice)
    self.shortprofit = self.trades.where(tradetype: "Short").sum(:stockprice) - self.trades.where(tradetype: "Short").sum(:currentprice)
    self.commprofit = self.trades.where.not(commodity_id: nil).sum(:currentprice) - self.trades.where.not(commodity_id: nil).sum(:stockprice)
     self.totalprofit =   self.longprofit + self.shortprofit + self.commprofit



     self.save
  end




end
