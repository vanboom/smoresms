module SmoreSMS

  class SMS
    include ActiveModel::Model
    include ActiveModel::Callbacks
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    define_model_callbacks :initialize

    attr_accessor :number, :carrier

    validates :number, :presence=>true
    validates :carrier, :presence=>true
    validates :number, :phone_number=>{:ten_digits=>true, :allow_blank=>false, :allow_nil=>false}
    validate :carrier_valid?
    before_initialize :setup
    after_initialize :load_carriers

    def initialize(attributes={})
      run_callbacks :initialize do
        super(attributes)
      end
    end

    def setup
      @@logger = Logger.new(STDOUT)
    end

    def load_carriers
      begin
        @@carriers ||= YAML::load(File.open(File.join(GEM_ROOT,"config", "carriers.yml")))
      rescue => e
        @@logger.error e.message
      end
    end

    def carriers
      @@carriers
    end

    def carrier_name
      @@carriers[self.carrier]['name']
    end

    def recipient
      [self.number, self.carrier_email].join("@")
    end

    def carrier_valid?
      unless self.carriers.has_key?(self.carrier)
        errors.add(:carrier, "is not supported" % self.carrier)
      end
    end

    def format_number(number)
      stripped = number.gsub("-","").strip
      stripped = stripped.gsub(" ", "").strip
      formatted = (stripped.length == 11 && stripped[0,1] == "1") ? stripped[1..stripped.length] : stripped
      raise SmoreSMSException.new("Number (#{number}) is not formatted correctly") unless valid_number?(formatted)
      formatted
    end

    protected
    def carrier_email
      @@carriers[self.carrier]['host']
    end
  end
end

class SmoreSMSException < StandardError; end
