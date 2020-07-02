class Doctor
  attr_reader :name
  attr_accessor :patient

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
end