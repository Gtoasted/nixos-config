import { bind, GObject, monitorFile, property, readFileAsync, register, Variable } from "astal"
import { exec } from "astal/process"
import WifiStrength from "./Wifi"

function brightnessctl(args: string) {
  return Number(exec(`brightnessctl ${args}`))
}

@register({ GTypeName: "Brightness" })
class Brightness extends GObject.Object {
  static instance: Brightness
  static get_default() {
    if (!this.instance) this.instance = new Brightness()
    return this.instance
  }

  #max = brightnessctl("max")
  #current = brightnessctl("get")

  @property(Number)
  get absolute() { return this.#current }

  set absolute(value) {
    if (value < 0 || value > this.#max) return
    brightnessctl(`get ${value}`)
  }

  @property(Number)
  get relative() { return this.#current / this.#max }

  set relative(value) {
    if (value < 0 || value > 1) return
    brightnessctl(`set ${value * this.#max}%`)
  }

  @property(String)
  get icon() {
    const percentage = this.relative
    if (percentage < 0.33) return "brightness-low-symbolic"
    else if (percentage < 0.66) return "brightness-symbolic"
    else return "brightness-high-symbolic"
  }

  constructor() {
    super()

    const screen = exec(`bash -c "ls -w1 /sys/class/backlight | head -1"`)
    const screenPath = `/sys/class/backlight/${screen}/brightness`

    monitorFile(screenPath, async f => {
      const v = await readFileAsync(f)
      this.#current = Number(v)
      this.notify("absolute")
      this.notify("relative")
      this.notify("icon")
    })
  }
}

export default function BrightnessLevel() {
  const brightness = Brightness.get_default()

  return <box>
    <icon icon={bind(brightness, "icon")} tooltipText={bind(brightness, "relative").as(p => `${Math.floor(p*100)}%`)} />
  </box>
}
