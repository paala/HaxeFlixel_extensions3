package org.haxe.extension.cb;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import com.chartboost.sdk.*;
import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;


public class ChartboostConnect extends Extension 
{
        private static String appID = "::ENV_ChartboostID::"; 
        private static String appSignature = "::ENV_ChartboostSignature::"; 
        
        private static Chartboost cb;
        
        @Override public void onCreate (Bundle savedInstanceState)
        {
			if(ChartboostConnect.appID == "null" || ChartboostConnect.appSignature == "null")
			{
				 Log.e("ChartboostConnect","APP ID AND/OR APP SIGNATURE HAVE NOT BEEN SET, set your app id in your project.xml file like this: <setenv name='ChartboostID' value='your id' /> <setenv name='ChartboostSignature' name='your app signature' /> ");
				return;
			}
            Log.e("ChartboostConnect", "CREATING CHARTBOOST SERVICE");
            ChartboostConnect.cb = Chartboost.sharedChartboost();
            ChartboostConnect.cb.onCreate(Extension.mainActivity, ChartboostConnect.appID, ChartboostConnect.appSignature, null);
        }
        

        @Override public void onStart()
        {
            Log.e("ChartboostConnect", "STARTING CHARTBOOST");
            ChartboostConnect.cb.onStart(Extension.mainActivity);
        
            // Notify the beginning of a user session. Must not be dependent on user actions or any prior network requests.
            ChartboostConnect.cb.startSession();
        }   
        
        @Override public void onStop() 
        {
            Log.e("ChartboostConnect", "STOPPING CHARTBOOST");
            ChartboostConnect.cb.onBackPressed();
            ChartboostConnect.cb.onStop(Extension.mainActivity);
        }
        
        @Override public void onDestroy() 
        {
            ChartboostConnect.cb.onDestroy(Extension.mainActivity);
        }
        
        public static void ShowAd()
        {
            if(ChartboostConnect.cb != null)
            {
                if(ChartboostConnect.cb.onBackPressed())
                {
                    ChartboostConnect.cb.showInterstitial(); 
                }
                else
                {
                    ChartboostConnect.cb.showInterstitial(); 
                }
            }
        }
        
        
        

        
        
        
        
        
}
