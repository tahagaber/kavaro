import re

with open(r'd:\KAVARO_APP\kavaro\lib\screen\core\checkout\checkout.dart', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace imports
content = re.sub(
    r"import 'widgets/checkout_order_item\.dart';.*?import 'widgets/premium_glass_card\.dart';",
    """import 'widgets/checkout_order_summary.dart';
import 'widgets/checkout_shipping_info.dart';
import 'widgets/checkout_payment_section.dart';
import 'widgets/checkout_price_summary.dart';
import 'widgets/checkout_purchase_button.dart';""",
    content,
    flags=re.DOTALL
)

# Replace Body
content = re.sub(
    r'            // Order Summary Header.*?            const SizedBox\(height: 40\),',
    """            CheckoutOrderSummary(items: items),
            const SizedBox(height: 32),
            CheckoutShippingInfo(
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              addressController: _addressController,
              phoneController: _phoneController,
            ),
            const SizedBox(height: 32),
            const CheckoutPaymentSection(),
            const SizedBox(height: 32),
            CheckoutPriceSummary(
              subtotal: subtotal,
              shipping: shipping,
              tax: tax,
              total: total,
            ),
            const SizedBox(height: 32),
            CheckoutPurchaseButton(
              onPressed: () => _handlePurchase(context),
            ),
            const SizedBox(height: 40),""",
    content,
    flags=re.DOTALL
)

with open(r'd:\KAVARO_APP\kavaro\lib\screen\core\checkout\checkout.dart', 'w', encoding='utf-8') as f:
    f.write(content)
