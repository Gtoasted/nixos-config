import { App } from "astal/gtk3"
import style from "./style.scss"
import bar from "./widget/Bar"
import quickmenu from "./widget/Quickmenu"

App.start({
  css: style,
  main() {
    App.get_monitors().map(bar)
  },
})
