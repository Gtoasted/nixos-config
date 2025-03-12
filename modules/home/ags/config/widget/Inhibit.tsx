import { bind, exec, execAsync, GObject, interval, property, register } from "astal";

@register({ GTypeName: "inhibit" })
class Inhibit extends GObject.Object {
  static instance: Inhibit
  static get_default() {
    if (!this.instance) this.instance = new Inhibit()
    return this.instance
  }

  @property(Boolean)
  get running() {
    return exec("ps -e")
      .split("\n")
      .filter(value => value.includes("wlinhibit"))
      .length != 0
  }

  set running(value: boolean) {
    if (this.running == value) return

    if (value) {
      execAsync("wlinhibit")
    } else {
      exec("killall wlinhibit")
    }

    this.notify("icon")
  }

  @property(String)
  get icon() {
    if (this.running) {
      return "redeyes"
    } else {
      return "image-red-eye-symbolic"
    }
  }

  toggle() { 
    this.running = !this.running
  }

  constructor() {
    super()
  }
}

export default function InhibitWidget() {
  const inhibit = Inhibit.get_default()

  return <box>
    <button onClick={() => inhibit.toggle() }>
      <icon icon={bind(inhibit, "icon")} />
    </button>
  </box>
}
