class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_pk],
            secret_token: Rails.application.credentials.iex_client[:sandbox_sk],
            endpoint: 'https://sandbox.iexapis.com/v1'
        )
        client.price(ticker_symbol)
    end

end
