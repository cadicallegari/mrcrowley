module API
  class Root < Grape::API
    prefix 'api'
    format          :json
    default_format  :jsonS

    mount API::V1::Root

    error_formatter :json, lambda { |message, backtrace, options, env|
      puts "<====== Returning: #{message}"
      {error: message}.to_json
    }

    route :any, '*path' do
      error!(I18n.t('fails.not_found'), 404)
    end

  end
end

