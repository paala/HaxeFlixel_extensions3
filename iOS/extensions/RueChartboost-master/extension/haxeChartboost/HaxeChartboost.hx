package extension.haxeChartboost;


import flash.events.EventDispatcher;
import flash.events.Event;
import flash.net.SharedObjectFlushStatus;
import flash.net.SharedObject;
import flash.Lib;

#if android
import openfl.utils.JNI;
#end


@:allow(extension.haxeChartboost) class HaxeChartboost 
{
	#if android
	static var ShowAdFunc;
	#end
	
	public static function OpenIntersetial():Void
	{
		#if android
		trace("ATTEMPTING TO CREATE FUNCTION FOR CHARTBOOST");
		if (ShowAdFunc == null)
		{
			ShowAdFunc = JNI.createStaticMethod("org/haxe/extension/cb/ChartboostConnect", "ShowAd", "()V");
		}
		
		Lib.postUICallback(function(){
		ShowAdFunc(); } );
		#end
		
		#if ios
		trace("ATTEMPTING TO OPEN AD FOR CHARTBOOST");
		cb_show_interstitial();
		#end
	}
	public static function Moregames():Void{
		cb_show_more_apps();
	}
	
	public static function init(appID:String, appSignature:String)
	{
		#if ios
		//"::ENV_ChartboostID::"
		cb_init(appID, appSignature);
		#end
		
		#if android
		
		#end
	}

	
	#if ios
	static var cb_init               = Lib.load("ruechartboost","cb_init",2);

	static var cb_show_interstitial  = Lib.load("ruechartboost","cb_show_interstitial", 0	);
		static var cb_show_more_apps  = Lib.load("ruechartboost","cb_show_more_apps", 1);
	#end
}
