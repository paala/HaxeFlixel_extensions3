rm -rf "obj"
echo "compiling for armv6"
haxelib run hxcpp Build.xml -Diphoneos
echo "compiling for armv7"
haxelib run hxcpp Build.xml -Diphoneos
echo "compiling for simulator"
haxelib run hxcpp Build.xml -Diphonesim 
echo "Done ! \n"
