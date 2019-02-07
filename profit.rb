#!/usr/bin/env ruby
require 'thor'

class Profit < Thor
  desc 'profit', 'Calculate the trade profit given amount buy price and sell price'
  option :amount, aliases: :a, desc: 'Amount of money that you want to invest', type: :numeric
  option :buy_price, aliases: :b, desc: 'Price that you want to buy', type: :numeric
  option :sell_price, aliases: :s, desc: 'Price that you want to sell', type: :numeric
  option :fee, aliases: :f, desc: 'Exchenge fee in percentage'

  def profit
    active_amount = options[:amount].to_f / options[:buy_price].to_f
    active_amount_minus_fees = active_amount - (active_amount * 0.01)
    profit = active_amount_minus_fees * options[:sell_price].to_f
    profit_minus_fees = profit - (profit * 0.01)

    puts "Investment: #{options[:amount]}"
    puts "Profit: #{(profit_minus_fees - options[:amount]).round(2)}"
    puts "Total: #{profit_minus_fees.round(2)}"
  end
end

Profit.start
