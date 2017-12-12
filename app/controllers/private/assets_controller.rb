module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      @cny_assets  = Currency.assets('cny')
      @btc_assets  = Currency.assets('btc')
      @aud_assets  = Currency.assets('aud')
      @eth_assets  = Currency.assets('eth')
      @ltc_assets  = Currency.assets('ltc')
      @btc_proof   = Proof.current :btc
      @cny_proof   = Proof.current :cny
      @aud_proof   = Proof.current :aud
      @eth_proof   = Proof.current :eth
      @ltc_proof   = Proof.current :ltc

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @aud_account = current_user.accounts.with_currency(:aud).first
        @ltc_account = current_user.accounts.with_currency(:ltc).first
        @eth_account = current_user.accounts.with_currency(:eth).first
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end
