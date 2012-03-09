class UserMailer < ActionMailer::Base
  default :from => "rihannalove2002@yahoo.com"
 
  def welcome_email(reservation)
    @reservation = reservation
    @url  = "http://example.com/login"
    mail(:to => reservation.email, :subject => "Reservation Confirmed")
  end
end
