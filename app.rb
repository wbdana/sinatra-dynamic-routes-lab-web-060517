require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    "#{params[:name].reverse}"
  end

  get '/square/:number' do
    "#{(params[:number].to_i ** 2).to_s}"
  end

  get '/say/:number/:phrase' do
    return_val = ""
    params[:number].to_i.times do
      return_val << "#{params[:phrase]}"
    end
    return_val
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = [params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]]
    @words.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    if params[:operation] == "add"
      @op = '+'
    elsif params[:operation] == "subtract"
      @op = '-'
    elsif params[:operation] == "multiply"
      @op = '*'
    elsif params[:operation] == "divide"
      @op = '/'
    end
    @op = @op.to_sym
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    arr = [@num1, @num2]
    "#{arr.inject(@op)}"
  end

end
