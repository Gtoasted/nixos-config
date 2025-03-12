import { Astal, Gtk, Gdk, App } from "astal/gtk3"

import { Workspaces, CurrentWindow } from "./Hyprland.js"
import { Media, Audio } from "./Media"
import Time from "./Time"
import WifiStrength from "./Wifi"
import BatteryLevel from "./Battery.js"
import BrightnessLevel from "./Brightness.js"
import SysTray from "./Tray.js"
import InhibitWidget from "./Inhibit.js"

// TODO:
// - Fix Tray
// - Add Notifications
// - Beautify
// - Toggleable Quickmenu
// - Battery saving mode

export default function bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    name="bar"
    application={App}
    className="bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
    >
    <centerbox>
      <box hexpand halign={Gtk.Align.START}>
        <Workspaces />
        <Media />
      </box>
      <box>
        <CurrentWindow />
      </box>
      <box hexpand halign={Gtk.Align.END} >
        <InhibitWidget />
        <Audio />
        <BrightnessLevel />
        <BatteryLevel />
        <WifiStrength short/>
        <SysTray />
        <Time format="%A, %d. %B %Y"/>
        <Time format="%H:%M"/>
      </box>
    </centerbox>
  </window>
}
