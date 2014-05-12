require 'gibbon'

Gibbon::Export.api_key = Rails.application.secrets
Gibbon::Export.timeout = 15
Gibbon::Export.throws_exceptions = false