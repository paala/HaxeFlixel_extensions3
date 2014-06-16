#ifndef CHARTBOOSTEXT_H
#define CHARTBOOSTEXT_H


namespace ruechartboost
{
	void cbInit(const char *appId, const char *appSignature);
    void cbCacheInterstitial();
    void cbShowInterstitial();
    
    void cbCacheInterstitial(const char* location);
    void cbShowInterstitial(const char* location);
    
    void cbShowMoreApps();
}


#endif