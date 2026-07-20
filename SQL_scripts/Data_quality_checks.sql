use DataWarehouse;


-- EDA DATA IN BRONZE LAYER (data quality check)


-- check for nulls and empty values and duplicates in cst_id

select 
	count(*) as total_records,
	sum(case when cst_id is null then 1 else 0 end) as cst_id_nulls,
	sum(case when cst_key is null then 1 else 0 end) as cst_key_nulls,
	sum(case when cst_firstname is null then 1 else 0 end) as cst_firstname_nulls,
	sum(case when cst_lastname is null then 1 else 0 end) as cst_lastname_nulls,
	sum(case when cst_marital_status is null then 1 else 0 end) as cst_marital_status_nulls,
	sum(case when cst_gender is null then 1 else 0 end) as cst_gender_nulls,
	sum(case when cst_create_date is null then 1 else 0 end) as cst_create_date_nulls
from bronze.crm_cust_info;



select 
	count(*) as total_records,
	sum(case when trim(cst_id)='' then 1 else 0 end) as cst_id_empty,
	sum(case when trim(cst_key)='' then 1 else 0 end)as cst_key_empty,
	sum(case when trim(cst_firstname)='' then 1 else 0 end)as cst_firstname_empty,
	sum(case when trim(cst_lastname)='' then 1 else 0 end)as cst_lastname_empty,
	sum(case when trim(cst_marital_status)='' then 1 else 0 end)as cst_marital_status_empty,
	sum(case when trim(cst_gender)='' then 1 else 0 end)as cst_gender_empty

from bronze.crm_cust_info





select COUNT(*) as duplicate_cst_id_count 
from bronze.crm_cust_info 
where cst_id in(select cst_id
from bronze.crm_cust_info
group by cst_id
having count(*) > 1);



select count(*)from bronze.crm_cust_info 
where len(cst_key)<>10


--  check for nulls and empty and duplicates in prd_info

select 
	count(*) as total_records,
	sum(case when prd_id is null then 1 else 0 end) as prd_id_nulls,
	sum(case when prd_key is null then 1 else 0 end) as prd_key_nulls,
	sum(case when prd_name is null then 1 else 0 end) as prd_name_nulls,
	sum(case when prd_cost is null then 1 else 0 end) as prd_cost_nulls,
	sum(case when prd_line is null then 1 else 0 end) as prd_line_nulls,
	sum(case when prd_start_date is null then 1 else 0 end) as prd_start_date_nulls,
	sum(case when prd_end_date is null then 1 else 0 end) as prd_end_date_nulls

from bronze.crm_prd_info;


select 
	count(*) as total_records,
	sum(case when trim(prd_id)='' then 1 else 0 end)as prd_id_nulls,
	sum(case when trim(prd_key)='' then 1 else 0 end)as prd_key_empty,
	sum(case when trim(prd_name)='' then 1 else 0 end)as prd_name_empty,
	sum(case when trim(prd_line)='' then 1 else 0 end)as prd_line_empty

	from bronze.crm_prd_info




select COUNT(*) as duplicate_prd_id_count
from bronze.crm_prd_info 
where prd_id in(select prd_id
from bronze.crm_prd_info
group by prd_id
having count(*) > 1);


SELECT * FROM silver.erp_px_cat_g1v2 
where len(id)<>5


-- check for nulls and empty and duplicates in sls_ord_num

select 
	count(*) as total_records,
	sum(case when sls_ord_num is null then 1 else 0 end) as sls_ord_num_nulls,
	sum(case when sls_prd_key is null then 1 else 0 end) as sls_prd_key_nulls,
	sum(case when sls_cust_id is null then 1 else 0 end) as sls_cust_id_nulls,
	sum(case when sls_order_dt is null then 1 else 0 end) as sls_order_dt_nulls,
	sum(case when sls_ship_dt is null then 1 else 0 end) as sls_ship_dt_nulls,
	sum(case when sls_due_dt is null then 1 else 0 end) as sls_due_dt_nulls,
	sum(case when sls_sales is null then 1 else 0 end) as sls_sales_nulls,
	sum(case when sls_quantity is null then 1 else 0 end) as sls_quantity_nulls,
	sum(case when sls_price is null then 1 else 0 end) as sls_price_nulls

