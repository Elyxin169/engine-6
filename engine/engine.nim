import classes, raylib
proc vec2*(x, y: int32): Vector2 =
      return Vector2(x: x.float32, y: y.float32)
proc vec2*(x, y: float32): Vector2 =
      return Vector2(x: x, y: y)
proc rgb*(r, g, b: uint8): Color =
      return Color(r: r, g: g, b: b, a: 255)
proc rgba*(r, g, b, a: uint8): Color =
      return Color(r: r, g: g, b: b, a: a)
class Game:
      var size: Vector2
      var title: string
      var fps: int32
      method init(size: Vector2, title: string, fps: int32) =
            this.size = size
            this.title = title
            this.fps = fps
      method start() =
            initWindow(this.size.x.int32, this.size.y.int32, this.title)
            setTargetFPS(this.fps)
      method stop() =
            closeWindow()
      method running(): bool =
            return not windowShouldClose()
class Component:
      method init() = discard -69
class TransformComponent of Component:
      var position: Vector2
      var size: Vector2
      var rotation: float32
      method init(pos: Vector2) =
            this.position = pos
      method init(pos, size: Vector2) =
            this.position = pos
            this.size = size
      method init(pos, size: Vector2, rotation: float32) =
            this.position = pos
            this.size = size
            this.rotation = rotation
class ColorComponent of Component:
      var color: Color
      method init(col: Color) =
            this.color = col
      method init() =
            this.color = rgb(0, 0, 0)
class Entity:
      var visible: bool
class RectangleEntity of Entity:
      var color: ColorComponent
      var transform: TransformComponent
      method init(pos, size: Vector2, color: Color) =
            this.visible = true
            this.transform = newTransformComponent(pos, size)
            this.color = newColorComponent(color)
      method draw() =
            if this.visible:
                  drawRectangle(this.transform.position, this.transform.size, this.color.color)

export Game, vec2, TransformComponent, Component, rgb, rgba, Entity, RectangleEntity
