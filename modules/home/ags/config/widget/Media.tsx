import { Gtk } from "astal/gtk3"
import { bind } from "astal"
import Mpris from "gi://AstalMpris"
import Wp from "gi://AstalWp"

export function Media() {
  const mpris = Mpris.get_default()

  return <box className="Media">
    {bind(mpris, "players").as(ps => ps[0] ? (
      <box>
        <box
          className="Cover"
          valign={Gtk.Align.CENTER}
          css={bind(ps[0], "coverArt").as(cover =>
              `background-image: url('${cover}');`
          )}
        />
        <label
          label={bind(ps[0], "metadata").as(() =>
            `${ps[0].title} - ${ps[0].artist}`
          )}
        />
      </box>
    ) : (
      <label label="Nothing Playing" />
    ))}
  </box>
}

export function AudioSlider() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!

  return <box className="AudioSlider" css="min-width: 140px">
    <icon icon={bind(speaker, "volumeIcon")} />
    <slider
      hexpand
      onDragged={({ value }) => speaker.volume = value}
      value={bind(speaker, "volume")}
    />
  </box>
}

export function Audio() {
  const speaker = Wp.get_default().audio.defaultSpeaker

  return <box>
    <icon
      icon={bind(speaker, "volumeIcon")}
      tooltipText={bind(speaker, "volume").as(p => `${Math.round(p*100)}%`)}
    />
  </box>
}
