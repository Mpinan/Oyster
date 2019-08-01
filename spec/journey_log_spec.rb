require 'journey_log'
describe JourneyLog do
    let(:journey){ double {:entry_station entry_station, :exit_station exit_station}}
    let(:station){ double :station}
    let(:journey_class){double :journey_class, new: journey}
    subject {described_class.new(journey_class: journey_class)}

end
