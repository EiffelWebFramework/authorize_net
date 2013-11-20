note
	description: "Summary description for {ORDER_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-10 14:17:31 -0300 (lun 10 de jun de 2013) $"
	revision: "$Revision: 29 $"

class
	ORDER_FIXTURE_FACTORY

feature -- Factories

	default_order: AN_ORDER
		do
			create Result
		end

	order_1 : AN_ORDER
		local
			l_ran : RANDOM
		do
			create l_ran.make
			l_ran.forth
			Result := default_order
			Result.set_description ("Widgets")
			Result.set_invoice_number (l_ran.item.out)
		end

end
