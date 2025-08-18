# Hyperswitch SDK React Native (TurboModule)

[![npm version](https://badge.fury.io/js/react-native-hyperswitch-turbo.svg)](https://badge.fury.io/js/react-native-hyperswitch-turbo)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern TurboModule implementation of the Hyperswitch SDK for React Native, built for React Native's New Architecture with improved performance and type safety.

## Features

✅ **React Native New Architecture Support** - Built with TurboModules for better performance  
✅ **Complete Feature Parity** - All payment methods and features from the legacy SDK  
✅ **Type Safety** - Written in ReScript with generated TypeScript interfaces  
✅ **Cross Platform** - iOS and Android support  
✅ **Headless Payments** - Support for headless payment flows  
✅ **Saved Payment Methods** - Customer payment method management  
✅ **Payment Sheets** - Native payment sheet UI  

## Installation

```bash
npm install react-native-hyperswitch-turbo
# or
yarn add react-native-hyperswitch-turbo
```

### iOS Setup

```bash
cd ios && pod install
```

### Android Setup

No additional setup required for Android.

## Usage

### Basic Setup

```tsx
import React from 'react';
import { HyperProvider } from 'react-native-hyperswitch-turbo';
import PaymentScreen from './PaymentScreen';

export default function App() {
  return (
    <HyperProvider publishableKey="your_publishable_key">
      <PaymentScreen />
    </HyperProvider>
  );
}
```

### Payment Sheet

```tsx
import React from 'react';
import { useHyper } from 'react-native-hyperswitch-turbo';

export default function PaymentScreen() {
  const { initPaymentSession, presentPaymentSheet } = useHyper();

  const handlePayment = async () => {
    try {
      // Initialize payment session
      const sessionParams = await initPaymentSession({
        clientSecret: 'your_client_secret',
        merchantDisplayName: 'Your Store',
      });

      // Present payment sheet
      const result = await presentPaymentSheet(sessionParams);
      console.log('Payment result:', result);
    } catch (error) {
      console.error('Payment failed:', error);
    }
  };

  return (
    <Button title="Pay Now" onPress={handlePayment} />
  );
}
```

### Headless Payments

```tsx
import React from 'react';
import { useHyper } from 'react-native-hyperswitch-turbo';

export default function HeadlessPayment() {
  const {
    initPaymentSession,
    getCustomerSavedPaymentMethods,
    confirmWithCustomerDefaultPaymentMethod,
  } = useHyper();

  const handleHeadlessPayment = async () => {
    try {
      // Initialize session
      const sessionParams = await initPaymentSession({
        clientSecret: 'your_client_secret',
        customerId: 'customer_id',
        customerEphemeralKeySecret: 'ephemeral_key',
      });

      // Get saved payment methods
      await getCustomerSavedPaymentMethods(sessionParams);

      // Confirm payment with default method
      const result = await confirmWithCustomerDefaultPaymentMethod({
        sessionParams,
        cvc: '123', // Optional
      });

      console.log('Headless payment result:', result);
    } catch (error) {
      console.error('Headless payment failed:', error);
    }
  };

  return (
    <Button title="Pay with Saved Method" onPress={handleHeadlessPayment} />
  );
}
```

## API Reference

### HyperProvider

The main provider component that manages configuration.

```tsx
interface HyperProviderProps {
  children: React.ReactNode;
  publishableKey: string;
  customBackendUrl?: string;
}
```

### useHyper Hook

The main hook that provides all payment functionality.

```tsx
interface UseHyperReturn {
  // Session Management
  initPaymentSession: (params: InitPaymentSheetParams) => Promise<SessionParams>;
  
  // Payment Sheet
  presentPaymentSheet: (params: SessionParams) => Promise<PaymentResult>;
  
  // Customer Methods
  getCustomerSavedPaymentMethods: (params: SessionParams) => Promise<SessionParams>;
  getCustomerDefaultSavedPaymentMethodData: (params: SessionParams) => Promise<PaymentMethod>;
  getCustomerLastUsedPaymentMethodData: (params: SessionParams) => Promise<PaymentMethod>;
  getCustomerSavedPaymentMethodData: (params: SessionParams) => Promise<PaymentMethod[]>;
  
  // Headless Payments
  confirmWithCustomerDefaultPaymentMethod: (args: ConfirmPaymentArgs) => Promise<PaymentResult>;
  confirmWithCustomerLastUsedPaymentMethod: (args: ConfirmPaymentArgs) => Promise<PaymentResult>;
  confirmWithCustomerPaymentToken: (args: ConfirmTokenArgs) => Promise<PaymentResult>;
}
```

### Type Definitions

```tsx
interface SessionParams {
  publishableKey: string;
  clientSecret: string;
  configuration?: PaymentConfiguration;
  customBackendUrl?: string;
  type: string;
  from: string;
  branding?: string;
  locale?: string;
}

interface PaymentConfiguration {
  merchantDisplayName?: string;
  customerId?: string;
  customerEphemeralKeySecret?: string;
  appearance?: AppearanceConfig;
  defaultBillingDetails?: AddressDetails;
  // ... other configuration options
}

interface PaymentResult {
  type: 'completed' | 'canceled' | 'failed';
  message: string;
  code?: string;
  status?: string;
}
```

## Migration from Legacy SDK

If you're migrating from `hyperswitch-sdk-react-native`, the API is **100% compatible**. Simply update your imports:

```tsx
// Before
import { HyperProvider, useHyper } from 'hyperswitch-sdk-react-native';

// After  
import { HyperProvider, useHyper } from 'react-native-hyperswitch-turbo';
```

## New Architecture vs Old Architecture

This TurboModule automatically detects and works with both:

- **New Architecture (Fabric + TurboModules)** - Full TurboModule implementation
- **Old Architecture (Paper + Native Modules)** - Automatic fallback

## Performance Benefits

- **Faster Initialization** - Direct JSI bindings eliminate bridge overhead
- **Type Safety** - Compile-time type checking with codegen
- **Memory Efficient** - Reduced memory footprint compared to legacy bridge
- **Future Proof** - Aligned with React Native's roadmap

## Platform Support

| Platform | Support |
|----------|---------|
| iOS      | ✅ iOS 11+ |
| Android  | ✅ API 21+ |

## Requirements

| Requirement | Version |
|-------------|---------|
| React Native | ≥ 0.68.0 |
| iOS | ≥ 11.0 |
| Android | ≥ API 21 |

## Troubleshooting

### Common Issues

**1. Module not found errors**
```bash
# Clean and rebuild
npx react-native clean
npx react-native start --reset-cache
```

**2. iOS build issues**
```bash
cd ios
rm -rf Pods Podfile.lock
pod install
```

**3. Android build issues**
```bash
cd android
./gradlew clean
cd ..
npx react-native run-android
```

## Development

### Building from Source

```bash
# Clone the repository
git clone https://github.com/juspay/hyperswitch-sdk-react-native.git
cd hyperswitch-sdk-react-native/hyperswitch-turbo

# Install dependencies
yarn install

# Build ReScript files
yarn re:build

# Build the library
yarn prepare
```

### Running the Example

```bash
# Install example dependencies
yarn example install

# iOS
yarn example ios

# Android
yarn example android
```

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

## License

MIT License. See [LICENSE](../LICENSE) for details.

## Support

- 📧 [Email Support](mailto:support@hyperswitch.io)
- 📚 [Documentation](https://docs.hyperswitch.io)
- 🐛 [Issue Tracker](https://github.com/juspay/hyperswitch-sdk-react-native/issues)

---

**Built with ❤️ by the Hyperswitch Team**
