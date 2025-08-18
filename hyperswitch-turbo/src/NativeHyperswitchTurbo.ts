import { NativeModules } from 'react-native';

export interface Spec {
  // Example method (required for template)
  multiply(a: number, b: number, callback: (result: number) => void): void;
  
  // Session Management
  initPaymentSession(request: Object, callback: (result: any) => void): void;
  
  // Payment Sheet - using callback for old architecture
  presentPaymentSheet(request: Object, callback: (result: any) => void): void;
  
  // Customer Saved Payment Methods
  getCustomerSavedPaymentMethods(request: Object, callback: (result: any) => void): void;
  getCustomerDefaultSavedPaymentMethodData(request: Object, callback: (result: any) => void): void;
  getCustomerLastUsedPaymentMethodData(request: Object, callback: (result: any) => void): void;
  getCustomerSavedPaymentMethodData(request: Object, callback: (result: any) => void): void;
  
  // Headless Payment Confirmations
  confirmWithCustomerDefaultPaymentMethod(
    request: Object, 
    cvc: string | null,
    callback: (result: any) => void
  ): void;
  confirmWithCustomerLastUsedPaymentMethod(
    request: Object, 
    cvc: string | null,
    callback: (result: any) => void
  ): void;
  confirmWithCustomerPaymentToken(
    request: Object, 
    paymentToken: string,
    cvc: string | null,
    callback: (result: any) => void
  ): void;
  
  // Utility methods
  exitPaymentsheet(rootTag: number, paymentResult: string, reset: boolean): void;
  sendMessageToNative(message?: string): void;
  launchGPay(gPayRequest: string, callback: (result: any) => void): void;
  exitCardForm(paymentResult: string): void;
  
  // Event listeners
  addListener(eventName: string): void;
  removeListeners(count: number): void;
}

// For old architecture, use NativeModules
const HyperswitchTurbo = NativeModules.HyperswitchTurbo as Spec;

export default HyperswitchTurbo;
