class DoctorController < ApplicationController
  def index

  	@doctor = Test.all
  	respond_to do |format|
	    format.html
	    format.csv { send_data @doctor.to_csv }
	    format.xls { render :xls => "<doctor>"}
  	end
  end
end
