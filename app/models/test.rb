class Test < ActiveRecord::Base
	has_many :specialities, dependent: :destroy

	def self.to_csv(options = {})
    	CSV.generate(options) do |csv|
    		csv << column_names
    			all.each do |doctor|
      			csv << doctor.attributes.values_at(*column_names)
      			csv << doctor.specialities.values_at(*column_names)
    		end
  		end
	end
end
