import { Variable, GLib } from "astal"

export default function Time({ format = "%A, %d. %B %Y, %H:%M" }) {
  const time = Variable<string>("").poll(1000, () =>
      GLib.DateTime.new_now_local().format(format)!)

  return <box>
    <label
        className="Time"
        onDestroy={() => time.drop()}
        label={time()}
    />
  </box>
}
