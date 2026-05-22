-- JesFer Village DB · Core Schema
CREATE DATABASE IF NOT EXISTS jesfer_village;
USE jesfer_village;

CREATE TABLE residents (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
unit VARCHAR(20),
role VARCHAR(50),
joined_date DATE
);

CREATE TABLE energy_log (
id INT AUTO_INCREMENT PRIMARY KEY,
resident_id INT,
timestamp DATETIME DEFAULT NOW(),
solar_generated_kwh DECIMAL(8,3),
consumed_kwh DECIMAL(8,3),
battery_level_pct DECIMAL(5,2),
FOREIGN KEY (resident_id) REFERENCES residents(id)
);

CREATE TABLE water_recycling_log (
id INT AUTO_INCREMENT PRIMARY KEY,
timestamp DATETIME DEFAULT NOW(),
greywater_collected_L DECIMAL(8,2),
recycled_L DECIMAL(8,2),
tank_level_pct DECIMAL(5,2),
alert_triggered BOOLEAN DEFAULT FALSE
);

CREATE TABLE garden_harvest (
id INT AUTO_INCREMENT PRIMARY KEY,
harvest_date DATE,
plant_type VARCHAR(100),
quantity_kg DECIMAL(6,2),
plot_id VARCHAR(20),
health_status ENUM('healthy','diseased','recovering') DEFAULT 'healthy'
);

CREATE TABLE sensor_readings (
id INT AUTO_INCREMENT PRIMARY KEY,
sensor_id VARCHAR(50) NOT NULL,
sensor_type ENUM('temperature','humidity','soil_moisture','light','water_flow'),
value DECIMAL(10,4),
unit VARCHAR(20),
recorded_at DATETIME DEFAULT NOW()
);

CREATE TABLE alerts (
id INT AUTO_INCREMENT PRIMARY KEY,
alert_type VARCHAR(100),
severity ENUM('low','medium','critical') DEFAULT 'low',
message TEXT,
triggered_at DATETIME DEFAULT NOW(),
resolved BOOLEAN DEFAULT FALSE
);