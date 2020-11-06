class DisplayOutput
  def print_table(description, list)
    output = ''
    output.concat(format_header(description), "\n") unless description.empty?
    output.concat(format_list(list))
    print_output(output)
  end

  def print_header(text)
    print_output(format_header(text))
  end

  def print_list(list)
    print_output(format_list(list))
  end

  def print_error(error)
    output = 'An error occurred:'

    if error.is_a?(Exception)
      output.concat("\n", '>> Type:    ', error.class.to_s)
      output.concat("\n", '>> Message: ', error.message&.to_s)
    else
      output.concat("\n", '.. but no more information is available ..')
    end

    print_output(output)
  end

  private

  def print_output(str)
    puts str
  end

  def format_header(text)
    output = ''
    output.concat(line, "\n", format_text(text))
  end

  def format_text(text)
    "| #{text.to_s.ljust(49)}|"
  end

  def format_list(list)
    list_output = ''
    list_output.concat(line)
    list_output.concat("\n", format_text('no item found!')) unless list&.any?
    list&.each do |key, value|
      list_output.concat("\n", format_list_item(key, value))
    end
    list_output.concat("\n", line)
  end

  def format_list_item(key, value)
    "| #{key&.to_s&.ljust(28, '.')} | #{value&.to_s&.ljust(18)}|"
  end

  def line
    @line ||= "|#{'-' * 50}|"
  end
end
