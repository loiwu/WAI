# SKMapsCenter
Maps (iOS, Swift) - maintain center while zooming.  

Developed due to not being able to maintain the center position of a given location while zooming.  
Scrolling while zooming can't be bypassed using the current Maps API.
Therefore, I've used an UIView on top of Maps to intercept pinch gestures, which is then used to animate the correct region.
All default gestures has been added to the UIView in order to simulate the exact same user experience as with Maps.

Left: Demo screen  
Right: An example of context. User can increase/decrease (zoom out/in) the distance range used while searching.

![alt tag](/Image.png)
