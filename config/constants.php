<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 *  Payment Type
 */
define('CR', 1);
define('DR', 2);

/*
 *  Product Type
 */

define('BOTH', 0);
define('PURCHASE', 1);
define('SALES', 2);
define('CHARGES', 3);

/*
 * STATUS
 */

define('ACTIVE', 0);
define('DELETED', 2);
define('TEMP', 3);


/*
 *  ENTRY TYPES
 */
define('CREDIT', 1);
define('DEBIT', 2);


/*
 *   ACCOUNT GROUPS
 */
define('BRANCH_DIVISIONS', 12);
define('CAPITAL_ACCOUNT', 13);
define('CURRENT_ASSETS', 14);
define('CURRENT_LIABILITIES', 15);
define('DIRECT_EXPENSES', 16);
define('DIRECT_INCOMES', 17);
define('FIXED_ASSETS', 18);
define('INDIRECT_EXPENSES', 19);
define('INDIRECT_INCOMES', 20);
define('INVESTMENTS', 21);
define('LOANS_LIABILITY', 22);
define('MISC_EXPENSES_ASSET', 23);
define('PURCHASE_ACCOUNTS', 24);
define('SALES_ACCOUNTS', 25);
define('SUSPENSE_ACCOUNTS', 26);
define('BANK_ACCOUNTS', 27);
define('BANK_OD_ACCCOUNTS', 28);
define('CASH_IN_HAND', 29);
define('DEPOSITS_ASSET', 30);
define('DUTIES_AND_TAXES', 31);
define('LOANS_ADVANCES_ASSET', 32);
define('PROVISIONS', 33);
define('RESERVES_AND_SURPLUS', 34);
define('SECURED_LOANS', 35);
define('STOCK_IN_HAND', 36);
define('SUNDRY_CREDITORS', 37);
define('SUNDRY_DEBTORS', 38);
define('UNSECURED_LOANS', 39);

/*
 *   OPPORTUNITY STAGES
 */
define('CLOSED_LOST', 4);
define('PROSPECTING', 5);
define('QUALIFICATION', 7);
define('WON', 8);
define('DEMONSTRATION', 9);
define('COMMERCIAL', 10);
define('NEGOTIATION', 11);
define('DATABANK', 12);
define('SALES_CONFIRMATION', 13);

/*
 *   SALES STAGES
 */
define('HOT', 4);
define('COLD', 5);
define('WARM', 6);
define('NOT APPLICABLE', 7);

/*
 *   TASK TYPES
 */
define('NEW_QUOTATION_CREATION', 15);
define('INQUIRY_FOLLOW_UP', 16);
define('REVISE_QUOTATION', 20);
define('QUOTATION_FOLLOW_UP', 21);

/*
 *   INVOICE TYPES
 */
define('COMPLAINT', 1);
define('INQUIRY', 2);
define('QUOTATION', 3);
define('TAX_INVOICE', 8);
define('PAYMENT', 9);
define('BOM', 11);
define('PO', 12);
define('PLN', 13);
define('GRN', 14);
define('MIN', 15);
define('PO-REQ', 16);
define('BILL_OF_SUPPLY', 17);
define('PURCHASE_BILL', 18);
define('DEBIT_NOTE', 19);
define('QC', 20);
define('STCOK_ADJUSTMENT', 21);