require './lib/input'

describe Input do

  it 'returns the entered number from the given input' do
    mock_input = double(:gets => 1)

    expect(Input.get_number(mock_input)).to eq(1)
  end

  it 'returns nil when a number is not entered' do
    mock_input = double(:gets => "hello")

    expect(Input.get_number(mock_input)).to eq(nil)
  end

end

