if ENV['MACKEREL_AGENT_PLUGIN_META'] == '1'
  require 'json'

  meta = {
    :graphs => {
      'acpi.battery' => {
        :label   => 'Battery',
        :unit    => 'integer',
        :metrics => [
          {
            :name  => 'b0',
            :label => 'Battery 0'
          }, {
            :name  => 'b1',
            :label => 'Battery 1'
          }
        ]
      }
    }
  }

  puts '# mackerel-agent-plugin'
  puts meta.to_json
  exit 0
end

def acpi(*args)
  `acpi #{args.join(" ")}`
end

def current_battery
  (acpi '-b').split("\n").map {|l|
    {
      :battery => l.match(/Battery (\d+)/)[1].to_i,
      :value => l.match(/(\d+)\%/)[1].to_i
    }
  }
end

def output_for_mackerel
  current_battery.map {|b|
    ["acpi.battery.b#{b[:battery]}", b[:value], Time.now.to_i].join("\t")
  }
end

puts output_for_mackerel.join("\n")

