type jsonFunWithCallback = (Js.Json.t, Js.Dict.t<Js.Json.t> => unit) => unit
type strFunWithCallback = (Js.Json.t, option<string>, Js.Dict.t<Js.Json.t> => unit) => unit
type strFun2WithCallback = (Js.Json.t, option<string>, string, Js.Dict.t<Js.Json.t> => unit) => unit

// Import the TurboModule
@module("../NativeHyperswitchTurbo")
external nativeHyperswitchTurbo: {
  "initPaymentSession": (Js.Json.t, Js.Json.t => unit) => unit,
  "presentPaymentSheet": (Js.Json.t, Js.Json.t => unit) => unit,
  "getCustomerSavedPaymentMethods": (Js.Json.t, Js.Json.t => unit) => unit,
  "getCustomerDefaultSavedPaymentMethodData": (Js.Json.t, Js.Json.t => unit) => unit,
  "getCustomerLastUsedPaymentMethodData": (Js.Json.t, Js.Json.t => unit) => unit,
  "getCustomerSavedPaymentMethodData": (Js.Json.t, Js.Json.t => unit) => unit,
  "confirmWithCustomerDefaultPaymentMethod": (Js.Json.t, option<string>, Js.Json.t => unit) => unit,
  "confirmWithCustomerLastUsedPaymentMethod": (Js.Json.t, option<string>, Js.Json.t => unit) => unit,
  "confirmWithCustomerPaymentToken": (Js.Json.t, string, option<string>, Js.Json.t => unit) => unit,
  "exitPaymentsheet": (int, string, bool) => unit,
  "sendMessageToNative": option<string> => unit,
  "launchGPay": (string, Js.Json.t => unit) => unit,
  "exitCardForm": string => unit,
  "addListener": string => unit,
  "removeListeners": int => unit,
} = "default"

let initPaymentSession = (requestObj: Js.Json.t, callback) => {
  nativeHyperswitchTurbo["initPaymentSession"](requestObj, result => {
    // React Native callbacks return JS objects directly, not JSON strings
    callback(result)
  })
}

let getCustomerSavedPaymentMethods = (requestObj: Js.Json.t, callback) => {
  nativeHyperswitchTurbo["getCustomerSavedPaymentMethods"](requestObj, result => {
    callback(result)
  })
}

let presentPaymentSheet = (requestObj: Js.Json.t, callback) => {
  nativeHyperswitchTurbo["presentPaymentSheet"](requestObj, result => {
    callback(result)
  })
}

let getCustomerDefaultSavedPaymentMethodData = (requestObj: Js.Json.t, callback) => {
  nativeHyperswitchTurbo["getCustomerDefaultSavedPaymentMethodData"](requestObj, result => {
    callback(result)
  })
}

let getCustomerLastUsedPaymentMethodData = (requestObj: Js.Json.t, callback) => {
  nativeHyperswitchTurbo["getCustomerLastUsedPaymentMethodData"](requestObj, result => {
    callback(result)
  })
}

let getCustomerSavedPaymentMethodData = (requestObj: Js.Json.t, callback) => {
  nativeHyperswitchTurbo["getCustomerSavedPaymentMethodData"](requestObj, result => {
    callback(result)
  })
}

let confirmWithCustomerDefaultPaymentMethod = (
  requestObj: Js.Json.t,
  cvc: option<string>,
  callback,
) => {
  nativeHyperswitchTurbo["confirmWithCustomerDefaultPaymentMethod"](requestObj, cvc, result => {
    callback(result)
  })
}

let confirmWithCustomerLastUsedPaymentMethod = (
  requestObj: Js.Json.t,
  cvc: option<string>,
  callback,
) => {
  nativeHyperswitchTurbo["confirmWithCustomerLastUsedPaymentMethod"](requestObj, cvc, result => {
    callback(result)
  })
}

let confirmWithCustomerPaymentToken = (
  requestObj: Js.Json.t,
  cvc: option<string>,
  paymentToken: string,
  callback,
) => {
  nativeHyperswitchTurbo["confirmWithCustomerPaymentToken"](requestObj, paymentToken, cvc, result => {
    callback(result)
  })
}

let exitPaymentsheet = (rootTag: int, paymentResult: string, reset: bool) => {
  nativeHyperswitchTurbo["exitPaymentsheet"](rootTag, paymentResult, reset)
}

let sendMessageToNative = (message: option<string>) => {
  nativeHyperswitchTurbo["sendMessageToNative"](message)
}

let launchGPay = (gPayRequest: string, callback) => {
  nativeHyperswitchTurbo["launchGPay"](gPayRequest, result => {
    callback(result)
  })
}

let exitCardForm = (paymentResult: string) => {
  nativeHyperswitchTurbo["exitCardForm"](paymentResult)
}

let addListener = (eventName: string) => {
  nativeHyperswitchTurbo["addListener"](eventName)
}

let removeListeners = (count: int) => {
  nativeHyperswitchTurbo["removeListeners"](count)
}
