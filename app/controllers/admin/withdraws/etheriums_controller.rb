module Admin
  module Withdraws
    class EtheriumsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Etherium'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_etheriums = @etheriums.with_aasm_state(:accepted).order("id DESC")
        @all_etheriums = @etheriums.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @etherium.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @etherium.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
