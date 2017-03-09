require 'i2c'

module I2C
    module Drivers
        module AM2320
            #
            # Driver class for the AM232x temparature and humidity sensor.
            #   forked from https://github.com/daisukesuzuki/i2c-lcd
            #
            # Parts ported from https://github.com/sinozu/am2320/blob/master/am2320.rb
            #
            class Sensor

                def initialize(device_path, device_address = 0x5c)
                    @device = I2C.create(device_path)
                    @address = device_address
                end

                def read
                    # Wake up sensor
                    begin
                        @device.write(@address, "")
                    rescue
                        # ignore
                    end

                    # Read sensor values
                    begin
                        sensor_data = @device.read(@address, 8, "\x03\x00\x04")
                    rescue
                        return nil
                    end

                    func_code, ret_len, hum_h, hum_l, temp_h, temp_l, crc_l, crc_h = sensor_data.bytes.to_a

                    orig_crc = (crc_h << 8) | crc_l
                    hum = (hum_h << 8) | hum_l
                    temp = ((temp_h & 0x7F) << 8) | temp_l
                    # Check if negative or not.
                    if (temp_h > 0x7F)
                        temp *= -1

                    # Calculate CRC
                    crc = crc16(sensor_data[0,6].bytes)

                    return nil if crc != orig_crc
                    return hum/10.0, temp/10.0
                end

                def read_temp
                    humid, temp = self.read
                    return temp
                end

                def read_humid
                    humid, temp = self.read
                    return humid
                end

                private

                def crc16(data)
                    crc = 0xFFFF
                    data.each do |b|
                        crc ^= b;
                        8.times do
                            if (crc & 0x01) != 0 then
                                crc = crc >> 1
                                crc ^= 0xA001
                            else
                                crc = crc >> 1
                            end
                        end
                    end
                    return crc
                end
            end
        end
    end
end