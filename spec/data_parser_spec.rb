require 'spec_helper'

RSpec.describe DataParser do
  it 'should be able to parse a status' do
    input = JSON.parse(File.open('spec/sample_report.json').read, symbolize_names: true)
    statuses = DataParser.statuses(input)
    expected = [
      { name: 'Passing:5', status: true, feature: 'one-passing-scenario,-one-failing-scenario' },
      { name: 'Failing:9', status: false, feature: 'one-passing-scenario,-one-failing-scenario' }
    ]
    expect(statuses).to eq(expected)
  end
end
