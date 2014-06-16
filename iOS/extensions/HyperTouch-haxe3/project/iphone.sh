rm -rf "obj"
echo "compiling for armv6"
haxelib run hxcpp Build.xml -Diphoneos -Ddebug
echo "compiling for armv7"
haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_ARMV7 -Ddebug
echo "compiling for simulator"
haxelib run hxcpp Build.xml -Diphonesim -Ddebug
