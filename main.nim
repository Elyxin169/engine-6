import raylib, engine/engine

const screenSize = vec2(960, 540)

proc main =
      var pong = newGame(screenSize, title = "hello", fps = 60) # added names for clarity
      pong.start()

      var rect = newRectangleEntity(vec2(69, 420), vec2(100, 50), rgb(69, 69, 0))
      while pong.running():
            beginDrawing()
            clearBackground(RayWhite)
            
            rect.draw()
            endDrawing()
      pong.stop()


main()
