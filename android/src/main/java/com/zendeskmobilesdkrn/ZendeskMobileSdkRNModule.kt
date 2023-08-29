package com.zendeskmobilesdkrn

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

import android.util.Log;

import zendesk.core.AnonymousIdentity
import zendesk.core.Zendesk
import zendesk.support.guide.HelpCenterActivity
import zendesk.support.Support

class ZendeskMobileSdkRNModule(val reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  @ReactMethod
  fun initZendesk(zendeskUrl: String, appId: String, clientId: String) {
    Zendesk.INSTANCE.init(this.reactContext, zendeskUrl, appId, clientId);
    Support.INSTANCE.init(Zendesk.INSTANCE);
    Zendesk.INSTANCE.setIdentity(AnonymousIdentity())
  } 

  @ReactMethod
  fun showHelpCenter(){
    val activity = getCurrentActivity();
    if (activity != null) {
      HelpCenterActivity.builder().show(activity)
    } else {
      Log.e("Zendesk: Help Center", "Could not load getCurrentActivity -- no UI can be displayed without it.");
    }
  } 

  companion object {
    const val NAME = "ZendeskMobileSdkRN"
  }
}
