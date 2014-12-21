AccelerationDemo
================

   Acceleration Demo is a project that can help you move the object you want to run for a length with acceleration. It only references to the principle of basic physical knowledge.


##Functionality

###Straight Line Move
The object will move on straight line with the constant acceleration.

<p align="center"><img src="https://raw.githubusercontent.com/GeneralZYQ/AccelerationDemo/master/AccelerationDemo/lineDemo.gif"/></p>

###Circle Line Move 
The object will move on the oribt of a circle.

<p align="center"><img src="https://github.com/GeneralZYQ/AccelerationDemo/blob/master/AccelerationDemo/roundDemo.gif"/></p>

###Features
You can control the value of start point , destination point and acceleration. 

##Usage

Import the class `KMAccelerationView` or `KMRoundAccelerationView` to your view controller.

And If you want your object go in straight line. Then call the method `- (void)moveFrom:(CGFloat)startingPlace to:(CGFloat)destinationPlace withAcceleration:(CGFloat)acceleration` of `KMAccelerationView`. (Parameters: startingPlace:The origin y you want your object start; destinationPlace: the y you want your object go to; acceleration: the pixels / second you want your object's speed increases per second.)

If you want your object go in circle . Call the method `- (void)moveFromPercent:(CGFloat)startPercent toPercent:(CGFloat)destinationPercent withAcceleration:(CGFloat)acceleration;` of class `KMRoundAccelerationView`. (Parameters: startPercent : the start rad as the percent you want your object start ; destinationPercent : the destination rad as percent of the object; acceleration : pixels / second you want your object to accelerte).The example above is start from 0 percent and end at 55 percent.

##Contact

Horatio Zhang

- Email: wazyq.cool@163.com

##License

Free
