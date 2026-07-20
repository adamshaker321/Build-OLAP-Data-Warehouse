
use master;

create database DataWarehouse;


use DataWarehouse;
go

-- create schemas for bronze, silver and gold layers

create schema bronze;
go
create schema silver;
go
create schema gold;
go




-- create tables in bronze layer

use DataWarehouse;
drop table if exists bronze.crm_prd_info;



create table bronze.crm_cust_info(
cst_id nvarchar(50),
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_marital_status nvarchar(50),
cst_gender nvarchar(50),
cst_create_date date
);

create table bronze.crm_prd_info(
prd_id nvarchar(50),
prd_key nvarchar(50),
prd_name nvarchar(100),
prd_cost decimal(18,2),
prd_line nvarchar(50),
prd_start_date datetime,
prd_end_date datetime
);


create table bronze.crm_sales_info(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);


create table bronze.erp_loc_a101(

cid nvarchar(50),
cntry nvarchar(50)
);

create table bronze.erp_cust_az12(
cid nvarchar(50),
bdate date ,
gen nvarchar(50)

);

create table bronze.erp_px_cat_g1v2(

id nvarchar(50),
cat nvarchar(50),
subcat nvarchar(50),
maintenance nvarchar(50)
);


-- create tables in silver layer




create table silver.crm_cust_info(
cst_id int ,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_marital_status nvarchar(50),
cst_gender nvarchar(50),
cst_create_date date
);

create table silver.crm_prd_info(
prd_id int,
prd_key nvarchar(50),
cat_id nvarchar(50),
prd_name nvarchar(100),
prd_cost decimal(18,2),
prd_line nvarchar(50),
prd_start_date datetime,
prd_end_date datetime
);


create table silver.crm_sales_info(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales decimal(10,2),
sls_quantity int,
sls_price decimal(10,2)
);


create table silver.erp_loc_a101(

cid nvarchar(50),
cntry nvarchar(50)
);

create table silver.erp_cust_az12(
cid nvarchar(50),
bdate date ,
gen nvarchar(50)

);

create table silver.erp_px_cat_g1v2(

id nvarchar(50),
cat nvarchar(50),
subcat nvarchar(50),
maintenance nvarchar(50)
);

-- create tables in silver layer

create table gold.dim_customers(

customer_key int identity(1,1) primary key,
cust_id int ,
cust_key nvarchar(100),
cust_firstname nvarchar(255),
cust_lastname nvarchar(255),
cust_marital_status nvarchar(50),
cust_gender nvarchar(50),
cust_birthdate date,
cust_country nvarchar(255),
cust_created_date date
)

create table gold.dim_products(

product_key int identity(1,1) primary key,
prd_id int,
prd_key nvarchar(100),
prd_name nvarchar(255),
prd_category nvarchar(100),
prd_subcategory nvarchar(100),
prd_maintenance nvarchar(50),
prd_cost decimal(18, 2),
prd_line nvarchar(50),
prd_start_date datetime,
prd_end_date datetime
)

create table gold.dim_date(

date_key int primary key,
full_date date not null,
day_number int ,
month_number int ,
month_name nvarchar(50),
quarter_number tinyint ,
day_name nvarchar(50),
year_number int

)

use DataWarehouse;

create table gold.fact_sales(

sales_key int identity(1,1) primary key,
order_number nvarchar(100),
customer_key int,
product_key int,
order_date date ,
ship_date date ,
due_date date ,
sales_amount decimal(18,2),
quantity int ,
unit_price decimal(18,2)

constraint FK_fact_customer
foreign key(customer_key)
references gold.dim_customers(customer_key),

constraint FK_fact_product
foreign key(product_key)
references gold.dim_products(product_key),
)
