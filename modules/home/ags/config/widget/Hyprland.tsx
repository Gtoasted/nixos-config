import { bind } from "astal"
import Hyprland from "gi://AstalHyprland"

export function Workspaces() {
  const hypr = Hyprland.get_default()

  return <box className="Workspaces">
    {bind(hypr, "workspaces").as(wss => wss
      .filter(workspace => !(workspace .id >= -99 && workspace.id <= -2)) // filter out special workspaces
      .sort((a, b) => a.id - b.id)
      .map(ws => (
        <button
          className={bind(hypr, "focusedWorkspace").as(fw => ws === fw ? "focused" : "")}
          onClicked={() => ws.focus()}>
          {ws.id}
        </button>
      ))
    )}
  </box>
}

export function CurrentWindow() {
  const hypr = Hyprland.get_default()
  const focused = bind(hypr, "focusedClient")

  return <>
    {focused.as(client => {
      if (!client) return ""
      return <label label={bind(client, "title").as(String)} />
    })}
  </>
}

