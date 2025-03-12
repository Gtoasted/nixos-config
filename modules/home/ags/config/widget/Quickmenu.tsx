import { App, Astal, Gtk } from "astal/gtk3"
import { AudioSlider } from "./Media"
import WifiStrength from "./Wifi"

export default function quickmenu(gdkmonitor: Gdk.monitor) {
  const { TOP, RIGHT } = Astal.WindowAnchor

  return <window
    name="quickmenu"
    application={App}
    className="Quickmenu"
    gdkmonitor={gdkmonitor}
    anchor={TOP | RIGHT}
    >
    <box vertical>
      <AudioSlider />
      <WifiStrength />
    </box>
  </window>
}
