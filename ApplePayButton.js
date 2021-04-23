import * as React from 'react';
import { requireNativeComponent } from 'react-native';

const RNApplePayButton = requireNativeComponent('RNApplePayButton', null, {
  nativeOnly: { onPress: true },
});

const defaultProps = {
  style: 'black',
  type: 'plain',
  width: 100,
  height: 44,
  cornerRadius: 4,
};

const ApplePayButton = props => {
  const { style, type } = props;
  return <RNApplePayButton buttonStyle={style} buttonType={type} {...props} />;
};

ApplePayButton.defaultProps = defaultProps;

export default ApplePayButton;
