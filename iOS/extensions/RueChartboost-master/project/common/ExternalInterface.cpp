#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "cb.h"


using namespace ruechartboost;

#ifdef IPHONE

value cb_init(value id, value appSignature)
{
    cbInit(val_string(id), val_string(appSignature));
    return alloc_null();
}
DEFINE_PRIM(cb_init, 2);


value cb_show_interstitial()
{
    cbShowInterstitial();
    return alloc_null();
}
DEFINE_PRIM(cb_show_interstitial, 0);

value cb_show_more_apps(){
        
        cbShowMoreApps();
        return alloc_null();
}
DEFINE_PRIM(cb_show_more_apps, 1);

#endif


extern "C" void ruechartboost_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (ruechartboost_main);



extern "C" int ruechartboost_register_prims () { return 0; }