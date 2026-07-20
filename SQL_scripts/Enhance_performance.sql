use DataWarehouse;

create nonclustered index Idx_dim_customers_cst_id
on gold.dim_customers(cust_id);

create nonclustered index Idx_dim_products_prd_id
on gold.dim_products(prd_id);

create clustered columnstore index colstr_idx_fact_sales
on gold.fact_sales;