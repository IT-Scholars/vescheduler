CREATE OR REPLACE FUNCTION "set_update_ts" () RETURNS trigger AS $$
   BEGIN
       NEW.update_ts = NOW();
       RETURN NEW;
   END;
$$LANGUAGE 'plpgsql' IMMUTABLE CALLED ON NULL INPUT SECURITY INVOKER;

DROP TABLE IF EXISTS configuration;
CREATE TABLE configuration(
	id SERIAL PRIMARY KEY,
	user_start_time TIMESTAMP WITH TIME ZONE NOT NULL,
	user_end_time TIMESTAMP WITH TIME ZONE NOT NULL,
	admin_start_time TIMESTAMP WITH TIME ZONE NOT NULL,
	admin_end_time TIMESTAMP WITH TIME ZONE NOT NULL,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);	
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "configuration" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO 
	configuration(user_start_time,user_end_time,admin_start_time,admin_end_time,active) 
	VALUES('2010-12-01','2011-06-01','2010-12-01','2011-12-01','TRUE');

DROP TABLE IF EXISTS host;
CREATE TABLE host(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	ssh_port INTEGER NOT NULL DEFAULT 22,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	ve_num_cap INTEGER NOT NULL DEFAULT 1,
	ve_first_free_port INTEGER NOT NULL DEFAULT 10000,
	ve_port_num INTEGER NOT NULL DEFAULT 5,
	active BOOLEAN DEFAULT 'TRUE',
	new_assignment BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "host" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('dolphin.cis.fiu.edu',22,'portal','k4se*prt4l',2,10000,20,'TRUE');	
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('64.77.83.35',22,'portal','k4se*prt4l',1,10000,20,'TRUE');
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('ita-vm1.cis.fiu.edu',22,'portal','k4se*prt4l',8,10000,20,'TRUE');
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('ita-vm2.cis.fiu.edu',22,'portal','k4se*prt4l',8,10000,20,'TRUE');
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('ita-vm3.cis.fiu.edu',22,'portal','k4se*prt4l',8,10000,20,'TRUE');
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('ita-vm4.cis.fiu.edu',22,'portal','k4se*prt4l',8,10000,20,'TRUE');
INSERT INTO 
	host(name,ssh_port,username,password,ve_num_cap,ve_first_free_port,ve_port_num,active) 
	VALUES('ita-vm5.cis.fiu.edu',22,'portal','k4se*prt4l',8,10000,20,'TRUE');

DROP TABLE IF EXISTS host_maintenance_sch;
CREATE TABLE host_maintenance_sch(
	id CHAR(36) PRIMARY KEY,
	host_id INTEGER NOT NULL,
	start_time TIMESTAMP WITH TIME ZONE NOT NULL,
	end_time TIMESTAMP WITH TIME ZONE NOT NULL,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()	
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "host_maintenance_sch" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS ve_ins;
CREATE TABLE ve_ins(
    id CHAR(36) PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	ve_type VARCHAR(50) NOT NULL,
	storage_id INTEGER,
	kserver_id INTEGER NOT NULL DEFAULT 1,
	first_port INTEGER,
	num_ports INTEGER,
	first_mac INTEGER,
	num_macs INTEGER,
	store BOOLEAN DEFAULT 'TRUE',
	active BOOLEAN DEFAULT 'TRUE',
    status VARCHAR(50) NOT NULL,
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "ve_ins" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS ve_ins_sch;
CREATE TABLE ve_ins_sch(
	id CHAR(36) PRIMARY KEY,
	ve_ins_id CHAR(36) NOT NULL,
	host_id INTEGER,
	start_time TIMESTAMP WITH TIME ZONE NOT NULL,
	end_time TIMESTAMP WITH TIME ZONE NOT NULL,
	done BOOLEAN DEFAULT 'FALSE',
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);	
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "ve_ins_sch" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
   
DROP TABLE IF EXISTS ve_free_ports_and_macs;
CREATE TABLE ve_free_ports_and_macs(
	ve_first_free_port INTEGER NOT NULL,
	ve_first_free_mac INTEGER NOT NULL,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "ve_free_ports_and_macs" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO 
	ve_free_ports_and_macs(ve_first_free_port,ve_first_free_mac,active) 
	values(10001,1,'t');

DROP TABLE IF EXISTS host_used_routers;
CREATE TABLE host_used_routers(
	host_id INTEGER NOT NULL,
	ve_ins_id CHAR(36) NOT NULL UNIQUE,
	router_id INTEGER NOT NULL,
	update_ts TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (host_id,router_id)
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "host_used_routers" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS vm_ins;
CREATE TABLE vm_ins(
	id CHAR(36) PRIMARY KEY,
	ve_ins_id CHAR(36) NOT NULL,
	name VARCHAR(50) NOT NULL,
	dir VARCHAR(50) NOT NULL,
	domain VARCHAR(50),
	os VARCHAR(50) NOT NULL,
	internal_address VARCHAR(100) NOT NULL,
	access_port INTEGER NOT NULL,
	mac_address CHAR(17) NOT NULL,
	status VARCHAR(50) NOT NULL,
	last_checkin TIMESTAMP NOT NULL,
	app_name VARCHAR(50) NOT NULL,
	app_dir VARCHAR(100) NOT NULL,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "vm_ins" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS reserved_resources;
CREATE TABLE reserved_resources(
	id SERIAL PRIMARY KEY,
	ve_type VARCHAR(50) NOT NULL,
	start_time TIMESTAMP WITH TIME ZONE NOT NULL,
	end_time TIMESTAMP WITH TIME ZONE NOT NULL,
	quota INTEGER NOT NULL,
	cancel BOOLEAN DEFAULT 'FALSE',
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "reserved_resources" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS storage;
CREATE TABLE storage(
	id SERIAL PRIMARY KEY,
	dir_path VARCHAR(100) NOT NULL,
	gb_size INTEGER NOT NULL,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "storage" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/sadjadi-vmstorage/sadjadi-vms/nobackup',1500,'TRUE');
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/portal/exams',300,'TRUE');
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/ita-vm1/vm-storage/portal/exams',1600,'TRUE');
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/serval/serval-vm-storage/portal/exams',900,'TRUE');
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/vc1/serval-vm-storage/portal/exams',2500,'TRUE');
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/vc2/serval-vm-storage/portal/exams',2500,'TRUE');
INSERT INTO 
	storage(dir_path,gb_size,active) 
	VALUES('/home/vc3/serval-vm-storage/portal/exams',2500,'TRUE');
	
DROP TABLE IF EXISTS host_storage;
CREATE TABLE host_storage(
	host_id INTEGER NOT NULL,
	storage_id INTEGER NOT NULL,
	preference INTEGER NOT NULL DEFAULT 1,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (host_id, storage_id)
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "host_storage" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(1,1,1,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(2,2,1,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(3,3,1,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(3,4,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(3,5,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(3,6,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(3,7,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(4,3,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(4,4,1,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(4,5,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(4,6,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(4,7,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(5,3,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(5,4,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(5,5,1,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(5,6,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(5,7,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(6,3,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(6,4,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(6,5,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(6,6,1,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(6,7,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(7,3,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(7,4,3,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(7,5,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(7,6,2,'t');
INSERT INTO
   host_storage(host_id,storage_id,preference,active)
   VALUES(7,7,1,'t');

DROP TABLE IF EXISTS ve_ins_host;
CREATE TABLE ve_ins_host(
    ve_ins_id CHAR(36) NOT NULL,
	host_id INTEGER NOT NULL,
	update_ts TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (ve_ins_id, host_id)
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "ve_ins_host" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
   
DROP TABLE IF EXISTS user_group;
CREATE TABLE user_group(
	id SERIAL PRIMARY KEY,
   	username VARCHAR(50) NOT NULL,
	group_name VARCHAR(50) NOT NULL,
	update_ts TIMESTAMP DEFAULT NOW(),
	UNIQUE (username, group_name)
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "user_group" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
   
DROP TABLE IF EXISTS kserver;
CREATE TABLE kserver(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	http_port INTEGER NOT NULL DEFAULT 80,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	total_cap INTEGER NOT NULL DEFAULT 100,
	active_cap INTEGER NOT NULL DEFAULT 8,
	active BOOLEAN DEFAULT 'TRUE',
	new_assignment BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "kserver" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(1,'kaseya1.cis.fiu.edu',80,'kaseya','Start1234',100,8,'TRUE','TRUE');	
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(2,'kaseya2.cis.fiu.edu',80,'kaseya','Start1234',100,8,'TRUE','TRUE');	
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(3,'kaseya3.cis.fiu.edu',80,'kaseya','Start1234',100,8,'TRUE','TRUE');	
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(4,'kaseya4.cis.fiu.edu',80,'kaseya','Start1234',100,8,'TRUE','TRUE');	
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(5,'saas12.kaseya.net',80,'kaseya','Start1234',300,50,'TRUE','TRUE');	
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(6,'demo1.kaseya.com',80,'kaseya','Start1234',2,1,'TRUE','TRUE');	
INSERT INTO 
	kserver(id,name,http_port,username,password,total_cap,active_cap,active,new_assignment) 
	VALUES(7,'mt-training.kaseya.net',80,'kaseya','Start1234',300,50,'TRUE','TRUE');	

DROP TABLE IF EXISTS promo_kserver;
CREATE TABLE promo_kserver(
	promo_id INT NOT NULL,
	kserver_id INT NOT NULL,
	update_ts TIMESTAMP DEFAULT NOW()
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "promo_kserver" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO promo_kserver(promo_id,kserver_id) VALUES(1,5);	
INSERT INTO promo_kserver(promo_id,kserver_id) VALUES(2,5);	
INSERT INTO promo_kserver(promo_id,kserver_id) VALUES(3,5);	
INSERT INTO promo_kserver(promo_id,kserver_id) VALUES(4,7);	

DROP TABLE IF EXISTS host_kserver;
CREATE TABLE host_kserver(
	host_id INTEGER NOT NULL,
	kserver_id INTEGER NOT NULL,
	preference INTEGER NOT NULL DEFAULT 1,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (host_id, kserver_id)
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "host_kserver" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(1,1,1,'t');
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(2,2,1,'t');
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(3,3,1,'t');
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(4,4,1,'t');
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(5,5,1,'t');
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(6,6,1,'t');
INSERT INTO
   host_kserver(host_id,kserver_id,preference,active)
   VALUES(7,7,1,'t');

DROP TABLE IF EXISTS kserver_maintenance_sch;
CREATE TABLE kserver_maintenance_sch(
	id CHAR(36) PRIMARY KEY,
	kserver_id INTEGER NOT NULL,
	start_time TIMESTAMP WITH TIME ZONE NOT NULL,
	end_time TIMESTAMP WITH TIME ZONE NOT NULL,
	active BOOLEAN DEFAULT 'TRUE',
	update_ts TIMESTAMP DEFAULT NOW()	
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "kserver_maintenance_sch" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS tenant;
CREATE TABLE tenant(
	ve_ins_id CHAR(36),
	username VARCHAR(100) UNIQUE,
	password VARCHAR(100) NOT NULL,
	kserver_id INTEGER NOT NULL,
	customer_id DECIMAL(20,2),
	account_id VARCHAR(50),
	group_id VARCHAR(50),
	url VARCHAR(150),
	end_date TIMESTAMP,
	agents INTEGER,
	admins INTEGER,
	update_ts TIMESTAMP DEFAULT NOW()	
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "tenant" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
DROP TABLE IF EXISTS course;
CREATE TABLE course (
  id INT,
  full_name VARCHAR(255) NOT NULL ,
  short_name VARCHAR(45) NOT NULL ,
  promo_code VARCHAR(50) ,
  update_ts TIMESTAMP WITH TIME ZONE  DEFAULT NOW(),
  PRIMARY KEY (id) );
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
  ON "course" FOR EACH ROW
  EXECUTE PROCEDURE "set_update_ts"();

DROP TABLE IF EXISTS akamai;
CREATE TABLE akamai (
  kserver_name VARCHAR(100) NOT NULL,
  akamai_name VARCHAR(100) NOT NULL,
  update_ts TIMESTAMP WITH TIME ZONE  DEFAULT NOW(),
  PRIMARY KEY (kserver_name) );
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
  ON "akamai" FOR EACH ROW
  EXECUTE PROCEDURE "set_update_ts"();

DROP TABLE IF EXISTS tenant_created;
CREATE TABLE tenant_created(
	username VARCHAR(100) UNIQUE,
	update_ts TIMESTAMP DEFAULT NOW()	
	);
CREATE TRIGGER "trg_set_update_ts" BEFORE INSERT OR UPDATE
   ON "tenant_created" FOR EACH ROW
   EXECUTE PROCEDURE "set_update_ts"();
	
