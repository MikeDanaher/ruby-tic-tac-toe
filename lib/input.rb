module Input

  def Input.get(input_method = $stdin)
    input_method.gets
  end

end
