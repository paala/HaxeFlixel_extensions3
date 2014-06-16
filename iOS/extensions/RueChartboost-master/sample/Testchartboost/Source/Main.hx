package;


import flash.display.Sprite;
import motion.Actuate;
import motion.MotionPath;
import motion.actuators.FilterActuator;
import motion.actuators.GenericActuator;
import motion.actuators.MethodActuator;
import motion.actuators.MotionPathActuator;
import motion.actuators.PropertyDetails;
import motion.actuators.SimpleActuator;
import motion.actuators.TransformActuator;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.IEasing;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

#if (android || ios)

import extension.haxeChartboost.HaxeChartboost;

#end


class Main extends Sprite 
{
	public function new () {
		
		super ();
		
		#if android
		Actuate.timer(3.0).onComplete(DoThisAfterABit);
		#end
		
		
		#if ios
		HaxeChartboost.init("Add your ios app id here", "Add your ios app signature here");
		Actuate.timer(3.0).onComplete(DoThisAfterABit);
		#end
		
	}
	
	private function DoThisAfterABit():Void
	{
		HaxeChartboost.OpenIntersetial(); //this function call shows an add on the screen
	}
	
	
}