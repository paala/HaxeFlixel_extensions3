RueChartboost
=============

RueChartboost allows you to show ads using chartboost in android and ios.

For correct usage of this extension:

IOS
---

```java

#if (android || ios)
import extension.haxeChartboost.HaxeChartboost;
#end
class Main extends Sprite 
{
	public function new () 
	{
		super ();
		#if ios
		HaxeChartboost.init("Add your ios app id here", "Add your ios app signature here");
		Actuate.timer(3.0).onComplete(DoThisAfterABit);
		#end
	}
 	private function DoThisAfterABit():Void
	{
		HaxeChartboost.OpenIntersetial(); //function call shows an ad on the screen
	}
}

```

You are required to init the chartboost through your code, as soon as possible by giving it the correct information from your chartboost campaign.



Android
-------

```java

#if (android || ios)
import extension.haxeChartboost.HaxeChartboost;
#end
class Main extends Sprite 
{
	public function new () 
	{
		super ();
		#if android
		Actuate.timer(3.0).onComplete(DoThisAfterABit);
		#end
	}
 	private function DoThisAfterABit():Void
	{
		HaxeChartboost.OpenIntersetial(); //function call shows an ad on the screen
	}
}

```

Android does not require an in code initialization, but instead you are required to add the app id and the app signature from your chartboost campaign into your project.xml, like this:

```java
<setenv name="ChartboostID" value="your chartboost app id here" if="android" />

<setenv name="ChartboostSignature" value="your chartboost app signature here" if="android" />
```

The rest is handled internally through OpenFL's new extension API.