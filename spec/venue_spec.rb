require 'rspec'
require './lib/venue'

describe Venue do
  describe '#initialize' do
    it 'is a venue' do
      venue = Venue.new('Bluebird', 4)
      expect(venue).to be_a Venue
    end

    it 'can read the name' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.name).to eq 'Bluebird'
    end

    it 'can read the capacity' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.capacity).to eq 4
    end

    it 'has no patrons by default' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.patrons).to eq []
    end
  end

  # Iteration 2

  describe '#add_patron' do
    it 'returns a list of patrons' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.patrons).to eq ['Mike', 'Megan', 'Bob']
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.yell_at_patrons).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  describe '#over_capacity' do
    it 'returns true if the venue is over capacity' do
      venue = Venue.new('Bluebird', 2)
      venue.add_patron('Rich')
      venue.add_patron('Mark')
      venue.add_patron('Drew')

      expect(venue.over_capacity?).to eq(true)
    end

    it 'returns false if the venue is over capacity' do
      venue = Venue.new('Bluebird', 5)
      venue.add_patron('Rich')
      venue.add_patron('Mark')
      venue.add_patron('Drew')

      expect(venue.over_capacity?).to eq(false)
    end
  end

  describe '#kick_out' do
    it 'kicks out patrons that are over the capacity' do
      venue = Venue.new('Bluebird', 5)
      venue.add_patron('Rich')
      venue.add_patron('Mark')
      venue.add_patron('Drew')
      venue.add_patron('Matt')
      venue.add_patron('Keith')
      venue.add_patron('Dustin')
      venue.add_patron('Jim')

      venue.kick_out

      expect(venue.over_capacity?).to eq(false)
    end

    it 'does nothing if not over capacity' do
      test_list = ['Rich', 'Mark', 'Drew', 'Matt', 'Keith']
      venue = Venue.new('Bluebird', 5)
      venue.add_patron('Rich')
      venue.add_patron('Mark')
      venue.add_patron('Drew')
      venue.add_patron('Matt')
      venue.add_patron('Keith')

      venue.kick_out

      expect(venue.patrons).to match_array(test_list)
    end
  end
end
