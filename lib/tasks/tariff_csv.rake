namespace :db
	task :load_tariffs => :environment do
		File.open("#{Rails.root}/public/out.csv", 'w+') do |out_f|
		  File.open("#{Rails.root}/public/in.csv") do |in_f|
		    in_f.each_line.with_index do |line, i|
		      out_f.write line unless i == 0 || i == 2 || i == 3
		    end
		  end
		end
		CSV.foreach("#{Rails.root}/public/out.csv", headers: true) do |row|
			@cities=row.to_a
			@cities.each { |cities|
				if !cities[0].nil? && cities[0]!="Пункт отправления (региональный тариф)"
					CityRelation.create!(city_from_id: City.find_by_name(@cities[0][1]).id,
															 city_to_id: City.find_by_name(cities[0]).id)
					ZoneDeliveryRelation.create!(zone_id:
													Zone.where(["name = ? and provider = ?",cities[1], "major_express"]).first.id,
													delivery_city_relation_id: CityRelation.where(
													["city_from_id = ? and city_to_id = ?",
													City.find_by_name(@cities[0][1]).id,
													City.find_by_name(cities[0]).id]
													).first.id)
					if cities[0]=="Белгород" or @cities[0][1]=="Белгород" then
						if cities[0]=="Белгород" and @cities[0][1]=="Белгород" then
							ZoneDeliveryRelation.create!(zone_id:
													Zone.where(["name = ? and provider = ?","belgorod", "bcs"]).first.id,
													delivery_city_relation_id: CityRelation.where(
													["city_from_id = ? and city_to_id = ?",
													City.find_by_name(@cities[0][1]).id,
													City.find_by_name(cities[0]).id]
													).first.id)
						else
						ZoneDeliveryRelation.create!(zone_id:
													Zone.where(["name = ? and provider = ?",cities[1], "bcs"]).first.id,
													delivery_city_relation_id: CityRelation.where(
													["city_from_id = ? and city_to_id = ?",
													City.find_by_name(@cities[0][1]).id,
													City.find_by_name(cities[0]).id]
													).first.id)
						end
					end
					@city_tmp=[]
					@city_tmp[0]=cities[0]
					@city_tmp[1]=cities[1]
				else 
					if cities[0].nil?
						@time_tmp = CityRelation.where(["city_from_id = ? and city_to_id = ?",
														City.find_by_name(@cities[0][1]).id,
														City.find_by_name(@city_tmp[0]).id]
														)
						@time_tmp.update_all(delivery_time: cities[1])
					end
				end
			}
		end
	end
end