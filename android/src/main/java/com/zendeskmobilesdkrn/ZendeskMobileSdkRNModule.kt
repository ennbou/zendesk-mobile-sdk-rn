package com.zendeskmobilesdkrn

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

import android.util.Log;

import zendesk.core.AnonymousIdentity
import zendesk.core.Zendesk
import zendesk.core.JwtIdentity
import zendesk.support.guide.HelpCenterActivity
import zendesk.support.Support
import zendesk.support.requestlist.RequestListActivity
import zendesk.support.guide.ArticleConfiguration
import zendesk.support.guide.HelpCenterConfiguration

class ZendeskMobileSdkRNModule(val reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  @ReactMethod
  fun initZendeskAnonymous(zendeskUrl: String, appId: String, clientId: String) {
    Zendesk.INSTANCE.init(this.reactContext, zendeskUrl, appId, clientId);
    Support.INSTANCE.init(Zendesk.INSTANCE);
    Zendesk.INSTANCE.setIdentity(AnonymousIdentity())    
  }

  @ReactMethod
  fun initZendeskJwt(zendeskUrl: String, appId: String, clientId: String, jwt: String) {
    Zendesk.INSTANCE.init(this.reactContext, zendeskUrl, appId, clientId);
    Support.INSTANCE.init(Zendesk.INSTANCE);
    Zendesk.INSTANCE.setIdentity(JwtIdentity(jwt))    
  }

  @ReactMethod
  fun showHelpCenter(isAuth: Boolean){
    val activity = getCurrentActivity();
    if (activity != null) {
      val helpCenterConfig = HelpCenterConfiguration.Builder()
      .withContactUsButtonVisible(isAuth)
      .withShowConversationsMenuButton(isAuth)
      .config()

      val articleConfig = ArticleConfiguration.Builder()
      .withContactUsButtonVisible(isAuth)
      .config()
      HelpCenterActivity.builder().show(activity, helpCenterConfig, articleConfig)
    } else {
      Log.e("Zendesk: Help Center", "Could not load getCurrentActivity -- no UI can be displayed without it.");
    }
  } 

  @ReactMethod
  fun showMyTickets(){
    val activity = getCurrentActivity();
    if (activity != null) {
      RequestListActivity.builder().show(activity);
    } else {
      Log.e("Zendesk: My Tickets", "Could not load getCurrentActivity -- no UI can be displayed without it.");
    }
  } 


  companion object {
    const val NAME = "ZendeskMobileSdkRN"
  }
}
