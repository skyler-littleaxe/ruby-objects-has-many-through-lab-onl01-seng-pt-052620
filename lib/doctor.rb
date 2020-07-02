class Doctor
  attr_reader 
  attr_accessor :patient, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def patients
    appointments.collect do |appointment|
      appointment.patient
    end
  end

  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self }
  end
  
  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end
  
  def self.all
    @@all
  end
end