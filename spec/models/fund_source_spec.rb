require 'spec_helper'

describe FundSource do

  context '#label' do
    context 'for btc' do
      let(:fund_source) { build(:btc_fund_source) }
      subject { fund_source }

      its(:label) { should eq("#{fund_source.uid} (bitcoin)") }
    end

    context 'bank' do
      let(:fund_source) { build(:aud_fund_source) }
      subject { fund_source }

      its(:label) { should eq('Westpac Banking Corporation#****1234') }
    end
    
    context 'eth' do
      let(:fund_source) { build(:eth_fund_source) }
      subject { fund_source }

      its(:label) { should eq("#{fund_source.uid} (etherium)") }
    end
  end

end
