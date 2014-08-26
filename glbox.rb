require "opengl"
require "glut"

def InitGL(width, height) 

  GL.ClearColor(0.0, 0.0, 0.0, 0.0) 

  GL.ClearDepth(1.0) 
  GL.DepthFunc(GL::LESS)
  GL.Enable(GL::DEPTH_TEST)
  GL.ShadeModel(GL::SMOOTH)
  GL.MatrixMode(GL::PROJECTION)
  GL.LoadIdentity()
  GLU.Perspective(45.0,Float(width)/Float(height),0.1,100.0)

  GL.MatrixMode(GL::MODELVIEW)
end
 
ReSizeGLScene = Proc.new {|width, height|
  if (height==0) 
    height=1
  end
  GL.Viewport(0,0,width,height)

  GL.MatrixMode(GL::PROJECTION)
  GL.LoadIdentity()
  GLU.Perspective(45.0,Float(width)/Float(height),0.1,100.0)
  GL.MatrixMode(GL::MODELVIEW)
}

# The main drawing function. 
DrawGLScene = Proc.new {

  GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT) # Clear The Screen And

  GL.LoadIdentity()                       # make sure we're no longer rotated.
  GL.Translate(0.0,0.0,-7.0)              # Move Right 3 Units, and back into 
                                          # the screen 7.0
  GL.Rotate($x,$y,$z,1.0)           # Rotate the quad on the X Axis
  # draw a cube (6 quadrilateral)
  GL.Begin(GL::QUADS)                     # start drawing the cube

  # top of cube
  GL.Color3f(0.0,1.0,0.0)               # Set The Color To Blue
  GL.Vertex3f( 1.0, 1.0,-1.0)             # Top Right Of The Quad (Top)
  GL.Vertex3f(-1.0, 1.0,-1.0)             # Top Left Of The Quad (Top)
  GL.Vertex3f(-1.0, 1.0, 1.0)             # Bottom Left Of The Quad (Top)
  GL.Vertex3f( 1.0, 1.0, 1.0)             # Bottom Right Of The Quad (Top)

  # bottom of cube
  GL.Color3f(1.0,0.5,0.0)             	# Set The Color To Orange
  GL.Vertex3f( 1.0,-1.0, 1.0)             # Top Right Of The Quad (Bottom)
  GL.Vertex3f(-1.0,-1.0, 1.0)             # Top Left Of The Quad (Bottom)
  GL.Vertex3f(-1.0,-1.0,-1.0)             # Bottom Left Of The Quad (Bottom)
  GL.Vertex3f( 1.0,-1.0,-1.0)             # Bottom Right Of The Quad (Bottom)

  # front of cube
  GL.Color3f(1.0,0.0,0.0)             	# Set The Color To Red
  GL.Vertex3f( 1.0, 1.0, 1.0)             # Top Right Of The Quad (Front)
  GL.Vertex3f(-1.0, 1.0, 1.0)             # Top Left Of The Quad (Front)
  GL.Vertex3f(-1.0,-1.0, 1.0)             # Bottom Left Of The Quad (Front)
  GL.Vertex3f( 1.0,-1.0, 1.0)             # Bottom Right Of The Quad (Front)

  # back of cube.
  GL.Color3f(1.0,1.0,0.0)             	# Set The Color To Yellow
  GL.Vertex3f( 1.0,-1.0,-1.0)             # Top Right Of The Quad (Back)
  GL.Vertex3f(-1.0,-1.0,-1.0)             # Top Left Of The Quad (Back)
  GL.Vertex3f(-1.0, 1.0,-1.0)             # Bottom Left Of The Quad (Back)
  GL.Vertex3f( 1.0, 1.0,-1.0)             # Bottom Right Of The Quad (Back)

  # left of cube
  GL.Color3f(0.0,0.0,1.0)             	# Blue
  GL.Vertex3f(-1.0, 1.0, 1.0)             # Top Right Of The Quad (Left)
  GL.Vertex3f(-1.0, 1.0,-1.0)             # Top Left Of The Quad (Left)
  GL.Vertex3f(-1.0,-1.0,-1.0)             # Bottom Left Of The Quad (Left)
  GL.Vertex3f(-1.0,-1.0, 1.0)             # Bottom Right Of The Quad (Left)

  # Right of cube
  GL.Color3f(1.0,0.0,1.0)             	# Set The Color To Violet
  GL.Vertex3f( 1.0, 1.0,-1.0);	          # Top Right Of The Quad (Right)
  GL.Vertex3f( 1.0, 1.0, 1.0)             # Top Left Of The Quad (Right)
  GL.Vertex3f( 1.0,-1.0, 1.0)             # Bottom Left Of The Quad (Right)
  GL.Vertex3f( 1.0,-1.0,-1.0)             # Bottom Right Of The Quad (Right)
  GL.End();                               # done with the polygon

  $x=$x+1.0                      # Decrease the rotation variable for 
  $y=$y-1.0
  $z=$z+2.0
  GLUT.SwapBuffers();
}

#Rotation angle for the quadrilateral.
$x=0.0
$y=0.0
$z=0.0

GLUT.Init
GLUT.InitDisplayMode(GLUT::RGBA|GLUT::DOUBLE|GLUT::ALPHA|GLUT::DEPTH)
GLUT.InitWindowSize(640,480)
GLUT.InitWindowPosition(0,0)
$window=GLUT.CreateWindow("GL Box")
GLUT.DisplayFunc(DrawGLScene)
#GLUT.FullScreen()
GLUT.IdleFunc(DrawGLScene)
GLUT.ReshapeFunc(ReSizeGLScene)
InitGL(640, 480)

GLUT.MainLoop()
