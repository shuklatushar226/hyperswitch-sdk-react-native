package com.hyperswitchturbo

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.Promise
import com.facebook.react.turbomodule.core.TurboModule

abstract class HyperswitchTurboSpec internal constructor(context: ReactApplicationContext) :
  ReactContextBaseJavaModule(context), TurboModule {

  @ReactMethod
  abstract fun multiply(a: Double, b: Double, promise: Promise)

  @ReactMethod
  abstract fun initPaymentSession(request: ReadableMap, promise: Promise)

  @ReactMethod
  abstract fun presentPaymentSheet(request: ReadableMap, promise: Promise)

  @ReactMethod
  abstract fun getCustomerSavedPaymentMethods(request: ReadableMap, promise: Promise)

  @ReactMethod
  abstract fun getCustomerDefaultSavedPaymentMethodData(request: ReadableMap, promise: Promise)

  @ReactMethod
  abstract fun getCustomerLastUsedPaymentMethodData(request: ReadableMap, promise: Promise)

  @ReactMethod
  abstract fun getCustomerSavedPaymentMethodData(request: ReadableMap, promise: Promise)

  @ReactMethod
  abstract fun confirmWithCustomerDefaultPaymentMethod(request: ReadableMap, cvc: String?, promise: Promise)

  @ReactMethod
  abstract fun confirmWithCustomerLastUsedPaymentMethod(request: ReadableMap, cvc: String?, promise: Promise)

  @ReactMethod
  abstract fun confirmWithCustomerPaymentToken(request: ReadableMap, paymentToken: String, cvc: String?, promise: Promise)

  @ReactMethod
  abstract fun exitPaymentsheet(rootTag: Double, paymentResult: String, reset: Boolean)

  @ReactMethod
  abstract fun sendMessageToNative(message: String?)

  @ReactMethod
  abstract fun launchGPay(gPayRequest: String, promise: Promise)

  @ReactMethod
  abstract fun exitCardForm(paymentResult: String)

  @ReactMethod
  abstract fun addListener(eventName: String)

  @ReactMethod
  abstract fun removeListeners(count: Double)
}
