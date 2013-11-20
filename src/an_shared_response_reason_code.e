note
	description: "Response code, a factory for each possible reponse code"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=49"

class
	AN_SHARED_RESPONSE_REASON_CODE

feature -- Access

	Rrc_1_1: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_approved
			create Result.make (l_rc, 1, "This transaction has been approved.", "")
		end

	Rrc_2_2: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 2, "This transaction has been declined.", "")
		end

	Rrc_2_3: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 3, "This transaction has been declined.", "")
		end

	Rrc_2_4: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 4, "This transaction has been declined.", "")
		end

	Rrc_3_5: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 5, "A valid amount is required.", "The value submitted in the amount field did not pass validation for a number.")
		end

	Rrc_3_6: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 6, "The credit card number is invalid.", "")
		end

	Rrc_3_7: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 7, "The credit card expiration date is invalid.", "The format of the date submitted was incorrect.")
		end

	Rrc_3_8: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 8, "The credit card has expired.", "")
		end

	Rrc_3_9: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 9, "The ABA code is invalid.", "The value submitted in the x_bank_aba_code field did not pass validation or was not for a valid financial institution.")
		end

	Rrc_3_10: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 10, "The account number is invalid.", "The value submitted in the x_bank_acct_num field did not pass validation.")
		end

	Rrc_3_11: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 11, "A duplicate transaction has been submitted.", "A transaction with identical amount and credit card information was submitted two minutes prior.")
		end

	Rrc_3_12: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 12, "An authorization code is required but not present.", "A transaction that required x_auth_code to be present was submitted without a value.")
		end

	Rrc_3_13: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 13, "The merchant API Login ID is invalid or the account is inactive.", "")
		end

	Rrc_3_14: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 14, "The Referrer or Relay Response URL is invalid.", "The Relay Response or Referrer URL does not match the merchant'ges configured value")
		end

	Rrc_3_15: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 15, "The transaction ID is invalid.", "The transaction ID value is non-numeric or was not present for a transaction that requires it.")
		end

	Rrc_3_16: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 16, "The transaction was not found.", "The transaction ID sent in was properly formatted but the gateway had no record of the transaction.")
		end

	Rrc_3_17: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 17, "The merchant does not accept this type of credit card.", "The merchant was not configured to accept the credit card submitted in the transaction.")
		end

	Rrc_3_18: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 18, "ACH transactions are not accepted by this merchant.", "The merchant does not accept electronic checks.")
		end

	Rrc_3_19: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 19, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_20: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 20, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_21: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 21, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_22: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 22, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_23: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 23, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_24: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 24, "The Nova Bank Number or Terminal ID is incorrect. Call Merchant Service Provider.", "")
		end

	Rrc_3_25: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 25, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_26: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 26, "An error occurred during processing. Please try again in 5 minutes.", "")
		end

	Rrc_2_27: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 27, "The transaction resulted in an AVS mismatch. The address provided does not match billing address of cardholder.", "")
		end

	Rrc_2_28: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 28, "The merchant does not accept this type of credit card.", "The Merchant ID at the processor was not configured to accept this card type.")
		end

	Rrc_2_29: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 29, "The Paymentech identification numbers are incorrect. Call Merchant Service Provider.", "")
		end

	Rrc_2_30: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 30, "The configuration with the processor is invalid. Call Merchant Service Provider.", "")
		end

	Rrc_2_31: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 31, "The FDC Merchant ID or Terminal ID is incorrect. Call Merchant Service Provider.", "The merchant was incorrectly set up at the processor.")
		end

	Rrc_3_32: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 32, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_33: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 33, "FIELD cannot be left blank.", "The word FIELD will be replaced by an actual field name. This error indicates that a field the merchant specified as required was not filled in. Please see the Form Fields section of the Merchant Integration Guide for details.")
		end

	Rrc_2_34: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 34, "The VITAL identification numbers are incorrect. Call Merchant Service Provider.", "The merchant was incorrectly set up at the processor.")
		end

	Rrc_2_35: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 35, "An error occurred during processing. Call Merchant Service Provider.", "The merchant was incorrectly set up at the processor.")
		end

	Rrc_3_36: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 36, "The authorization was approved, but settlement failed.", "")
		end

	Rrc_2_37: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 37, "The credit card number is invalid.", "")
		end

	Rrc_2_38: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 38, "The Global Payment System identification numbers are incorrect. Call Merchant Service Provider.", "The merchant was incorrectly set up at the processor.")
		end

	Rrc_3_40: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 40, "This transaction must be encrypted.", "")
		end

	Rrc_2_41: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 41, "This transaction has been declined.", "Only merchants set up for the FraudScreen.Net service would receive this decline. This code will be returned if a given transaction'ges fraud score is higher than the threshold set by the merchant.")
		end

	Rrc_3_43: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 43, "The merchant was incorrectly set up at the processor. Call your Merchant Service Provider.", "The merchant was incorrectly set up at the processor.")
		end

	Rrc_2_44: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 44, "This transaction has been declined.", "The card code submitted with the transaction did not match the card code on file at the card issuing bank and the transaction was declined.")
		end

	Rrc_2_45: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 45, "This transaction has been declined.", "This error would be returned if the transaction received a code from the processor that matched the rejection criteria set by the merchant for both the AVS and Card Code filters.")
		end

	Rrc_3_46: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 46, "Your session has expired or does not exist. You must log in to continue working.", "")
		end

	Rrc_3_47: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 47, "The amount requested for settlement may not be greater than the original amount authorized.", "This occurs if the merchant tries to capture funds greater than the amount of the original authorization-only transaction.")
		end

	Rrc_3_48: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 48, "This processor does not accept partial reversals.", "The merchant attempted to settle for less than the originally authorized amount.")
		end

	Rrc_3_49: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 49, "A transaction amount greater than [amount] will not be accepted.", "The transaction amount submitted was greater than the maximum amount allowed.")
		end

	Rrc_3_50: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 50, "This transaction is awaiting settlement and cannot be refunded.", "Credits or refunds can only be performed against settled transactions. The transaction against which the credit/refund was submitted has not been settled, so a credit cannot be issued.")
		end

	Rrc_3_51: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 51, "The sum of all credits against this transaction is greater than the original transaction amount.", "")
		end

	Rrc_3_52: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 52, "The transaction was authorized, but the client could not be notified; the transaction will not be settled.", "")
		end

	Rrc_3_53: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 53, "The transaction type was invalid for ACH transactions.", "If x_method ECHECK, x_type cannot be set to CAPTURE_ONLY.")
		end

	Rrc_3_54: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 54, "The referenced transaction does not meet the criteria for issuing a credit.", "")
		end

	Rrc_3_55: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 55, "The sum of credits against the referenced transaction would exceed the original debit amount.", "The transaction is rejected if the sum of this credit and prior credits exceeds the original debit amount")
		end

	Rrc_3_56: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 56, "This merchant accepts ACH transactions only; no credit card transactions are accepted.", "The merchant processes eCheck.Net transactions only and does not accept credit cards.")
		end

	Rrc_3_57: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 57, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_58: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 58, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_59: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 59, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_60: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 60, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_61: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 61, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_62: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 62, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_3_63: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 63, "An error occurred in processing. Please try again in 5 minutes.", "")
		end

	Rrc_2_65: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 65, "This transaction has been declined.", "The transaction was declined because the merchant configured their account through the Merchant Interface to reject transactions with certain values for a Card Code mismatch.")
		end

	Rrc_3_66: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 66, "This transaction cannot be accepted for processing.", "The transaction did not meet gateway security guidelines.")
		end

	Rrc_3_68: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 68, "The version parameter is invalid.", "The value submitted in x_version was invalid.")
		end

	Rrc_3_69: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 69, "The transaction type is invalid.", "The value submitted in x_type was invalid.")
		end

	Rrc_3_70: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 70, "The transaction method is invalid.", "The value submitted in x_method was invalid.")
		end

	Rrc_3_71: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 71, "The bank account type is invalid.", "The value submitted in x_bank_acct_type was invalid.")
		end

	Rrc_3_72: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 72, "The authorization code is invalid.", "The value submitted in x_auth_code was more than six characters in length.")
		end

	Rrc_3_73: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 73, "The driver'ges license date of birth is invalid.", "The format of the value submitted in x_drivers_license_dob was invalid.")
		end

	Rrc_3_74: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 74, "The duty amount is invalid.", "The value submitted in x_duty failed format validation.")
		end

	Rrc_3_75: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 75, "The freight amount is invalid.", "The value submitted in x_freight failed format validation.")
		end

	Rrc_3_76: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 76, "The tax amount is invalid.", "The value submitted in x_tax failed format validation.")
		end

	Rrc_3_77: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 77, "The SSN or tax ID is invalid.", "The value submitted in x_customer_tax_id failed validation.")
		end

	Rrc_3_78: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 78, "The Card CodeCVV2/CVC2/CID) is invalid.", "The value submitted in x_card_code failed format validation.")
		end

	Rrc_3_79: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 79, "The driver'ges license number is invalid.", "The value submitted in x_drivers_license_num failed format validation.")
		end

	Rrc_3_80: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 80, "The driver'ges license state is invalid.", "The value submitted in x_drivers_license_state failed format validation.")
		end

	Rrc_3_81: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 81, "The requested form type is invalid.", "The merchant requested an integration method not compatible with the AIM API.")
		end

	Rrc_3_82: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 82, "Scripts are only supported in version 2.5.", "The system no longer supports version 2.5; requests cannot be posted to scripts.")
		end

	Rrc_3_83: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 83, "The requested script is either invalid or no longer supported.", "The system no longer supports version 2.5; requests cannot be posted to scripts.")
		end

	Rrc_3_84: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 84, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_85: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 85, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_86: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 86, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_87: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 87, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_88: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 88, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_89: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 89, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_90: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 90, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_3_91: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 91, "Version 2.5 is no longer supported.", "")
		end

	Rrc_3_92: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 92, "The gateway no longer supports the requested method of integration.", "")
		end

	Rrc_3_97: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 97, "This transaction cannot be accepted.", "Applicable only to SIM API. Fingerprints are only valid for a short period of time. If the fingerprint is more than one hour old or more than 15 minutes into the future, it will be rejected. This code indicates that the transaction fingerprint has expired.")
		end

	Rrc_3_98: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 98, "This transaction cannot be accepted.", "Applicable only to SIM API. The transaction fingerprint has already been used.")
		end

	Rrc_3_99: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 99, "This transaction cannot be accepted.", "Applicable only to SIM API. The server-generated fingerprint does not match the merchant-specified fingerprint in the x_fp_hash field.")
		end

	Rrc_3_100: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 100, "The eCheck.Net type is invalid.", "Applicable only to eCheck.Net. The value specified in the x_echeck_type field is invalid.")
		end

	Rrc_3_101: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 101, "The given name on the account and/or the account type does not match the actual account.", "Applicable only to eCheck.Net. The specified name on the account and/or the account type do not match the NOC record for this account.")
		end

	Rrc_3_102: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 102, "This request cannot be accepted.", "A password or Transaction Key was submitted with this WebLink request. This is a high security risk.")
		end

	Rrc_3_103: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 103, "This transaction cannot be accepted.", "A valid fingerprint, Transaction Key, or password is required for this transaction.")
		end

	Rrc_3_104: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 104, "This transaction is currently under review.", "Applicable only to eCheck.Net. The value submitted for country failed validation.")
		end

	Rrc_3_105: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 105, "This transaction is currently under review.", "Applicable only to eCheck.Net. The values submitted for city and country failed validation.")
		end

	Rrc_3_106: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 106, "This transaction is currently under review.", "Applicable only to eCheck.Net. The value submitted for company failed%Tvalidation.")
		end

	Rrc_3_107: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 107, "This transaction is currently under review.", "Applicable only to eCheck.Net. The value submitted for bank account name failed validation.")
		end

	Rrc_3_108: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 108, "This transaction is currently under review.", "Applicable only to eCheck.Net. The values submitted for first name and last name failed validation.")
		end

	Rrc_3_109: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 109, "This transaction is currently under review.", "Applicable only to eCheck.Net. The values submitted for first name and last name failed validation.")
		end

	Rrc_3_110: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 110, "This transaction is currently under review.", "Applicable only to eCheck.Net. The value submitted for bank account name does not contain valid characters.")
		end

	Rrc_3_116: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 116, "The authentication indicator is invalid.", "This error is only applicable to Verified by Visa and MasterCard SecureCode transactions. The ECI value for a Visa transaction; or the UCAF indicator for a MasterCard transaction submitted in the x_authentication_indicator field is invalid.")
		end

	Rrc_3_117: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 117, "The cardholder authentication value is invalid.", "This error is only applicable to Verified by Visa and MasterCard SecureCode transactions. The CAVV for a Visa transaction; or the AVV/UCAF for a MasterCard transaction is invalid.")
		end

	Rrc_3_118: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 118, "The combination of authentication indicator and cardholder authentication value is invalid.", "This error is only applicable to Verified by Visa and MasterCard SecureCode transactions. The combination of authentication indicator and cardholder authentication value for a Visa or MasterCard transaction is invalid. For more information, see the Cardholder Authentication section of this document.")
		end

	Rrc_3_119: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 119, "Transactions having cardholder authentication values cannot be marked as recurring.", "This error is only applicable to Verified by Visa and MasterCard SecureCode transactions. Transactions submitted with a value in x_authentication_indicator and x_recurring_billing=YES will be rejected.")
		end

	Rrc_3_120: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 120, "An error occurred during processing. Please try again.", "The system-generated void for the original timed-out transaction failed.The original transaction timed out while waiting for a response from the authorizer.")
		end

	Rrc_3_121: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 121, "An error occurred during processing. Please try again.", "The system-generated void for the original errored transaction failed.The original transaction experienced a database error.")
		end

	Rrc_3_122: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 122, "An error occurred during processing. Please try again.", "The system-generated void for the original errored transaction failed.The original transaction experienced a processing error.")
		end

	Rrc_3_123: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 123, "This account has not been given the permission", "")
		end

	Rrc_2_127: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 127, "The transaction resulted in an AVS mismatch. The address provided does not match billing address of cardholder.", "The system-generated void for the original AVS-rejected transaction failed.")
		end

	Rrc_3_128: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 128, "This transaction cannot be processed.", "The customer'ges financial institution does not currently allow transactions for this account.")
		end

	Rrc_3_130: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 130, "This payment gateway account has been closed.", "IFT: The payment gateway account status is Blacklisted.")
		end

	Rrc_3_131: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 131, "This transaction cannot be accepted at this time.", "IFT: The payment gateway account status is Suspended-STA.")
		end

	Rrc_3_132: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 132, "This transaction cannot be accepted at this time.", "IFT: The payment gateway account status is Suspended-Blacklist.")
		end

	Rrc_2_141: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 141, "This transaction has been declined.", "The system-generated void for the original FraudScreen-rejected transaction failed.")
		end

	Rrc_2_145: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 145, "This transaction has been declined.", "The system-generated void for the original card code-rejected and AVS-rejected transaction failed.")
		end

	Rrc_3_152: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 152, "The transaction was authorized, but the client could not be notified; the transaction will not be settled.", "The system-generated void for the original transaction failed. The response for the original transaction could not be communicated to the client.")
		end

	Rrc_2_165: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 165, "This transaction has been declined.", "The system-generated void for the original card code-rejected transaction failed.")
		end

	Rrc_3_170: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 170, "An error occurred during processing. Please contact the merchant.", "Concord EFS Provisioning at the processor has not been completed.")
		end

	Rrc_2_171: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 171, "An error occurred during processing. Please contact the merchant.", "Concord EFS This request is invalid.")
		end

	Rrc_2_172: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 172, "An error occurred during processing. Please contact the merchant.", "Concord EFS The store ID is invalid.")
		end

	Rrc_3_173: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 173, "An error occurred during processing. Please contact the merchant.", "Concord EFS The store key is invalid.")
		end

	Rrc_2_174: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 174, "The transaction type is invalid. Please contact the merchant.", "Concord EFS This transaction type is not accepted by the processor.")
		end

	Rrc_3_175: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 175, "The processor does not allow voiding of credits.", "Concord EFS This transaction is not allowed. The Concord EFS processing platform does not support voiding credit transactions. Please debit the credit card instead of voiding the credit.")
		end

	Rrc_3_180: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 180, "An error occurred during processing. Please try again.", "The processor response format is invalid.")
		end

	Rrc_3_181: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 181, "An error occurred during processing. Please try again.", "The system-generated void for the original invalid transaction failed.The original transaction included an invalid processor response format.")
		end

	Rrc_3_185: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 185, "This reason code is reserved or not applicable to this API.", "")
		end

	Rrc_4_193: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_review
			create Result.make (l_rc, 193, "The transaction is currently under review.", "The transaction was placed under review by the risk management system.")
		end

	Rrc_2_200: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 200, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The credit card number is invalid.")
		end

	Rrc_2_201: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 201, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The expiration date is invalid.")
		end

	Rrc_2_202: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 202, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The transaction type is invalid.")
		end

	Rrc_2_203: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 203, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The value submitted in the amount field is invalid.")
		end

	Rrc_2_204: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 204, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The department code is invalid.")
		end

	Rrc_2_205: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 205, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The value submitted in the merchant number field is invalid.")
		end

	Rrc_2_206: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 206, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The merchant is not on file.")
		end

	Rrc_2_207: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 207, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The merchant account is closed.")
		end

	Rrc_2_208: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 208, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The merchant is not on file.")
		end

	Rrc_2_209: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 209, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. Communication with the processor could not be established.")
		end

	Rrc_2_210: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 210, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The merchant type is incorrect.")
		end

	Rrc_2_211: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 211, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The cardholder is not on file.")
		end

	Rrc_2_212: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 212, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The bank configuration is not on file")
		end

	Rrc_2_213: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 213, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The merchant assessment code is incorrect.")
		end

	Rrc_2_214: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 214, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. This function is currently unavailable.")
		end

	Rrc_2_215: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 215, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The encrypted PIN field format is invalid.")
		end

	Rrc_2_216: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 216, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The ATM term ID is invalid.")
		end

	Rrc_2_217: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 217, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. This transaction experienced a general message format problem.")
		end

	Rrc_2_218: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 218, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The PIN block format or PIN availability value is invalid.")
		end

	Rrc_2_219: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 219, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The ETC void is unmatched.")
		end

	Rrc_2_220: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 220, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The primary CPU is not available.")
		end

	Rrc_2_221: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 221, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. The SE number is invalid.")
		end

	Rrc_2_222: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 222, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. Duplicate auth requestfrom INAS")
		end

	Rrc_2_223: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 223, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. This transaction experienced an unspecified error.")
		end

	Rrc_2_224: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 224, "This transaction has been declined.", "This error code applies only to merchants on FDC Omaha. Please re-enter the transaction.")
		end

	Rrc_3_243: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 243, "Recurring billing is not allowed for this eCheck.Net type.", "The combination of values submitted for x_recurring_billing and x_echeck_type is not allowed.")
		end

	Rrc_3_244: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 244, "This eCheck.Net type is not allowed for this Bank Account Type.", "The combination of values submitted for x_bank_acct_type and x_echeck_type is not allowed.")
		end

	Rrc_3_245: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 245, "This eCheck.Net type is not allowed when using the payment gateway hosted payment form.", "The value submitted for x_echeck_type is not allowed when using the payment gateway hosted payment form.")
		end

	Rrc_3_246: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 246, "This eCheck.Net type is not allowed.", "The merchant'ges payment gateway account is not enabled to submit the eCheck.Net type.")
		end

	Rrc_3_247: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 247, "This eCheck.Net type is not allowed.", "The combination of values submitted for x_type and x_echeck_type is not allowed.")
		end

	Rrc_3_248: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 248, "The check number is invalid.", "Invalid check number. Check number can only consist of letters and numbers and not more than 15 characters.")
		end

	Rrc_2_250: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 250, "This transaction has been declined.", "This transaction was submitted from a blocked IP address.")
		end

	Rrc_2_251: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 251, "This transaction has been declined.", "The transaction was declined as a result of triggering a Fraud Detection Suite filter.")
		end

	Rrc_4_252: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_review
			create Result.make (l_rc, 252, "Your order has been received. Thank you for your business!", "The transaction was accepted, but is being held for merchant review. The merchant can customize the customer response in the Merchant Interface.")
		end

	Rrc_4_253: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_review
			create Result.make (l_rc, 253, "Your order has been received. Thank you for your business!", "The transaction was accepted and was authorized, but is being held for merchant review. The merchant can customize the customer response in the Merchant Interface.")
		end

	Rrc_2_254: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 254, "Your transaction has been declined.", "The transaction was declined after manual review.")
		end

	Rrc_3_261: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 261, "An error occurred during processing. Please try again.", "The transaction experienced an error during sensitive data encryption and was not processed. Please try again.")
		end

	Rrc_3_270: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 270, "The line itemitem number] is invalid.", "A value submitted in x_line_item for the item referenced is invalid.")
		end

	Rrc_3_271: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 271, "The number of line items submitted is not allowed. A maximum of 30 line items can be submitted.", "The number of line items submitted exceeds the allowed maximum of 30.")
		end

	Rrc_3_288: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 288, "Merchant is not registered as a Cardholder Authentication participant. This transaction cannot be accepted.", "The merchant has not indicated participation in any Cardholder Authentication Programs in the Merchant Interface.")
		end

	Rrc_3_289: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 289, "This processor does not accept zero dollar authorization for this card type.", "Your credit card processing service does not yet accept zero dollar authorizations for Visa credit cards. You can find your credit card processor listed on your merchant profile.")
		end

	Rrc_3_290: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 290, "One or more required AVS values for zero dollar authorization were not submitted.", "When submitting authorization requests for Visa, the address and zip code fields must be entered.")
		end

	Rrc_4_295: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_review
			create Result.make (l_rc, 295, "The amount of this request was only partially approved on the given prepaid card. Additional payments are required to complete the balance of this transaction.", " The merchant must have partial authorization enabled in the merchant interface in order to receive this error.")
		end

	Rrc_3_296: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 296, "The specified SplitTenderId is not valid.", "")
		end

	Rrc_3_297: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 297, "A Transaction ID and a Split Tender ID cannot both be used in a single transaction request.", "")
		end

	Rrc_3_300: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 300, "The device ID is invalid.", "The value submitted for x_device_id is invalid.")
		end

	Rrc_3_301: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 301, "The device batch ID is invalid.", "The value submitted for x_device_batch_id is invalid.")
		end

	Rrc_3_302: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 302, "The reversal flag is invalid.", "The value submitted for x_reversal is invalid.")
		end

	Rrc_3_303: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 303, "The device batch is full. Please close the batch.", "The current device batch must be closed manually from the POS device.")
		end

	Rrc_3_304: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 304, "The original transaction is in a closed batch.", "The original transaction has been settled and cannot be reversed.")
		end

	Rrc_3_305: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 305, "The merchant is configured for auto-close.", "This merchant is configured for auto-close and cannot manually close batches.")
		end

	Rrc_3_306: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 306, "The batch is already closed.", "The batch is already closed.")
		end

	Rrc_1_307: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_approved
			create Result.make (l_rc, 307, "The reversal was processed successfully.", "The reversal was processed successfully.")
		end

	Rrc_1_308: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_approved
			create Result.make (l_rc, 308, "Original transaction for reversal not found.", "The transaction submitted for reversal was not found.")
		end

	Rrc_3_309: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_error
			create Result.make (l_rc, 309, "The device has been disabled.", "The device has been disabled.")
		end

	Rrc_1_310: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_approved
			create Result.make (l_rc, 310, "This transaction has already been voided.", "This transaction has already been voided.")
		end

	Rrc_1_311: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_approved
			create Result.make (l_rc, 311, "This transaction has already been captured", "This transaction has already been captured.")
		end

	Rrc_2_315: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 315, "The credit card number is invalid.", "This is a processor-issued decline.")
		end

	Rrc_2_316: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 316, "The credit card expiration date is invalid.", "This is a processor-issued decline.")
		end

	Rrc_2_317: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 317, "The credit card has expired.", "This is a processor-issued decline.")
		end

	Rrc_2_318: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 318, "A duplicate transaction has been submitted.", "This is a processor-issued decline.")
		end

	Rrc_2_319: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_declined
			create Result.make (l_rc, 319, "The transaction cannot be found.", "This is a processor-issued decline.")
		end

	Rrc_0_0: AN_RESPONSE_REASON_CODE
		local
			l_rc: AN_RESPONSE_CODE
		once
			create l_rc.make
			l_rc.mark_unknown
			create Result.make (l_rc, 0, "Unknown.", "")
		end

