namespace :import_data do
	require 'csv'

  desc "Import point types"
	task :load_point_types =>:environment do
  	CSV.foreach('lib/files/tipos_puntos.csv', headers:true) do |row|
			point_type = PointType.find_by_id(row["TIPOPUNT"])
      unless point_type
        point_type = PointType.new(id: row["TIPOPUNT"], name: row['DESCCPUN'].strip)
      else
        point_type.update_attributes(name: row['DESCCPUN'].strip)
      end
      point_type.save
  	end
	end

	desc "Import accounts with customers"
	task :load_accounts =>:environment do
  	CSV.foreach('lib/files/cuentas.csv', headers:true) do |row|
			cod_cuent = row["CODCUENT"]
			fec_alta = row["FECHALTA"].strip.empty? ? nil : (Date.parse(row["FECHALTA"].strip) rescue nil)
			fec_baja = row["FECHBAJA"].strip.empty? ? nil : (Date.parse(row["FECHBAJA"].strip) rescue nil)
			fec_acti = row["FECHACTI"].strip.empty? ? nil : (Date.parse(row["FECHACTI"].strip) rescue nil)
			account = Account.find_by(cod_cuent: cod_cuent)
      unless account
				email_username = row["DESCCCUE"].strip.downcase.split(" ").join("_")
				customer = Customer.find_by(email: "#{email_username}@example.com")
				unless customer
					customer = Customer.create(email: "#{email_username}@example.com", password: '123456')
					next unless customer.valid?
					customer.create_customer_detail(name: row["DESCCCUE"].strip.split(" ").map(&:capitalize).join(" "))
				end
        account = Account.new(
					customer_id: customer.id,
					cod_cuent: cod_cuent,
					fec_alta: fec_alta,
					fec_baja: fec_baja,
					fec_acti: fec_acti
				)
      else
        account.update_attributes(fec_alta: fec_alta, fec_baja: fec_baja, fec_acti: fec_acti)
      end
      account.save
  	end
	end

	desc "Import customer points"
	task :load_customer_points =>:environment do
  	CSV.foreach('lib/files/total_puntos.csv', headers:true) do |row|
			account = Account.find_by(cod_cuent: row["CODCUENT"])
			next unless account
      account.points.create(point_type_id: row["TIPOPUNT"].to_i, cant_punt: row["CANTPUNT"].to_i, cod_progr: row["CODPROGR"])
  	end
	end
end
