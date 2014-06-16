package fr.hyperfiction.hypertouch.gestures;

import android.util.Log;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.SimpleOnScaleGestureListener;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.GestureDetector;
import android.view.View;
import org.haxe.lime.GameActivity;
import fr.hyperfiction.hypertouch.HyperTouch;

/**
 * Thanks to http://www.blackmoonit.com/2010/07/gesture-swipe-detection/
 * @author shoe[box]
 */

class GesturePinch extends ScaleGestureDetector.SimpleOnScaleGestureListener implements View.OnTouchListener {

	private static String TAG = "HyperTouch";

	final private ScaleGestureDetector oPinchGesture;
	
	static public native void onPinch( 
											int iPhase,
											float dx , 
											float dy , 
											float scaleX,
											float scaleY,
											float focusX,
											float focusY
										);
	static {
		System.loadLibrary( "hypertouch" ); 
	}
	

	// -------o constructor
		
		/**
		* constructor
		*
		* @param	
		* @return	void
		*/
		public GesturePinch( ){
			super( );
			Log.i( TAG , "constructor" );
			oPinchGesture = new ScaleGestureDetector( GameActivity.getInstance( ) , this );
			HyperTouch.getInstance( ).add_gesture( this );
		}
	
	// -------o public

		/**
		* 
		* 
		* @public
		* @return	void
		*/
		public boolean onScaleBegin( ScaleGestureDetector d ) {
			try {
				HyperTouch.mSurface.queueEvent(
				new Runnable(){
	                public void run() { 
						onPinch( 
								0,
								oPinchGesture.getCurrentSpan( ) - oPinchGesture.getPreviousSpan( ),
								oPinchGesture.getCurrentSpan( ) - oPinchGesture.getPreviousSpan( ),
								oPinchGesture.getScaleFactor( ),
								oPinchGesture.getScaleFactor( ),
								oPinchGesture.getFocusX(),
								oPinchGesture.getFocusY()
							);
					}
				});
			} catch (Exception e) {
				Log.i( TAG , "onScaleBegin error : "+e );
			}
			return true;
		}

	// -------o public

		/**
		* 
		* 
		* @public
		* @return	void
		*/
		public boolean onScale( ScaleGestureDetector d ) {
			// Log.i( TAG , "oPinchGesture.getFocusX() : " + oPinchGesture.getFocusX() );
			try {
				HyperTouch.mSurface.queueEvent(
				new Runnable(){
	                public void run() { 
						onPinch( 
								1,
								oPinchGesture.getCurrentSpan( ) - oPinchGesture.getPreviousSpan( ),
								oPinchGesture.getCurrentSpan( ) - oPinchGesture.getPreviousSpan( ),
								oPinchGesture.getScaleFactor( ),
								oPinchGesture.getScaleFactor( ),
								oPinchGesture.getFocusX(),
								oPinchGesture.getFocusY()
							);
					}
				});
			} catch (Exception e) {
				Log.i( TAG , "onScale error : "+e );
			}
			return false;
		}

		/**
		* 
		* 
		* @public
		* @return	void
		*/
		public void onScaleEnd( ScaleGestureDetector d ) {
			try {
				HyperTouch.mSurface.queueEvent(
				new Runnable(){
	                public void run() { 
						onPinch( 
								2,
								oPinchGesture.getCurrentSpan( ) - oPinchGesture.getPreviousSpan( ),
								oPinchGesture.getCurrentSpan( ) - oPinchGesture.getPreviousSpan( ),
								oPinchGesture.getScaleFactor( ),
								oPinchGesture.getScaleFactor( ),
								oPinchGesture.getFocusX(),
								oPinchGesture.getFocusY()
							);
					}
				});
			} catch (Exception e) {
				Log.i( TAG , "onScaleEnd error : "+e );
			}
		}		

		/**
		* 
		* 
		* @public
		* @return	void
		*/
		@Override
		public boolean onTouch( View v , MotionEvent e ) {
			oPinchGesture.onTouchEvent( e );
			return false;
		}
		
	// -------o protected

	// -------o misc
		
		/**
		* 
		* 
		* @public
		* @return	void
		*/
		static public void trace( String s ){
			Log.i( TAG , s );
		}

		/**
		* 
		* 
		* @public
		* @return	void
		*/
		public static GesturePinch getInstance( ){	
			return new GesturePinch( );
		}

}