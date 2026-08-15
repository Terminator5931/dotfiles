rule = {
  matches = {
    {
      { "node.name", "equals", "v4l2_input.pci-0000_00_14.0-usb-0_6_1.0" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules, rule)
