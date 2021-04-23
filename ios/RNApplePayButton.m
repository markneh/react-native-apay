//
//  RNApplePayButton.m
//  ApplePay
//
//  Created by User on 11/21/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

@import PassKit;
#import "RNApplePayButton.h"
#import "RNApplePayButtonView.h"

@implementation RNApplePayButton

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(buttonType, NSString, RNApplePayButtonView)
{
  if (json) {
    [view setButtonType:[RCTConvert NSString:json]];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(buttonStyle, NSString, RNApplePayButtonView)
{
  if (json) {
    [view setButtonStyle:[RCTConvert NSString:json]];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(cornerRadius, CGFloat, RNApplePayButtonView)
{
  if (json) {
    [view setCornerRadius:[RCTConvert CGFloat:json]];
  }
}

- (UIView *)view
{
  return [RNApplePayButtonView new];
}

@end
