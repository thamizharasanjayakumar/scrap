desc "Task description"
task :doctor => :environment do
	mechanize = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
	$i = 827
	while $i < 969  do		
			d = "https://www.practo.com/chennai?page="
			e = $i.to_s
			$f = d+e
			page = mechanize.get($f)
			page.search('.listing-row').each do |doctor|
				begin
				name = doctor.search('h2').text.strip
				puts name
				qua = doctor.search('.doc-qualifications').text.strip

				exp = doctor.search('.doc-exp-years').text.strip
				exp_int = exp.to_i

				rec = doctor.search('.recommend').text.strip
				rec_int = rec.to_i

				page_addr = doctor.search('.doc-photo-container')
				$s = page_addr.children[1].attributes['href'].to_s
				addr= mechanize.get($s)
				center_name = addr.search('.clinic-address h2').text.strip
				address = addr.search('.clinic-street-address').text.strip

				docter_detail = Test.create(:name => name, :qua => qua, :exp => exp_int, :rec => rec_int, :center_name => center_name, :address => address)
					doctor.search('.doc-specialties a').each do |speciality|
						test_id = docter_detail.id
						spec = speciality.text.strip
						puts spec
						Speciality.create(:test_id => test_id, :spec => spec)
					end
				rescue
					puts "The data is skiped"
					next
				end	

			puts ">> >> >> >>"
			puts ""
		end
		$a = "page "
		$b = $i.to_s
		$c = " is Completed :) :)"
		puts ""
		puts "*****************************"
		puts $a+$b+$c
		puts "*****************************"
		puts ""
		$i +=1

		sleep 20
	end
end