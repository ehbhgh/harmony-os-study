import { WsPanel } from "./components/WsPanel"

@Entry
@Component
struct TrailingClosureCase {
  build() {
    Column() {
      WsPanel() {
        Text("这是一段文字")
      }

      WsPanel() {
        Button("这是一个按钮")
      }

      WsPanel() {
        TextInput({ placeholder: "这是一个输入框" })
      }
    }
  }
}