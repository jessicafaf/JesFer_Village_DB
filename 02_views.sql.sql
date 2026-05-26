-- Daily energy balance
CREATE OR REPLACE VIEW v_daily_energy AS
SELECT DATE(timestamp) as day,
SUM(solar_generated_kwh) as total_generated,
SUM(consumed_kwh) as total_consumed,
SUM(solar_generated_kwh) - SUM(consumed_kwh) as net_balance
FROM energy_log GROUP BY DATE(timestamp);

-- Water efficiency rate
CREATE OR REPLACE VIEW v_water_efficiency AS
SELECT DATE(timestamp) as day,
SUM(greywater_collected_L) as collected,
SUM(recycled_L) as recycled,
ROUND(SUM(recycled_L)/NULLIF(SUM(greywater_collected_L),0)*100, 2) as efficiency_pct
FROM water_recycling_log GROUP BY DATE(timestamp);

-- Garden health summary
CREATE OR REPLACE VIEW v_garden_summary AS
SELECT plant_type, health_status,
COUNT(*) as total_harvests,
SUM(quantity_kg) as total_kg
FROM garden_harvest GROUP BY plant_type, health_status;