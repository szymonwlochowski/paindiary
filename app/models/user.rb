class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :posts

  before_create :first_theme

  after_create :send_mail

  def first_theme
    self.layout_name = 'custom'
  end

  def forem_name
    email
  end

  def send_mail
    UserMailer.welcome_email(self).deliver
  end

  def is_admin?
    self.forem_admin?
  end


end
