//
//  RNApplePayButtonView.m
//  ApplePay
//
//  Created by User on 11/21/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNApplePayButtonView.h"

@implementation RNApplePayButtonView

NSString * const DEFAULT_BUTTON_TYPE = @"plain";
NSString * const DEFAULT_BUTTON_STYLE = @"black";
CGFloat const DEFAULT_CORNER_RADIUS = 4.0;

@synthesize buttonType = _buttonType;
@synthesize buttonStyle = _buttonStyle;
@synthesize cornerRadius = _cornerRadius;
@synthesize button = _button;

- (instancetype) init {
  self = [super init];
  
  [self setButtonType:DEFAULT_BUTTON_TYPE andStyle:DEFAULT_BUTTON_STYLE withRadius:DEFAULT_CORNER_RADIUS];
  
  return self;
}

- (void)setButtonType:(NSString *) value {
  if (_buttonType != value) {
    [self setButtonType:value andStyle:_buttonStyle withRadius:_cornerRadius];
  }
  
  _buttonType = value;
}

- (void)setButtonStyle:(NSString *) value {
  if (_buttonStyle != value) {
    [self setButtonType:_buttonType andStyle:value withRadius:_cornerRadius];
  }
  
  _buttonStyle = value;
}

- (void)setCornerRadius:(CGFloat) value {
  if(_cornerRadius != value) {
    [self setButtonType:_buttonType andStyle:_buttonStyle withRadius:value];
  }
  
  _cornerRadius = value;
}

/**
 * PKPayment button cannot be modified. Due to this limitation, we have to
 * unmount existint button and create new one whenever it's style and/or
 * type is changed.
 */
- (void)setButtonType:(NSString *) buttonType andStyle:(NSString *) buttonStyle withRadius:(CGFloat) cornerRadius {
  for (UIView *view in self.subviews) {
    [view removeFromSuperview];
  }

  PKPaymentButtonType type;
  PKPaymentButtonStyle style;
  
  if ([buttonType isEqualToString: @"buy"]) {
    type = PKPaymentButtonTypeBuy;
  } else if ([buttonType isEqualToString: @"setUp"]) {
    type = PKPaymentButtonTypeSetUp;
  } else if ([buttonType isEqualToString: @"inStore"]) {
    type = PKPaymentButtonTypeInStore;
  } else if ([buttonType isEqualToString: @"donate"]) {
    type = PKPaymentButtonTypeDonate;
  } else {
    type = PKPaymentButtonTypePlain;
  }

  if ([buttonStyle isEqualToString: @"white"]) {
    style = PKPaymentButtonStyleWhite;
  } else if ([buttonStyle isEqualToString: @"whiteOutline"]) {
    style = PKPaymentButtonStyleWhiteOutline;
  } else {
    style = PKPaymentButtonStyleBlack;
  }

  _button = [[PKPaymentButton alloc] initWithPaymentButtonType:type paymentButtonStyle:style];
  [_button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];

  _button.layer.cornerRadius = cornerRadius;
  _button.layer.masksToBounds = true;
  
  [self addSubview:_button];
}

/**
 * Respond to touch event
 */
- (void)touchUpInside:(PKPaymentButton *)button {
  if (self.onPress) {
    self.onPress(nil);
  }
}

/**
 * Set button frame to what React sets for parent view.
 */
- (void)layoutSubviews
{
  [super layoutSubviews];
  _button.frame = self.bounds;
}

@end
