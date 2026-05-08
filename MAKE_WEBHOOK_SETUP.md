# Make.com Webhook Setup for DRIP Orders

## Quick Setup (15 minutes)

### Step 1: Create Make.com Account
1. Go to **make.com**
2. Click **Sign up** → Use Google/Email
3. Verify email

### Step 2: Create Scenario
1. Click **Create** → **New Scenario**
2. Search for **Webhook** in trigger
3. Select **Webhooks** → **Custom webhook**
4. Choose **POST**
5. **COPY the webhook URL** (you'll need this)

Example URL:
```
https://hook.make.com/xxxxxxxxxxxxxxxxxxxxx
```

### Step 3: Add Google Sheets Action
1. Click the **+** button below the webhook
2. Search for **Google Sheets**
3. Select **Add a row**
4. Click **Create a new connection**
5. **Sign in with your Google account**
6. Select your spreadsheet: **DRIP Orders**
7. Select your sheet: **Sheet1** (or whatever it's called)

### Step 4: Map the Fields
You'll see a form with fields. Fill them like this:

**In the Google Sheets action, map these fields:**

```
Row (array) → Click + Add Item

1st field: Timestamp
   Value: {{1.timestamp}} (from webhook)

2nd field: Customer Name  
   Value: {{1.customerName}}

3rd field: Phone Number
   Value: {{1.phoneNumber}}

4th field: Items
   Value: {{1.items}}

5th field: Total
   Value: {{1.total}}

6th field: Delivery Address
   Value: {{1.deliveryAddress}}

7th field: Notes
   Value: {{1.notes}}

8th field: Status
   Value: "Pending"
```

### Step 5: Enable & Test
1. Click **Save** (bottom right)
2. Toggle **ON** (top left corner)
3. Copy the webhook URL
4. Paste in your website code

### Step 6: Update Website Code

Find this in `index.html` around line 4500:
```javascript
const GOOGLE_SHEETS_WEBHOOK = 'YOUR_WEBHOOK_URL_HERE';
```

Replace with your actual URL:
```javascript
const GOOGLE_SHEETS_WEBHOOK = 'https://hook.make.com/xxxxxxxxxxxxxxxxxxxxx';
```

### Step 7: Test It
1. Open your website
2. Submit a test order with:
   - Name: Test User
   - Phone: 03211234567
   - Items: 1x Test Item
3. Check your Google Sheet → New row should appear! ✅

---

## What Happens Now

**When someone places an order:**
1. They fill form on website
2. Order sent to webhook
3. Make.com receives it
4. Automatically added to your Google Sheet
5. You get notified (email notification optional in Make.com)

---

## Make.com Pricing
- **Free tier:** 1,000 operations/month = ~30 orders/day ✅
- You'll never hit this limit until you have 1000s of orders

---

## If Something Goes Wrong

**Webhook not sending?**
- Check: Is GOOGLE_SHEETS_WEBHOOK updated in code?
- Check: Is Make scenario toggled ON?
- Check: No errors in browser console (F12)

**Data not appearing in Sheet?**
- Go to Make.com dashboard
- Check **Execution log** for errors
- Re-map fields if needed

**Google Sheets not connecting?**
- Remove and re-authenticate in Make.com
- Make sure you're using same Google account

---

## Advanced: Add Email Notification (Optional)

After Google Sheets action:
1. Click **+** button
2. Add **Gmail** action
3. Send yourself email with order details
4. Now you get notified when order arrives

Email template:
```
Subject: 📦 New DRIP Order from {{1.customerName}}

New order received!
- Customer: {{1.customerName}}
- Phone: {{1.phoneNumber}}
- Items: {{1.items}}
- Total: PKR {{1.total}}
- Address: {{1.deliveryAddress}}

Check Google Sheet for details.
```

---

## Done! 🎉

Your orders will now automatically flow from website → Google Sheet

No more manual entry needed (unless you want to).

Remember: This is free forever for your volume. When you hit 50+ orders/month consistently, consider upgrading to paid plan ($9/month).
