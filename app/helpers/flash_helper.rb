module FlashHelper

	BOOTSTRAP_ALERT_TYPES = {
		success: 'alert-success',
		error:   'alert-danger',
		alert:   'alert-warning',
		notice:  'alert-info'
	}

	def bootstrap_class_for(flash_type)
		BOOTSTRAP_ALERT_TYPES.fetch(flash_type.to_sym, flash_type.to_s)
	end
end
