module Input

  def Input.get_number(input_method = $stdin)
    Integer(input_method.gets) rescue nil
  end

end
