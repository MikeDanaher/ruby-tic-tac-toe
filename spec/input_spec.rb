require './lib/input'

describe Input do

  it 'gets input from the given input method' do
    input_spy = double(:gets => true)

    Input.get(input_spy)

    expect(input_spy).to have_received(:gets)
  end

end

