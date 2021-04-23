//
//  RNApplePayButtonView.h
//  ApplePay
//
//  Created by User on 11/21/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTView.h>
@import PassKit;

NS_ASSUME_NONNULL_BEGIN

@interface RNApplePayButtonView : RCTView

@property (strong, nonatomic) NSString *buttonStyle;
@property (strong, nonatomic) NSString *buttonType;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic, readonly) PKPaymentButton *button;
@property (nonatomic, copy) RCTBubblingEventBlock onPress;

@end

NS_ASSUME_NONNULL_END
