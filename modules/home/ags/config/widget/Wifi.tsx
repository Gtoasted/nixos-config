import { bind, GObject, interval, property, register, } from "astal"
import { exec } from "astal/process"

function clamp(value: number, min: number, max: number) {
  return Math.min(Math.max(value, min), max)
}

function discretize(value: number, steps: number[]) {
  steps = steps.sort((n1, n2) => n1-n2)
  for (let i = 0; i < steps.length - 1; i++) {
    if (value > steps[i] && value <= steps[i+1]) return steps[i+1]
  }
  return steps[0]
}

const max_rssi = -50
const min_rssi = -100
const rssi_span = max_rssi-min_rssi

function get_ssid() {
   return exec("wpa_cli status")
    .split("\n")[3]
    .substring(5)
}

function get_rssi() {
  return parseFloat(exec("wpa_cli signal_poll")
    .split("\n")[1]
    .substring(5))
}

@register({ GTypeName: "Wifi" })
class Wifi extends GObject.Object {
  static instance: Wifi
  static get_default() {
    if (!this.instance) this.instance = new Wifi()
    return this.instance
  }

  #ssid = get_ssid()

  #rssi = get_rssi()

  @property(Number)
  get rssi() { return this.#rssi }

  @property(Number)
  get percentage() {
    return clamp( (this.#rssi - min_rssi) / rssi_span * 100, 0, 100)
  }

  @property(String)
  get ssid() { return this.#ssid }

  @property(String)
  get icon() {
    const p = discretize(this.percentage, [0, 20, 40, 60, 80, 100])
    return `network-wireless-${p}`
  }

  constructor() {
    super()

    interval(1000, () => {
      const ssid = get_ssid()
      if (ssid != this.#ssid ) {
        this.#ssid = ssid
        this.notify("ssid")
      }

      const rssi = get_rssi()
      if (rssi != this.#rssi ) {
        this.#rssi = rssi
        this.notify("rssi")
        this.notify("percentage")
      }
    })
  }
}

export default function WifiStrength({ short=false }) {
  const wifi = Wifi.get_default()

  return <box className="connection">
    {!short && <label label={bind(wifi, "ssid").as(ssid => ssid+" ")} />}
    {!short && <label label={bind(wifi, "percentage").as(p => `(${Math.floor(p)}%)`)} />}
    <icon icon={bind(wifi, "icon")} tooltipText={bind(wifi, "ssid")} />
  </box>
}
