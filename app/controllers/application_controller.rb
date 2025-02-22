class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("user_number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/blank_square_root_form.html.erb"})
  end

  def calculate_square_root
    @num = params.fetch("user_num").to_f
    @square_root = Math.sqrt(@num)
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/blank_payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @num_of_years = params.fetch("num_of_years").to_i
    @principal = params.fetch("principal").to_f

    first_half_of_equation = @principal * (@apr / 100 / 12)
    second_half_of_equation = 1 - (1 + @apr /100 / 12) **-(@num_of_years * 12)

    @payment = first_half_of_equation/second_half_of_equation


    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb"})
  end
end
