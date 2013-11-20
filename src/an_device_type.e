note
	description: "Obejct that represent a Device Type, is used for Card Present transactions. Not supported for now"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=Card Present", "protocol=url", "src=http://developer.authorize.net/api/cardpresent/"

--When merchants and shoppers are in the same physical location, merchants need a Card Present (CP) payment solution.

--Merchants can leverage the speed of the Internet to authorize credit card transactions in as little as three seconds.
--Using Authorize.Net with an Internet Protocol (IP) enabled point-of-sale (POS) system gives you a far more efficient and reliable solution than dial-up systems.

--IP-based POS systems offer several advantages:

--Faster Checkout Times - Improve customer satisfaction by speeding up checkout lines.
--Reduce Costs - Eliminate multiple dedicated telephone lines to reduce telecom expenses, while consolidating service costs for broadband.
--Increased Productivity - Simplify the integration of payment information into your enterprise applications.

class
	AN_DEVICE_TYPE

create
	make

feature {NONE} -- Initialize

	make
			-- Create an object device type by default as device type is website
		do
			mark_website
		end

feature -- Device Type

	device_type: INTEGER_32
			-- device type (unknown, unattended, self_service_terminal, ..)



feature -- Set Device Type

	set_decice_type (a_device_type: like device_type)
			-- Set device_type with `a_device_type'.
		require
			valid_device_type: is_valid_device (a_device_type)
		do
			device_type := a_device_type
		ensure
			device_type_set: device_type = a_device_type
		end

	mark_unknown
		do
			set_decice_type (Unknown)
		end

	mark_unattended
		do
			set_decice_type (Unattended)
		end

	mark_self_service_terminal
		do
			set_decice_type (Self_service_terminal)
		end

	mark_electronic_cash_register
		do
			set_decice_type (Electronic_cash_register)
		end

	mark_personal_computer_based_terminal
		do
			set_decice_type (Personal_computer_based_terminal)
		end

	mark_airpay
		do
			set_decice_type (Airpay)
		end

	mark_wireless_pos
		do
			set_decice_type (Wireless_pos)
		end

	mark_website
		do
			set_decice_type (Website)
		end

	mark_dial_terminal
		do
			set_decice_type (Dial_terminal)
		end

	mark_virtual_terminal
		do
			set_decice_type (Virtual_terminal)
		end

feature -- Status Report

	is_valid_device (s: INTEGER_32): BOOLEAN
			-- Is `s' a valid device type?
		do
			inspect s
			when Unknown, Unattended, Self_service_terminal, Electronic_cash_register, Personal_computer_based_terminal, Airpay, Wireless_pos, Website, Dial_terminal, Virtual_terminal then
				Result := True
			else
			end
		end

	is_unknown	: BOOLEAN
		do
			Result:= device_type = Unknown
		end

	is_unattended : BOOLEAN
		do
			Result:= device_type = Unattended
		end

	is_self_service_terminal : BOOLEAN
		do
			Result := device_type = Self_service_terminal
		end

	is_electronic_cash_register	: BOOLEAN
		do
			Result := device_type = Electronic_cash_register
		end

	is_personal_computer_based_terminal	:  BOOLEAN
		do
			Result := device_type = Personal_computer_based_terminal
		end

	is_airpay : BOOLEAN
		do
			Result := device_type = Airpay
		end

	is_wireless_pos : BOOLEAN
		do
			Result := device_type = Wireless_pos
		end

	is_website	: BOOLEAN
		do
			Result := device_type = Website
		end

	is_dial_terminal : BOOLEAN
		do
			Result := device_type = Dial_terminal
		end

	is_virtual_terminal	: BOOLEAN
		do
			Result := device_type = Virtual_terminal
		end
feature -- Constants

	Unknown: INTEGER = 1

	Unattended: INTEGER = 2

	Self_service_terminal: INTEGER = 3

	Electronic_cash_register: INTEGER = 4

	Personal_computer_based_terminal: INTEGER = 5

	Airpay: INTEGER = 6

	Wireless_pos: INTEGER = 7

	Website: INTEGER = 8

	Dial_terminal: INTEGER = 9

	Virtual_terminal: INTEGER = 10

invariant
	device_type_set: is_valid_device (device_type)
end
