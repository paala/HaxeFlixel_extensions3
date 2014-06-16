import flash.display.Sprite;
import fr.hyperfiction.HypFacebook;

class MainTEST extends Sprite {

    var fb  : HypFacebook;

    public function new () {
        super ();
        connectToFacebook( );
    }

    function connectToFacebook( ) : Void {
            fb = new HypFacebook( "1420285291578270" );
            var session_is_valid = fb.connect( false ); // false to disallow login UI

            if( session_is_valid ) {
                _doFacebookStuff( );
            } else {
                fb.addEventListener( HypFacebookEvent.OPENED, _onFbOpened );

                // open session with minimal read permission
                fb.connectForRead( true, ["public_profile"] ); // true to allow login UI
            }
        }

    function _onFbOpened( _ ) {
            fb.removeEventListener( HypFacebookEvent.OPENED, _onFbOpened );
            _doFacebookStuff( );
        }

    function _doFacebookStuff( ) {
            fb.addEventListener( HypFacebookRequestEvent.GRAPH_REQUEST_RESULTS, _onGraphResults );
trace("facebook before request publish");
            // you now have a valid facebook session, you can start making Graph request
            // when your application needs it, request additional permission from the user.
            fb.requestNew_publish_permissions( ["publish_actions"] );
        }

    function _onGraphResults( event : HypFacebookRequestEvent ) : Void {
        // read the result here
        trace( 'sResult:'+event.sResult );
    }

}