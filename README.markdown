# AM2320/AM2321 temparature and humidity sensor

This is a Ruby driver for the AM2320/AM2321 temparature and humidity sensor
partially based on [i2c-lcd](https://github.com/daisukesuzuki/i2c-am2320).

The original code was partially ported from [am2320](https://github.com/sinozu/am2320/blob/master/am2320.rb).

## Installation

Add this line to your application's Gemfile:

```
gem 'i2c-am2320'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install i2c-am2320
```

## Usage

```ruby
require 'i2c/drivers/am2320'
sensor = I2C::Drivers::AM2320::Sensor.new('/dev/i2c-1')
humid, temp = sensor.read
puts "humid: #{humid}, temp: #{temp}"
```
