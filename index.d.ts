import React from 'react';

export type APayAllowedCardNetworkType = "amex" | "mastercard" | "visa" | "privatelabel" | "chinaunionpay" | "interac" | "jcb" | "suica" | "cartebancaires" | "idcredit" | "quicpay" | "maestro"
export type APayRequiredBillingField = "name" | "address";

export type APayPaymentStatusType = number

export interface APayPaymentSummaryItemType {
  label: string
  amount: string
}

export interface APayRequestDataType {
  merchantIdentifier: string
  supportedNetworks: APayAllowedCardNetworkType[]
  countryCode: string
  currencyCode: string
  paymentSummaryItems: APayPaymentSummaryItemType[]
  requiredBillingFields?: APayRequiredBillingField[]
}

export type APayPaymentResponse = {
  paymentData: string
  billingInfo?: {
    name?: {
      firstName: string,
      lastName: string,
    },
    address?: {
      city: string
      country: string
      countryCode: string
      state: string
      street: string
      zip: string
    }
  }
}

declare class ApplePay {
  static SUCCESS: APayPaymentStatusType
  static FAILURE: APayPaymentStatusType
  static canMakePayments: boolean
  static isConfiguredForNetworks: (networks: APayAllowedCardNetworkType[]) => Promise<boolean>
  static requestPayment: (requestData: APayRequestDataType) => Promise<APayPaymentResponse>
  static complete: (status: APayPaymentStatusType) => Promise<void>
  static openSetup: () => void
}

export type APayButtonType = 'plain' | 'buy' | 'setUp' | 'inStore' | 'donate';
export type APayButtonStyle = 'white' | 'whiteOutline' | 'black';

type Props = {
  style?: APayButtonStyle
  type?: APayButtonType
  cornerRadius?: number
  width?: number
  height?: number
  onPress: () => void
};

declare const ApplePayButton: React.SFC<Props>

export { ApplePay, ApplePayButton }
