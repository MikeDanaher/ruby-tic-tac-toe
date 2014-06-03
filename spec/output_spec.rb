require './lib/output'

describe Output do

  it 'prints a string to the default output' do
    test_string = 'Please make a move'
    output_spy = double(:print => test_string)

    Output.print_string(test_string, output_spy)

    expect(output_spy).to have_received(:print).with(test_string)
  end

  it 'puts a string to the default output' do
    test_string = 'Please make a move'
    output_spy = double(:puts => test_string)

    Output.put_string(test_string, output_spy)

    expect(output_spy).to have_received(:puts).with(test_string)
  end

end

