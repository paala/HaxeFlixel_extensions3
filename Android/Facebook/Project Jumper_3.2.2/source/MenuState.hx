package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxStringUtil;
import fr.hyperfiction.HypFacebook;
import fr.hyperfiction.*;
/**
 * ...
 * @author David Bell
 */
class MenuState extends FlxState 
{
	// How many menu options there are.
	public static inline var OPTIONS:Int = 3;
	public static inline var TEXT_SPEED:Float = 600;
	
	// Augh, so many text objects. I should make arrays.
	private var _text1:FlxText;
	private var _text2:FlxText;
	private var _text3:FlxText;
	private var _text4:FlxText;
	private var _text5:FlxText;  
	private var buton1:FlxButton;
	private var buton2:FlxButton;
	private var buton3:FlxButton;
	private var fbpermissionarray:Array<String>;//=["publish_actions"];
	private var fbpermissionarrayread:Array<String>;//=["publish_actions"];
	private var _pointer:FlxSprite;
	
	// This will indicate what the pointer is pointing at
	private var _option:Int;  
	
	private  var fb  : HypFacebook;
	
	override public function create():Void 
	{
		fbpermissionarray = ["publish_actions"];
		fbpermissionarrayread=["email"];
		FlxG.mouse.visible = false;
		FlxG.state.bgColor = 0xFF101414;
		buton1 = new FlxButton(100, 100, "share", onbuton1);
		add(buton1);
		buton2 = new FlxButton(300, 300, "request permission", onbuton2);
		add(buton2);
		buton3 = new FlxButton(400, 400, "read", onbuton3);
		add(buton3);
		// Each word is its own object so we can position them independantly
		_text1 = new FlxText( -220, FlxG.height / 4, 320, "Project");
		_text1.moves = true;
		_text1.size = 40;
		_text1.color = 0xFFFF00;
		_text1.antialiasing = true;
		_text1.velocity.x = TEXT_SPEED;
		add(_text1);
		
		// Base everything off of text1, so if we change color or size, only have to change one
		_text2 = new FlxText(FlxG.width - 50, FlxG.height / 2.5, 320, "Jumper");
		_text2.moves = true;
		_text2.size = _text1.size;
		_text2.color = _text1.color;
		_text2.antialiasing = _text1.antialiasing;
		_text2.velocity.x = - TEXT_SPEED;
		add(_text2);
		
		// Set up the menu options
		_text3 = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3, 150, "Play");
		_text4 = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3 + 30, 150, "Visit NIWID");
		_text5 = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3 + 60, 150, "Visit flixel.org");
		_text3.color = _text4.color = _text5.color = 0xAAFFFF00;
		_text3.size = _text4.size = _text5.size = 16;
		_text3.antialiasing = _text4.antialiasing = _text5.antialiasing = true;
		add(_text3);
		add(_text4);
		add(_text5);
		
		_pointer = new FlxSprite();
		_pointer.loadGraphic("assets/art/pointer.png");
		_pointer.x = _text3.x - _pointer.width - 10;
		add(_pointer);
		_option = 0;
		trace("facebook inainte de connect");
		fb = new HypFacebook( "1420285291578270" );
		connectToFacebook( );
		
		super.create();
	}
	
	override public function update():Void 
	{
		if (FlxG.mouse.wheel != 0)
		{
			FlxG.camera.zoom += (FlxG.mouse.wheel / 10);
		}
		
		// Stop the texts when they reach their designated position
		if (_text1.x > FlxG.width / 5)	
		{
			_text1.velocity.x = 0;
		}
		
		if (_text2.x < FlxG.width / 2.5) 
		{
			_text2.velocity.x = 0;
		}
		
		// this is the goofus way to do it. An array would be way better
		switch(_option)    
		{
			case 0:
				_pointer.y = _text3.y;
			case 1:
				_pointer.y = _text4.y;
			case 2:
				_pointer.y = _text5.y;
		}
		
		if (FlxG.keys.justPressed.UP)
		{
			// A goofy format, because % doesn't work on negative numbers
			_option = (_option + OPTIONS - 1) % OPTIONS; 
			FlxG.sound.play("assets/sounds/menu" + Reg.SoundExtension, 1, false);
		}
		
		if (FlxG.keys.justPressed.DOWN)
		{
			_option = (_option + OPTIONS + 1) % OPTIONS;
			FlxG.sound.play("assets/sounds/menu" + Reg.SoundExtension, 1, false);
		}
		
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER", "C"]))
		{
			switch (_option) 
			{
				case 0:
					FlxG.cameras.fade(0xff969867, 1, false, startGame);
					FlxG.sound.play("assets/sounds/coin" + Reg.SoundExtension, 1, false);
				case 1:
					FlxG.openURL("http://chipacabra.blogspot.com");
				case 2:
					FlxG.openURL("http://flixel.org");
			}
		}
		
		super.update();
	}
	
	private function onbuton1():Void {
		//fb.call( DIALOG( "share" ) );
		 var h = new Map( );
        //h.set( "message" , "Test Request");
        //h.set( "to" , "<fb user id>");
       // fb.call( REQUEST_DIALOG( h ) );
	   
	 //  var h = new Hash<String>( );
        h.set("name","Facebook extension for NME");
        h.set("caption","Build great social apps and get more installs with Haxe/NME.");
        h.set("description","The Facebook extension for NME makes it easier and faster to develop Facebook integrated apps build with Haxe");
        h.set("link","http://www.nme.io");
        h.set("picture","https://raw.github.com/fbsamples/ios-3.x-howtos/master/Images/iossdk_logo.png");
        fb.call( FEED_DIALOG( h ) );
		
		
		//function graphApi( ) : Void {
       // var h = new Hash<String>( );
        h.set( "score", "42" );
        fb.call( GRAPH_REQUEST("/<fb user id>/scores", h ,POST) );
   // }
		
	}
	private function onbuton2():Void {
		//fb.connectForRead(true,fbpermissionarrayread);
		//fb.connectForPublish(true, fbpermissionarray);
		//fb.connectForRead(true,fbpermissionarrayread);
		//fb.requestNew_read_permissions( ["user_about_me"] );
		var h = new Map( );
		h.set( "score", "42" );
        fb.call( GRAPH_REQUEST("/852126308150852/scores", h ,POST) );
		
	}
	
	private function onbuton3():Void {
		 //fb.requestNew_read_permissions( ["publish_actions"] );
		//fb.connectForRead(true,fbpermissionarrayread);
		//fb.connectForPublish(true, fbpermissionarray);
		//fb.requestNew_publish_permissions(fbpermissionarray);
		connectToFacebook( );
	}
	    function connectToFacebook( ) : Void {
           // fb = new HypFacebook( "1420285291578270" );
            var session_is_valid = fb.connect( false ); // false to disallow login UI
	//}
	

            if( session_is_valid ) {
                _doFacebookStuff( );
            } else {
                fb.addEventListener( HypFacebookEvent.OPENED, _onFbOpened );
                fb.connect( true ); // true to allow login UI
				
            }
        }

    function _onFbOpened( _ ) {
            fb.removeEventListener( HypFacebookEvent.OPENED, _onFbOpened );
            _doFacebookStuff( );
        }

    function _doFacebookStuff( ) {
            fb.addEventListener( HypFacebookRequestEvent.GRAPH_REQUEST_RESULTS, _onGraphResults );
            fb.call( GRAPH_REQUEST("/me") );
			trace("facebook, ajunge aici");
			  fb.requestNew_publish_permissions( ["publish_actions"] );
			  fb.call( GRAPH_REQUEST("/me") );
        }

    function _onGraphResults( event : HypFacebookRequestEvent ) : Void {
        trace( 'sResult:'+event.sResult );//here you find your user id specific to app
    }


	
	
	
	private function startGame():Void
	{
		FlxG.switchState(new PlayState());
	}
}