feature -- Reason Codes

	response_codes: ARRAY [AN_RESPONSE_REASON_CODE]
		once
			Result := <<Rrc_1_1, Rrc_2_2, Rrc_2_3, Rrc_2_4, Rrc_3_5, Rrc_3_6, Rrc_3_7, Rrc_3_8, Rrc_3_9, Rrc_3_10,
						Rrc_3_11, Rrc_3_12, Rrc_3_13, Rrc_3_14, Rrc_3_15, Rrc_3_16, Rrc_3_17, Rrc_3_18, Rrc_3_19,
						Rrc_3_20, Rrc_3_21, Rrc_3_22, Rrc_3_23, Rrc_3_24, Rrc_3_25, Rrc_3_26, Rrc_2_27, Rrc_2_28,
						Rrc_2_29, Rrc_2_30, Rrc_2_31, Rrc_3_32, Rrc_3_33, Rrc_2_34, Rrc_2_35, Rrc_3_36, Rrc_2_37,
						Rrc_2_38, Rrc_3_40, Rrc_2_41, Rrc_3_43, Rrc_2_44, Rrc_2_45, Rrc_3_46, Rrc_3_47, Rrc_3_48,
						Rrc_3_49, Rrc_3_50, Rrc_3_51, Rrc_3_52, Rrc_3_53, Rrc_3_54, Rrc_3_55, Rrc_3_56, Rrc_3_57,
						Rrc_3_58, Rrc_3_59, Rrc_3_60, Rrc_3_61, Rrc_3_62, Rrc_3_63, Rrc_2_65, Rrc_3_66, Rrc_3_68,
						Rrc_3_69, Rrc_3_70, Rrc_3_71, Rrc_3_72, Rrc_3_73, Rrc_3_74, Rrc_3_75, Rrc_3_76, Rrc_3_77,
						Rrc_3_78, Rrc_3_79, Rrc_3_80, Rrc_3_81, Rrc_3_82, Rrc_3_83, Rrc_3_84, Rrc_3_85, Rrc_3_86,
						Rrc_3_87, Rrc_3_88, Rrc_3_89, Rrc_3_90, Rrc_3_91, Rrc_3_92, Rrc_3_97, Rrc_3_98, Rrc_3_99,
						Rrc_3_100, Rrc_3_101, Rrc_3_102, Rrc_3_103, Rrc_3_104, Rrc_3_105, Rrc_3_106, Rrc_3_107,
						Rrc_3_108, Rrc_3_109, Rrc_3_110, Rrc_3_116, Rrc_3_117, Rrc_3_118, Rrc_3_119, Rrc_3_120,
						Rrc_3_121, Rrc_3_122, Rrc_3_123, Rrc_2_127, Rrc_3_128, Rrc_3_130, Rrc_3_131, Rrc_3_132,
						Rrc_2_141, Rrc_2_145, Rrc_3_152, Rrc_2_165, Rrc_3_170, Rrc_2_171, Rrc_2_172, Rrc_3_173,
						Rrc_2_174, Rrc_3_175, Rrc_3_180, Rrc_3_181, Rrc_3_185, Rrc_4_193, Rrc_2_200, Rrc_2_201,
						Rrc_2_202, Rrc_2_203, Rrc_2_204, Rrc_2_205, Rrc_2_206, Rrc_2_207, Rrc_2_208, Rrc_2_209,
						Rrc_2_210, Rrc_2_211, Rrc_2_212, Rrc_2_213, Rrc_2_214, Rrc_2_215, Rrc_2_216, Rrc_2_217,
						Rrc_2_218, Rrc_2_219, Rrc_2_220, Rrc_2_221, Rrc_2_222, Rrc_2_223, Rrc_2_224, Rrc_3_243,
						Rrc_3_244, Rrc_3_245, Rrc_3_246, Rrc_3_247, Rrc_3_248, Rrc_2_250, Rrc_2_251, Rrc_4_252,
						Rrc_4_253, Rrc_2_254, Rrc_3_261, Rrc_3_270, Rrc_3_271, Rrc_3_288, Rrc_3_289, Rrc_3_290,
						Rrc_4_295, Rrc_3_296, Rrc_3_297, Rrc_3_300, Rrc_3_301, Rrc_3_302, Rrc_3_303, Rrc_3_304,
						Rrc_3_305, Rrc_3_306, Rrc_1_307, Rrc_1_308, Rrc_3_309, Rrc_1_310, Rrc_1_311, Rrc_2_315,
						Rrc_2_316, Rrc_2_317, Rrc_2_318, Rrc_2_319, Rrc_0_0
						>>
		end


	find_by_reason_code (code : INTEGER) : AN_RESPONSE_REASON_CODE
			-- Return a reason code based on `code', if does
			-- not include `code' return Rrc_0_0
		local
			i : INTEGER
			found : BOOLEAN
		do
			Result := Rrc_0_0
			from
				i := 1
			until
				i > response_codes.count or found
			loop
				if response_codes.at (i).code = code then
					Result :=  response_codes.at (i)
					found := True
				end
				i := i + 1
			end
		end
end