from bronze.crm_sales_info;



select 
	count(*) as total_records,
	sum(case when trim(sls_ord_num) ='' then 1 else 0 end) as sls_ord_num_empty,
	sum(case when trim(sls_prd_key) ='' then 1 else 0 end) as sls_prd_key_empty,
	sum(case when trim(sls_cust_id) ='' then 1 else 0 end) as sls_cust_id_empty,
	sum(case when trim(sls_order_dt) ='' then 1 else 0 end) as sls_order_dt_empty,
	sum(case when trim(sls_ship_dt) ='' then 1 else 0 end) as sls_ship_dt_empty,
	sum(case when trim(sls_due_dt) ='' then 1 else 0 end) as sls_due_dt_empty,
	sum(case when trim(sls_sales) ='' then 1 else 0 end) as sls_sales_empty,
	sum(case when trim(sls_quantity) ='' then 1 else 0 end) as sls_quantity_empty,
	sum(case when trim(sls_price) ='' then 1 else 0 end) as sls_price_empty

from bronze.crm_sales_info;




SELECT COUNT(*) AS total_rows
FROM bronze.crm_sales_info;

SELECT COUNT(*) AS distinct_rows
FROM
(
    SELECT DISTINCT *
    FROM bronze.crm_sales_info
) d;

-- check for nulls empty and and duplicates in bronze.erp_cust_az12


select 
	count(*) as total_records,
	sum(case when cst_key is null then 1 else 0 end) as cid_nulls,
	sum(case when bdate is null then 1 else 0 end) as bdate_nulls,
	sum(case when gen is null then 1 else 0 end) as gen_nulls
from bronze.erp_cust_az12



SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN TRIM(cst_key) = '' THEN 1 ELSE 0 END) AS cid_empty,
    SUM(CASE WHEN TRIM(gen) = '' THEN 1 ELSE 0 END) AS gen_empty
FROM bronze.erp_cust_az12;


select count(*) as duplicate_cst_key_count
from bronze.erp_cust_az12 
where cst_key in(select cst_key
from bronze.erp_cust_az12
group by cst_key
having count(*) > 1);


 select gen,count(gen)
  from silver.erp_cust_az12
  group by gen


  select count(*)from silver.erp_cust_az12 
where len(cst_key)<>10


-- check for nulls and empty and duplicates bronze.erp_loc_a101

select 
	count(*) as total_records,
	sum(case when cst_key is null then 1 else 0 end) as cst_key_nulls,
	sum(case when cntry is null then 1 else 0 end) as cntry_nulls
from bronze.erp_loc_a101


select 
	count(*) as total_records,
	sum(case when trim(cst_key) ='' then 1 else 0 end) as cst_key_empty,
	sum(case when trim(cntry) ='' then 1 else 0 end) as cntry_empty
from bronze.erp_loc_a101




select count(*) as duplicate_cst_key_count
from bronze.erp_loc_a101 
where cst_key in(select cst_key
from bronze.erp_loc_a101
group by cst_key
having count(*) > 1);


select cst_key from silver.erp_loc_a101  where len(cst_key)<>10
 order by cst_key asc;


-- check for nulls and empty and duplicates in bronze.erp_px_cat_g1v2

select 
	count(*) as total_records,
	sum(case when id is null then 1 else 0 end) as id_nulls,
	sum(case when cat is null then 1 else 0 end) as cat_nulls,
	sum(case when subcat is null then 1 else 0 end) as subcat_nulls,
	sum(case when maintenance is null then 1 else 0 end) as maintenance_nulls
from bronze.erp_px_cat_g1v2

select 
	count(*) as total_records,
	sum(case when trim(id) ='' then 1 else 0 end) as id_empty,
	sum(case when trim(cat) ='' then 1 else 0 end) as cat_empty,
	sum(case when trim(subcat) ='' then 1 else 0 end) as subcat_empty,
	sum(case when trim(maintenance) ='' then 1 else 0 end) as maintenance_empty
from bronze.erp_px_cat_g1v2




select count(*) as duplicate_id_count
from bronze.erp_px_cat_g1v2 
where id in(select id
from bronze.erp_px_cat_g1v2
group by id
having count(*) > 1);



