module CurrentUserConcern
	extend ActiveSupport::Concern
	def current_user
		super || guest_user
	end

	def guest_user
		OpenStruct.new(name:"Convidado Convidado",
					   first_name:"Convidado", 
					   last_name:"Convidado",
					   email:"guest@example.com"
					   )
	end
end