HaxeFlixel_extensions
=====================

Demos of how to implement basic extensions for haxeflixel android and iOS (Admob, Chartboost, IAP, Gestures, Facebook,Gamecenter, Googleplayservices))

-------------------------------------

 This includes demos on how to integrate the following extensions for haxeflixel 3.2.2 and openfl 1.2.0, for android and iOS
Some of the extensions(Gestures, Facebook, Google Play services ) for android will not work if you update openfl due to this bug:

https://github.com/openfl/openfl-native/issues/216

Extensions used:

1. Admob:                     https://github.com/mkorman9/admob-openfl
2. Chartboost                   http://fugocode.blogspot.ro/2013/04/integrating-chartboost-with-haxe-nme.html
3. Google Play services:       https://github.com/hyperfiction/HypPlay_services
4. Facebook                     https://github.com/hyperfiction/HypFacebook
5. Gestures:                    https://github.com/shoebox/HyperTouch
6. In App Purchase:             https://github.com/openfl/iap
7. Gamecenter                     https://github.com/openfl/gamecenter

My wish list but unable to find or implement:

8. Twitter
9. PushWoosh(or other good push notification service)
10. Cloudsave 


In iOS you can easy make a project that contains all extensions. This is how the demo is here but with some code commented out

In android there are some extensions that require changes to mainactivity.java.
If you want to use multiple extension you need to merge the contains of mainactivity into on file.

You need to replace my com.paala.testhaxe to your reversedns, replace facebook game id,in app purchase key,path to certificate and password etc in project.xml, and in MenuState.hx 


For android you need for some projects to replace main activity from:
C:\HaxeToolkit\haxe\openfl\lime\openfl-native\1,2,0\templates\android

with the ones provided in !!main activitys folder



INFO:

1. To install the enviroment to work with these extensions you need to rename your c:Haxetoolkit to haxe_3.1.3
then install haxe3.0.1 and all this libraries:
C:\Users\mihai.morosanu>haxelib list
actuate: [1.7.3]
flixel: [3.2.2]
googleiap: git [dev:C:\HaxeToolkit\haxe\openfl\lime/googleiap/git]
googleplay: git [dev:C:\HaxeToolkit\haxe\openfl\lime/googleplay/git]
hxcpp: [3.1.30]
hxlibc: [1.1.4]
hxtools: [1.1.6]
inthebox-macros: [1.0.4] haxelib.json include.nmml LICENSE readme.md src
lime: [0.9.4] 0.9.9
lime-tools: [1.2.3] 1.5.3
openfl: 1.1.0 [1.2.0]
openfl-native: [1.2.0]

Known issues:

Charboost no more app on iOS



  
