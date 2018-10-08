# Rails Engine

Rails Engine is a RESTful merchant analytics API built in rails 5.1. The purpose
of this project was to familiarize myself with building an API in rails.

---

### Set Up

To run locally:

Cone the Repo: `git clone https://github.com/patrickshobe/rails_engine.git`

Set Ruby Version: `2.5.1`

Install Dependencies: `bundle`

Set up Database: `rake db:{drop,create,migrate} `

Seed the Databse: `rake import:all`

Start the server: `rails s`

---

## Database Layout
       ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
       ┃             ___      _ _      ___           _            ___  ___            ┃
       ┃            | _ \__ _(_) |___ | __|_ _  __ _(_)_ _  ___  |   \| _ )           ┃
       ┃            |   / _` | | (_-< | _|| ' \/ _` | | ' \/ -_) | |) | _ \           ┃
       ┃            |_|_\__,_|_|_/__/ |___|_||_\__, |_|_||_\___| |___/|___/           ┃
       ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
         ┌──────────────────────┐
         │      customers       │
         │======================│
         │  + id - primary key  ├ ─ ─ ─ ┐       ┌────────────────────────────┐
         │----------------------│               │          invoices          │
         │+ first_name - string │       │       │============================│
         │----------------------│               │     + id - primary key     │─ ─ ─ ─ ┐
         │ + last_name - string │       │       │----------------------------│
         └──────────────────────┘        ─ ─ ─ ─│+ customer_id - foreign key │        │
                                                │----------------------------│
         ┌──────────────────────┐        ─ ─ ─ ─│+ merchant_id - foreign key │        │
         │      merchants       │       │       │----------------------------│
         │======================│               │     + status - string      │        │
     ─ ─ ┤  + id - primary key  ├ ─ ─ ─ ┘       └────────────────────────────┘
    │    │----------------------│               ┌────────────────────────────┐        │
         │   + name - string    │               │       invoices items       │
    │    └──────────────────────┘               │============================│        │
                                                │     + id - primary key     │
    │  ┌────────────────────────────┐           │----------------------------│        │
       │           items            │           │ + invoice_id - foreign key ├ ─ ─ ─ ─
    │  │============================│           │----------------------------│        │
       │     + id - primary key     ├ ─ ─ ─ ─ ─ ┤  + item_id - foreign key   │
    │  │----------------------------│           │----------------------------│        │
     ─ ┤+ merchant_id - primary key │           │    + quantity - integer    │
       │----------------------------│           │----------------------------│        │
       │      + name - string       │           │   + unit_price - decimal   │
       │----------------------------│           └────────────────────────────┘        │
       │    + description - text    │
       │----------------------------│┌─────────────────────────────────────────┐      │
       │   + unit_price - decimal   ││              transactions               │
       └────────────────────────────┘│=========================================│      │
                                     │           + id - primary key            │
                                     │-----------------------------------------│      │
                                     │       + invoice_id - foreign key        │ ─ ─ ─
                                     │-----------------------------------------│
                                     │      + credit_card_number - string      │
                                     │-----------------------------------------│
                                     │+ credit_card_expiration_date - datetime │
                                     │-----------------------------------------│
                                     │            + result - string            │
                                     └─────────────────────────────────────────┘

## Routes

All routes are prepended by `/api/v1`

| Type |  Route | Description |
| :------------- |:-------------:| -----:|
| Merchant |  GET /api/v1/merchants.json| returns all merchants |
| Merchant | GET /api/v1/merchants/1.json| returns merchant 1|
| Invoice | GET /api/v1/invoices.json|returns all invoices |
| Invoice | GET /api/v1/invoices/1.json| returns invoice 1|
| Invoice Item | GET /api/v1/invoice_items.json |  returns all invoice_items|
| Invoice Item | GET /api/v1/invoice_items/1.json | returns invoice_item 1 |
| Items |  GET /api/v1/items.json | returns all items|
| Items | GET /api/v1/items/1.json | returns item 1 |
| Transactions |  GET /api/v1/transactions.json | returns all transactions |
| Transactions |  GET /api/v1/transactions/1.json | returns transaction 1|
| Customers| GET /api/v1/customers.json | returns all customers |
| Customers|  GET /api/v1/customers/1.json | returns customer 1|
| Merchants Relationships |  GET /api/v1/merchants/:id/items | returns a collection of items associated with that merchant |
| Merchants Relationships |  GET /api/v1/merchants/:id/invoices|  returns a collection of invoices associated with that merchant from their known orders|
| Merchants Relationships |  GET /api/v1/invoices/:id/transactions | returns a collection of associated transactions |
| Invoices Relationships |GET /api/v1/invoices/:id/transactions | returns a collection of associated transactions |
| Invoices Relationships | GET /api/v1/invoices/:id/invoice_items | returns a collection of associated invoice items |
| Invoices Relationships |  GET /api/v1/invoices/:id/items | returns a collection of associated items|
| Invoices Relationships | GET /api/v1/invoices/:id/customer | returns the associated customer |
| Invoices Relationships | GET /api/v1/invoices/:id/merchant | returns the associated merchant |
| Invoice Item Relationships |  GET /api/v1/invoice_items/:id/invoice | returns the associated invoice |
| Invoice Item Relationships | GET /api/v1/invoice_items/:id/item | returns the associated item |
| Item Relationships |  GET /api/v1/items/:id/invoice_items | returns a collection of associated invoice items|
| Item Relationships | GET /api/v1/items/:id/merchant | returns the associated merchant |
| Transaction Relationships | GET /api/v1/transactions/:id/invoice | returns the associated invoice|
| Customer Relationships|  GET /api/v1/customers/:id/invoices | returns a collection of associated invoices|
| All Merchants BI |  GET /api/v1/merchants/most_revenue?quantity=x | returns the top x merchants ranked by total revenue|
| All Merchants BI|  GET /api/v1/merchants/most_items?quantity=x | returns the top x merchants ranked by total number of items sold|
| All Merchants BI| GET /api/v1/merchants/revenue?date=x | returns the total revenue for date x across all merchants|
| Single Merchant BI|  GET /api/v1/merchants/:id/revenue | returns the total revenue for that merchant across successful transactions|
| Single Merchant BI|  GET /api/v1/merchants/:id/revenue?date=x| returns the total revenue for that merchant for a specific invoice date x|
| Single Merchant BI|  GET /api/v1/merchants/:id/favorite_customer | returns the customer who has conducted the most total number of successful transactions.|
| Single Merchant BI|  GET /api/v1/merchants/:id/customers_with_pending_invoices | returns a collection of customers which have pending (unpaid) invoices.|
| Items BI | GET /api/v1/items/most_revenue?quantity=x | returns the top x items ranked by total revenue generated|
| Items BI|  GET /api/v1/items/most_items?quantity=x | returns the top x item instances ranked by total number sold|
| Items BI|  GET /api/v1/items/:id/best_day | returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.|
| Custoemr BI | GET /api/v1/customers/:id/favorite_merchant | returns a merchant where the customer has conducted the most successful transactions |


