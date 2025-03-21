import { bind, exec, execAsync, GObject, property, register } from "astal";

@register({ GTypeName: "focus" })
class Focus extends GObject.Object {
  static instance: Focus
  static get_default() {
    if (!this.instance) this.instance = new Focus()
    return this.instance
  }

  #enabled = false;

  toggle() {
    this.enabled = !this.enabled
  }

  @property(Boolean)
  get enabled() {
    return this.#enabled
  }

  set enabled(value) {
    if (value) {
      this.#enabled = true;
      print(exec(`bash -c "
hyprctl keyword decoration:rounding 0
hyprctl keyword general:gaps_in 0
hyprctl keyword general:gaps_out 0
hyprctl keyword general:border_size 0
hyprctl keyword decoration:shadow:enabled false
hyprctl keyword animations:enabled no
"`))
   } else {
      this.#enabled = false;
      exec(`bash -c "
hyprctl keyword decoration:rounding 2
hyprctl keyword general:gaps_in 2
hyprctl keyword general:gaps_out 5
hyprctl keyword general:border_size 1
hyprctl keyword decoration:shadow:enabled true
hyprctl keyword animations:enabled yes
"`)
    }

    this.notify("icon")
  }

  @property(String)
  get icon() {
    if (this.enabled) {
      return "redshift-status-on-symbolic"
    } else {
      return "redshift-status-off-symbolic"
    }
  }

  constructor() {
    super()
  }
}

export default function FocusWidget() {
  const focus = Focus.get_default()

  return <box>
    <button onClick={() => focus.toggle() }>
      <icon icon={bind(focus, "icon")} />
    </button>
  </box>
}
