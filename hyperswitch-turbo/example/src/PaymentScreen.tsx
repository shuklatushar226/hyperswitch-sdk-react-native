// PaymentScreen.ts

import React from 'react';
import {
  Dimensions,
  StyleSheet,
  Text,
  useColorScheme,
  View,
} from 'react-native';
import { useHyper } from 'react-native-hyperswitch-turbo';
import fetchPaymentParams from './utils/fetchPaymentParams';
import Button from './Components/Button';

const PaymentScreen = () => {
  console.log('PaymentScreen rendered');
  const hyperHook = useHyper();
  console.log('useHyper result:', hyperHook);
  const { initPaymentSession, presentPaymentSheet } = hyperHook;
  const [error, setError] = React.useState('');
  const [message, setMessage] = React.useState('');
  const [loading, setLoading] = React.useState(false);
  const [paymentSheetParams, setPaymentSheetParams] = React.useState({});
  const isDarkMode = useColorScheme() === 'dark';
  const reloadButtonText = loading ? 'Loading Session' : 'Reload Client';
  const checkOutButtonText = loading ? 'Loading...' : 'Checkout';
  const styles = isDarkMode ? darkStyles : lightStyles;

  const fetchPaymentSession = async () => {
    setLoading(true);
    try {
      setError('');
      console.log('Fetching payment params...');
      const key = await fetchPaymentParams();
      console.log('Payment params received:', key);
      console.log('Calling initPaymentSession...');
      const paymentSheetParamsResult = await initPaymentSession({
        clientSecret: key.clientSecret,
      });
      console.log('initPaymentSession result:', paymentSheetParamsResult);
      setPaymentSheetParams(paymentSheetParamsResult);
    } catch (err) {
      console.error('Error in fetchPaymentSession:', err);
      setError('Failed to load Client Secret: ' + (err as Error).message);
    }
    setLoading(false);
  };

  React.useEffect(() => {
    fetchPaymentSession();
  }, []);

  const checkout = async () => {
    console.log('=== CHECKOUT BUTTON CLICKED ===');
    setMessage('Checkout started...');
    setError('');
    
    try {
      console.log('paymentSheetParams:', paymentSheetParams);
      
      // Simple test first - just call presentPaymentSheet with minimal params
      console.log('Calling presentPaymentSheet...');
      const response = await presentPaymentSheet(paymentSheetParams);
      console.log('presentPaymentSheet response:', response);
      
      if (response && response.status) {
        switch (response.status) {
          case 'cancelled':
            setError('Payment cancelled by user.');
            setMessage('');
            break;
          case 'succeeded':
            setMessage('Payment Success.');
            setError('');
            break;
          case 'failed':
            setError('Payment failed: ' + (response.message || 'Unknown error'));
            setMessage('');
            break;
          default:
            setError('Unknown response: ' + JSON.stringify(response));
            setMessage('');
        }
      } else {
        setError('No response from payment sheet');
        setMessage('');
      }
    } catch (error) {
      console.error('Checkout error:', error);
      setError('Checkout failed: ' + (error as Error).message);
      setMessage('');
    }
  };

  return (
    <View style={defaultStyles.wrapper}>
      <Button
        disabled={loading}
        callback={fetchPaymentSession}
        buttonText={reloadButtonText}
      />
      <Button
        disabled={loading || error ? true : false}
        style={{
          opacity: loading || error ? 0.6 : 1,
        }}
        callback={checkout}
        buttonText={checkOutButtonText}
      />

      <Text style={styles.messageText}>{message}</Text>
      <Text style={styles.textView}>{error}</Text>
    </View>
  );
};
const defaultStyles = StyleSheet.create({
  wrapper: {
    width: Dimensions.get('screen').width - 50,
    height: Dimensions.get('screen').height - 50,
    gap: 20,
    alignItems: 'center',
  },
});

export default PaymentScreen;

const darkStyles = StyleSheet.create({
  messageText: {
    fontSize: 24,
    color: '#0f0',
  },
  textView: {
    color: '#FF7C7C',
    fontSize: 21,
  },
});
const lightStyles = StyleSheet.create({
  messageText: {
    fontSize: 24,
    color: '#284A2C',
  },
  textView: {
    color: '#7A4949',
    fontSize: 21,
  },
});
