class Patient
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(name, doctor)
    Appointment.new(name, self, doctor)
  end

  def appointments # setter
    Appointment.all.select {|appointment| appointment.patient == self }
  end

  def doctors # getter
    appointments.collect do |appointment|
      appointment.doctor
    end
  end

  def self.all
    @@all 
  end
end 