# frozen_string_literal: true

RSpec.describe CaTesting::Drivers::V4::Options do
  describe ".for" do
    subject(:options) { described_class.for(browser) }

    context "for chrome" do
      let(:browser) { :chrome }

      it { is_expected.to have_attributes({ browser_name: "chrome" }) }
    end

    context "for firefox" do
      let(:browser) { :firefox }

      it { is_expected.to have_attributes({ browser_name: "firefox", log: { level: "trace" } }) }
    end

    context "for internet explorer" do
      let(:browser) { :internet_explorer }

      it { is_expected.to have_attributes({ native_events: true, persistent_hover: true }) }
    end

    context "for safari" do
      let(:browser) { :safari }

      it { is_expected.to have_attributes({ browser_name: "safari", automatic_inspection: true }) }
    end

    context "for any other browser" do
      let(:browser) { :foo }

      it { is_expected.to be_empty }
    end
  end
end
