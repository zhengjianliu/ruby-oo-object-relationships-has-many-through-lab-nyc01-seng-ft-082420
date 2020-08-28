class Patient
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def doctors
        Doctor.all.find{ |doctor|
            doctor.name 
        }
    end

    def appointments
        Appointment.all.filter{|app| app if app.patient == self}
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def doctors
        self.appointments.map{ |app| app.doctor}
    end
    
end