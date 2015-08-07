mackerel-plugin-acpi
====================

acpi (battery status) custom metrics plugin for mackerel.io agent.

## Synopsis

```shell
mackerel-plugin-acpi
```

## Requirements

- `acpi` command

## Example of mackerel-agent.conf

```
[plugin.metrics.acpi]
command = "ruby /path/to/mackerel-plugin-acpi/acpi.rb"
```

## TODO

Write script in golang instead of ruby
