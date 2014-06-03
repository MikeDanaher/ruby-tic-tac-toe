module Output

  def Output.print_string(message, output_method = $stdout)
    output_method.print message
  end

  def Output.put_string(message, output_method = $stdout)
    output_method.puts message
  end

end
