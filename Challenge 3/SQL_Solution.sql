WITH MonthlyTransactionCounts AS (
    SELECT
        a.account_id,
        a.status,
        DATE_TRUNC('month', t.transaction_date) AS month,
        COUNT(*) AS transaction_count
    FROM Accounts a
    LEFT JOIN Transactions t ON a.account_id = t.account_id
    WHERE t.transaction_date >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 year') -- Transactions in the last year
    GROUP BY a.account_id, a.status, month
),
AccountActivityCategories AS (
    SELECT
        account_id,
        status,
        CASE
            WHEN AVG(transaction_count) >= 20 THEN 'High Activity'
            WHEN AVG(transaction_count) >= 10 AND AVG(transaction_count) <= 19 THEN 'Medium Activity'
            ELSE 'Low Activity'
        END AS activity_category
    FROM MonthlyTransactionCounts
    GROUP BY account_id, status
),
ChurnRiskAccounts AS (
    SELECT
        account_id
    FROM AccountActivityCategories
    WHERE status = 'inactive' -- Inactive accounts
      AND activity_category = 'Low Activity' -- Low activity in the last year
),
TransactionAnalysis AS (
    SELECT
        t.account_id,
        t.transaction_type,
        AVG(t.amount) AS avg_transaction_amount,
        COUNT(*) AS transaction_count
    FROM Transactions t
    WHERE t.account_id IN (SELECT account_id FROM ChurnRiskAccounts)
      AND t.transaction_date >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '6 months') -- Last 6 months
    GROUP BY t.account_id, t.transaction_type
)

-- Account Activity Summary
SELECT activity_category, COUNT(*) AS num_accounts
FROM AccountActivityCategories
GROUP BY activity_category;

-- Churn Risk Account Summary
SELECT COUNT(*) AS num_churn_risk_accounts
FROM ChurnRiskAccounts;

-- Transaction Analysis for Churn Risk Accounts
SELECT
    account_id,
    FIRST_VALUE(transaction_type) OVER (PARTITION BY account_id ORDER BY transaction_count DESC) AS most_frequent_transaction_type,
    MAX(CASE WHEN transaction_type = 'deposit' THEN avg_transaction_amount END) AS avg_deposit_amount,
    MAX(CASE WHEN transaction_type = 'withdrawal' THEN avg_transaction_amount END) AS avg_withdrawal_amount
FROM TransactionAnalysis
GROUP BY account_id;
